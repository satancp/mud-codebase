{
/************************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
   '看来你需要我的帮助，\'+
   '我这里可以修理物品，有什么需要修理的就交给我吧。\'+
   '如果你有不要的物品，我这里可以回收\ \'+
   '|{cmd}<买/@buy>                      ^<回收物品/@guhua>\'+
   '|{cmd}<卖/@sell>                      \'+  //^<灵鼠神佑的灵力/@shenyoling>
   '|{cmd}<修理/@repair>                    \'+  //^<回收玄绿与反璞归真/@huishouXF>
   '|{cmd}<特殊修理/@s_repair>                ^<兑换组队卷轴/@chgzuduij>\'+
   '|{cmd}<退出/@doexit>');
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

Procedure _chgzuduij;
begin
   This_Npc.NpcDialog(This_Player,
   '矿洞组队卷轴、神殿组队卷轴、邪窟组队卷轴、地穴组队卷轴、\'+
   '石墓组队卷轴都可以兑换成<地下组队卷轴/c=red>。\你想使用哪种组队卷轴兑换呢？\ \'+
   '|{cmd}<矿洞组队卷轴/@chgzuduij_01>        ^<神殿组队卷轴/@chgzuduij_02>        ^<邪窟组队卷轴/@chgzuduij_03>\'+
   '|{cmd}<地穴组队卷轴/@chgzuduij_04>        ^<石墓组队卷轴/@chgzuduij_05>\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure ChangeJuZhou(gtname, gvname : string);
begin
   if This_Player.GetBagItemCount(gtname) > 0 then
   begin
      This_Player.Take(gtname,1);
      This_Player.Give(gvname,1);
      _chgzuduij;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '如果你有' + gtname + '，就把它交给我吧。\ \ \'+ 
      '|{cmd}<返回/@main>');
   end;
end;

Procedure _chgzuduij_01;
begin
   ChangeJuZhou('矿洞组队卷轴','地下组队卷轴');
end;

Procedure _chgzuduij_02;
begin
   ChangeJuZhou('神殿组队卷轴','地下组队卷轴');
end;

Procedure _chgzuduij_03;
begin
   ChangeJuZhou('邪窟组队卷轴','地下组队卷轴');
end;

Procedure _chgzuduij_04;
begin
   ChangeJuZhou('地穴组队卷轴','地下组队卷轴');
end;

Procedure _chgzuduij_05;
begin
   ChangeJuZhou('石墓组队卷轴','地下组队卷轴');
end;

Procedure _huishouXF;
begin
   This_Npc.NpcDialog(This_Player,
   '你有多余的玄绿和反璞归真吗？\'+
   '每回收一个玄绿或者反璞归真，都将返还你10000经验。\ \' +
   '|{cmd}<玄绿/@XLhuishou>                        ^<反璞归真/@FPhuishou>\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _XLhuishou;
begin
   if This_Player.GetBagItemCount('玄绿') >= 1 then
   begin
      This_Player.Take('玄绿',1);
      This_Player.Give('经验',10000);
      This_Npc.NpcDialog(This_Player,
      '你还有多余的玄绿和反璞归真吗？\'+
      '每回收一个玄绿或者反璞归真，都将返还你10000经验。\ \' +
      '|{cmd}<玄绿/@XLhuishou>                        ^<反璞归真/@FPhuishou>\ \'+
      '|{cmd}<返回/@main>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有玄绿就快给我吧！\ \' +
      '|{cmd}<离开/@doexit>');
   end;
end;

Procedure _FPhuishou;
begin
   if This_Player.GetBagItemCount('反璞归真') >= 1 then
   begin
      This_Player.Take('反璞归真',1);
      This_Player.Give('经验',10000);
      This_Npc.NpcDialog(This_Player,
      '你还有多余的玄绿和反璞归真吗？\'+
      '每回收一个玄绿或者反璞归真，都将返还你10000经验。\ \' +
      '|{cmd}<玄绿/@XLhuishou>                        ^<反璞归真/@FPhuishou>\ \'+
      '|{cmd}<返回/@main>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到啊，如果你有反璞归真就快给我吧！\ \' +
      '|{cmd}<离开/@doexit>');
   end;
end;

Procedure jinngjinbi;
begin
   This_Npc.NpcDialog(This_Player,
   '下面的物品，如果不需要，可以交给我，但是不能获得5万金币。\ \'+
   '|{cmd}<聚气丹/@jinnang_1>           ^<归元丹/@jinnang_2>           ^<精元丹/@jinnang_5>          ^<还虚丹/@jinnang_6>\'+
   '|{cmd}<灵虚丹(小)/@jinnang_7>       ^<灵虚丹(中)/@jinnang_8>       ^<灵虚丹(大)/@jinnang_9>\'+
   '|{cmd}<超级灵虚丹(小)/@jinnang_10> ^<超级灵虚丹(中)/@jinnang_11> ^<超级灵虚丹(大)/@jinnang_12>\'+
   '|{cmd}<乾坤令/@jinnang_3>           ^<宝盒/@jinnang_4>             ^<蜡烛/@jinnang_13>            ^<特惠礼包/@jinnang_15>\'+
   '|{cmd}<宝藏钥匙/@jinnang_14>         ^<幸运钥匙/@jinnang_16>         ^<紫水晶矿/@jinnang_17>        ^<绿宝石矿/@jinnang_18>\'+
   '|{cmd}<魔龙冰晶/@jinnang_19>         ^<气血石(小)/@jinnang_21>       ^<幻魔石(小)/@jinnang_22>      ^<月饼/@jinnang_20>\'+
   '|{cmd}<一次回收10个乾坤令/@jinnang_23>                     ^<返回/@guhua>');
end;

Procedure _jinnang;
begin
   jinngjinbi;
end;

Procedure _jinnang_23;
begin
  if This_Player.GetBagItemCount('乾坤令') >= 10 then
  begin
    This_Player.Take('乾坤令',10);
    jinngjinbi;
  end
  else
  begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到10个乾坤令啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
  end;   
end; 


//提交物品模板,不给钱
procedure HandOutItemWithoutMoney(item_name : string);
begin
   if This_Player.GetBagItemCount(item_name) >= 1 then
   begin
      This_Player.Take(item_name,1);        
      jinngjinbi;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到'+item_name+'啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _jinnang_1;
begin
  HandOutItemWithoutMoney('聚气丹');   
end; 

Procedure _jinnang_2;
begin
  HandOutItemWithoutMoney('归元丹');      
end; 

Procedure _jinnang_5;
begin
  HandOutItemWithoutMoney('精元丹');      
end; 

Procedure _jinnang_6;
begin
  HandOutItemWithoutMoney('还虚丹');     
end; 

Procedure _jinnang_7;
begin
  HandOutItemWithoutMoney('灵虚丹(小)');    
end; 

Procedure _jinnang_8;
begin
  HandOutItemWithoutMoney('灵虚丹(中)');    
end; 

Procedure _jinnang_9;
begin
  HandOutItemWithoutMoney('灵虚丹(大)');    
end; 

Procedure _jinnang_10;
begin
  HandOutItemWithoutMoney('超级灵虚丹(小)');   
end; 

Procedure _jinnang_11;
begin
  HandOutItemWithoutMoney('超级灵虚丹(中)');   
end; 

Procedure _jinnang_12;
begin
  HandOutItemWithoutMoney('超级灵虚丹(大)');   
end; 

Procedure _jinnang_3;
begin
  HandOutItemWithoutMoney('乾坤令');    
end; 

Procedure _jinnang_4;
begin
  HandOutItemWithoutMoney('宝盒');   
end; 

Procedure _jinnang_13;
begin
  HandOutItemWithoutMoney('蜡烛');   
end; 

Procedure _jinnang_14;
begin
  HandOutItemWithoutMoney('宝藏钥匙');   
end;

procedure _jinnang_15;
begin
  HandOutItemWithoutMoney('特惠礼包'); 
end; 

procedure _jinnang_16;
begin
  HandOutItemWithoutMoney('幸运钥匙'); 
end;

procedure _jinnang_17;
begin
  HandOutItemWithoutMoney('紫水晶矿'); 
end;

procedure _jinnang_18;
begin
  HandOutItemWithoutMoney('绿宝石矿'); 
end;

procedure _jinnang_19;
begin
  HandOutItemWithoutMoney('魔龙冰晶'); 
end;


procedure _jinnang_21;
begin
  HandOutItemWithoutMoney('气血石(小)'); 
end;

procedure _jinnang_22;
begin
  HandOutItemWithoutMoney('幻魔石(小)'); 
end;

Procedure _guhua;
begin
   This_Npc.NpcDialog(This_Player,
   '你有多余的装备吗？\'+
   '物品我都以5万金币回收，以下的物品有多余的就给我吧。\ \'+
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
   '|{cmd}<圣战项链(封印)/@shenxl1>    ^<圣战手镯(封印)/@shensz2> ^<圣战戒指(封印)/@shenjz3>\'+
   '|{cmd}<法神项链(封印)/@fashxl1>    ^<法神手镯(封印)/@fashxl2> ^<法神戒指(封印)/@fashxl3>\'+
   '|{cmd}<天尊项链(封印)/@tianxl1>    ^<天尊手镯(封印)/@tianxl2> ^<天尊戒指(封印)/@tianxl3>\'+
   '|{cmd}<圣战头盔(封印)/@shentk1>    ^<法神头盔(封印)/@fashtk1> ^<天尊头盔(封印)/@tiantk1>\'+
   '|{cmd}<黑铁头盔(封印)/@heitie>');
end;

//提交物品模板,换50000金币 
//item_name 提交物品名称 ; mode 表示 1第一页物品 2表示封印物品 
procedure HandOutItemForMoney(item_name : string; mode : Integer);
begin
   if This_Player.GetBagItemCount(item_name) >= 1 then
   begin
      This_Player.Take(item_name,1);
      This_Player.AddGold(50000);
      if mode = 1 then
      begin
        _guhua;
      end
      else if mode = 2 then
      begin
        _fengyin;      
      end
      else
      begin
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '我怎么没看到'+item_name+'啊，如果你有就快给我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end; 

Procedure _shentk1;
begin
   HandOutItemForMoney('圣战头盔(封印)', 2);   
end; 

Procedure _fashtk1;
begin
   HandOutItemForMoney('法神头盔(封印)', 2); 
end; 

Procedure _tiantk1;
begin
   HandOutItemForMoney('天尊头盔(封印)', 2);  
end; 


Procedure _heitie;
begin
   HandOutItemForMoney('黑铁头盔(封印)', 2);  
end; 

Procedure _fashxl1;
begin
   HandOutItemForMoney('法神项链(封印)', 2); 
end; 

Procedure _fashxl2;
begin
   HandOutItemForMoney('法神手镯(封印)', 2);  
end; 

Procedure _fashxl3;
begin
   HandOutItemForMoney('法神戒指(封印)', 2); 
end; 

Procedure _tianxl1;
begin
   HandOutItemForMoney('天尊项链(封印)', 2); 
end; 

Procedure _tianxl2;
begin
   HandOutItemForMoney('天尊手镯(封印)', 2); 
end; 

Procedure _tianxl3;
begin
   HandOutItemForMoney('天尊戒指(封印)', 2);  
end; 

Procedure _qiyuan1;
begin
   HandOutItemForMoney('启源项链(封印)', 2); 
end; 

Procedure _qiyuan2;
begin
   HandOutItemForMoney('启源手镯(封印)', 2); 
end; 

Procedure _qiyuan3;
begin
   HandOutItemForMoney('启源戒指(封印)', 2); 
end; 

Procedure _shenxl1;
begin
   HandOutItemForMoney('圣战项链(封印)', 2);  
end; 

Procedure _shensz2;
begin
   HandOutItemForMoney('圣战手镯(封印)', 2); 
end; 

Procedure _shenjz3;
begin
   HandOutItemForMoney('圣战戒指(封印)', 2); 
end; 

Procedure _huanmo1;
begin
   HandOutItemForMoney('唤魔项链(封印)', 2);  
end; 

Procedure _huanmo2;
begin
   HandOutItemForMoney('唤魔手镯(封印)', 2); 
end; 

Procedure _huanmo3;
begin
   HandOutItemForMoney('唤魔戒指(封印)', 2); 
end; 

Procedure _leizel1;
begin
   HandOutItemForMoney('雷泽项链(封印)', 2);  
end; 

Procedure _leizel2;
begin
   HandOutItemForMoney('雷泽手镯(封印)', 2); 
end; 

Procedure _leizel3;
begin
   HandOutItemForMoney('雷泽戒指(封印)', 2); 
end; 

///////////////////////////////////////////////////////////////////////////////
Procedure _libao;
begin
   HandOutItemForMoney('礼包', 1);    
end; 

Procedure _tianlong;
begin
   HandOutItemForMoney('天龙之印', 1);  
end; 

Procedure _guhua1;
begin
   HandOutItemForMoney('荣誉勋章43号', 1);  
end; 

Procedure _guhua2;
begin
   HandOutItemForMoney('荣誉勋章44号', 1);  
end; 

Procedure _guhua3;
begin
   HandOutItemForMoney('荣誉勋章45号', 1);  
end; 

Procedure _guhua7;
begin
   HandOutItemForMoney('圣战纹章', 1);  
end; 

Procedure _guhua8;
begin
   HandOutItemForMoney('法神纹章', 1);  
end; 

Procedure _guhua9;
begin
   HandOutItemForMoney('天尊纹章', 1);  
end; 

Procedure _guhua4;
begin
   HandOutItemForMoney('裁决之杖', 1);  
end; 

Procedure _guhua5;
begin
   HandOutItemForMoney('骨玉权杖', 1);  
end; 

Procedure _guhua6;
begin
   HandOutItemForMoney('龙纹剑', 1);  
end; 

Procedure _guhua13;
begin
   HandOutItemForMoney('血饮', 1);  
end; 

Procedure _guhua10;
begin
   HandOutItemForMoney('天之裁决', 1);  
end; 

Procedure _guhua11;
begin
   HandOutItemForMoney('天之骨玉权杖', 1);  
end; 

Procedure _guhua12;
begin
   HandOutItemForMoney('天之龙纹', 1);  
end;
 
 
Procedure _shenyoling;
begin
   This_Npc.NpcDialog(This_Player,
   '灵鼠神佑和极品灵鼠神佑可都是不同凡响的东西，但是它们蕴含的\'+
   '灵力将随着时间的推移不断消耗，你需要定期给它们注入新的灵力。\'+
   '只有在我这里它们才能获取这种灵力，而且灵力第一次注入的瞬间，\'+
   '也会将一定的经验注入你的体内，不过我得告诉你，获取经验的机会\'+
   '只有一次。如果想恢复灵力就把它们交给我吧。\ \'+
   '|{cmd}<恢复灵鼠神佑的灵力/@lingshu_01>\'+
   '|{cmd}<恢复极品灵鼠神佑的灵力/@lingshu_02>\'+
   '|{cmd}<返回/@main>\'); 
end; 

procedure _lingshu_01;
begin
  if This_Player.GetS(18,2) = 100 then
  begin
    if This_Player.GetBagItemCount('灵鼠神佑') >= 1 then
    begin
      This_Player.Take('灵鼠神佑',1);
      This_Player.Give('灵鼠神佑',1);
      This_Npc.NpcDialog(This_Player,
      '你的灵鼠神佑已经重新获得了灵力，这就交给你吧。\ \|{cmd}<返回/@main>\');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果想恢复灵鼠神佑的灵力就把它交给我吧。\ \');
    end;
  end
  else
  begin
    if This_Player.GetBagItemCount('灵鼠神佑') >= 1 then
    begin
      This_Player.Take('灵鼠神佑',1);
      This_Player.Give('灵鼠神佑',1);
      This_Player.SetS(18,2,100);
      This_Player.Give('经验',18888);
      This_Npc.NpcDialog(This_Player,
      '你的灵鼠神佑已经重新获得了灵力，这就交给你吧。\ \|{cmd}<返回/@main>\');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果想恢复灵鼠神佑的灵力就把它交给我吧。\ \');
    end;
  end;  
end;

procedure _lingshu_02;
begin
  if This_Player.GetS(18,3) = 100 then
  begin
    if This_Player.GetBagItemCount('极品灵鼠神佑') >= 1 then
    begin
      This_Player.Take('极品灵鼠神佑',1);
      This_Player.Give('极品灵鼠神佑',1);
      This_Npc.NpcDialog(This_Player,
      '你的极品灵鼠神佑已经重新获得了灵力，这就交给你吧。\ \|{cmd}<返回/@main>\');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果想恢复极品灵鼠神佑的灵力就把它交给我吧。\ \');
    end;
  end
  else
  begin
    if This_Player.GetBagItemCount('极品灵鼠神佑') >= 1 then
    begin
      This_Player.Take('极品灵鼠神佑',1);
      This_Player.Give('极品灵鼠神佑',1);
      This_Player.SetS(18,3,100);
      This_Player.Give('经验',88888);
      This_Npc.NpcDialog(This_Player,
      '你的极品灵鼠神佑已经重新获得了灵力，这就交给你吧。\ \|{cmd}<返回/@main>\');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果想恢复极品灵鼠神佑的灵力就把它交给我吧。\ \');
    end;
  end;  
end;



Begin
  domain;
end.