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
  if CompareText(This_Player.MapName,'5') = 0 then
  begin
    This_Player.RandomFlyTo('D2051');
  end
  else
    exit;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '这里通向满是恶灵僵尸的尸魔洞，\'+
   '如果你在历练的过程中遇到<恶灵尸王/c=red>，\'+
   '请千万注意自己，它们是尸魔洞中让人无法安心的梦魇。\ \'+
   '|{cmd}<我要进入尸魔洞/@gofei>\ \'
   );
end. 