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
   '我要和师父好好学，天天向上！\'
   +'我肯定能成为最伟大的道士！\\'
   +'|{cmd}<确定/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.