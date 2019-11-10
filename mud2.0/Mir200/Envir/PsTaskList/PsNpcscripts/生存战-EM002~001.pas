{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure CheckGoldMap(mapname : string);
begin
  if CheckOtherMapHum(mapname) >= 40 then
  begin
    This_Npc.NpcDialog(This_Player,
    '这张地图已经满员了，请稍后再到我这里来吧！'); 
  end
  else if This_Player.GoldNum >= 2000 then
  begin
    This_Player.DecGold(2000);
    This_Player.SetS(22,21,0);
    This_Player.SetS(22,33,0); 
    This_Player.RandomFlyTo(mapname);
    This_Player.CallOut(This_NPC,60,'p101');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '每次进入任务地图都需要支付2000金币，\你现在好像还没有2000金币！'); 
  end;
end;

procedure CreateMon1(mapname : string); 
begin
  This_NPC.CreateMon(mapname,52,52,10,'闪亮的天赐2',1);
  This_NPC.CreateMon(mapname,52,52,10,'闪亮的天赐4',1);
  This_NPC.CreateMon(mapname,52,52,10,'闪亮的天赐6',1);
  This_Player.CallOut(This_NPC,60,'p101');
  if random(400) = 168 then
  begin
    This_NPC.CreateMon(mapname,52,52,10,'闪亮的天赐801',1);
  end
  else if random(20) = 8 then
  begin
    This_NPC.CreateMon(mapname,52,52,10,'闪亮的天赐5',1);
  end
  else if random(20) = 10 then
  begin
    This_NPC.CreateMon(mapname,52,52,10,'闪亮的天赐802',1);
  end
  else if random(20) = 16 then
  begin
    This_NPC.CreateMon(mapname,52,52,10,'闪亮的天赐1',1);
  end; 
end;

procedure CreateMon2(mapname : string);
var
  temp : integer;
begin
  temp := This_Player.GetS(22,21);
  This_NPC.CreateMon(mapname,52,52,10,'黑色恶蛆114',1);
  This_Player.SetS(22,21,temp+1);
  This_Player.CallOut(This_NPC,60,'p101');
end;

procedure p101();
begin
  if (This_Player.GetS(22,21) = -1) or (This_Player.GetS(22,21) > 15) or (This_Player.GetS(22,33) = -1) then
  begin
    This_Player.SetS(22,21,0);
    This_Player.SetS(22,33,0);
  end;
  
  if This_Player.GetS(22,21) = 15 then
  begin
    This_Player.RandomFlyTo('3');
    This_Player.SetS(22,21,0);
    This_Player.SetS(22,33,0); 
  end 
  else if (This_Player.GetS(22,21) < 15) and (This_Player.GetS(22,33) = 0) then
  begin
    if CompareText(This_Player.MapName,'D2079~001') = 0 then
    begin
      CreateMon1('D2079~001');
      This_Player.SetS(22,33,1);
    end
    else if CompareText(This_Player.MapName,'D2079~002') = 0 then
    begin
      CreateMon1('D2079~002');
      This_Player.SetS(22,33,1);
    end
    else if CompareText(This_Player.MapName,'D2079~003') = 0 then
    begin
      CreateMon1('D2079~003');
      This_Player.SetS(22,33,1);
    end
    else if CompareText(This_Player.MapName,'D2079~004') = 0 then
    begin
      CreateMon1('D2079~004');
      This_Player.SetS(22,33,1);
    end
    else if CompareText(This_Player.MapName,'D2079~005') = 0 then
    begin
      CreateMon1('D2079~005');
      This_Player.SetS(22,33,1);
    end
    else if CompareText(This_Player.MapName,'D2079~006') = 0 then
    begin
      CreateMon1('D2079~006');
      This_Player.SetS(22,33,1);
    end 
  end
  else if (This_Player.GetS(22,21) < 15) and (This_Player.GetS(22,33) = 1) then
  begin
    if CompareText(This_Player.MapName,'D2079~001') = 0 then
    begin
      CreateMon2('D2079~001');
      This_Player.SetS(22,33,0);
    end
    else if CompareText(This_Player.MapName,'D2079~002') = 0 then
    begin
      CreateMon2('D2079~002');
      This_Player.SetS(22,33,0);
    end
    else if CompareText(This_Player.MapName,'D2079~003') = 0 then
    begin
      CreateMon2('D2079~003');
      This_Player.SetS(22,33,0);
    end
    else if CompareText(This_Player.MapName,'D2079~004') = 0 then
    begin
      CreateMon2('D2079~004');
      This_Player.SetS(22,33,0);
    end
    else if CompareText(This_Player.MapName,'D2079~005') = 0 then
    begin
      CreateMon2('D2079~005');
      This_Player.SetS(22,33,0);
    end
    else if CompareText(This_Player.MapName,'D2079~006') = 0 then
    begin
      CreateMon2('D2079~006');
      This_Player.SetS(22,33,0);
    end 
  end 
end;

procedure _godatin01;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    CheckGoldMap('D2079~001'); 
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin 
    CheckGoldMap('D2079~001');
  end 
  else
    exit; 
end;

procedure _godatin02;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    CheckGoldMap('D2079~002'); 
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin 
    CheckGoldMap('D2079~002');
  end
  else
    exit; 
end;

procedure _godatin03;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    CheckGoldMap('D2079~003'); 
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin 
    CheckGoldMap('D2079~003');
  end
  else
    exit; 
end;

procedure _godatin04;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    CheckGoldMap('D2079~004'); 
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin 
    CheckGoldMap('D2079~004');
  end
  else
    exit; 
end;

procedure _godatin05;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    CheckGoldMap('D2079~005'); 
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin 
    CheckGoldMap('D2079~005');
  end
  else
    exit; 
end;

procedure _godatin06;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    CheckGoldMap('D2079~006'); 
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin 
    CheckGoldMap('D2079~006');
  end
  else
    exit; 
end;


begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    This_Npc.NpcDialog(This_Player,
    '试炼大厅内机遇与危险是并存的，越危险的地方获得的利益也越大。\'
    +'你做好充足的准备了吗？进入一次需支付2000金币。\ \'
    +'|{cmd}<进入试炼大厅一/@godatin01>      ^<进入试炼大厅二/@godatin02>\'
    +'|{cmd}<进入试炼大厅三/@godatin03>      ^<进入试炼大厅四/@godatin04>\'
    +'|{cmd}<进入试炼大厅五/@godatin05>      ^<进入试炼大厅六/@godatin06>\'
    );
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin
    This_Npc.NpcDialog(This_Player,
    '试炼大厅内机遇与危险是并存的，越危险的地方获得的利益也越大。\'
    +'你做好充足的准备了吗？\ \'
    +'|{cmd}<进入试炼大厅一/@godatin01>      ^<进入试炼大厅二/@godatin02>\'
    +'|{cmd}<进入试炼大厅三/@godatin03>      ^<进入试炼大厅四/@godatin04>\'
    +'|{cmd}<进入试炼大厅五/@godatin05>      ^<进入试炼大厅六/@godatin06>\'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '现在还不到时候，活动将在每天的14点和17点开放进入！\你过段时间再来吧。\\'
    );
  end;
end. 