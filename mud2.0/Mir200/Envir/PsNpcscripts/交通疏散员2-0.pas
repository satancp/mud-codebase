{
*******************************************************************}

PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _Chuansong;
begin
   if compareText(This_Player.MapName, '0') = 0 then
   begin
      This_Player.Flyto('0',652 + random(10) - 5,630 + random(10) - 5);
   end;
end;

Begin
   This_NPC.NpcDialog(This_Player,
   '这里人员太多，交通拥堵，我可以免费帮你传送出去！\ \'+
   '|{cmd}<我要传送/@Chuansong>');
end.