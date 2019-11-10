{
*******************************************************************}

program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _enter;
begin
  if compareText(This_Player.MapName,'H007~01')= 0 then
  begin
    if (GetHour() = 10) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      This_Player.RandomFlyTo('D2004~01');
    end
    else if (GetHour() = 13) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      This_Player.RandomFlyTo('D2004~01');
    end
    else if (GetHour() = 15) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      This_Player.RandomFlyTo('D2004~01');
    end
    else if (GetHour() = 20) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      This_Player.RandomFlyTo('D2004~01');
    end
    else if (GetHour() = 23) and (GetMin() >= 0) and (GetMin() <= 29) then
    begin
      This_Player.RandomFlyTo('D2004~01');
    end
    else 
    begin
      This_Npc.NpcDialog(This_Player,
      '对不起，只有在每天的10:30－11:00、13:30－14:00、\'
      +'15:30－16:00、20:30－21:00、23:00－23:30，\才可以通过我进入夺宝地图！'
      );
    end;
  end
  else
  exit;
end;


begin
  This_Npc.NpcDialog(This_Player,
  '每天的10:30－11:00、13:30－14:00、\'
  +'15:30－16:00、20:30－21:00、23:00－23:30，\都可以通过我进入夺宝地图，\'
  +'在地图中的送宝人偶处就可以获得奖励。\'
  +'每天10:55－11:00、13:55－14:00、\'
  +'15:55－16:00、20:55－21:00、23:25－23:30，\'
  +'送宝人偶还会送出大量珍宝，只有有实力的勇士才能夺得宝藏！\ \'
  +'|{cmd}<我要进入夺宝地图/@enter>'
  );
end. 