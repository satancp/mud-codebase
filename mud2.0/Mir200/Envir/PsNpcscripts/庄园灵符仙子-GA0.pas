{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _chuang;
begin
   if This_Player.Level >= 8 then
   begin
      if compareText(This_Player.MapName,'GA0') = 0 then
      begin
         This_Player.RandomFlyTo('0122~1');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '您的等级不够，天关对您可能太危险了！'); 
   end;
end;

procedure _xijie;
begin
   This_Npc.NpcDialog(This_Player,
   '|{cmd}<同时拥有月卡和秒卡，如何兑换灵符/@duihuan>\'+
   '|{cmd}<为什么提示我“天关通道已经满员，请稍后再试”/@why>\'+
   '|{cmd}<兑换灵符时，为什么系统提示:“你要等一会儿，才能兑换�  �/@tishi>\'+
   '|{cmd}<在天关中获得的金刚石如何显示/@xianshi>\'+
   '|{cmd}<天关通道是否就是天关/@shifou>\ \'+
   '|{cmd}<返回/@main>');
end;

procedure _shifou;
begin
   This_Npc.NpcDialog(This_Player,
   '天关通道并不是天关，只是天庭通往天关的通道；\'+
   '天关通道里没有宝藏，真正的宝藏是隐藏在天关里的。\ \'+
   '|{cmd}<返回上一页/@xijie>');
end;

procedure _xianshi;
begin
   This_Npc.NpcDialog(This_Player,
   '如果您在天关中获得了金刚石，那么在同一天关中是无法显示的，\'+
   '如果您进入下一天关，或返回天庭，就可以看到增加的金刚石了。\ \'+
   '|{cmd}<返回上一页/@xijie>');
end;

procedure _tishi;
begin
   This_Npc.NpcDialog(This_Player,
   '系统规定每次兑换灵符后，必须等一分钟后才能再次兑换。\ \'+
   '|{cmd}<返回上一页/@xijie>');
end;

procedure _why;
begin
   This_Npc.NpcDialog(This_Player,
   '如果玩家对自己的实力有信心，可以[选择消灭怪物]，\'+
   '在没有灵符的保护下进入天关通道。\'+
   '玩家必须只身消灭完天关通道里的所有怪物，才能进入天关夺宝，\'+
   '这样的通道一共有10条，\'+
   '如果满员就会提示：“天关通道已经满员，请稍后再试”\ \'+
   '|{cmd}<返回上一页/@xijie>');
end;

procedure _duihuan;
begin
   This_Npc.NpcDialog(This_Player,
   '兑换灵符时，如帐号同时存在月卡、秒卡，系统将先扣月卡再扣\'+
   '秒卡；\'+
   '如玩家兑换数量大于等于当前月卡剩余天数，系统将只兑换月卡\'+
   '当前余额减去1天后所对应的灵符数量；\'+
   '如果玩家还要继续兑换，则需等待一段时间，这段时间间隔根据\'+
   '玩家申请时选择兑换灵符的数量而定；\'+
   '这段时间以后，玩家可使用秒卡进行灵符的兑换秒卡能兑换的最\'+
   '大额度为秒卡的当前余额减去1小时所对应的灵符数量。\'+ 
   '|{cmd}<“减去 1天”、“减去 1小时”是什么意思/@yisi>        ^<返回上一页/@xijie>');
end;

procedure _yisi;
begin
   This_Npc.NpcDialog(This_Player,
   '月卡用户在兑换灵符时，系统会保留当前月卡的最后一天，以尽\'+
   '量保证玩家下次能登陆游戏；\'+
   '当前月卡所能兑换灵符的最大额度等于月卡的当前余额减去1天，\'+
   '保留的这1天依然遵守月卡“随时间自然消耗”的计费方式；\'+
   '秒卡用户在兑换灵符时，系统也将保留当前秒卡的最后一小时；\'+
   '当前秒卡所能兑换灵符的最大额度等于秒卡的当前余额减去 1小\'+
   '时，保留的这 1小时也依然遵守秒卡“随着游戏而消耗”的计费\'+
   '方式。\'+
   '|{cmd}<返回/@xijie>');
end;

procedure _randomga0;
var
tga0 : integer;
begin
  if compareText(This_Player.MapName,'GA0') = 0 then
  begin
     tga0 := random(5);
     if tga0 = 4 then
     begin
        This_Player.Flyto('GA0',70,71);
     end else if tga0 = 3 then
     begin
        This_Player.Flyto('GA0',73,64);
     end else if tga0 = 2 then
     begin
        This_Player.Flyto('GA0',73,69);
     end else if tga0 = 1 then
     begin
        This_Player.Flyto('GA0',62,72);
     end else if tga0 = 0 then
     begin
        This_Player.Flyto('GA0',61,64);
     end; 
  end;
end;

procedure _ybbuylingfu;
var
  num : integer;
begin
  num := This_Player.GetV(14,2);
  if num < 0 then
  begin
    num := 0;
    This_Player.SetV(14,2,0);
    This_Npc.NpcDialog(This_Player,
    '兑换标准：1个元宝可以用以兑换1张灵符，\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\' 
    +'你还没有兑换灵符。\'  
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<加一张/@ybaddone> ^<加五张/@ybaddfive> ^<加十张/@ybaddten>      |<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    );
  end
  else if num = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '兑换标准：1个元宝可以用以兑换1张灵符，\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\'
    +'你还没有兑换灵符。\'  
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<加一张/@ybaddone> ^<加五张/@ybaddfive> ^<加十张/@ybaddten>      |<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    );
  end
  else if num < 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '兑换标准：1个元宝可以用以兑换1张灵符，\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\' 
    +'你打算兑换' + inttostr(num) + '张灵符\' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<加一张/@ybaddone> ^<加五张/@ybaddfive> ^<加十张/@ybaddten>      |<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    );
  end
  else
  begin
    num := 1000;
    This_Player.SetV(14,2,num);
    This_Npc.NpcDialog(This_Player,
    '一次最多可兑换1000张灵符，\'
    +'您已经选择兑换1000张灵符，是否进行兑换？\ \'
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    ); 
  end;
end;

procedure showchklinfu();
var
  num : integer;
begin
  num := This_Player.GetV(14,2);
  if num < 0 then
  begin
    num := 0;
    This_Player.SetV(14,2,0);
    This_Npc.NpcDialog(This_Player,
    '兑换标准：1个元宝可以用以兑换1张灵符，\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\' 
    +'你还没有兑换灵符。\' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<加一张/@ybaddone> ^<加五张/@ybaddfive> ^<加十张/@ybaddten>      |<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    );
  end
  else if num = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '兑换标准：1个元宝可以用以兑换1张灵符，\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\' 
    +'你还没有兑换灵符。\' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<加一张/@ybaddone> ^<加五张/@ybaddfive> ^<加十张/@ybaddten>      |<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    );
  end
  else if num < 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '兑换标准：1个元宝可以用以兑换1张灵符，\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\' 
    +'你打算兑换' + inttostr(num) + '张灵符\' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<加一张/@ybaddone> ^<加五张/@ybaddfive> ^<加十张/@ybaddten>      |<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    );
  end
  else
  begin
    num := 1000;
    This_Player.SetV(14,2,num);
    This_Npc.NpcDialog(This_Player,
    '一次最多可兑换1000张灵符，\'
    +'您已经选择兑换1000张灵符，是否进行兑换？\ \'
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<减一张/@ybdecone> ^<减五张/@ybdecfive> ^<减十张/@ybdecten>\'
    +'|{cmd}<确定使用元宝兑换/@ybbuylf>          ^<任意兑换灵符/@ybbuylf_1>          |<返回/@main>'
    
    ); 
  end;
end;

procedure _chklinfu;
begin
  This_Npc.NpcDialog(This_Player,
  '你当前的灵符总数是：' + inttostr(This_Player.MyLFnum)
  ); 
end;

procedure ybaddlinfu(num : integer);
var
  allnum : integer;
begin
  allnum := This_Player.GetV(14,2) + num;
  if  allnum < 1000 then
  begin
    This_Player.SetV(14,2,allnum);
    showchklinfu;
  end
  else
  begin
    This_Player.SetV(14,2,1000);
    showchklinfu;
  end;
end; 


procedure _ybaddone;
begin
  ybaddlinfu(1);
end;

procedure _ybaddfive;
begin
  ybaddlinfu(5);
end;  

procedure _ybaddten;
begin
  ybaddlinfu(10);
end;

procedure ybdeclinfu(num : integer);
var
  allnum : integer;
begin
  allnum := This_Player.GetV(14,2) - num;
  if  allnum > 0 then
  begin
    This_Player.SetV(14,2,allnum);
    showchklinfu;
  end
  else
  begin
    This_Player.SetV(14,2,0);
    showchklinfu;
  end;
end; 

procedure _ybdecone;
begin
  ybdeclinfu(1);
end;

procedure _ybdecfive;
begin
  ybdeclinfu(5);
end;  

procedure _ybdecten;
begin
  ybdeclinfu(10);
end;

procedure _ybbuylf;
var
  linfu_num : integer;
begin
  linfu_num := This_Player.GetV(14,2);
  if This_Player.YBNum >= linfu_num then
  begin
    This_Npc.ClientYBbuyLF(This_Player, linfu_num);
    This_Player.SetV(14,2,0);
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '您身上没有那么多的元宝。\ \|{cmd}<返回/@main>');
  end;
end;

procedure _ybbuylf_1;
begin
  This_Npc.InputDialog(This_Player, '请输入要兑换的灵符数量(1~~1000)：', 0, 101);
end;

procedure P101;
var
  linfu_num : integer;
begin
  if This_Npc.InputOk then
  begin
    linfu_num := strtointdef(Trim(This_Npc.InputStr), 0);
    if This_Player.YBNum >= linfu_num then
    begin
      if (linfu_num > 0) and (linfu_num <= 1000) then
      begin
        This_Npc.ClientYBbuyLF(This_Player, linfu_num);
      end
      else
      begin
        This_Npc.NpcDialog(This_Player,
        '每次兑换不能超过1000张。\ \|{cmd}<返回/@main>'); 
      end;
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '您身上没有那么多的元宝。\ \|{cmd}<返回/@main>'); 
    end;
  end; 
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '在进入天关通道前的瞬间，使用1张灵符将可以隐身遁形。\'+
   '此时，天关通道内的怪物将无法看到你，通过我，我可以将您的\'+
   '元宝兑换成灵符，你可以输入想要兑换的灵符数量，\'+
   '1个元宝兑换1张灵符，进入庄园后，等待一分钟后就可兑换灵符。\ \'+
   '|{cmd}<前往天庭闯天关/@chuang>                  ^<查询灵符数量/@chklinfu>\'+ 
   '|{cmd}<了解闯天关的规则/@xijie>                ^<使用元宝兑换灵符/@ybbuylingfu>\'+
   '|{cmd}<去周围看看/@randomga0>                      ^<离开/@doexit>');
end.