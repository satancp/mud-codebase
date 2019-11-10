{********************************************************************

*******************************************************************}

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;



procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '这里可不是到下一层的入口，呵呵！\'
   +'至于这扇门后面是什么地方……这个嘛……\ \'
   +'|{cmd}<离开/@exit>'
   );

end;

begin
    domain; 
end.