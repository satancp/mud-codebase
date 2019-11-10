{
/************************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
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
  This_NPC.FillGoods('地牢逃脱卷', 100, 1);
  This_NPC.FillGoods('随机传送卷', 100, 1); 
  This_NPC.FillGoods('地牢逃脱卷包', 100, 1);
  This_NPC.FillGoods('随机传送卷包', 100, 1);
  This_NPC.FillGoods('护身符', 100, 1);
  This_NPC.FillGoods('修复油', 50, 1);
  //加载stdmode 
  This_NPC.AddStdMode(25);
  This_NPC.AddStdMode(3);
end;


var
j : integer;

Begin
   j := random(2);
   if j = 1 then 
   begin
   This_Npc.NpcDialog(This_Player,
   '今天可吓死我了,今天运货回来的路上,碰上魔龙的手下！\'+ 
   '我发现它们居然拥有强大的雷霆战戒！\'+ 
   '幸好我跑的快不然就..... 不提了,不提了！\ \'+
   '|{cmd}<购买物品/@buy> '+addspace(' ',20)+'|{cmd}<出售物品/@sell> \'+
   '|{cmd}<退出/@doexit>');
   end;
   if j = 0 then 
   begin
   This_Npc.NpcDialog(This_Player,
   '封印总算解除，我又变回来了。\'+
   '但此刻我却感到那股力量更强大了。\'+
   '好了，不多说了，你要点什么？\ \'+
   '|{cmd}<购买物品/@buy> '+addspace(' ',20)+'|{cmd}<出售物品/@sell> \'+
   '|{cmd}<退出/@doexit>');
   end;
end.