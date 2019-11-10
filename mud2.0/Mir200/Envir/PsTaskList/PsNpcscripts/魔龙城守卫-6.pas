{
/************************************************************************}

Program Mir2;




Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '以阁下的实力目前还不能进入此地，请回吧！ \ \' +
   '|{cmd}<离开/@doexit>');
end.