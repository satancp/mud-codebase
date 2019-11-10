{********************************************************************

*******************************************************************}


Program Mir2;


{$I common.pas}



Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您要修理吗？我可是个万能工匠哦！\ \'+
   '|<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '怎么样，修好了吧？看起来比新的还值钱！\ \' +
  '|<返回/@main>');
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。，\'+
   '但费用是普通的三倍！\ \'+
   '|<返回/@main>');
   This_Npc.Click_SRepair(This_Player);
end;


procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   '已经修理好了，看起来很不错嘛！\ \' +
   '|<返回/@main>');
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我您要卖的物品。\ \'+
   '|<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么？\ \ \'+
   '|<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;

procedure OnInitialize;
var
  i : integer;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 200, 1);
  This_NPC.FillGoods('魔法药(小量)', 200, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  This_NPC.FillGoods('金创药（小）包', 100, 1);
  This_NPC.FillGoods('魔法药（小）包', 100, 1);
  This_NPC.FillGoods('金创药（中）包', 100, 1);
  This_NPC.FillGoods('魔法药（中）包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);
    This_NPC.FillGoods('地牢逃脱卷', 100, 1);
  This_NPC.FillGoods('随机传送卷', 100, 1);
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符（大）', 10, 1);  
  This_NPC.FillGoods('灰色药粉(中量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 10, 1);
  //加载stdmode 
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3); 
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(43);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;



Begin
   This_Npc.NpcDialog(This_Player, 
   '你竟然能跑到这里来？看在你这么卖命的份上，\'+
   '顺便告诉你一下，一旦进入迷宫，就再也不能回头了！\ \' +
   '|<买/@buy>                            ^<卖/@sell>\' +
   '|<修理/@repair>                          ^<特殊修理/@s_repair>\'+
   '|<退出/@doexit>');
end.