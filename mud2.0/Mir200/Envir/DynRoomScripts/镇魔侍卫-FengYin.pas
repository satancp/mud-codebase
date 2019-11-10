//--------------------------------------------------
//脚本Npc：镇魔侍卫
//所在地图：动态房间 FengYin，使用的地图 M100 
//内容：解封任务中地下的第一层NPC
//      主要负责在玩家消灭完第一层怪后将小队传到下一层 
//备注：使用了0号任务第15列作为临时变量， 值为45 
//      用来标记玩家为点击NPC进入下层的队长 
//-------------------------------------------------- 

program mir2;

const
  roomName = 'FengYin';
  roomNameNext = 'FengYin2'; 
  
procedure _BackMeng;
begin
  if This_Player.DynRoomName = roomName then
  begin
    This_Player.Flyto('3', 327, 330);
  end;
end;

procedure flyToNext(beAlone: Boolean);
var
  roomIdx : Integer;
begin
  if beAlone then
  begin
    This_Player.FlyToDynRoom(roomNameNext, 0, 0);
    This_Player.CallOutParam := roomNameNext;
    This_Player.CallOut(This_Npc, 1800, 'callOutFlyBack');
  end
  else
  begin
    if not This_Player.IsGroupOwner then
    begin
      This_Npc.NpcDialog(This_Player,
        '你不是所在队伍的队长，不能进入下一层'
      );
      Exit;
    end; 
    
    This_Player.SetV(0, 15, 45);
    roomIdx := This_Npc.GetAIdleDynRoomIndex(roomNameNext);
    This_Player.GroupFlyToDynRoom(roomNameNext, roomIdx);
    This_Player.GroupCallOut(This_Npc, 'callOutFlyBack', roomNameNext, 1800);  
  end;
end;

procedure _next;
var
  roomIdx : Integer;
begin
  if not (This_Player.DynRoomName = roomName) then
    Exit;
  
  if This_Npc.CheckCurrMapMon > 0 then
  begin
    This_Npc.NpcDialog(This_Player,
      '这一层的怪物还没有被消灭，不能进入下一层'
    );
    Exit; 
  end;
  
  if This_Npc.CheckCurrMapHum > 1 then
    flyToNext(False)
  else
    flyToNext(True);  
end;

procedure callOutFlyBack;
begin
  if This_Player.DynRoomName = This_Player.CallOutParam then
    This_Player.Flyto('3', 323, 333);  
end;
 
begin
  This_Npc.NpcDialog(This_Player,
    '您能找到我说明您已经有相当的实力了\' +
    '只要所有的怪物都被消灭了，您就可以进入下一层\' +
    '找到下一层的镇魔侍卫，你就可以接受考验\' +
    '成功接受考验，消灭完怪物，您就可以找他去解封物品\' +
    '在二层你只有20分钟时间,超过时间还没有消灭完怪物\' +
    '您就将被自动送回盟重\' +
    '|{cmd}<挑战下一层/@next>\' + 
    '|{cmd}<返回盟重/@BackMeng>'
  );
end.