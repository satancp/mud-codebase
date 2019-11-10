{********************************************************************

*******************************************************************}

program mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '如果你在挑战地图和禁止挂机的地图挂机(无论是否使用内\'
  +'挂)，或者在游戏内辱骂他人，宣传外挂、赌博等信息。都\'
  +'会被移动至本地图。在本地图你会受到一些限制。第一次\'
  +'来这里，我可以把你传送回盟重，不过会扣除你30分信用\'
  +'分；第二次的话，我会扣光你的信用分和金币，才会把你\'
  +'送回盟重；第三次的话，我也不想理你了。\ \'
  +'|{cmd}<查看禁止挂机的地图/@lookformap>\'
  +'|{cmd}<我要回盟重/@outhere>'
  );
end;

procedure _lookformap;
begin
  This_Npc.NpcDialog(This_Player,
  '使用浪漫星雨进入的焰火地图禁止挂机。\'
  +'需要信用分验证的挑战地图禁止挂机，包括沃玛寺庙、霸者\'
  +'大厅、祖玛神殿七层大厅、祖玛寺庙五层、生死之间、魔龙\'
  +'西郊、牛魔寺庙大厅、石墓七层、祖玛阁。\'
  +'在以上地图挂机的角色会被移动至检查室。\ \'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _outhere;
var
time_out:integer;
begin
  if This_Player.GetS(80,35) < 0 then This_Player.SetS(80,35,0);
  time_out:= This_Player.GetS(80,35);
  if time_out = 0 then
  begin
  This_Npc.NpcDialog(This_Player,
  '看在你是第一次的话，我会扣除你30分信用分，才能把你\'
  +'送回盟重。不过你要注意，以后不能在禁止挂机的地图挂\'
  +'机，也不要使用外挂、参与游戏中的赌博、辱骂他人。我\'
  +'可不希望再见到你了。\ \'
  +'|{cmd}<确定，我要回到盟重/@outhere_1>'
  );
  end else
  if time_out = 1 then
  begin
  This_Npc.NpcDialog(This_Player,
  '你已经是第二次来这里了，我会扣光你的信用分和金币，\'
  +'才能把你送回盟重。不过你要注意，以后不能在禁止挂机\'
  +'的地图挂机，也不要使用外挂、参与游戏中的赌博、辱骂\'
  +'他人。我可不希望再见到你了。\ \'
  +'|{cmd}<确定，我要回到盟重/@outhere_1>'
  );
  end else
  This_Npc.NpcDialog(This_Player,
  '我已经告诉过你了，不能在禁止挂机的地图挂机，也不要\'
  +'使用外挂、参与游戏中的赌博、辱骂他人。\'
  );
end;

procedure _outhere_1;
var
time_out,temp,temp1:integer;
begin
  if This_Player.MapName <> '0139~1' then exit;
  if This_Player.GetS(80,35) < 0 then This_Player.SetS(80,35,0);
  time_out:= This_Player.GetS(80,35);
  if time_out = 0 then
  begin
  This_Player.SetS(80,35,1);
  temp:= This_Player.GetActivePoint;
  if temp >= 30 then temp := 30;
  This_Player.DecActivePoint(temp);
  This_Player.RandomFlyTo('3'); 
  end else
  if time_out = 1 then
  begin
  This_Player.SetS(80,35,2);
  temp:= This_Player.GetActivePoint;
  temp1:= This_Player.GoldNum;
  This_Player.DecActivePoint(temp);
  This_Player.DecGold(temp1);
  This_Player.RandomFlyTo('3'); 
  end else
  This_Npc.NpcDialog(This_Player,
  '我已经告诉过你了，不能在禁止挂机的地图挂机，也不要\'
  +'使用外挂、参与游戏中的赌博、辱骂他人。\'
  );
end;


//脚本执行的入口
begin
  domain;
end.   