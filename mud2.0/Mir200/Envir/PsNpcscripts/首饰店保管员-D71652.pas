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


Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '要修理装饰品吗？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '修理得还算可以。\ \ \' +
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
  This_Npc.SetRebate(200);

  //加载stdmode 
  This_NPC.AddStdMode(19);
  This_NPC.AddStdMode(20);
  This_NPC.AddStdMode(21);
  This_NPC.AddStdMode(22);
  This_NPC.AddStdMode(23);
  This_NPC.AddStdMode(24);
  This_NPC.AddStdMode(26);
end;

Procedure _Normal;
begin
   This_Npc.NpcDialog(This_Player,
   '你也是为了寻找新的东西才来到这里的吗？\'+
   '你也应该知道这里很危险。我能够帮你的就是修理装饰品。\ \'+
   '|{cmd}<修理装饰品/@repair> ' + addSpace(' ',24) + '^<特殊修理/@s_repair>\'+
   '|{cmd}<退出/@doexit>');
end;

Begin
      _Normal;
end.