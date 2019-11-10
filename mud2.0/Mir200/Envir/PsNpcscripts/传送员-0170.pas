{

*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _give755757;
begin
  if This_Player.Level >= 20 then
  begin
    if CompareText(This_Player.MapName,'0170') = 0 then
    begin
      This_Player.RandomFlyTo('3');
    end
    else
    begin
      exit;
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你的等级尚未达到20级以上，不能前往盟重。'); 
  end;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '只要你等级达到20级以上，我就可以送你前往盟重。\ \'+
   '|{cmd}<前往盟重/@give755757>\'); 
end.