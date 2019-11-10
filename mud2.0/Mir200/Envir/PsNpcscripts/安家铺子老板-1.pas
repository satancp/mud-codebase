{********************************************************************

*******************************************************************}

Program Mir2;

{$I common.pas}

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
   '我会修好它！\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '它看起来已经修好了，\'+
    '如果您有别的武器要修理,请来这\ \' +
    '|{cmd}<返回/@main>'
  );
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


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);
  //加载stdmode  
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
end;




Begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，需要我帮什么忙吗？\ \'+  
      '|{cmd}<修理武器/@repair> \'+
      '|{cmd}<特殊修理/@s_repair>\'+
      '|{cmd}<退出/@doexit>');
end.