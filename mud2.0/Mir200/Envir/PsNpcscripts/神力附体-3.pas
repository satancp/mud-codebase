                                        program mir2;

var
  shuxing: string;
  shuxingzhi, shuxingzhi1, fangyu, moyu, shengming, mofa, xiangcha: integer;
  shuxingzu: array [1 .. 5] of integer;
  shouci, shuaxin: Boolean;

procedure OnInitialize;
begin
  shuxingzu[1] := 0;
  shuxingzu[2] := 4;
  shuxingzu[3] := 5;
  shuxingzu[4] := 8;
  shuxingzu[5] := 9;
end;

procedure _letgo;
var
  xuanzhongzhi, fujiazhi: integer;
begin
  case This_Player.Job of
    0:
      shuxing := '攻击';
    1:
      shuxing := '魔法';
    2:
      shuxing := '道术';
  end;
  if shouci then
  begin
    if This_Player.MyLFnum >= 500 then
    begin
      shuxingzhi := 0;
      shuxingzhi1 := 0;
      fangyu := 0;
      moyu := 0;
      shengming := 0;
      mofa := 0;
      shuaxin := False;
      This_Player.DecLF(20250, 500, False);    //这里扣除100灵符 
      shuaxin := True;
      xuanzhongzhi := random(5) + 1;
      shuxingzu[1] := 0;
      fujiazhi := random(10) + 1;
      case shuxingzu[xuanzhongzhi] of
        0:
          begin
            case This_Player.Job of
              0:
                begin
                  shuxingzhi := This_Player.MaxDC *35 / 100;    // 这里改战士攻击力 最多为 35为设置最多可以获得的属性 最高可以改成100 
                  shuxingzhi1 := shuxingzhi + fujiazhi;
                end;
              1:
                begin
                  shuxingzu[1] := 1;
                  shuxingzhi := This_Player.MaxMC * 20 / 100;  //魔法 
                  shuxingzhi1 := shuxingzhi + fujiazhi;
                end;
              2:
                begin
                  shuxingzu[1] := 2;
                  shuxingzhi := This_Player.MaxSC * 20 / 100;  //道术 
                  shuxingzhi1 := shuxingzhi + fujiazhi;
                end;
            end;
          end;
        4:
          begin
            shuxingzhi := This_Player.MaxHP * 30 / 100;      //HP 
            shengming := shuxingzhi + fujiazhi;
          end;
        5:
          begin
            shuxingzhi := This_Player.MaxMP * 30 / 100;    //MP
            mofa := shuxingzhi + fujiazhi;
          end;
        8:
          begin
            shuxingzhi := This_Player.MaxAC * 20 / 100;    //防御 
            fangyu := shuxingzhi + fujiazhi;
          end;
        9:
          begin
            shuxingzhi := This_Player.MaxAC * 20 / 100;  //防御 
            moyu := shuxingzhi + fujiazhi;
          end;
      end;
    end
    else
      This_Player.PlayerNotice('每次刷新神力属性需要灵符500个！', 0);
  end;
  shouci := True;
  This_Npc.NpcDialog(This_Player, '你将随机获得以下一个属性加成：' + '|' + shuxing + '：' +
    inttostr(shuxingzhi1) + '点' + '|防御：' + inttostr(fangyu) + '点' + '|魔御：' +
    inttostr(moyu) + '点' + '|生命值：' + inttostr(shengming) + '点' + '|魔法值：' +
    inttostr(mofa) + '点' +
    '|开启神力后1小时内将无法更换其他神力，请慎重开启！|{cmd}<刷新属性/@letgo> ^{cmd}<开启神力/@kaiqi>')
end;

procedure _kaiqi;
var
  shuxingming: string;
  shuxingshuzhi: integer;
begin
  if shuaxin then
  begin
    This_Player.SetV(50, 5, ConvertDateTimeToDB(GetNow));
    if shuxingzhi1 > 0 then
    begin
      shuxingming := '主属性';
      shuxingshuzhi := shuxingzhi1;
      This_Player.AddPlayerAbil(This_Player.Job, shuxingzhi1, 3600);    //属性时间 3600 秒  可以改   
    end;
    if fangyu > 0 then
    begin
      shuxingming := '防御';
      shuxingshuzhi := fangyu;
      This_Player.AddPlayerAbil(8, fangyu, 3600);
    end;
    if moyu > 0 then
    begin
      shuxingming := '魔御';
      shuxingshuzhi := moyu;
      This_Player.AddPlayerAbil(9, moyu, 3600);
    end;
    if shengming > 0 then
    begin
      shuxingming := 'HP';
      shuxingshuzhi := shengming;
      This_Player.AddPlayerAbil(4, shengming, 3600);
    end;
    if mofa > 0 then
    begin
      shuxingming := 'MP';
      shuxingshuzhi := mofa;
      This_Player.AddPlayerAbil(5, mofa, 3600);
    end;
    This_Npc.CloseDialog(This_Player);
    ServerSay('玩家<' + This_Player.Name + '>开启了神力附体，' + shuxingming + '增加了' +
      inttostr(shuxingshuzhi) + '点，顿时杀气冲天而起 ！ ', 5);
  end
  else
    This_Player.PlayerNotice('请先刷新你要附加的神力！', 0);
end;

begin
  shuaxin := False;
  This_Npc.NpcSay('神力附体可以临时提高你的各种属性，持续时间1小时，打宝PK必备！');
  xiangcha := minusDataTime(GetNow,
    ConvertDBToDateTime(This_Player.GetV(50, 5)));
  if (This_Player.GetV(50, 5) = -1) or (xiangcha >= 3610) then    //这里设置检测剩余时间参数  3610   
  begin
    shouci := False;
    This_Npc.NpcDialog(This_Player, '神力附体可以临时增加你的属性，杀人夺宝，无往不利！' +
      '|花费500灵符可以随机刷新一个神力属性，按照你自身的属性比例来加成。持续时间1小时！|你当前的灵符数量：' +
      inttostr(This_Player.MyLFnum) + '|{cmd}<我要开启/@letgo>');
  end
  else
    This_Npc.NpcDialog(This_Player, '必须' + inttostr(3610 - xiangcha) +   //这里用3610减去过去的时间 等于 剩余开启时间 
      '秒后才可以再次开启神力！');

end.