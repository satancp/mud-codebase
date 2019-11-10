{
*******************************************************************}

PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _Chuansong;
var
  CSTem : integer; 
begin
   if compareText(This_Player.MapName, '0') = 0 then
   begin
      CSTem := Random(3) + 1;
      case CSTem of
        1 : This_Player.Flyto('0',332 + random(10) - 5,274 + random(10) - 5);
        2 : This_Player.Flyto('0',332 + random(10) - 5,260 + random(10) - 5);
        3 : This_Player.Flyto('0',322 + random(10) - 5,260 + random(10) - 5);
      end;
   end;
end;

Begin
   This_NPC.NpcDialog(This_Player,
   '这里人员太多，交通拥堵，我可以免费帮你传送出去！\ \'+
   '|{cmd}<我要传送/@Chuansong>');
end.