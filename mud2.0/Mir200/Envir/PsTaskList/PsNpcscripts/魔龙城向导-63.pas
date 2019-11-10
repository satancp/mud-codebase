{
/************************************************************************}


Program Mir2;


{$I common.pas}

Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;



Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您要修理吗?\'+
   '我可是个万能工匠哦！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '怎么样，修好了吧？看起来比新的还值钱！\ \' +
  '|{cmd}<返回/@main>');
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
   '给我您要卖的物品.\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么?\ \ \'+
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

  //加载stdmode
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(43);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(3);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;




Begin
   This_Npc.NpcDialog(This_Player,
   '前面就是最为凶险的东魔龙关了!当然,只要过了这个关卡，\'+
   '你就离绝世神兵又近了一步。但受到魔龙教主强大力量的影响，\'+
   '在里面你所有的补给药品都将失效，就连随机传送卷也将失去作用，\'+
   '这是多么的可怕，你唯一能做的就是依靠大家的力量共同进退。\'+
   '在同伴到来之前我可以为你提供一些服务。\ \'+
   '|{cmd}<买/@buy>'+addspace(' ',28)+'|{cmd}<卖/@sell>\'+
   '|{cmd}<特殊修理/@s_repair>\' +
   '|{cmd}<嗯/@doexit>我要等同伴一起进入');
end.