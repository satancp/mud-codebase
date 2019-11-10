{
*******************************************************************}

PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _chuans01;
begin
   if compareText(This_Player.MapName, '0') = 0 then
   begin
      This_Player.Flyto('0',251 + random(10) - 5,353 + random(10) - 5);
   end;
end;

Procedure _chuans02;
begin
   if compareText(This_Player.MapName, '0') = 0 then
   begin
      This_Player.Flyto('0',256 + random(10) - 5,170 + random(10) - 5);
   end;
end;

Procedure _chuans03;
begin
   if compareText(This_Player.MapName, '0') = 0 then
   begin
      This_Player.Flyto('0',426 + random(10) - 5,353 + random(10) - 5);
   end;
end;

Procedure _chuans04;
begin
   if compareText(This_Player.MapName, '0') = 0 then
   begin
      This_Player.Flyto('0',436 + random(10) - 5,151 + random(10) - 5);
   end;
end;

Begin
   This_NPC.NpcDialog(This_Player,
   '这里人员太多，交通拥堵，我可以免费帮你传送出去！\ \'+
   '|{cmd}<传送到比奇城南/@chuans01>\'+
   '|{cmd}<传送到比奇城西/@chuans02>\'+
   '|{cmd}<传送到比奇城东/@chuans03>\'+
   '|{cmd}<传送到比奇城北/@chuans04>');
end.