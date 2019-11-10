{********************************************************************

*******************************************************************}

PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '这里可以修理的品种有衣服、武器。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '怎么样，修好了吧？看起来比新的还值钱！\ \' +
    '|{cmd}<返回/@main>');
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '要卖什么东西？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '虽然有点贵，但是趁现在有快买吧。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;

procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(180);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 1000, 1);
  This_NPC.FillGoods('魔法药(小量)', 1000, 1);
  This_NPC.FillGoods('地牢逃脱卷', 1000, 1);
  This_NPC.FillGoods('骰子', 5, 1); 
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3);
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(28);
  This_NPC.AddStdMode(45);
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '一路上还好吧？要买什么？\'+
   '但是别想讲价钱。不知道今天能不能回到家……\ \'+
   '|{cmd}<买东西/@buy>\'+
   '|{cmd}<卖东西/@sell>\'+
   '|{cmd}<修理东西/@repair>\'+
   '|{cmd}<退出/@doexit>');
end.