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
   '不要说我没有提醒你，\'
   +'这座烽火魔城很可能成为你的一场恶梦，\'
   +'你真的还打算进去吗？\'
   +'|{cmd}<退出/@exit>'
   
   );

end;

begin
    domain; 
end.  