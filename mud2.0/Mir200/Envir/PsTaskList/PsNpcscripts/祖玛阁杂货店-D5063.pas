{  
/************************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '选好了要买的物品吗？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;

begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(200);

  //加载道具
  This_NPC.FillGoods('地牢逃脱卷', 200, 1);
  This_NPC.FillGoods('随机传送卷', 200, 1); 
  This_NPC.FillGoods('金创药(小量)', 100, 1);
  This_NPC.FillGoods('魔法药(小量)', 100, 1);
  This_NPC.FillGoods('金创药(中量)', 200, 1);
  This_NPC.FillGoods('魔法药(中量)', 200, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  //加载stdmode 
  This_NPC.AddStdMode(0);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '你真厉害..... 竟然来到这儿....\'+
   '我也是走到这里迷路了，只好在这里做生意...\'+
   '我不知道你能不能穿过这条路继续你的旅程。\ \'+
   '|{cmd}<购买物品/@buy> \'+
   '|{cmd}<退出/@doexit>');
end.