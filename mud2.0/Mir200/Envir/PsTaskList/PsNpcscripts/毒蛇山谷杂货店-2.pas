{
*******************************************************************}

PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '我们收购护身符，卷轴，修理液等.\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '你想买什么？？\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('护身符', 100, 1);
  This_NPC.FillGoods('地牢逃脱卷', 1000, 1);
  This_NPC.FillGoods('随机传送卷', 1000, 1); 
  This_NPC.FillGoods('地牢逃脱卷包', 100, 1);
  This_NPC.FillGoods('随机传送卷包', 100, 1);
  This_NPC.FillGoods('修复油', 50, 1);
  //加载stdmode  
  This_NPC.AddStdMode(3);
  This_NPC.AddStdMode(25);
end;




Begin
   This_Npc.NpcDialog(This_Player,
   '感谢. 我可以为你做什么吗?\ \'+
   '|{cmd}<购买物品/@buy>                    ^<出售物品/@sell> \'+
   '|{cmd}<退出/@doexit>');
end.