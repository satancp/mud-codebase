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
    This_Player.RandomFlyTo('D501');
  end
  else
    exit;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '这里通向满是可怕怪物的祖玛寺庙，\'+
   '如果你在历练的过程中遇到<祖玛教主、祖玛卫士/c=red>，\'+
   '请千万注意自己，它们是祖玛寺庙中让人无法安心的梦魇。\ \'+
   '|{cmd}<我要进入祖玛寺庙/@gofei>\ \'
   );
end. 