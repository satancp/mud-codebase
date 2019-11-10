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
   '气守丹田，神游四海......\'
   +'我要平时收敛一点，不能让人知道我已经天下第一了。\'
   +'我能三掌打死一只鸡！大家会嫉妒的。\'
   +'我准备明天动身去杀赤月恶魔！\\'
   +'|{cmd}<确定/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.