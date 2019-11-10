{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _gofei;
begin
  if CompareText(This_Player.MapName,'0') = 0 then
  begin
    This_Player.RandomFlyTo('D401');
  end
  else
    exit;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '这里通向满是僵尸的矿区，\'+
   '如果你在历练的过程中遇到<尸王/c=red>，\'+
   '请千万注意自己，它们是矿区中让人无法安心的梦魇。\ \'+
   '|{cmd}<我要进入矿区/@gofei>\ \'
   );
end. 