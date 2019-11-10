{******************************************************************
* 项目名称：
* 单元名称：LogonQuest 
* 单元作者： 
* 摘    要：
* 备    注：
*******************************************************************}

program Mir2;

{$I ActiveValidateCom.pas}




procedure _AboutActive;
begin
   This_Player.PlayerDialog(
   '增强传奇信用分的方式有以下:\' 
    +'|1.使用浪漫星雨或者地下组队卷轴进入地图挑战怪物会增加你的\传奇信用分。\' 
    +'|2.击杀BOSS与活动怪物也会增加传奇信用分。\' 
    +'|3.参加地下夺宝活动,并点击到活动NPC,会增加传奇信用分。\' 
    +'|4.在商城中购买绑定道具会增加传奇信用分。\' 
    +'|5.鉴定精力值,金刚石抽取武器等会增加传奇信用分。\' 
    +'|6.学习高级技能和佩戴高属性装备可以增加临时信用分。\'
    +'|7.还有许多会增加传奇信用分的方式,等待你去发现。\' 
    ); 
end; 
procedure _ValidateActive;
var StorageNum_b , StorageNum_N : integer;
begin
   if This_Player.CheckAuthen(1,100) = false then
   begin
     if This_Player.GetActivePoint + This_Player.GetTmpActivePoint >= 30 then
     begin
      StorageNum_b := This_Player.GetStorageSpaceCount;
      if This_Player.ActiveAuthen(1,100) = 1 then
      begin
      StorageNum_N := This_Player.GetStorageSpaceCount;
      
      This_Player.ExpandStorageSpace(StorageNum_b + 24 - StorageNum_N);

      
      This_Player.PlayerDialog(
      '验证成功！\'+
      '您已成为验证用户，祝您游戏愉快！'  
      ); 
      end else
      This_Player.PlayerDialog(
      '验证失败，请稍后再试。\ \'  
      ); 
     end else 
     This_Player.PlayerDialog(
     '验证失败，您的传奇信用分不足30分。\ \'+ 
     '|{cmd}<了解增强传奇信用分的方式/@AboutActive>\'  
     ); 
   end else
   This_Player.PlayerDialog(
   '您是验证用户，无需再次验证，祝您游戏愉快！\'  
   ); 
end; 

procedure EventNotify(EventNO: Integer; EventParam: Integer);   //此接口由程序调用 
begin

end;

//**************************GM宝典*****************************


function getZBnameById(ZBid : integer) : string;
var ZBlv , ZBlvId : integer;
begin
    ZBlv := ZBid div 100;
    ZBlvId := ZBid mod 100;
    result := '';
    case ZBlv of
        1 : 
        begin
            case ZBlvId of
                1 : result := '绿色项链';
                2 : result := '骑士手镯';
                3 : result := '力量戒指';
                4 : result := '恶魔铃铛';
                5 : result := '龙之手镯';
                6 : result := '紫碧螺';
                7 : result := '灵魂项链';
                8 : result := '三眼手镯';
                9 : result := '泰坦戒指';
                10 : result := '黑铁头盔';
                11 : result := '青铜腰带';
                12 : result := '紫绸靴';
				13 : result := '骨玉权杖';
				14 : result := '裁决之杖';
				15 : result := '龙纹剑';
				16 : result := '斗笠43号';
				17 : result := '斗笠44号';
				18 : result := '斗笠45号';
				19 : result := '荣誉勋章43号';
				20 : result := '荣誉勋章44号';
				21 : result := '荣誉勋章45号';
            end;
        end;
		
        2 : 
        begin
            case ZBlvId of
                1 : result := '圣战头盔';
                2 : result := '圣战项链';
                3 : result := '圣战手镯';
                4 : result := '圣战戒指';
                5 : result := '法神头盔';
                6 : result := '法神项链';
                7 : result := '法神手镯';
                8 : result := '法神戒指';
                9 : result := '天尊头盔';
                10 : result := '天尊项链';
                11 : result := '天尊手镯';
                12 : result := '天尊戒指';
                13 : result := '钢铁腰带';
                14 : result := '避魂靴';
				15 : result := '霓裳羽衣';
                16 : result := '天师长袍';
                17 : result := '圣战宝甲';
                18 : result := '天魔神甲';
                19 : result := '法神披风';
                20 : result := '天尊道袍';

            end;
        end;
		
		
		        3 : 
        begin
            case ZBlvId of
               1 : result := '雷霆项链';
                2 : result := '雷霆护腕';
                3 : result := '雷霆战戒';
                4 : result := '雷霆腰带';
                5 : result := '雷霆战靴';
                6 : result := '烈焰项链';
                7 : result := '烈焰护腕';
                8 : result := '烈焰魔戒';
                9 : result := '烈焰腰带';
                10 : result := '烈焰魔靴';
                11 : result := '光芒项链';
                12 : result := '光芒护腕';
                13 : result := '光芒道戒';
                14 : result := '光芒腰带';
                15 : result := '光芒道靴';
				16 : result := '烈焰魔盔';
				20 : result := '光芒道盔';
				21 : result := '雷霆战盔';
				25 : result := '烈焰魔衣(男)';
                26 : result := '烈焰魔衣(女)';
				27 : result := '雷霆战甲(男)';
			    28 : result := '雷霆战甲(女)';
                29 : result := '光芒道袍(男)';
				30 : result := '光芒道袍(女)';

            end;
        end;
       
	   4 : 
        begin
            case ZBlvId of
                  1 : result := '强化雷霆腰带';
				2 : result := '强化雷霆战靴';
				3 : result := '强化烈焰腰带';
				4 : result := '强化烈焰魔靴';
				5 : result := '强化光芒腰带';
				6 : result := '强化光芒道靴';
	            7 : result := '强化雷霆项链';
                8 : result := '强化雷霆护腕';
                9 : result := '强化雷霆战戒';
                10 : result := '强化烈焰项链';
                11 : result := '强化烈焰护腕';
				12 : result := '强化烈焰魔戒';
				13 : result := '强化光芒项链';
				14 : result := '强化光芒护腕';
				15 : result := '强化光芒道戒';

		   end;
		   end;
		 
		 
		  5 : 
        begin
            case ZBlvId of
	 	1 : result := '开天';
                2 : result := '镇天';
				3 : result := '玄天';
			    4 : result := '凤天魔甲';
                5 : result := '凰天魔衣';
				6 : result := '真魂项链';
				7 : result := '战神戒指';
                8 : result := '真魂戒指';
				9 : result := '圣魔戒指';
			    10 : result := '真魂手镯';
                11 : result := '战神手镯';
				12 : result := '圣魔手镯';
			    13 : result := '战神项链';
                14 : result := '圣魔项链';
		   end;
		   end;
		   

		   
		 6 : 
        begin
            case ZBlvId of
			1 : result := '星王战靴';
				2 : result := '星王腰带(战)';
				3 : result := '星王法冠';
				4 : result := '星王道盔';
				5 : result := '星王法靴';
				6 : result := '星王道靴';
	            7 : result := '星王腰带(法)';
                8 : result := '星王腰带(道)';
                9 : result := '星王战戒';
                10 : result := '星王护腕(战)';
                11 : result := '星王项链(战)';
				12 : result := '星王魔戒';
				13 : result := '星王护腕(法)';
				14 : result := '星王项链(法)';
				15 : result := '星王道戒';
				16 : result := '星王护腕(道)';
				17 : result := '星王项链(道)';
				18 : result := '星王圣剑(战)';
				19 : result := '星王圣剑(法)';
				20 : result := '星王圣剑(道)';
				21 : result := '星王圣甲(男)';
				22 : result := '星王圣甲(女)';
		   end;
		   end;
		   
    end;
end;

function getZexpNum(Zlv : integer) : integer;
begin
    case Zlv of
        1 : result := 10000;
        2 : result := 20000;
        3 : result := 40000;
		4 : result := 80000;
        5 : result := 320000;
        6 : result := 1280000;
    end;
end;

  
  
procedure _huishou;
begin
    This_Player.PlayerDialog(
    '<请选择要回收的装备种类！/c=red> |\'+
    '<不愿意回收的装备可以存到仓库！/c=red> |\' +
    +'|{cmd}<一键回收祖玛/@ZUma_all>      ^<一键回收赤月/@ChiYue_all>\'
    +'|{cmd}<一键回收魔龙/@tianzhichiyue_all>       ^<一键回收强化/@molong_all>\'
	+'|{cmd}<一键回收战神/@tianzhimolong_all>   ^<一键回收星王/@kaitian_all>'
	+'|{cmd}<返回/@1238>'
	);
end;


procedure _ZUma_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 40 do
    begin
        Iname := getZBnameById(100 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_Player.PlayerDialog(
     '你的包裹中有' + inttostr(ZMnum) + '件祖玛装备，回收可获得:' + inttostr(getZexpNum(1) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(1) div 20000 * ZMnum) + '个灵符，你确定回收所有祖玛装备吗？\|'
    +'|{cmd}<确认回收所有祖玛装备/@ZUma_True>'
    +'|{cmd}<返回/@ZhuangBack>');
end;

procedure  _ZUma_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 40 do
    begin
        Iname := getZBnameById(100 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.Give('经验', getZexpNum(1));
				This_Player.AddLF(0,getZexpNum(1) div 20000);
				ServerSay('玩家<' + This_Player.Name + '>使用会员宝箱回收了'+ inttostr(ZMnum) + '件祖玛装备，获得:'+ inttostr(getZexpNum(1) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(1) div 20000) + '个灵符！', 2);
            end;
        end; 
    end;
    This_Player.PlayerDialog(
    '恭喜你成功回收！' 
    +'|{cmd}<返回/@ZhuangBack>');

end;


procedure _Chiyue_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 40 do
    begin
        Iname := getZBnameById(200 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_Player.PlayerDialog(
    '你的包裹中有' + inttostr(ZMnum) + '件赤月装备，回收可获得:' + inttostr(getZexpNum(2) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(2) div 40000 * ZMnum) + '个灵符，你确定回收所有赤月装备吗？\|'
    +'|{cmd}<确认回收所有赤月装备/@Chiyue_True>'
    +'|{cmd}<返回/@ZhuangBack>');
end;


procedure  _Chiyue_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 40 do
    begin
        Iname := getZBnameById(200 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.Give('经验', getZexpNum(2));
			    This_Player.AddLF(0,getZexpNum(2) div 40000);
				ServerSay('玩家<' + This_Player.Name + '>使用会员宝箱回收了'+ inttostr(ZMnum) + '件赤月装备，获得:'+ inttostr(getZexpNum(2) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(2) div 40000) + '个灵符！', 2);
            end;
        end; 
    end;
    This_Player.PlayerDialog(
    '恭喜你成功回收'
    +'|{cmd}<返回/@ZhuangBack>');

end;

procedure _tianzhichiyue_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 40 do
    begin
        Iname := getZBnameById(300 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_Player.PlayerDialog(
    '你的包裹中有' + inttostr(ZMnum) + '件魔龙装备，回收可获得:' + inttostr(getZexpNum(3) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(3) div 40000 * ZMnum) + '个灵符，你确定回收所有魔龙装备吗？\|'
    +'|{cmd}<确认回收所有魔龙装备/@tianzhichiyue_True>'
    +'|{cmd}<返回/@ZhuangBack>');
end;

procedure  _tianzhichiyue_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 40 do
    begin
        Iname := getZBnameById(300 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.Give('经验', getZexpNum(3));
                This_Player.AddLF(0,getZexpNum(3) div 40000);
				ServerSay('玩家<' + This_Player.Name + '>使用会员宝箱回收了'+ inttostr(ZMnum) + '件魔龙装备，获得:'+ inttostr(getZexpNum(3) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(3) div 40000) + '个灵符！', 2);
            end;
        end; 
    end;
    This_Player.PlayerDialog(
    '恭喜你成功回收！'
    +'|{cmd}<返回/@ZhuangBack>');

end;





procedure _molong_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 39 do
    begin
        Iname := getZBnameById(400 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_Player.PlayerDialog(
    '你的包裹中有' + inttostr(ZMnum) + '件强化装备，回收可获得:' + inttostr(getZexpNum(4) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(4) div 64000 * ZMnum) + '个灵符，你确定回收所有强化装备吗？\|'
    +'|{cmd}<确认回收所有强化装备/@molong_True>'
    +'|{cmd}<返回/@ZhuangBack>');
end;

procedure  _molong_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 39 do
    begin
        Iname := getZBnameById(400 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.Give('经验', getZexpNum(4));
				This_Player.AddLF(0,getZexpNum(4) div 64000);
				ServerSay('玩家<' + This_Player.Name + '>使用会员宝箱回收了'+ inttostr(ZMnum) + '件强化装备，获得:'+ inttostr(getZexpNum(4) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(4) div 64000) + '个灵符！', 2);
            end;
        end; 
    end;
    This_Player.PlayerDialog(
    '恭喜你回收成功！'
    +'|{cmd}<返回/@ZhuangBack>');

end;






procedure _tianzhimolong_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 21 do
    begin
        Iname := getZBnameById(500 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_Player.PlayerDialog(
    '你的包裹中有' + inttostr(ZMnum) + '件战神装备，回收可获得:' + inttostr(getZexpNum(5) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(5) div 64000 * ZMnum) + '个灵符，你确定回收所有战神装备吗？\|'
    +'|{cmd}<确认回收所有战神装备/@tianzhimolong_True>'
    +'|{cmd}<返回/@ZhuangBack>');
end;

procedure  _tianzhimolong_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 21 do
    begin
        Iname := getZBnameById(500 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.Give('经验', getZexpNum(5));
                This_Player.AddLF(0,getZexpNum(5) div 64000);
				ServerSay('玩家<' + This_Player.Name + '>使用会员宝箱回收了'+ inttostr(ZMnum) + '件战神装备，获得:'+ inttostr(getZexpNum(5) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(5) div 64000) + '个灵符！', 2);
            end;
        end; 
    end;
    This_Player.PlayerDialog(
    '恭喜你获得:' + inttostr(getZexpNum(5) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(5) div 64000 * ZMnum) + '个灵符！\|'
    +'|{cmd}<返回/@ZhuangBack>');

end;




procedure _kaitian_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 14 do
    begin
        Iname := getZBnameById(600 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_Player.PlayerDialog(
    '你的包裹中有' + inttostr(ZMnum) + '件星王装备，回收可获得:' + inttostr(getZexpNum(6) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(6) div 64000 * ZMnum) + '个灵符，你确定回收所有星王装备吗？\|'
    +'|{cmd}<确认回收所有星王装备/@kaitian_True>'
    +'|{cmd}<返回/@ZhuangBack>');
end;

procedure  _kaitian_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 14 do
    begin
        Iname := getZBnameById(600 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.Give('经验', getZexpNum(6));
				This_Player.AddLF(0,getZexpNum(6) div 64000);
				ServerSay('玩家<' + This_Player.Name + '>使用会员宝箱回收了'+ inttostr(ZMnum) + '件星王装备，获得:'+ inttostr(getZexpNum(6) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(6) div 64000) + '个灵符！', 2);
            end;
        end; 
    end;
    This_Player.PlayerDialog(
    '恭喜你获得:' + inttostr(getZexpNum(6) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(6) div 64000 * ZMnum) + '个灵符！\|'
    +'|{cmd}<返回/@ZhuangBack>');

end;



procedure _sjls;      //       直升48级 
var 
sum2 : integer;
begin
  sum2 := This_Player.GetV(50,2);
  if  This_Player.GetV(50,2) <0 then    This_Player.setV(50,2,0);
  if  This_Player.GetV(50,2) <1  then
      begin 
        This_Player.setV(50,2,1);
       This_Player.SetPlayerLevel(48);   //       直升48级 
      end else This_Player.PlayerDialog(
             '你已经升级过一次了!')   
end;                                      //     直升48级

procedure _KQSHENLI;    //开启神力 
var 
sum3 : integer;
today1:Integer;
begin
today1 := GetDateNum(GetNow);

    if This_Player.GetV(52,2) <> today1 then //此段为每天都能领一次的设置    
    begin
       This_Player.SetV(52,2,today1);
         This_Player.setV(50,3,0) ;         
    end;
    
  sum3 := This_Player.GetV(50,3);
  if  This_Player.GetV(50,3) <1  then
  case random(3) of         //随机开启2倍，1.5，倍1.2倍神力 每天一个小时 
  0 : begin
      This_Player.AddPlayerAbil(4,This_Player.Maxhp*2, 3600);  //2倍神力  
      This_Player.AddPlayerAbil(0,This_Player.MaxDC*2, 3600);   // 攻击力上下限平局值算法   ((This_Player.MAXDC +This_Player.DC) div 2)*2
      This_Player.AddPlayerAbil(2,This_Player.MaxSC*2, 3600);
      This_Player.AddPlayerAbil(1,This_Player.MaxMC*2, 3600);
      This_Player.setV(50,3,1) ;
      end;
  1 :  begin 
       This_Player.AddPlayerAbil(4,This_Player.Maxhp div 2 + This_Player.Maxhp,3600); //1.5倍
       This_Player.AddPlayerAbil(0,This_Player.MaxDC div 2 + This_Player.MaxDC,3600);
       This_Player.AddPlayerAbil(2,This_Player.MaxSC div 2 + This_Player.MaxSC,3600);
       This_Player.AddPlayerAbil(1,This_Player.MaxMC div 2 + This_Player.MaxMC,3600);
       This_Player.setV(50,3,1) ;
        end;
  2:  begin 
      This_Player.AddPlayerAbil(4,This_Player.Maxhp div 5 + This_Player.Maxhp,3600);   //1.2倍
      This_Player.AddPlayerAbil(0,This_Player.MaxDC div 5 + This_Player.MaxDC,3600);
      This_Player.AddPlayerAbil(2,This_Player.MaxSC div 5 + This_Player.MaxSC,3600);
      This_Player.AddPlayerAbil(1,This_Player.MaxMC div 5 + This_Player.MaxMC,3600);
      This_Player.setV(50,3,1) ;
      end;                
 end else This_Player.PlayerDialog(
             '你今天已经开启过一次了，请明天再来!')   
end;                                                         //开启神力 
 
  
procedure _CS;       //传送 
begin
    This_Player.PlayerDialog(
    '欢迎来到会员传送中心！：\'
    +'|{cmd}<安全传送/@anquan>        ^<险恶区域/@xiane>    ^<变态区域/@biantai>  ^<六重装/@zz>\');
end;

procedure _xiane;
begin
  This_Player.PlayerDialog(
  '欢迎来到会员传送中心！\ \'
  +'|{cmd}<比齐矿区/@MOVE12>    ^<沃玛寺庙/@MOVE13>    ^<死亡山谷/@MOVE14>\'
  +'|{cmd}<石 墓 阵/@MOVE15>    ^<抉择之地/@MOVE16>    ^<封魔矿区/@MOVE17>\'
  +'|{cmd}<尸 魔 洞/@MOVE18>    ^<骨 魔 洞/@MOVE19>    ^<牛魔寺庙/@MOVE20> \' 
  +'|{cmd}<牛魔六层/@MOVE21>\' 
  );
end;

procedure _MOVE12; 
begin
This_Player.Flyto('0',650,219);
end;

procedure _MOVE13; 
begin
This_Player.Flyto('1',88,282);
end;

procedure _MOVE14; 
begin
This_Player.Flyto('3',143,93);
end;

procedure _MOVE15; 
begin
This_Player.Flyto('D715',87,77);
end;

procedure _MOVE16; 
begin
This_Player.Flyto('D1004',64,234);
end;

procedure _MOVE17; 
begin
This_Player.Flyto('4',56,76);
end;

procedure _MOVE18; 
begin
This_Player.Flyto('5',518,615);
end;

procedure _MOVE19; 
begin
This_Player.Flyto('5',550,135);
end;

procedure _MOVE20; 
begin
This_Player.Flyto('5',659,461);
end;

procedure _MOVE21; 
begin
This_Player.Flyto('D2078',160,160);
end;

procedure _anquan;
begin
  This_Player.PlayerDialog(
  '欢迎来到会员传送中心！\ \'
  +'|{cmd}<边界村/@MOVE01>    ^<银杏山谷/@MOVE02>    ^<比奇省/@MOVE0>\'
  +'|{cmd}<毒蛇山谷/@MOVE2>    ^<盟重省/@MOVE3>    ^<封魔谷/@MOVE4>\'
  +'|{cmd}<苍月岛/@MOVE5>    ^<魔龙城/@MOVE6>    ^<白日门/@MOVE11> \' 
  +'|{cmd}<沙城区域/@shacheng>\' 
  );
end;

procedure _MOVE01; 
begin
This_Player.Flyto('0',650,631);
end;

procedure _MOVE02; 
begin
This_Player.Flyto('0',289,618);
end;

procedure _MOVE0; 
begin
This_Player.Flyto('0',325,268);
end;

procedure _MOVE2; 
begin
This_Player.Flyto('2',503,483);
end;

procedure _MOVE3; 
begin
This_Player.Flyto('3',330,330);
end;

procedure _MOVE4; 
begin
This_Player.Flyto('4',240,200);
end;

procedure _MOVE5; 
begin
This_Player.Flyto('5',141,335);
end;

procedure _MOVE6; 
begin
This_Player.Flyto('6',124,156);
end;

procedure _MOVE11; 
begin
This_Player.Flyto('11',178,326);
end;

procedure _shacheng; 
begin
This_Player.Flyto('3',719,414);
end;

procedure _biantai;
begin
  This_Player.PlayerDialog(
  '欢迎来到会员传送中心！\ \'
  +'|{cmd}<火龙殿/@MOVE22>    ^<龙源血路/@MOVE23>    ^<魔龙血域/@MOVE24>\'
  +'|{cmd}<热血战场/@MOVE25>    ^<牛魔大殿/@MOVE26>    ^< 恶魔祭坛/@MOVE27>\'
  +'|{cmd}<赤月魔穴/@MOVE28>    ^<石墓七层/@MOVE29>    ^<祖玛教主之家/@MOVE30> \' 
  +'|{cmd}<桃园之门/@MOVE31>\' 
  );
end;

procedure _MOVE22; 
begin
This_Player.RandomFlyto('D2083~1');
ServerSay('玩家<' + This_Player.Name + '>通过会员服务,进入了火龙殿', 2);
end;

procedure _MOVE23; 
begin
This_Player.Flyto('65',267,107);
end;

procedure _MOVE24; 
begin
This_Player.Flyto('66',257,212);
end;

procedure _MOVE25; 
begin
This_Player.Flyto('HL002',83, 156);
ServerSay('玩家<' + This_Player.Name + '>通过会员服务,进入了热血战场', 2);
end;

procedure _MOVE26; 
begin
This_Player.Flyto('D2079',13,13);
end;

procedure _MOVE27; 
begin
This_Player.Flyto('D10061',21,26);
end;

procedure _MOVE28; 
begin
This_Player.Flyto('D10062',11,25);
end;

procedure _MOVE29; 
begin
This_Player.Flyto('D717',25,75);
end;

procedure _MOVE30; 
begin
This_Player.Flyto('D515',13,32);
end;

procedure _MOVE31; 
begin
This_Player.Flyto('R001',100,99);
end;

procedure _zz;
begin
  This_Player.PlayerDialog(
  '欢迎来到会员传送中心！\ \'
  +'|{cmd}<堕落坟场男法/@MOVE32>    ^<死亡神殿女法/@MOVE33>    ^<深渊魔域男道/@MOVE34>\'
  +'|{cmd}<钳虫巢穴女道/@MOVE35>    ^<地狱烈焰女战/@MOVE36>    ^< 困惑殿堂男战/@MOVE37>\'
  );
end;

procedure _MOVE32; 
begin
This_Player.RandomFlyto('T115');
end;

procedure _MOVE33; 
begin
This_Player.RandomFlyto('T118');
end;

procedure _MOVE34; 
begin
This_Player.RandomFlyto('T119');
end;


procedure _MOVE35; 
begin
This_Player.RandomFlyto('T132');
end;

procedure _MOVE36; 
begin
This_Player.RandomFlyto('T139');
end;

procedure _MOVE37; 
begin
This_Player.RandomFlyto('T140');
end;


procedure _FULI; //每日福利 
var 
sum1:Integer;
today:Integer;
begin
today := GetDateNum(GetNow);

    if This_Player.GetV(52,1) <> today then //此段为每天都能领一次的设置    
    begin
       This_Player.SetV(52,1,today);
         This_Player.setV(50,1,0) ;
    end;
    sum1 := This_Player.GetV(50,1); 
    if   sum1 < 1 then
    begin 
            if  This_Player.FreeBagNum >= 2 then  
            begin 
               This_Player.Give('50元宝' , 1);
			   This_Player.Give('50灵符礼包' , 1);
			   This_Player.Give('会员神水' , 1);
			   ServerSay('土豪玩家<' + This_Player.Name + '>领取了会员每日福利.', 2);		
               This_Player.PlayerDialog(
             '福利已放入您的包裹!');
             This_Player.setV(50,1,sum1 + 1) ;
      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'	);       
               end else
               This_Player.PlayerDialog(
               '你已经领过一次了,请明天再来!\');
 end;                        //每日福利 



procedure _Normal;  //灵符商店
var temp : integer;
begin
  temp := random(2);
  if temp = 1 then
  begin
  This_Player.PlayerDialog(
   '感谢，我可以为你做什么吗？我这里出售的都是最抢手的物品，\并且我可是盟重省独家经营哦！\ '
  +'|{cmd}<灵符购买/@lingfuBuy>\'
  +'|{cmd}<退出/@doexit>'
  );
  end
  else
  begin
  This_Player.PlayerDialog(
   '感谢，我可以为你做什么吗？我这里出售的都是最抢手的物品，\并且我可是盟重省独家经营哦！\'
  +'|{cmd}<灵符购买/@lingfuBuy>\'
  +'|{cmd}<退出/@doexit>'
  );
  end;
end;

function geiLinfItemName(itemId : integer):string; 
begin
    result := '';
    case itemId of   
	    5 : result := '修复神水';	
        6 : result := '比奇传送石';
        7 : result := '盟重传送石';
        8 : result := '随机传送石';
        9 : result := '魔血石(大)';
        10 : result := '书页';
        11 : result := '沃玛号角';       
        12 : result := '金条';
        13 : result := '祝福油';
        14 : result := '超级护身符';
        15 : result := '超级黄色药粉';
        16 : result := '超级灰色药粉';
	    17 : result := '祖玛头像';
    end;
end;

function needLFnum(itemId : integer):integer; 
begin
    result := 0;
    case itemId of    
        5 : result := 10;    
        6 : result := 30;
        7 : result := 30;
        8 : result := 30;
        9 : result := 100;
        10 : result := 50;
        11 : result := 20;
        12 : result := 30;
        13 : result := 40;
        14 : result := 10;
        15 : result := 10;
        16 : result := 10;
		17 : result := 20;
    end;
end;

procedure _lingfu;
var str : string;
i : integer;
begin
   str := '';
   
   for i:=5 to 23 do
   begin
       str := str + '<' + geiLinfItemName(i) + '/@buyLFitem_Dlg~' + inttostr(i) + '>'
       if (i mod 2) = 1 then
       str := str + '^'
       else
       str := str + '|'; 
   end;
   This_Player.PlayerDialog(
  '请选择你要购买的物品\ \|{cmd}'
  +str
  +'{cmd}<返回/@1238>'
  );
end;

procedure _buyLFitem_Dlg(strId : string);
var str : string;
i : integer;
begin
   str := '';
   
   i := StrToIntDef(strId,0);
 
   This_Player.PlayerDialog(
  '购买<' + geiLinfItemName(i) + '/c=red>需要<' + inttostr(needLFnum(i)) + '灵符/c=red>，|你确定使用' + inttostr(needLFnum(i)) + '灵符购买' + geiLinfItemName(i) + '吗？\ \'
  +'|{cmd}<确认购买' + geiLinfItemName(i) + '/@buyLFitem~' + strId + '>'
  +'{cmd}<返回/@lingfu>'
  );
end;

procedure _buyLFitem(strId : string);
var itemId , needLf: integer;
iName : string;
begin
    itemId := StrToIntDef(strId , 0);
    needLf := needLFnum(itemId);
    iName := geiLinfItemName(itemId);
    
    if iName <> '' then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
            if This_Player.MyLFnum >= needLf then
            begin
                This_Player.DecLF(10001, needLf, false);
                This_Player.Give(iName,1);
                This_Player.PlayerDialog(
                '恭喜你获得:' + iName + '！'
                +'|{cmd}<继续购买' + iName + ' /@buyLFitem~' + strId + '>'
                +'|{cmd}<返回/@lingfu>'
                );
            end else
            This_Player.PlayerDialog(
          '灵符数量不足，无法购买！'
          +'{cmd}<返回/@lingfu>'
          );
        end else
        This_Player.PlayerDialog(
      '包裹空间不足，无法购买！'
      +'{cmd}<返回/@lingfu>'
      );
    end;
end;


Procedure _doexit;
begin
   This_Player.CloseDialog(This_Player);
end;

function Gaoji0LB(price, num: Integer):boolean;
begin                                               

  result := true;
end;

  


procedure _xiane4;
     begin
    if This_Player.FreeBagNum > 0 then
begin
   if This_Player.MyLFnum >= 800 then 
  begin
  This_Player.Give('100元宝',1);
  This_Player.DecLF(0, 800, false);
  ServerSay('玩家<' + This_Player.Name + '>用会员宝箱兑换了元宝', 2);
  end
    else
    This_Player.PlayerDialog(
    '对不起，你没有800灵符，不能兑换元宝！'
    );
  end else
   This_Player.PlayerDialog(
	'对不起，你背包已满！'
	);
	end;

procedure _xiane5;
     begin
    if This_Player.FreeBagNum > 0 then
begin
   if This_Player.MyLFnum >= 500 then 
  begin
  This_Player.Give('金刚石',80);
  This_Player.DecLF(0, 500, false);
  ServerSay('玩家<' + This_Player.Name + '>用会员宝箱兑换了金刚石', 2);
  end
    else
    This_Player.PlayerDialog(
    '对不起，你没有500灵符，不能兑换金刚石！'
    );
  end else
   This_Player.PlayerDialog(
	'对不起，你背包已满！'
	);
	end;
	
	
	
	
	procedure _xiane6;
     begin
    if This_Player.FreeBagNum > 0 then
begin
   if This_Player.MyLFnum >= 100 then 
  begin
  This_Player.Give('100灵符礼包',1);
  ServerSay('土豪玩家<' + This_Player.Name + '>用会员宝箱提取了100灵符', 2);
  This_Player.DecLF(0, 100, false);
  end
    else
    This_Player.PlayerDialog(
    '对不起，你没有100灵符，不能取出！'
    );
  end else
   This_Player.PlayerDialog(
	'对不起，你背包已满！'
	);
	end;
	
	
procedure _xiane7;
     begin
    if This_Player.FreeBagNum > 0 then
begin
   if This_Player.YBNum >= 100 then 
  begin
  This_Player.Give('100元宝',1);
  ServerSay('土豪玩家<' + This_Player.Name + '>用会员宝箱提取了100元宝', 2);
  This_Player.PsYBConsum(This_Player,'YB_NewComeBag',20001,100,1); 
  end
    else
    This_Player.PlayerDialog(
    '对不起，你没有100元宝，不能兑换取出！'
    );
  end else
   This_Player.PlayerDialog(
	'对不起，你背包已满！'
	);
	end;
		





procedure _huhuan;
   begin
      This_Player.PlayerDialog(
      '在我这里可以货币互换哦\ \'
	  +'|{cmd}<800灵符兑换100个元宝/@xiane4>  \'
	  +'|{cmd}<500灵符兑换80个金刚石/@xiane5>  \'
	  +'|{cmd}<提取100灵符/@xiane6>  \'
	  +'|{cmd}<提取100元宝/@xiane7>  \'
      +'|{cmd}<返回/@1238>  \'
	  );
end;
  
    //回收 


procedure _my;                  //买药 
begin
  This_Player.PlayerDialog(
  '欢迎来到开心就好会员中心快捷买药符！\ \'
  +'|{cmd}<超级金创药/@cjjcy>    ^<超级魔法药/@cjmfy>    ^<超级灰色药粉/@cjhsyf>\'
  +'|{cmd}<超级黄色药粉/@cjhsyf1>    ^<万年雪霜包/@wnxs>    ^< 太阳水包/@tys>\'
  +'|{cmd}<疗伤药包/@lsy>    ^<护身符(大)/@hsf>                          '
  );
end;
 
procedure _cjjcy;
 begin  
            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('超级金创药' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '超级金创药已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');       
end;
 
 procedure _cjmfy;
   begin  
            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('超级魔法药' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '超级魔法药已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');      
end;
   
  procedure _cjhsyf;
   begin  
            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('超级灰色药粉' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '超级灰色药粉已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');
end;
   
procedure _cjhsyf1;
begin  
            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('超级黄色药粉' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '超级黄色药粉已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');      
end;
   
procedure _wnxs;
 begin  
            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('万年雪霜包' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '万年雪霜包已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');      
end;

   procedure _tys;
   begin  
            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('太阳水包' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '太阳水包已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');      
end;
      
procedure _lsy;
            begin  
            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('疗伤药包' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '疗伤药包已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');      
end;
   
procedure _hsf; 
begin 

            if  This_Player.GoldNum >= 500 then 
            begin 
              if  This_Player.FreeBagNum >= 2 then  
              begin 
               This_Player.Give('护身符(大)' , 1);
               This_Player.DecGold(500);
               This_Player.PlayerDialog(
             '护身符(大)已放入您的包裹!')      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'); 
              end else
              This_Player.PlayerDialog(
              '你的金钱不够!\');      
end;
      
   
//--------GM宝典---------------------------- 

procedure TempExpBylv();
var tempLv , tempExp : integer;
begin
    tempExp := 0;  
    tempLv := This_Player.Level;
 if (tempLv >= 1) and (tempLv <= 25) then tempExp := 20 
    else if (tempLv >= 25) and (tempLv <= 35) then tempExp := 10 
    else if (tempLv >= 35) and (tempLv <= 40) then tempExp := 8 
    else if (tempLv >= 40) and (tempLv <= 45) then tempExp := 5
	else if (tempLv >= 45) and (tempLv <= 50) then tempExp := 3
    else if (tempLv >= 50) then tempExp := 2; 
{   if (GetMonth = 20) and (GetDay = 22) and (GetHour < 1) and (This_Player.MapName <> '0139~22')then
     This_Player.RandomFlyTo('0139~22');    }  
	if (tempLv == 9) or (tempLv == 19) or (tempLv == 29) or (tempLv == 39) or (tempLv == 49) or (tempLv == 59) or (tempLv == 69) then 
	begin
		This_Player.FlyTo('M100', 285, 280);
	end;
	
   { if tempExp > 0 then
    
     This_Player.MultiTempExpRate := tempExp;
        This_Player.PlayerNotice('当前经验倍数：' + inttostr(tempExp) + '倍',2); 
		This_Player.PlayerNotice('★与君相知一场,愿今后的岁月,你我仍可欢笑并肩★',2); 
	    ServerSay('玛法英雄★★★【' + This_Player.Name + '】★★★登陆逐鹿中原,开启传奇旅程!',3);
     end;  }
end; 
    	



//---------------------------GM宝典---------------------------- 
procedure JHTZ_XH_ZS();
var wuqi, xianglian, toukui , shouzhuo1 , shouzhuo2 , jiezhi1 , jiezhi2  : string;
begin
wuqi := This_Player.GetItemNameOnBody(1);
xianglian := This_Player.GetItemNameOnBody(3);
toukui := This_Player.GetItemNameOnBody(4);
shouzhuo1 := This_Player.GetItemNameOnBody(5);
shouzhuo2 := This_Player.GetItemNameOnBody(6);
jiezhi1 := This_Player.GetItemNameOnBody(7);
jiezhi2 := This_Player.GetItemNameOnBody(8);
//////////验证成功获得技能并且循环验证
if (wuqi = '裁决之杖') or (wuqi = '怒斩') or (wuqi = '屠龙') or (wuqi = '霸者之刃') then 
begin
  if (xianglian = '圣战项链') and (toukui = '圣战头盔') then 
  begin
  if (shouzhuo1 = '圣战手镯') or (shouzhuo2 = '圣战手镯') then 
    begin
	  if (jiezhi1 = '圣战戒指') or (jiezhi2 = '圣战戒指') then 
	  begin
	  if This_Player.GetSkillLevelExt('刺杀剑术',false) < 4 then
	  begin
      This_Player.ChgSkillLv('刺杀剑术',4,0);
      This_Player.PlayerNotice('赤月套装激活成功,已掌握4级刺杀剑术！',2);
	  end;
	  end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少法神戒指,套装效果消失！',2);
end;
end;
	end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少法神手镯,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少法神项链或头盔,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少战士神器,套装效果消失！',2);
end;
end;
end;

procedure JHTZ_XH_FS();
var wuqi, xianglian, toukui , shouzhuo1 , shouzhuo2 , jiezhi1 , jiezhi2  : string;
begin
wuqi := This_Player.GetItemNameOnBody(1);
xianglian := This_Player.GetItemNameOnBody(3);
toukui := This_Player.GetItemNameOnBody(4);
shouzhuo1 := This_Player.GetItemNameOnBody(5);
shouzhuo2 := This_Player.GetItemNameOnBody(6);
jiezhi1 := This_Player.GetItemNameOnBody(7);
jiezhi2 := This_Player.GetItemNameOnBody(8);
//////////验证成功获得技能并且循环验证
if (wuqi = '骨玉权杖') or (wuqi = '龙牙') or (wuqi = '嗜魂法杖') or (wuqi = '血饮') or (wuqi = '霸者之刃') then 
begin
  if (xianglian = '法神项链') and (toukui = '法神头盔') then 
  begin
  if (shouzhuo1 = '法神手镯') or (shouzhuo2 = '法神手镯') then 
    begin
	  if (jiezhi1 = '法神戒指') or (jiezhi2 = '法神戒指') then 
	  begin
	  if This_Player.GetSkillLevelExt('魔法盾',false) < 4 then
	  begin
      This_Player.ChgSkillLv('魔法盾',4,0);
      This_Player.PlayerNotice('赤月套装激活成功,已掌握4级魔法盾！',2);
	  end;
	  end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法神戒指,套装效果消失！',2);
end;
end;
	end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法神手镯,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法神项链或头盔,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法师神器,套装效果消失！',2);
end;
end;
end;


procedure JHTZ_XH_DS();
var wuqi, xianglian, toukui , shouzhuo1 , shouzhuo2 , jiezhi1 , jiezhi2  : string;
begin
wuqi := This_Player.GetItemNameOnBody(1);
xianglian := This_Player.GetItemNameOnBody(3);
toukui := This_Player.GetItemNameOnBody(4);
shouzhuo1 := This_Player.GetItemNameOnBody(5);
shouzhuo2 := This_Player.GetItemNameOnBody(6);
jiezhi1 := This_Player.GetItemNameOnBody(7);
jiezhi2 := This_Player.GetItemNameOnBody(8);
//////////验证成功获得技能并且循环验证
if (wuqi = '龙纹剑') or (wuqi = '逍遥扇') or (wuqi = '无极棍') or (wuqi = '霸者之刃') then 
begin
  if (xianglian = '天尊项链') and (toukui = '天尊头盔') then 
  begin
  if (shouzhuo1 = '天尊手镯') or (shouzhuo2 = '天尊手镯') then 
    begin
	  if (jiezhi1 = '天尊戒指') or (jiezhi2 = '天尊戒指') then 
	  begin
	  if This_Player.GetSkillLevelExt('施毒术',false) < 4 then
	  begin
      This_Player.ChgSkillLv('施毒术',4,0);
	  This_Player.PlayerNotice('赤月套装激活成功,已掌握4级施毒术！',2);
	  end;
	  end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少天尊戒指,套装效果消失！',2);
end;
end;
	end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少天尊手镯,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少天尊项链或头盔,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少道士神器,套装效果消失！',2);
end;
end;
end;

procedure JHTZ_KS(); 
begin            
  case This_Player.Job of
       0: 
	   JHTZ_XH_ZS();
       1: 
	   JHTZ_XH_FS();
       2: 
	   JHTZ_XH_DS();
  end;
end; 



//---------------------------GM宝典---------------------------- 
begin
   
   TempExpBylv();
     
   if AutoOpen(2) then
   begin 
     if This_Player.CheckAuthen(1,100) = false then
     begin
     This_Player.PlayerNotice('您当前为未验证用户。可携带200万金币和使用20格仓库，可以获得所有物品，但无法转移、丢弃物品给其他玩家。',2);
     This_Player.PlayerNotice('您可以通过体验游戏内容，提高传奇信用分至30分，在各仓库管理员和传送员处成为验证用户。',2);
     end;
   end else
   begin
     if This_Player.CheckAuthen(1,100) = false then
     begin
     This_Player.PlayerNotice('您当前为未验证用户，'+inttostr(AutoOpenDay(2))+'天后将开启验证功能，验证功能开启后未验证用户：可携带200万金币和使用20格仓库，可以获得所有物品，但无法转移、丢弃物品给其他玩家。',2);
     This_Player.PlayerNotice('您也可以通过体验游戏内容，提高传奇信用分至30分，提前在各仓库管理员和传送员处成为验证用户。',2);
     end;
   end;  
end.