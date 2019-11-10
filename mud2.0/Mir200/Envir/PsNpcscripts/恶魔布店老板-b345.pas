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
   '可以修复衣服，头盔，帽子。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '看来修补得很不错。\ \ \' +
  '|{cmd}<返回/@main>');
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。，\'+
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
   '请放上去要卖的衣服，我给估价。\'+
   '头盔和帽子也收购，\'+
   '最好在这儿一起卖吧。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '你想买什么样的衣服？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


Procedure _duihua1;
Begin
   This_Npc.NpcDialog(This_Player,
   '这里的布料艺术成分都很高啊！\ \'+
   '|{cmd}<有多高啊？/@duihua2>\');
end;


Procedure _duihua2;
Begin
   This_Npc.NpcDialog(This_Player,
   '大概有沙巴克城楼那么高吧！\ \'+
   '|{cmd}<返回/@main>                         ^<离开/@doexit>');
end;


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('布衣(男)', 50, 1);
  This_NPC.FillGoods('布衣(女)', 50, 1); 
  This_NPC.FillGoods('轻型盔甲(男)', 50, 1);
  This_NPC.FillGoods('轻型盔甲(女)', 50, 1);
  This_NPC.FillGoods('中型盔甲(男)', 50, 1);
  This_NPC.FillGoods('中型盔甲(女)', 50, 1);
  This_NPC.FillGoods('重盔甲(男)', 50, 3);
  This_NPC.FillGoods('重盔甲(女)', 50, 3);
  This_NPC.FillGoods('魔法长袍(男)', 50, 3);
  This_NPC.FillGoods('魔法长袍(女)', 50, 3);  
  This_NPC.FillGoods('灵魂战衣(男)', 50, 3);
  This_NPC.FillGoods('灵魂战衣(女)', 50, 3);
  This_NPC.FillGoods('幽灵战衣(男)', 50, 1);
  This_NPC.FillGoods('幽灵战衣(女)', 50, 1);
  This_NPC.FillGoods('恶魔长袍(男)', 50, 1);
  This_NPC.FillGoods('恶魔长袍(女)', 50, 1);
  This_NPC.FillGoods('战神盔甲(男)', 50, 1);
  This_NPC.FillGoods('战神盔甲(女)', 50, 1);  
  //加载stdmode
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
end;


Begin
      This_Npc.NpcDialog(This_Player,
      '虽然我穿的破，但我仍旧是个好裁缝，\'+
      '只是不太喜欢洗衣服而已。\'+
      '你是来买衣服呢，还是来补衣服？\ \'+
      '|{cmd}<买衣服/@buy>' + addspace(' ',26) + '^<卖衣服/@sell>\'+
      '|{cmd}<修复衣服/@repair>' + addspace(' ',24) + '^<特殊修理/@s_repair>\'+
      '|{cmd}<退出/@doexit>');
end.