{
  ******************************************************************* }

program mir2;

procedure _letgo;
var
  i: integer;
begin
  if (GetHour >= 16) or (GetDay <> 19) then
  begin
    i := Random(1);
    if i = 1 then
      This_Player.Flyto('0', 650, 626)
    else
      This_Player.Flyto('0', 290, 617);
  end
  else
    This_Player.PlayerNotice('必须到16点才可以离开！', 0);
end;

procedure Execute;
begin
  if GetHour >= 11 then
  This_Npc.NPCSay('传奇已正式开启！请点击我离开等待间！')
  else
  This_Npc.NPCSay('传奇于19号16点正式开区！我们在传奇等你！！！');
end;

begin
  This_Npc.NpcDialog(This_Player, '传奇于17号16点正式开区，届时你才可以离开等待间。\ \' +
    '|{cmd}<我要出去/@letgo>\');
end.