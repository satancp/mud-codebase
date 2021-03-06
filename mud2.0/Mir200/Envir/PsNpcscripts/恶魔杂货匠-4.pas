{********************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '我们出售护身符，卷轴，修复油等.\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '你需要哪种物品呢?\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;

begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('地牢逃脱卷', 1000, 1);
  This_NPC.FillGoods('随机传送卷', 1000, 1); 
  This_NPC.FillGoods('地牢逃脱卷包', 100, 1);
  This_NPC.FillGoods('随机传送卷包', 100, 1);
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符(大)', 10, 1);
  This_NPC.FillGoods('超级护身符', 10, 1);
  This_NPC.FillGoods('灰色药粉(少量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 1, 1); 
  This_NPC.FillGoods('灰色药粉(中量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 1, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(大量)', 10, 1);
  This_NPC.FillGoods('超级灰色药粉', 10, 1);
  This_NPC.FillGoods('超级黄色药粉', 10, 1);
  This_NPC.FillGoods('修复油', 50, 1);
  //加载stdmode 
  This_NPC.AddStdMode(30);
  This_NPC.AddStdMode(25);
  This_NPC.AddStdMode(3);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '拜托，看清楚，我就是老板。\'+
   '你真够讨厌的，到底你买什么？快点挑……\ \'+
   '|{cmd}<购买物品/@buy> ' + addspace(' ',20) + '^<出售物品/@sell> \'+
   '|{cmd}<退出/@doexit>');
end.