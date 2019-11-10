{ 
/************************************************************************}



PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您您要修理吗？我可是个万能工匠哦！\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '怎么样，修好了吧？看起来比新的还值钱！\ \' +
    '|{cmd}<返回/@main>'
  );
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙，你可太幸运了，我正好有材料做特殊修补，\'+
   '但费用是普通的三倍！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_SRepair(This_Player);
end;


procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   '已经修理好了，看起来很不错嘛！\' +
   '|{cmd}<返回/@main>');
end;


Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我您要卖的物品。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;
var
  i : integer;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 100, 1);
  This_NPC.FillGoods('魔法药(小量)', 100, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  This_NPC.FillGoods('金创药(小)包', 100, 1);
  This_NPC.FillGoods('魔法药(小)包', 100, 1);
  This_NPC.FillGoods('金创药(中)包', 100, 1);
  This_NPC.FillGoods('魔法药(中)包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);  
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符(大)', 10, 1);
  This_NPC.FillGoods('超级护身符', 10, 1);
  This_NPC.FillGoods('灰色药粉(中量)', 10, 1);  
  This_NPC.FillGoods('黄色药粉(中量)', 10, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 10, 1);  
  This_NPC.FillGoods('黄色药粉(大量)', 10, 1);  
  This_NPC.FillGoods('超级灰色药粉', 10, 1);
  This_NPC.FillGoods('超级黄色药粉', 10, 1);
  //加载stdmode 
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3); 
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(16);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(43);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;


Procedure _guhua;
begin
   This_Npc.NpcDialog(This_Player,
   '你有多余的装备吗？\'+
   '物品我都以5万金币回收，以下的物品有多余的就给我吧。\ \'+
   '|{cmd}<荣誉勋章43号/@guhua1>        ^<荣誉勋章44号/@guhua2>        ^<荣誉勋章45号/@guhua3>\'+
   '|{cmd}<圣战纹章/@guhua7>               ^<法神纹章/@guhua8>             ^<天尊纹章/@guhua9>\'+
   '|{cmd}<裁决之杖/@guhua4>               ^<骨玉权杖/@guhua5>               ^<龙纹剑/@guhua6>\'+
   '|{cmd}<天之裁决/@guhua10>            ^<天之骨玉权杖/@guhua11>            ^<天之龙纹/@guhua12>\'+
   '|{cmd}<天龙之印/@tianlong>               ^<礼包/@libao>             ^<回收封印物品/@fengyin> \'+
   '|{cmd}<返回/@main>');
end;

Procedure givegold50000;
begin
   This_Player.AddGold(50000);
   This_Npc.NpcDialog(This_Player,
   '你还有多余的装备吗？\'+
   '物品我都以5万金币回收，以下的物品有多余的就给我吧。\ \'+
   '|{cmd}<荣誉勋章43号/@guhua1>        ^<荣誉勋章44号/@guhua2>        ^<荣誉勋章45号/@guhua3>\'+
   '|{cmd}<圣战纹章/@guhua7>               ^<法神纹章/@guhua8>             ^<天尊纹章/@guhua9>\'+
   '|{cmd}<裁决之杖/@guhua4>               ^<骨玉权杖/@guhua5>               ^<龙纹剑/@guhua6>\'+
   '|{cmd}<天之裁决/@guhua10>            ^<天之骨玉权杖/@guhua11>            ^<天之龙纹/@guhua12>\'+
   '|{cmd}<天龙之印/@tianlong>               ^<礼包/@libao>             ^<回收封印物品/@fengyin> \'+
   '|{cmd}<返回/@main>');
end;

Procedure _fengyin;
begin
   This_Npc.NpcDialog(This_Player,
   '所有的封印物品我都回收，你想卖给我哪个呢？\'+
   '|{cmd}<唤魔项链(封印)/@huanmo1>    ^<唤魔手镯(封印)/@huanmo2> ^<唤魔戒指(封印)/@huanmo3>\'+
   '|{cmd}<雷泽项链(封印)/@leizel1>    ^<雷泽手镯(封印)/@leizel2> ^<雷泽戒指(封印)/@leizel3>\'+
   '|{cmd}<启源项链(封印)/@qiyuan1>    ^<启源手镯(封印)/@qiyuan2> ^<启源戒指(封印)/@qiyuan3>\'+
   '|{cmd}<圣战项链(封印)/@shenxl1>    ^<圣战手镯(封印)/@shenxl2> ^<圣战戒指(封印)/@shenxl3>\'+
   '|{cmd}<法神项链(封印)/@fashxl1>    ^<法神手镯(封印)/@fashxl2> ^<法神戒指(封印)/@fashxl3>\'+
   '|{cmd}<天尊项链(封印)/@tianxl1>    ^<天尊手镯(封印)/@tianxl2> ^<天尊戒指(封印)/@tianxl3>\'+
   '|{cmd}<圣战头盔(封印)/@shentk1>    ^<法神头盔(封印)/@fashtk1> ^<天尊头盔(封印)/@tiantk1>\'+
   '|{cmd}<黑铁头盔(封印)/@heitie>');
end;

Procedure fengyin01;
begin
   This_Player.AddGold(50000);
   This_Npc.NpcDialog(This_Player,
   '所有的封印物品我都回收，你还想卖给我哪个呢？\'+
   '|{cmd}<唤魔项链(封印)/@huanmo1>    ^<唤魔手镯(封印)/@huanmo2> ^<唤魔戒指(封印)/@huanmo3>\'+
   '|{cmd}<雷泽项链(封印)/@leizel1>    ^<雷泽手镯(封印)/@leizel2> ^<雷泽戒指(封印)/@leizel3>\'+
   '|{cmd}<启源项链(封印)/@qiyuan1>    ^<启源手镯(封印)/@qiyuan2> ^<启源戒指(封印)/@qiyuan3>\'+
   '|{cmd}<圣战项链(封印)/@shenxl1>    ^<圣战手镯(封印)/@shenxl2> ^<圣战戒指(封印)/@shenxl3>\'+
   '|{cmd}<法神项链(封印)/@fashxl1>    ^<法神手镯(封印)/@fashxl2> ^<法神戒指(封印)/@fashxl3>\'+
   '|{cmd}<天尊项链(封印)/@tianxl1>    ^<天尊手镯(封印)/@tianxl2> ^<天尊戒指(封印)/@tianxl3>\'+
   '|{cmd}<圣战头盔(封印)/@shentk1>    ^<法神头盔(封印)/@fashtk1> ^<天尊头盔(封印)/@tiantk1>\'+
   '|{cmd}<黑铁头盔(封印)/@heitie>');
end;


Procedure _shentk1;
begin
   if This_Player.GetBagItemCount('圣战头盔(封印)') >= 1 then
   begin
      This_Player.Take('圣战头盔(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _fashtk1;
begin
   if This_Player.GetBagItemCount('法神头盔(封印)') >= 1 then
   begin
      This_Player.Take('法神头盔(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _tiantk1;
begin
   if This_Player.GetBagItemCount('天尊头盔(封印)') >= 1 then
   begin
      This_Player.Take('天尊头盔(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _heitie;
begin
   if This_Player.GetBagItemCount('黑铁头盔(封印)') >= 1 then
   begin
      This_Player.Take('黑铁头盔(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _fashxl1;
begin
   if This_Player.GetBagItemCount('法神项链(封印)') >= 1 then
   begin
      This_Player.Take('法神项链(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _fashxl2;
begin
   if This_Player.GetBagItemCount('法神手镯(封印)') >= 1 then
   begin
      This_Player.Take('法神手镯(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _fashxl3;
begin
   if This_Player.GetBagItemCount('法神戒指(封印)') >= 1 then
   begin
      This_Player.Take('法神戒指(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _tianxl1;
begin
   if This_Player.GetBagItemCount('天尊项链(封印)') >= 1 then
   begin
      This_Player.Take('天尊项链(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 



Procedure _tianxl2;
begin
   if This_Player.GetBagItemCount('天尊手镯(封印)') >= 1 then
   begin
      This_Player.Take('天尊手镯(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _tianxl3;
begin
   if This_Player.GetBagItemCount('天尊戒指(封印)') >= 1 then
   begin
      This_Player.Take('天尊戒指(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _qiyuan1;
begin
   if This_Player.GetBagItemCount('启源项链(封印)') >= 1 then
   begin
      This_Player.Take('启源项链(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _qiyuan2;
begin
   if This_Player.GetBagItemCount('启源手镯(封印)') >= 1 then
   begin
      This_Player.Take('启源手镯(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _qiyuan3;
begin
   if This_Player.GetBagItemCount('启源戒指(封印)') >= 1 then
   begin
      This_Player.Take('启源戒指(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _shenxl1;
begin
   if This_Player.GetBagItemCount('圣战项链(封印)') >= 1 then
   begin
      This_Player.Take('圣战项链(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 



Procedure _shenxl2;
begin
   if This_Player.GetBagItemCount('圣战手镯(封印)') >= 1 then
   begin
      This_Player.Take('圣战手镯(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _shenxl3;
begin
   if This_Player.GetBagItemCount('圣战戒指(封印)') >= 1 then
   begin
      This_Player.Take('圣战戒指(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _huanmo1;
begin
   if This_Player.GetBagItemCount('唤魔项链(封印)') >= 1 then
   begin
      This_Player.Take('唤魔项链(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _huanmo2;
begin
   if This_Player.GetBagItemCount('唤魔手镯(封印)') >= 1 then
   begin
      This_Player.Take('唤魔手镯(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _huanmo3;
begin
   if This_Player.GetBagItemCount('唤魔戒指(封印)') >= 1 then
   begin
      This_Player.Take('唤魔戒指(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _leizel1;
begin
   if This_Player.GetBagItemCount('雷泽项链(封印)') >= 1 then
   begin
      This_Player.Take('雷泽项链(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 



Procedure _leizel2;
begin
   if This_Player.GetBagItemCount('雷泽手镯(封印)') >= 1 then
   begin
      This_Player.Take('雷泽手镯(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _leizel3;
begin
   if This_Player.GetBagItemCount('雷泽戒指(封印)') >= 1 then
   begin
      This_Player.Take('雷泽戒指(封印)',1);        
      fengyin01;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _libao;
begin
   if This_Player.GetBagItemCount('礼包') >= 1 then
   begin
      This_Player.Take('礼包',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _tianlong;
begin
   if This_Player.GetBagItemCount('天龙之印') >= 1 then
   begin
      This_Player.Take('天龙之印',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _guhua1;
begin
   if This_Player.GetBagItemCount('荣誉勋章43号') >= 1 then
   begin
      This_Player.Take('荣誉勋章43号',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _guhua2;
begin
   if This_Player.GetBagItemCount('荣誉勋章44号') >= 1 then
   begin
      This_Player.Take('荣誉勋章44号',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _guhua3;
begin
   if This_Player.GetBagItemCount('荣誉勋章45号') >= 1 then
   begin
      This_Player.Take('荣誉勋章45号',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _guhua7;
begin
   if This_Player.GetBagItemCount('圣战纹章') >= 1 then
   begin
      This_Player.Take('圣战纹章',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _guhua8;
begin
   if This_Player.GetBagItemCount('法神纹章') >= 1 then
   begin
      This_Player.Take('法神纹章',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _guhua9;
begin
   if This_Player.GetBagItemCount('天尊纹章') >= 1 then
   begin
      This_Player.Take('天尊纹章',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 



Procedure _guhua4;
begin
   if This_Player.GetBagItemCount('裁决之杖') >= 1 then
   begin
      This_Player.Take('裁决之杖',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _guhua5;
begin
   if This_Player.GetBagItemCount('骨玉权杖') >= 1 then
   begin
      This_Player.Take('骨玉权杖',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 



Procedure _guhua6;
begin
   if This_Player.GetBagItemCount('龙纹剑') >= 1 then
   begin
      This_Player.Take('龙纹剑',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;  


Procedure _guhua10;
begin
   if This_Player.GetBagItemCount('天之裁决') >= 1 then
   begin
      This_Player.Take('天之裁决',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _guhua11;
begin
   if This_Player.GetBagItemCount('天之骨玉权杖') >= 1 then
   begin
      This_Player.Take('天之骨玉权杖',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 


Procedure _guhua12;
begin
   if This_Player.GetBagItemCount('天之龙纹') >= 1 then
   begin
      This_Player.Take('天之龙纹',1);        
      givegold50000;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '天关通道通向未知的天关，天关的宝藏等待你去寻找，\'+
   '我这里可以给你提供一些帮助，看你有什么需要吧，\'+
   '除了老本行制药之外，我也可以给您修理一下物品！\'+
   '如果你有不需要的物品，我这里可以回收。\ \'+
   '|{cmd}<买/@buy>'+AddSpace(' ',24)+'|{cmd}<卖/@sell>\'+
   '|{cmd}<修理/@repair>'+AddSpace(' ',22)+'|{cmd}<特殊修理/@s_repair>\'+
   '|{cmd}<回收物品/@guhua>\'+
   '|{cmd}<退出/@doexit>');
end.