//--------------------------------------------------
//脚本Npc：镇魔侍卫
//所在地图：动态房间 KuangDong，使用的地图 D411 
//内容：组队任务中矿洞地下的第一层NPC
//      主要负责在玩家消灭完第一层怪后将小队传到下一层 
//备注：使用了0号任务第15、16列作为临时变量 
//-------------------------------------------------- 


program mir2;

const
  roomName = 'KuangDong';
  roomNameNext = 'KuangDong2'; 
  
procedure _BackMeng;
begin
  if This_Player.DynRoomName = roomName then
  begin
    This_Player.Flyto('3', 327, 330);
  end;
end;

procedure _next;
var
  roomIdx : Integer;
begin
  
  if not (This_Player.DynRoomName = roomName) then
    Exit;
 
  if not This_Player.IsGroupOwner then
  begin
    This_Npc.NpcDialog(This_Player,
      '你不是所在队伍的队长,不能进入下一层'
    );
    Exit;
  end; 
  
  if This_Npc.CheckCurrMapMon <> 0 then
  begin
    This_Npc.NpcDialog(This_Player,
      '这一层的怪物还没有被消灭，不能进入下一层'
    );
    Exit; 
  end;
  //标记是谁点的NPC
  This_Player.SetV(0, 15, 75);  
  This_Player.SetV(0, 16, 50);   
  //整队飞到第二层 
  This_Player.GroupCallOut(This_Npc, 'callOutFlyBack', roomNameNext, 1200);
  roomIdx := This_Npc.GetAIdleDynRoomIndex(roomNameNext);
  This_Player.GroupFlyToDynRoom(roomNameNext, roomIdx);
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
    '|{cmd}<找二层的镇魔守将，就可以开始下一关的挑战>，\' +
    '在二层你们有20分钟的时间接受挑战，\' +
    '时间限制一到，将送你们返回盟重。\' +
    '|{cmd}<挑战下一层/@next>\' +
    '|{cmd}<返回盟重/@BackMeng>'
  );
end.