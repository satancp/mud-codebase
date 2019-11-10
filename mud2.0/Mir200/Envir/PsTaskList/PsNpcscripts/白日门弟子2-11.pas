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
   '从道馆往北走，就会出现叫做灌木林的森林 \\'
   +'那里树木茂盛，白天也不见一丝阳光， \\'
   +'附近的人们经常在那里迷路 \\'
   +'所以去那儿一定要倍加小心. \ \\'
   +'|{cmd}<关闭/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.