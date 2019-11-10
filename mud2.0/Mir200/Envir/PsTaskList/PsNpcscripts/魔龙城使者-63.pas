{
/************************************************************************}

Program Mir2;




Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '°µÖ®Ä§Áú½ÌÖ÷Ê¹ÓÃ×Ô¼ºĞ°¶ñµÄÁ¦Á¿\'+
   '¶ÔÄ§ÁúÎ÷¹Ø½øĞĞÁË·âÓ  £´Ó´Ë,ÈËÃÇÔÙÒ²²»ÄÜ½øÈëÄ§ÁúÎ÷¹Ø¡£\ \' +
   '|{cmd}<Àë¿ª/@doexit>');
end.