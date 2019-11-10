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
   '在森林里神出鬼没的蜘蛛怪物当中， \\'
   +'最让人头疼的要数幻影蜘蛛\\'
   +'这种蜘蛛自身不动，但是不断吐出子虫 \\'
   +'这些子虫见人就自爆\\'
   +'只有打败母虫, 才会停止吐子虫，打败一个幻影蜘蛛\\'
   +'要经过生死战斗. \ \\'
   +'|{cmd}<关闭/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.