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
   This_NPC.NpcDialog(This_Player,
   '呵呵，幻境终于被人发现了！我也没必要再隐瞒什么了。\'
   +'只要你有勇气去幻境挑战，我现在就可以送你！\ \'
   +'|{cmd}<到别处去/@talkwith>\'
   +'|{cmd}<确定/@exit>'   
   );

end;



procedure _talkwith;
begin
   This_NPC.NpcDialog(This_Player,
   '白日门附近很危险，\'
   +'如果你想回到安全的地方，\'
   +'我可以帮你。\ \'
   +'|{cmd}<回到比奇/@move1>\'
   +'|{cmd}<返回/@main>'
   );

end;

procedure _move1;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到比奇需要金币  \'
   +'不能让你免费使用 \'
   +'你必须支付2000金币 \ '
   +'你想花这笔钱吗? \ \'
   +'   '
   +'|{cmd}<移动/@pay1> \'
   +'|{cmd}<退出/@talkwith>'
   
   
   
   );

end;

procedure _pay1;
begin
    IF This_Player.GoldNum >= 2000 then
    begin
        This_Player.DecGold(2000);
        This_Player.Flyto('0',333,274);
    end else
   This_NPC.NpcDialog(This_Player,
   '你在开玩笑吧???这点钱也没有.. \'
   +'还想移动?? 我不想再见到你.. \ \'
   +'|{cmd}<返回/@main>'
   );

end;

begin
    domain;
end.