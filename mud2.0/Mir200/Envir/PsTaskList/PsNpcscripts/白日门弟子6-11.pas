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
   '哎呦... 腿疼死了.. \\'
   +'有没有地方可以歇一会儿?? \ \\'
   +'|{cmd}<关闭/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.