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
   '充满妖气的森林最深处，有一座中魔咒的山 \\'
   +'红月挂在山顶，天下将会被血流所埋住.. \\'
   +'对, 这是我很久以前看过的一段话. \\'
   +'好像在暗示着什么，但是却不知道到底是什么意思 \\'
   +'你真的想了解的话可去后面山洞看看. \ \\'
   +'|{cmd}<关闭/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.