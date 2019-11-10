{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _GOONE;
begin
  if CompareText(This_Player.MapName,'D2079~06') = 0 then
  begin
    if This_NPC.CheckCurrMapMon = 0 then
    begin
      if random(4) = 3 then
      begin
        This_Player.Flyto('F002~01',24,22); 
      end
      else if random(3) = 2 then
      begin
        This_Player.Flyto('F002~01',20,80); 
      end
      else if random(2) = 1 then
      begin
        This_Player.Flyto('F002~01',77,23); 
      end
      else
      begin
        This_Player.Flyto('F002~01',81,80); 
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
    '很好，这张地图上的怪物已经全部消灭\现在请你赶往夺宝战第六层的看守人(52 51) ！\'
    +'|{cmd}<进入夺宝战第六层/@GOONE>');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '还有怪物没有消灭，只有消灭地图中的所有怪物才能\进入下一层夺宝地图，赶快，留给你的时间不多了！！');
  end;
end.