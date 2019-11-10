{
/************************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您要修理武器吗?\'+
   '给我您要修理的武器.\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看起来修好了，下次再来吧。\ \' +
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
   '给我您要卖的武器。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么武器?\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('木剑', 50, 1);
  This_NPC.FillGoods('乌木剑', 50, 1);
  This_NPC.FillGoods('青铜剑', 50, 1); 
  This_NPC.FillGoods('铁剑', 50, 1);
  This_NPC.FillGoods('短剑', 50, 1);
  This_NPC.FillGoods('匕首', 50, 1);
  This_NPC.FillGoods('鹤嘴锄', 50, 1);
  This_NPC.FillGoods('青铜斧', 50, 60);
  This_NPC.FillGoods('海魂', 50, 60);
  This_NPC.FillGoods('八荒', 50, 60);
  This_NPC.FillGoods('半月', 50, 60);
  This_NPC.FillGoods('凌风', 10, 60);  
  This_NPC.FillGoods('偃月', 10, 60);
  This_NPC.FillGoods('破魂', 10, 60);
  This_NPC.FillGoods('降魔', 10, 60);
  This_NPC.FillGoods('斩马刀', 10, 60);
  This_NPC.FillGoods('修罗', 10, 60);
  //加载stdmode  
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(43);
end;




Begin
   This_Npc.NpcDialog(This_Player,
   '谢谢光临。\ \'+
   '|{cmd}<买武器/@buy>'+AddSpace(' ',20)+'|{cmd}<卖武器/@sell>\'+
   '|{cmd}<修理武器/@repair>'+AddSpace(' ',18)+'|{cmd}<特殊修理/@s_repair>\'+
   '|{cmd}<退出/@doexit>');
end.