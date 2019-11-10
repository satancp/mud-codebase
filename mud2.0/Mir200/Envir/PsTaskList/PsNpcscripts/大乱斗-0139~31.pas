program mir2;

procedure _letgo;
begin
  if This_Npc.CheckCurrMapHum = 1 then
  begin
    This_Player.Give('经验', 2000000);
    This_Player.AddLF(0, 50);
    This_Player.RandomFlyTo('0159');
    ServerSay('恭喜玩家<' + This_Player.Name + '>获得了大乱斗活动的胜利，获得了50灵符，200万经验！', 5);
  end;
end;

procedure Execute;
var
  hum: integer;
begin
  hum := This_Npc.CheckCurrMapHum;
  if hum = 1 then
    This_Npc.NpcSay('恭喜你获得了胜利，你可以找我领取奖励了！')
  else
    This_Npc.NpcSay('当前剩余玩家数：' + inttostr(hum) + '人！')
end;

begin
  if (GetHour <> 12) and (GetHour <> 19) and (GetHour <> 22) then
  begin
    This_Player.PlayerNotice('大乱斗活动还没有开始！', 0);
    exit;
  end;
  if GetMin <= 10 then
  begin
    This_Player.PlayerNotice('暂时还不能领取奖励，请稍等！', 0);
    exit;
  end;
  if This_Npc.CheckCurrMapHum > 1 then
  begin
    This_Player.PlayerNotice('地图内还有其他人，请打败他们来获得奖励！', 0);
    exit;
  end;
  This_Npc.NpcDialog(This_Player, '恭喜你获得了最终的胜利，你可以领取你的奖励了！' +
    '|{cmd}<领取奖励/@letgo>');

end.