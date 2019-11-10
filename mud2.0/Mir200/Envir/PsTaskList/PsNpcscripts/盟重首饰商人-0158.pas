{
/************************************************************************}
PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;



Procedure givegold50000;
begin
   This_Player.AddGold(50000);
   This_Npc.NpcDialog(This_Player,
   '你还有多余的装备吗？\'+
   '物品我都以5万金币回收，以下的物品有多余的就给我吧。\'+
   '|{cmd}<荣誉勋章43号/@guhua1>        ^<荣誉勋章44号/@guhua2>        ^<荣誉勋章45号/@guhua3>\'+
   '|{cmd}<圣战纹章/@guhua7>               ^<法神纹章/@guhua8>             ^<天尊纹章/@guhua9>\'+
   '|{cmd}<裁决之杖/@guhua4>         ^<骨玉权杖/@guhua5>         ^<龙纹剑/@guhua6>        ^<血饮/@guhua13>\'+
   '|{cmd}<天之裁决/@guhua10>            ^<天之骨玉权杖/@guhua11>            ^<天之龙纹/@guhua12>\'+
   '|{cmd}<天龙之印/@tianlong>                                        ^<礼包/@libao>\'+
   '|{cmd}<回收封印物品/@fengyin>           ^<免费回收物品/@jinnang>             ^<返回/@main>');
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


Procedure _guhua13;
begin
   if This_Player.GetBagItemCount('血饮') >= 1 then
   begin
      This_Player.Take('血饮',1);        
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
 

Procedure _jinnang;
begin
   This_Npc.NpcDialog(This_Player,
   '下面的物品，如果不需要，可以交给我，但是不能获得5万金币。\ \'+
   '|{cmd}<聚气丹/@jinnang_1>            ^<归元丹/@jinnang_2>            ^<精元丹/@jinnang_5>        ^<还虚丹/@jinnang_6>\'+
   '|{cmd}<灵虚丹(小)/@jinnang_7>        ^<灵虚丹(中)/@jinnang_8>        ^<灵虚丹(大)/@jinnang_9>\'+
   '|{cmd}<超级灵虚丹(小)/@jinnang_10>    ^<超级灵虚丹(中)/@jinnang_11>    ^<超级灵虚丹(大)/@jinnang_12>\'+
   '|{cmd}<乾坤令/@jinnang_3>            ^<宝盒/@jinnang_4>              ^<蜡烛/@jinnang_13>\'+
   '|{cmd}<宝藏钥匙/@jinnang_14>\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure jinngjinbi;
begin
   This_Npc.NpcDialog(This_Player,
   '下面的物品，如果不需要，可以交给我，但是不能获得5万金币。\ \'+
   '|{cmd}<聚气丹/@jinnang_1>            ^<归元丹/@jinnang_2>            ^<精元丹/@jinnang_5>        ^<还虚丹/@jinnang_6>\'+
   '|{cmd}<灵虚丹(小)/@jinnang_7>        ^<灵虚丹(中)/@jinnang_8>        ^<灵虚丹(大)/@jinnang_9>\'+
   '|{cmd}<超级灵虚丹(小)/@jinnang_10>    ^<超级灵虚丹(中)/@jinnang_11>    ^<超级灵虚丹(大)/@jinnang_12>\'+
   '|{cmd}<乾坤令/@jinnang_3>            ^<宝盒/@jinnang_4>              ^<蜡烛/@jinnang_13>\'+
   '|{cmd}<宝藏钥匙/@jinnang_14>\ \'+
   '|{cmd}<返回/@main>');
end;



Procedure _jinnang_1;
begin
   if This_Player.GetBagItemCount('聚气丹') >= 1 then
   begin
      This_Player.Take('聚气丹',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_2;
begin
   if This_Player.GetBagItemCount('归元丹') >= 1 then
   begin
      This_Player.Take('归元丹',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_5;
begin
   if This_Player.GetBagItemCount('精元丹') >= 1 then
   begin
      This_Player.Take('精元丹',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_6;
begin
   if This_Player.GetBagItemCount('还虚丹') >= 1 then
   begin
      This_Player.Take('还虚丹',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_7;
begin
   if This_Player.GetBagItemCount('灵虚丹(小)') >= 1 then
   begin
      This_Player.Take('灵虚丹(小)',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_8;
begin
   if This_Player.GetBagItemCount('灵虚丹(中)') >= 1 then
   begin
      This_Player.Take('灵虚丹(中)',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_9;
begin
   if This_Player.GetBagItemCount('灵虚丹(大)') >= 1 then
   begin
      This_Player.Take('灵虚丹(大)',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 
Procedure _jinnang_10;
begin
   if This_Player.GetBagItemCount('超级灵虚丹(小)') >= 1 then
   begin
      This_Player.Take('超级灵虚丹(小)',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_11;
begin
   if This_Player.GetBagItemCount('超级灵虚丹(中)') >= 1 then
   begin
      This_Player.Take('超级灵虚丹(中)',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_12;
begin
   if This_Player.GetBagItemCount('超级灵虚丹(大)') >= 1 then
   begin
      This_Player.Take('超级灵虚丹(大)',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_3;
begin
   if This_Player.GetBagItemCount('乾坤令') >= 1 then
   begin
      This_Player.Take('乾坤令',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 
Procedure _jinnang_4;
begin
   if This_Player.GetBagItemCount('宝盒') >= 1 then
   begin
      This_Player.Take('宝盒',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_13;
begin
   if This_Player.GetBagItemCount('蜡烛') >= 1 then
   begin
      This_Player.Take('蜡烛',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_14;
begin
   if This_Player.GetBagItemCount('宝藏钥匙') >= 1 then
   begin
      This_Player.Take('宝藏钥匙',1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 





Begin
   This_Npc.NpcDialog(This_Player,
   '你有多余的装备吗？\'+
   '物品我都以5万金币回收，以下的物品有多余的就给我吧。\ \'+
   '|{cmd}<荣誉勋章43号/@guhua1>        ^<荣誉勋章44号/@guhua2>        ^<荣誉勋章45号/@guhua3>\'+
   '|{cmd}<圣战纹章/@guhua7>               ^<法神纹章/@guhua8>             ^<天尊纹章/@guhua9>\'+
   '|{cmd}<裁决之杖/@guhua4>         ^<骨玉权杖/@guhua5>         ^<龙纹剑/@guhua6>        ^<血饮/@guhua13>\'+
   '|{cmd}<天之裁决/@guhua10>            ^<天之骨玉权杖/@guhua11>            ^<天之龙纹/@guhua12>\'+
   '|{cmd}<天龙之印/@tianlong>                                        ^<礼包/@libao>\'+
   '|{cmd}<回收封印物品/@fengyin>           ^<免费回收物品/@jinnang>             ^<离开/@doexit>');
end.