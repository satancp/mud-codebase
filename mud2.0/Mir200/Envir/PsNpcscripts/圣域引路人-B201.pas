{********************************************************************

*******************************************************************}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;



procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '没想到你真能来到这里，作为对你非凡勇气的奖励，\'
   +'我可以送你去圣域，不必付出金钱和声望！\'
   +'而且你想在那里停留多久都可以！\'
   +'现在想去吗？\ \'
   +'|{cmd}<想去/@a1>\'
   +'|{cmd}<不想去/@exit>'
   
   
   
   
   );

end;

procedure _a1;
begin
    case random(2) of
        0 : This_Player.RandomFlyTo('B101');
        1 : This_Player.RandomFlyTo('B102');
    end;
end;

begin
    domain; 
end.