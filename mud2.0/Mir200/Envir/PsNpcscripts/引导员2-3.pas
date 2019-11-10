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
  if CompareText(This_Player.MapName,'3') = 0 then
  begin
    This_Player.RandomFlyTo('D601');
  end
  else
    exit;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '这里通向满是可怕蜈蚣的地牢，\'+
   '如果你在历练的过程中遇到<邪恶钳虫/c=red>，\'+
   '请千万注意自己，它们是地牢中让人无法安心的梦魇。\ \'+
   '|{cmd}<我要进入地牢一层/@gofei>\ \'
   );
end. 