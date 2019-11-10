{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '能来到这里，说明你有足够的实力进入下一层。\'
   +'你现在就去吗？\ \'
   +'|<去/@a1>\'
   +'|<不去/@exit>'
   );

end;

procedure _a1;
begin
This_Player.Flyto('H004',12, 27);
end;

begin
  domain;
end. 