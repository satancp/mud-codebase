{
/************************************************************************}

Program Mir2;




Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '暗之魔龙教主使用自己邪恶的力量\'+
   '对魔龙西关进行了封�  ４哟�,人们再也不能进入魔龙西关。\ \' +
   '|{cmd}<离开/@doexit>');
end.