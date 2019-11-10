{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _gofei;
var
  temp : integer; 
begin
  if CompareText(This_Player.MapName,'0') = 0 then
  begin
    temp := random(7)+1;
    if temp = 1 then
    begin
      This_Player.Flyto('0',316,278); 
    end
    else if temp = 2 then
    begin
      This_Player.Flyto('0',299,261);
    end
    else if temp = 3 then
    begin
      This_Player.Flyto('0',309,241);
    end
    else if temp = 4 then
    begin
      This_Player.Flyto('0',247,285);
    end
    else if temp = 5 then
    begin
      This_Player.Flyto('0',331,239);
    end
    else if temp = 6 then
    begin
      This_Player.Flyto('0',337,311);
    end
    else
    begin
      This_Player.Flyto('0',359,301);
    end 
  end
  else
    exit;
end;

begin
   This_Npc.NpcDialog(This_Player,
   '我可以将你送回城内，你要进入城内吗？\ \'
   +'|{cmd}<进入城内/@gofei>\ \'
   );
end. 