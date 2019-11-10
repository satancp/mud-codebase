{
地下城一层



}
program Mir2;

procedure TimeOutProc;
begin
  if LowerCase(This_Player.DynRoomName) = 'godforfex' then
    This_Player.FlyTo('DM002~1', 0, 0)  // 这个是静态房间
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _goh006;
begin
  if LowerCase(This_Player.DynRoomName) = 'underground1' then
  begin
    This_Player.FlyTo('DM002~1', 0, 0);
//mov d8 0
//mov d7 0
  end;
end;

procedure _gonext;
var
  nRoomIdx : integer;
begin
  if LowerCase(This_Player.DynRoomName) = 'underground1' then
  begin
    if This_Player.IsGroupOwner and (This_Player.GetV(26, 4)=1) then
    begin
      if This_Npc.CheckCurrMapMon > 0 then
      begin
        This_Npc.NpcDialog(This_Player,
          '怪物还没有全部消灭，勇士们，继续努力吧\'+
          '|{cmd}<返回宫殿/@goh006>\ \'+
          '|{cmd}<关闭/@exit>');

      end
      else
      begin
        if This_Player.GetV(26, 5) = 3 then
        begin
          This_Player.SetV(26, 5, 0);
          nRoomIdx := This_Npc.GetAIdleDynRoomIndex('GodForfex');
          if nRoomIdx <> -1 then
          begin
            This_Npc.NpcDialog(This_Player,
              '祝贺您，魔神的机关都阻止不了您！\'+
              '现在就送您进入下一层，在下一层您有30分钟的时间。');
            This_Player.GroupCallOut(This_Npc, 'TimeOutProc', '', 1800);            
            This_Player.GroupFlyToDynRoom('GodForfex', nRoomIdx);
            This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 15, 16, 3, '魔界圣兽', 1);
          end;
        end
        else
          This_Npc.NpcDialog(This_Player,
            '您还在接受挑战，继续奋斗吧，勇士们！\');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '您不是原先所在队伍的队长，不能进入下一层！\'+
        '|{cmd}<关闭/@exit>');
  end;
end;

begin
  This_Npc.NpcDialog(This_Player,
    '英雄，来到这里，说明您已经很有实力了，\'+
    '但是，您想进入下一层挑战魔界圣兽的话，\'+
    '首先就要打破我这里的机关，您有20分钟的时间，\'+
    '在20分钟内消灭全部怪物，您就可以进入下一层，\'+
    '否则，我只能送您返回宫殿，您可以下次再来挑战，\'+
    '在下一层，你们有30分钟的时间。\'+
    '|{cmd}<进入下一层/@gonext>\'+
    '|{cmd}<返回宫殿/@goh006>');
end.
