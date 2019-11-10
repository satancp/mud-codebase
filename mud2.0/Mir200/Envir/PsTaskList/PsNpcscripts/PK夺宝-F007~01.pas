{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _GOONE;
begin
  if CompareText(This_Player.MapName,'F007~01') = 0 then
  begin
    if This_NPC.CheckCurrMapMon = 0 then
    begin
      if random(2) = 1 then
      begin
        This_Player.Flyto('F009~01',138,140); 
      end
      else
      begin
        This_Player.Flyto('F009~01',58,42); 
      end;
    end
    else
      exit;
  end
  else
    exit;
end;

begin
  if This_NPC.CheckCurrMapMon = 0 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '很好，这张地图上的怪物已经全部消灭\现在请你赶往夺宝战第二层的看守人(102 94) ！\'
    +'|{cmd}<进入夺宝战第二层/@GOONE>');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '还有怪物没有消灭，只有消灭地图中的所有怪物才能\进入下一层夺宝地图，赶快，留给你的时间不多了！！');
  end;
end.