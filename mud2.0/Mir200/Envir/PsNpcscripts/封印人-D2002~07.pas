program Mir2;

const
  THIS_MAP_NAME = 'D2002~07';


procedure checkmon2;
begin
  if CompareText(This_Player.MapName, THIS_MAP_NAME) = 0 then
    if This_Npc.CheckCurrMapMon > 0 then
    begin
      This_Player.SetV(30, 8, 0);
      This_Player.FlyTo('3', 333, 333);
      This_Npc.NpcDialog(This_Player,
        '很可惜,你没有通过考验,现在送您返回盟重');
    end
    else
    begin
      This_Player.SetV(30, 8, 3);
      This_Npc.CreateMon('', 23, 24, 10, '地蛙', 20);
      This_Player.CallOut(This_Npc, 120, 'TimeOutProc');
      This_Player.PlayerNotice('第二批地蛙出现！赶快消灭它们吧!', 0);
      This_Npc.NpcDialog(This_Player, '第二批地蛙出现！赶快消灭它们吧!');
    end;
end;

procedure checkmon3;
begin
  if CompareText(This_Player.MapName, THIS_MAP_NAME) = 0 then
    if This_Npc.CheckCurrMapMon > 0 then
    begin
      This_Player.SetV(30, 8, 0);
      This_Player.FlyTo('3', 333, 333);
      This_Npc.NpcDialog(This_Player,
        '很可惜,你没有通过考验,现在送您返回盟重');
    end
    else
    begin
      This_Player.SetV(30, 8, 4);
      This_Npc.CreateMon('', 23, 24, 10, '地蛙', 24);
      This_Player.CallOut(This_Npc, 120, 'TimeOutProc');
      This_Player.PlayerNotice('第三批地蛙出现！赶快消灭它们吧!', 0);
      This_Npc.NpcDialog(This_Player, '第三批地蛙出现！赶快消灭它们吧!');
    end;
end;

procedure checkmon4;
begin
  if CompareText(This_Player.MapName, THIS_MAP_NAME) = 0 then
    if This_Npc.CheckCurrMapMon > 0 then
    begin
      This_Player.SetV(30, 8, 0);
      This_Npc.NpcDialog(This_Player,
        '很可惜,你没有通过考验,现在送您返回盟重');
      This_Player.PlayerNotice('很可惜, 你没有通过考验, 不能解封头盔', 0);
    end
    else
    begin
      This_Player.SetV(30, 8, 5);    
      This_Player.PlayerNotice('恭喜你成功通过三关考验, 现在可以送您去解封头盔了', 0);
    end;
  This_Player.FlyTo('3', 333, 333);
end;

procedure callout;
begin
  case This_Player.GetV(30, 8) of
    2: checkmon2;
    3: checkmon3;
    4: checkmon4;
  else
    ;
  end;
end;

procedure TimeOutProc;
begin
  case This_Player.GetV(30, 8) of
    2: checkmon2;
    3: checkmon3;
    4: checkmon4;
  else
    ;
  end;
end;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _starttest;
begin
  if CompareText(This_Player.MapName, THIS_MAP_NAME) = 0 then
    if This_Player.GetV(30, 8) = 1 then
    begin
      This_Player.SetV(30, 8, 2);
      This_Npc.NpcDialog(This_Player,
        '第一批地蛙出现！赶快消灭它们吧!');
      This_Player.PlayerNotice('第一批地蛙出现！赶快消灭它们吧!', 0);
      This_Player.CallOut(This_Npc, 120, 'TimeOutProc');
      This_Npc.CreateMon('', 23, 24, 10, '地蛙', 16);
    end
    else
      This_Player.FlyTo('3', 333, 333);
end;

begin
  if This_Player.GetV(30, 8) = 1 then   //equal d8 1
    This_Npc.NpcDialog(This_Player,
      '你是来接受考验的吧,那好,那就开始吧\' +
      '一共有3批地蛙,每批限时3分钟,一共只有9分钟时间\\' +
      '在限定时间内消灭完全部3批地蛙,考验就过关了\' +
      '我就可以送您去盟重解封你的封印头盔了\' +
      '|{cmd}<开始考验/@starttest>\' +
      '|{cmd}<我再考虑一下/@exit>')
  else
    This_Npc.NpcDialog(This_Player,
      '你正在接受考验吧');
end.

