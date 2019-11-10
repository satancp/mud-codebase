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
  if CompareText(This_Player.MapName,'1') = 0 then
  begin
    This_Player.RandomFlyTo('D021');
  end
  else
    exit;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '这里通向满是沃玛怪物的沃玛寺庙，\'+
   '如果你在历练的过程中遇到<沃玛教主、沃玛卫士/c=red>，\'+
   '请千万注意自己，它们是地牢中让人无法安心的梦魇。\ \'+
   '|{cmd}<我要进入沃玛寺庙/@gofei>\ \'
   );
end. 