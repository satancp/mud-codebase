{********************************************************************

*******************************************************************}
//命运之刃指示最后分歧点

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain;
begin
    if CheckOtherMapMon('01141') > 0 then
       This_NPC.NpcDialog(This_Player,
   '哦，魔鬼在作孽，快去把它们消除掉。\ \'
   +'|{cmd}<关闭/@exit>'

   )else
   begin
    This_Player.RandomFlyTo('0114');
    //This_Player.SetV(9,7,1);
    This_Player.SetV(11,4,12);
   end;
end; 


begin
    domain;
end.