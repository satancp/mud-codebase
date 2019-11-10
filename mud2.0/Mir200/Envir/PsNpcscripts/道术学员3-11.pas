{********************************************************************


*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure domain;
begin
This_Npc.NpcDialog(This_Player,
   '呼噜呼噜ZZzzZZzz\\'
   +'|{cmd}<确定/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.