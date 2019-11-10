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
  This_NPC.FillGoods('护身符(大)', 100, 1);
  This_NPC.FillGoods('超级护身符', 10, 1);
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
   '奇怪！最近的药铺生意怎么这么好？天天顾客盈门。\'+
   '最近妖魔袭人事件越来越频繁，听现在的小道消息\'+
   '说似乎和藏宝图有关，有兴趣你不妨去打听一下哦。\ \'+
   '|{cmd}<购买物品/@buy> '+addspace(' ',20)+'|{cmd}<出售物品/@sell> \'+
   '|{cmd}<退出/@doexit>');
   end;
   if j = 0 then 
   begin
   This_Npc.NpcDialog(This_Player,
   '你好啊，快来买点东西，\'+
   '现在我生意好的很，晚了你就买不到了！ \ \'+
   '|{cmd}<购买物品/@buy> '+addspace(' ',20)+'|{cmd}<出售物品/@sell> \'+
   '|{cmd}<退出/@doexit>');
   end;
end.