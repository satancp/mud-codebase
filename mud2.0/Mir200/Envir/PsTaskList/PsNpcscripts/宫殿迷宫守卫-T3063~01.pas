{
/************************************************************************}

PROGRAM Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _goh007;
var
r : integer;
begin
  if compareText(This_Player.MapName, 'T3063') = 0 then
  begin
   r := random(4);
   if r = 3 then
   begin
      This_Player.FlyTo('H007',119,9);
   end;
   if r = 2 then
   begin
      This_Player.FlyTo('H007',115,13);
   end;
   if r = 1 then
   begin
      This_Player.FlyTo('H007',118,16);
   end;
   if r = 0 then
   begin
      This_Player.FlyTo('H007',121,12);
   end;
  end;  
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '你不要再往下走了，下面已经成为一片废墟了。魔王为了\'+
   '“天工神剪”的事，把魔兽都派去了地下宫殿，同时也带\'+
   '去了所有的财宝。\'+
   '地下宫殿的入口就在宫殿长廊的中间，还是让我送你去宫\'+
   '殿长廊吧。\ \'+
   '       ^<去宫殿长廊/@goh007>                   ^<离开/@doexit>');
end.