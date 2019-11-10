{
/************************************************************************}

PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '道可道，非常道，当师傅的就是要耐心传道！\'+
   '并且我的徒弟都十分刻苦好学，是时候让他们去闯荡一番了。\ \'+
   '|{cmd}<退出/@doexit>');
end.