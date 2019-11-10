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
    This_Player.RandomFlyTo('D711');
  end
  else
    exit;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '这里通向满是可怕野猪的石墓，\'+
   '如果你在历练的过程中遇到<邪恶毒蛇、白野猪/c=red>，\'+
   '请千万注意自己，它们是石墓中让人无法安心的梦魇。\ \'+
   '|{cmd}<我要进入石墓一层/@gofei>\ \'
   );
end. 