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
   '我表妹小敏在比奇新手村门口天天站着等我。\'
   +'听说老有人去和她搭讪，问七问八的，真不放心啊。\\'
   +'|{cmd}<确定/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.