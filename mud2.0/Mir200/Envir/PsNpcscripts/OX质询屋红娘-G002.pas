{
/************************************************************************}


PROGRAM Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _mengzhong;
begin
   if compareText(This_Player.MapName, 'G002') = 0 then
   begin
      This_Player.RandomFlyTo('3');
   end;
end;

Procedure _biqi;
begin
   if compareText(This_Player.MapName, 'G002') = 0 then
   begin
      This_Player.RandomFlyTo('0');
   end;
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '这里是‘爱的质询屋’，我是谁？\'+
   '你叫我红娘吧。对了，提醒你：\'+
   '在这里千万不要说谎话，如果你所说的一切都是真心话的话，\'+
   '也许会给你带来好运哦！\ \'+
   '|{cmd}<回盟重/@mengzhong>                        ^<回比奇/@biqi>\'+
   '|{cmd}<确定/@doexit>');
end.