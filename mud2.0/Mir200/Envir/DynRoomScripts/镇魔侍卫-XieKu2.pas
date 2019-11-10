//--------------------------------------------------
//脚本Npc：镇魔侍卫
//所在地图：动态房间 XieKu2，使用的地图 E404 
//内容：组队任务中邪窟地下的第二层NPC
//      主要负责在开始挑战时根据组队人数进行刷怪 
//备注：使用了0号任务第15、16列作为临时变量 
//-------------------------------------------------- 

program mir2;

const
  roomName = 'XieKu2';

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _BackMeng;
begin
  if This_Player.DynRoomName = roomName then
  begin
    This_Player.Flyto('3', 327, 330);
  end; 
end;

procedure DoCreateMon;
var
  i, PlayerCount, CirCount, rd : Integer;
begin
  CirCount := 0;
  PlayerCount := This_Npc.CheckCurrMapHum;
  if PlayerCount < 4 then
    CirCount := 3 
  else if PlayerCount < 6 then
    CirCount := 5
  else if PlayerCount < 8 then
    CirCount := 7
  else if PlayerCount < 10 then
    CirCount := 9
  else if PlayerCount < 13 then
    CirCount := 11;
  
  for i:=1 to CirCount do
  begin
    rd := Random(35);
    case rd of
    0:  
      This_Npc.CreateMon('', 20, 75, 10, '魔龙教主120', 1);
    1:  
      This_Npc.CreateMon('', 20, 75, 10, '魔龙力士120', 1);
    2:  
      This_Npc.CreateMon('', 20, 75, 10, '魔龙战将120', 1);
    3:  
      This_Npc.CreateMon('', 20, 75, 10, '尸王', 3);
    4:  
      begin
        This_Npc.CreateMon('', 20, 75, 10, '骷髅刀斧手', 2);
        This_Npc.CreateMon('', 20, 75, 10, '邪恶毒蛇', 1);
      end;
    5:  
      This_Npc.CreateMon('', 20, 75, 10, '恶灵尸王', 3);
    6:  
      This_Npc.CreateMon('', 20, 75, 10, '电僵王', 1);
    7:  
      begin
        This_Npc.CreateMon('', 20, 75, 10, '魔龙血蛙', 2);
        This_Npc.CreateMon('', 20, 75, 10, '魔龙射手', 2);
      end;
    8:
      begin 
        This_Npc.CreateMon('', 20, 75, 10, '幻影蜘蛛', 1);
        This_Npc.CreateMon('', 20, 75, 10, '月魔蜘蛛', 2);
      end;
    9:
      begin  
        This_Npc.CreateMon('', 20, 75, 10, '楔蛾', 2);
        This_Npc.CreateMon('', 20, 75, 10, '红野猪', 2);
      end;
    10: 
      This_Npc.CreateMon('', 20, 75, 10, '祖玛教主120', 1);
    11: 
      This_Npc.CreateMon('', 20, 75, 10, '白野猪', 1);
    12: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '黑野猪', 2);
        This_Npc.CreateMon('', 20, 75, 10, '牛魔法师', 2);
      end;
    13: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '黄泉教主', 1);
        This_Npc.CreateMon('', 20, 75, 10, '骷髅弓箭手', 2);
      end;
    14: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '楔蛾', 4);
        This_Npc.CreateMon('', 20, 75, 10, '沃玛勇士', 2);
      end;
    15:
      begin 
        This_Npc.CreateMon('', 20, 75, 10, '楔蛾', 4);
        This_Npc.CreateMon('', 20, 75, 10, '月魔蜘蛛', 4);
      end; 
    16: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '黑野猪', 3);
        This_Npc.CreateMon('', 20, 75, 10, '黑色恶蛆', 3);
      end;
    17: 
      This_Npc.CreateMon('', 20, 75, 10, '虹魔教主', 1);
    18:
      begin 
        This_Npc.CreateMon('', 20, 75, 10, '牛魔王120', 1); 
        This_Npc.CreateMon('', 20, 75, 10, '牛魔法师', 2);
      end;
    19: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '牛头魔', 2);
        This_Npc.CreateMon('', 20, 75, 10, '骷髅精灵', 3);
      end;
    20: 
      This_Npc.CreateMon('', 20, 75, 10, '白野猪', 3);
    21: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '双头血魔120', 1);  
        This_Npc.CreateMon('', 20, 75, 10, '骷髅长枪兵', 3);
      end;       
    22: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '恶灵僵尸', 3);  
        This_Npc.CreateMon('', 20, 75, 10, '恶灵尸王', 2);
      end;
    23: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '骷髅锤兵', 2);
        This_Npc.CreateMon('', 20, 75, 10, '双头金刚', 1);
      end;
    24: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '火焰沃玛', 4);
        This_Npc.CreateMon('', 20, 75, 10, '邪恶毒蛇', 1);
      end;
    25: 
      This_Npc.CreateMon('', 20, 75, 10, '魔龙破甲兵', 2);
    26: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '牛魔战士', 2);
        This_Npc.CreateMon('', 20, 75, 10, '牛魔斗士', 2);
      end;
    27: 
      begin
        This_Npc.CreateMon('', 20, 75, 10, '牛魔侍卫', 3);
        This_Npc.CreateMon('', 20, 75, 10, '牛魔将军', 2);
      end;
    28: 
      This_Npc.CreateMon('', 20, 75, 10, '血僵尸', 1);    
    29: 
      This_Npc.CreateMon('', 20, 75, 10, '血巨人', 1);  
    30: 
      This_Npc.CreateMon('', 20, 75, 10, '魔龙刀兵', 2);  
    31: 
      This_Npc.CreateMon('', 20, 75, 10, '虹魔猪卫', 1);
    32: 
      This_Npc.CreateMon('', 20, 75, 10, '虹魔蝎卫', 1);
    33: 
      This_Npc.CreateMon('', 20, 75, 10, '触龙神', 1);  
    34: 
      This_Npc.CreateMon('', 20, 75, 10, '白野猪', 2);       
    end;            
  end;  
end;

procedure _Challenge;
begin
  if not (This_Player.DynRoomName = roomName) then
    Exit;
    
  if not ((This_Player.GetV(0, 15) = 75) and (This_Player.IsGroupOwner)) then
  begin
    This_Npc.NpcDialog(This_Player,
      '您不是原先所在队伍的队长，不能开始。\' +
      '|{cmd}<关闭/@exit>'
    );       
    Exit;
  end;
  
  if This_Player.GetV(0, 16) <> 50 then
  begin
    This_Npc.NpcDialog(This_Player,
      '您已经开始挑战了，不能再次进行挑战 \' +
      '|{cmd}<关闭/@exit>'
    );
    Exit;
  end;
  
  DoCreateMon;
  This_Player.SetV(0, 16, 0);
  _exit;
end;

begin
  This_Npc.NpcDialog(This_Player,
    '这位英雄，您来接受斩妖除魔的重任啊，\' +
    '好的，一切就掌握在您自己的手里了！\' +
    '|{cmd}<开始挑战/@Challenge>\' +
    '|{cmd}<返回盟重/@BackMeng>'
  );
end.