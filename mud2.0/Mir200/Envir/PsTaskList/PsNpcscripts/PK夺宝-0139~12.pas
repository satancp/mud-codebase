{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _GOONE;
begin
  if This_Player.Level >= 40 then
  begin
    if (GetHour = 18) and (GetMin >= 30) and (GetMin <= 40) then
    begin
      if random(2) = 1 then
      begin
        This_Player.Flyto('F007~01',23,46);
        This_Player.CallOut(This_NPC,3600,'P101'); 
      end
      else
      begin
        This_Player.Flyto('F007~01',176,36);
        This_Player.CallOut(This_NPC,3600,'P101');
      end;
    end
    else
      exit; 
  end
  else
    exit;
end;

procedure P101;
begin
  if CompareText(This_Player.MapName,'F007~01') = 0 then
  begin
    This_Player.RandomFlyTo('3');
  end
  else if CompareText(This_Player.MapName,'F009~01') = 0 then
  begin
    This_Player.RandomFlyTo('3');
  end
  else if CompareText(This_Player.MapName,'F006~01') = 0 then
  begin
    This_Player.RandomFlyTo('3');
  end
  else if CompareText(This_Player.MapName,'F003~03') = 0 then
  begin
    This_Player.RandomFlyTo('3');
  end
  else if CompareText(This_Player.MapName,'F002~01') = 0 then
  begin
    This_Player.RandomFlyTo('3');
  end
  else if CompareText(This_Player.MapName,'D2079~06') = 0 then
  begin
    This_Player.RandomFlyTo('3');
  end
  else if CompareText(This_Player.MapName,'D2004~02') = 0 then
  begin
    This_Player.RandomFlyTo('3');
  end;
end;

var
  temp : integer;
begin
  if This_Player.Level >= 40 then
  begin
    if (GetHour = 18) and (GetMin > 40) then
    begin
      This_Npc.NpcDialog(This_Player,          
      '非常的抱歉，你已经错过了本次活动的进入时间，\请等待下次活动开启！\');
    end
    else if (GetHour = 18) and (GetMin >= 30) and (GetMin <= 40) then
    begin
      This_Npc.NpcDialog(This_Player,          
      '目前夺宝战已经正式开启，请你抓紧时间尽快赶往第七层！\现在请你先赶往夺宝战第一层的看守人(101,161) ！\ \' 
      +'|{cmd}<进入夺宝战第一层/@GOONE>');
      if temp = GetDateNum(GetNow) then
      begin
        exit;
      end
      else
      begin
        temp := GetDateNum(GetNow);
        This_NPC.ClearMon('F007~01');
        This_NPC.ClearMon('F009~01');
        This_NPC.ClearMon('F006~01');
        This_NPC.ClearMon('F003~03');
        This_NPC.ClearMon('D2079~06');
        This_NPC.ClearMon('F002~01');
        This_NPC.CreateMon('F007~01',89,100,20,'电僵王08',2);
        This_NPC.CreateMon('F007~01',89,100,50,'僵尸2',20);
        This_NPC.CreateMon('F007~01',89,100,50,'僵尸3',20);
        This_NPC.CreateMon('F007~01',89,100,50,'僵尸4',60);
        This_NPC.CreateMon('F009~01',107,94,50,'邪恶钳虫003',3);
        This_NPC.CreateMon('F009~01',107,94,50,'蜈蚣',50);
        This_NPC.CreateMon('F009~01',107,94,50,'跳跳蜂',50);
        This_NPC.CreateMon('F009~01',107,94,50,'钳虫',50);
        This_NPC.CreateMon('F006~01',100,100,50,'白野猪',5);
        This_NPC.CreateMon('F006~01',100,100,50,'虹魔猪卫',5);
        This_NPC.CreateMon('F006~01',100,100,50,'黑野猪',50);
        This_NPC.CreateMon('F006~01',100,100,50,'红野猪',50);
        This_NPC.CreateMon('F006~01',100,100,50,'蝎蛇',50);
        This_NPC.CreateMon('F006~01',100,100,50,'黑色恶蛆',50);
        This_NPC.CreateMon('F003~03',47,52,20,'暗之沃玛教主14',1);
        This_NPC.CreateMon('F003~03',47,52,50,'沃玛卫士',5);
        This_NPC.CreateMon('F003~03',47,52,50,'沃玛勇士',40);
        This_NPC.CreateMon('F003~03',47,52,50,'沃玛战士',40);
        This_NPC.CreateMon('F003~03',47,52,50,'沃玛战将',40);
        This_NPC.CreateMon('F003~03',47,52,50,'火焰沃玛',40);
        This_NPC.CreateMon('D2079~06',52,51,20,'暗之祖玛教主',1);
        This_NPC.CreateMon('D2079~06',52,51,50,'祖玛弓箭手3',30);
        This_NPC.CreateMon('D2079~06',52,51,50,'祖玛卫士3',30);
        This_NPC.CreateMon('D2079~06',52,51,50,'祖玛雕像3',30);
        This_NPC.CreateMon('D2079~06',52,51,50,'楔蛾',30);
        This_NPC.CreateMon('F002~01',51,50,20,'暗之魔龙教主',1);
        This_NPC.CreateMon('F002~01',51,50,50,'魔龙力士',1);
        This_NPC.CreateMon('F002~01',51,50,30,'魔龙巨蛾',1);
        This_NPC.CreateMon('F002~01',51,50,40,'魔龙战将',1);
        This_NPC.CreateMon('F002~01',51,50,50,'魔龙破甲兵',30);
        This_NPC.CreateMon('F002~01',51,50,50,'魔龙刀兵',30);
        This_NPC.CreateMon('F002~01',51,50,50,'魔龙射手',30);
        This_NPC.CreateMon('F002~01',51,50,50,'魔龙刺蛙1',20);
        This_NPC.CreateMon('F002~01',51,50,50,'魔龙刺蛙2',20);
      end; 
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,          
      '比赛正式开始时间是18点30分，请先耐心等待，谢谢！\');
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '非常的遗憾，只有等级达到<40级/c=red>的玩家才能参加此活动！');
  end;
end.