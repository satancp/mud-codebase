program mir2;

procedure _letgo;
begin
  if (GetHour <> 12) and (GetHour <> 19) and (GetHour <> 22) then
  begin
    This_Player.PlayerNotice('大乱斗活动还没有开始！', 0);
    exit;
  end;
  if GetMin > 5 then
  begin
    This_Player.PlayerNotice('已经超过了进入时间了，请在活动开始5分钟内进入！', 0);
    exit;
  end;
  if GetMin > 20 then
  begin
    This_Player.PlayerNotice('活动已经结束，请等待下次活动！', 0);
    exit;
  end;
  This_Player.RandomFlyTo('0139~30');
  This_Player.PlayerNotice('大乱斗活动将在10分时开始，请耐心等待！', 2);
  This_Player.CallOut(This_Npc, 1, 'luandou');
end;

procedure luandou;
begin
  if not(This_Player.MapName = '0139~30') then
    exit;
  if GetMin = 10 then
  begin
    This_Player.RandomFlyTo('0139~31');
    This_Player.CallOut(This_Npc, 10, 'jieshu');
    This_Player.PlayerNotice('大乱斗活动已经开始！请打败其他玩家，获得最终胜利！', 2);
    exit;
  end;
  This_Player.CallOut(This_Npc, 1, 'luandou');
end;

procedure jieshu;
begin
  if not(This_Player.MapName = '0139~31') then
    exit;
  if GetMin > 20 then
  begin
    This_Player.RandomFlyTo('0159');
    This_Player.PlayerNotice('大乱斗活动已经结束！', 2);
    exit;
  end;
  This_Player.CallOut(This_Npc, 10, 'jieshu');
end;

begin
  This_Npc.NpcDialog(This_Player,
    '每天12点，19点，22点整将举行大乱斗活动\|'
	+'|活动结束时地图内的最后一个玩家将获得<50灵符/c=red>和<200万经验/c=red>。\'
    +'|活动开始后的前5分钟请要参加活动的玩家.\'
	+'|进入等待室(超时将无法进入)，10分时所有人将传送到大乱斗地图.\'
	+'|地图内最后一个玩家获得奖励！.\'
    +'|{cmd}<进入等待室/@letgo>');

end.