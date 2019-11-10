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
  if This_Player.Level >= 45 then
  begin
    if CompareText(This_Player.MapName,'3') = 0 then
    begin
      This_Player.RandomFlyTo('D5071~88');
    end
    else
    begin
      exit;
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你的等级尚未达到45级以上，不能前往虚空之地。'); 
  end;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '虚无缥缈的空间\'+
   '杀死里面的怪物，你会得到上古宝藏，也有\'+
   '可能命丧当场！！！\|'+
   '|{cmd}<前往虚空之地/@give755757>\'); 
end.