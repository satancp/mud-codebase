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
   '要修理武器吗？修理什么武器？\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '还有要修理的吗？\ \' +
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
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
end;

Procedure _Normal;
begin
   This_Npc.NpcDialog(This_Player,
   '对你这样的武士来说，武器就跟生命一样。如果时刻不准备着，\'+
   '那么你也会成为地上的骷髅。要是你有好几条命，那么可以不\'+
   '修理武器，怎么样，把你的武器交给我来修理吧？\ \'+
   '|{cmd}<修理武器/@repair> ' + addSpace(' ',24) + '^<特殊修理/@s_repair>\'+
   '|{cmd}<退出/@doexit>');
end;

Begin
      _Normal;
end.