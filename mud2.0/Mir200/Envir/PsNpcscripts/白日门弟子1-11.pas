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
   '很久以前, 我们道馆有祖传之宝叫做破关珍剑， \\'
   +'被恶人盗走了。那把宝剑很神奇， \\'
   +'传说宝剑一出天地震动，有天龙下凡飘舞 \\'
   +'可能有些夸张... \\'
   +'不过若宝剑存在的话，就可以领略它的威力. \ \\'
   +'|{cmd}<关闭/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.