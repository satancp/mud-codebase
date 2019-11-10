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
   '大殿里的天尊祖师爷总不露面\'
   +'想和他学两手都没机会。\'
   +'听说天底下就他老人家一个人能降住赤月恶魔！\\'
   +'|{cmd}<确定/@exit>\');

end;

//脚本执行的入口
begin
  domain;
end.