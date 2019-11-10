{
*******************************************************************}

program Mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _goback;
begin
  //if This_Player.Level >= 30 then
  if 1 = 1 then
  begin
    if CompareText(This_Player.MapName,'SD002~01')= 0 then
    begin
      This_Player.RandomFlyTo('3');
    end
    else
      exit; 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '尚未达到30级，不能返回盟重。\ \' 
    );
  end;
end;

begin
  This_Npc.NpcDialog(This_Player,
 '我可以送你返回盟重。\ \'+
 '|{cmd}<返回盟重/@goback>\'
 );
end. 