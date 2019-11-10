{********************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _Exit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '把要卖的东西给我，我会给你好价钱的。\'+
   '我们还收购各种药。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '需要什么物品吗？\'+
   '我这里有地牢逃脱卷，买一些吧？\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;



Procedure _QUEST;
begin
   This_Npc.NpcDialog(This_Player,
   '你知道半兽勇士吗？ \'+
   '手拿一个大斧头， \'+
   '看起来像妖魔... \见到这种怪物，可要当心啊\ \'+
   '|{cmd}<返回/@main>');
end;

procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 200, 1);
  This_NPC.FillGoods('魔法药(小量)', 200, 1); 
  This_NPC.FillGoods('地牢逃脱卷', 1000, 1);
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3);
  This_NPC.AddStdMode(42);
end;



Begin
    This_Npc.NpcDialog(This_Player,
    '欢迎，我能为你做点什么？\ \'+
    '|{cmd}<买物品/@buy>                         ^<卖物品/@sell> \'+
    '|{cmd}<对话/@QUEST>\'+
    '|{cmd}<退出/@exit>');
end.           