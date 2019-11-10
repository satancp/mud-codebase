{
*******************************************************************}

program Mir2;

var 
  items : array[1..18] of string;


procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _doexit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure PushDrinkItem_OK;
Begin
end;

//************************
//      地下组队任务 
//************************

procedure _chuangguan;
begin
  This_Npc.NpcDialog(This_Player,
    '不同的卷轴通向不同的地牢，你们也将会遇到不同的恶魔。\' +
    '首先你会进入一间试炼室,试炼室只能停留最多5分钟\' +
    '在试炼室中，只需点击试炼员即可进入下一层\' +
    '对了，有个小秘密告诉你,\' +
    '在地牢最底层所出没的恶魔身上藏有藏宝图和稀世珍宝，\' +
    '现在让我看看你有什么卷轴吧，我带你们去那里挑战群魔！\' +
    '|{cmd}<去矿洞组队除魔/@goKuangDong>         ^<去神殿组队除魔/@goShenDian>\' +
    '|{cmd}<去邪窟组队除魔/@goXieKu>         ^<去地穴组队除魔/@goDiXue>\' +
    '|{cmd}<去石墓组队除魔/@goShimu>         ^<退出/@exit>'
  );
end;

procedure createMon(dynRoomName: string; roomIdx: Integer);
begin
  if compareText(dynRoomName, 'KuangDong') = 0 then
  begin
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '白野猪', 5); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '僵尸1', 30); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '尸王', 8); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '电僵王', 5); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 1, '白野猪', 1);
  end; 

  if compareText(dynRoomName, 'ShenDian') = 0 then
  begin
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛雕像', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛卫士', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛弓箭手', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛雕像3', 5); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛卫士3', 5);
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛弓箭手3', 5); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛雕像0', 4); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛卫士0', 4); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '祖玛弓箭手3', 4); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '电僵王', 4);    
  end; 

  if compareText(dynRoomName, 'XieKu') = 0 then
  begin
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '恶灵僵尸', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '白野猪', 5); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '僵尸1', 20); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '恶灵尸王', 20); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '电僵王', 4); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 1, '白野猪', 1);
  end;
 
  if compareText(dynRoomName, 'DiXue') = 0 then
  begin
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '钳虫', 20); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 50, '邪恶钳虫2', 4); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 70, '蜈蚣', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 70, '跳跳蜂', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 70, '黑色恶蛆', 10);
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 70, '变异史莱姆', 5); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 70, '触龙神', 2); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 1, '白野猪', 1);    
  end;

  if compareText(dynRoomName, 'ShiMu') = 0 then
  begin
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '楔蛾', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '红野猪3', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '黑野猪3', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '黑色恶蛆', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '蝎蛇', 10);
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 40, '白野猪0', 10); 
    This_Npc.CreateDynRoomMon(dynRoomName, roomIdx, 50, 50, 1, '白野猪', 1);    
  end;         
end;

procedure goToDungeon(dynRoomName, scrollName : string);
var
  roomIdx : Integer;
begin
  if This_Player.MapName <> '3' then
    Exit;
   
  if This_Player.GetBagItemCount(scrollName) = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
      '您没有相应地图的卷轴，不能进入'
    );
    Exit;
  end;
  
  if not This_Player.IsGroupOwner then
  begin
    This_Npc.NpcDialog(This_Player,
      '您不是所在队伍的队长，不能进入'
    );
    Exit;
  end;

  This_Player.Take(scrollName, 1);  
  //获取动态房间号 
  roomIdx := This_Npc.GetAIdleDynRoomIndex(dynRoomName);
  //在新创建的动态房间中刷怪 
  CreateMon(dynRoomName, roomIdx);
  
  //整队飞到动态房间中 
  This_Player.GroupCallOut(This_Npc, 'callOutFlyBack', dynRoomName, 2400);
  This_Player.GroupFlyToDynRoom(dynRoomName, roomIdx);
end;

procedure callOutFlyBack;
begin
  if This_Player.DynRoomName = This_Player.CallOutParam then
    This_Player.Flyto('3', 323, 333);
end;

procedure _goKuangDong;
begin
  goToDungeon('KuangDong', '矿洞组队卷轴');
end;

procedure _goShenDian;
begin
  goToDungeon('ShenDian', '神殿组队卷轴');
end;

procedure _goXieKu;
begin
  goToDungeon('XieKu', '邪窟组队卷轴');
end;

procedure _goDiXue;
begin
  goToDungeon('DiXue', '地穴组队卷轴'); 
end;

procedure _goshimu;
begin
  goToDungeon('ShiMu', '石墓组队卷轴');
end;

//******************************
//        解封印任务 
//******************************

procedure _goToJF;
begin
  This_Npc.NpcDialog(This_Player,
    '年轻人，你要解除首饰的封印？\' +
    '如果你拥有一支精诚团结而且拥有强大力量的队伍，\' +
    '那解封路上的种种危险自然不能给你的队伍带来困难。\' +
    '如果你要凭借一己之力单独前往，我也非常佩服你的勇气，\' +
    '那就让我助你一臂之力，祝你马到成功！\ \' +
    '|{cmd}<了解更多解封信息/@moreJFInfo>\' +
    '|{cmd}<我和朋友一起去/@goWithTeam>                   ^<我要单独前往/@goAlone>'

  );
end;

procedure _moreJFInfo;
begin
  This_Npc.NpcDialog(This_Player,
    '雷泽项链(封印)       唤魔项链(封印)        启源项链(封印)\' +
    '雷泽手镯(封印)       唤魔手镯(封印)        启源手镯(封印)\' +
    '雷泽戒指(封印)       唤魔戒指(封印)        启源戒指(封印)\' +
    '                                                         \' +
    '圣战项链(封印)       法神项链(封印)        天尊项链(封印)\' +
    '圣战手镯(封印)       法神手镯(封印)        天尊手镯(封印)\' +
    '圣战戒指(封印)       法神戒指(封印)        天尊戒指(封印)\\' +
    '|{cmd}<返回/@goToJF>'
  );  
end;

function checkItems: Boolean;
var
  i : Integer;
begin
  Result := False;
  for i:=1 to 18 do
  begin
    if This_Player.GetBagItemCount(items[i]) > 0 then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure CreateAloneCommonJFMon(roomName: string; roomIdx, x, y: Integer);
begin
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '红野猪', 1);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '黑野猪', 1);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '蝎蛇', 1);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '楔蛾', 1);
end; 
  
procedure CreateTeamCommonJFMon(roomName: string; roomIdx, x, y: Integer);
begin
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '红野猪', 2);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '黑野猪', 2);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '黑色恶蛆', 1);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '白野猪0', 2);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 1, '角蝇', 1);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '蝎蛇', 2);
  This_Npc.CreateDynRoomMon(roomName, roomIdx, x, y, 3, '楔蛾', 2);
end;  
                            
procedure flyToJFDungeon(bAlone: Boolean);
var
  roomIdx : Integer;
  roomName : string;
begin
  roomName := 'FengYin';
  roomIdx := This_Npc.GetAIdleDynRoomIndex(roomName);

  if bAlone then
  begin
    //****** 刷怪 ******//
    //270 264
    CreateAloneCommonJFMon(roomName, roomIdx, 270, 264);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 270, 264, 3, '白野猪0', 1);
    //250 244
    CreateAloneCommonJFMon(roomName, roomIdx, 250, 244);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 250, 244, 3, '黑色恶蛆', 1);
    //225 219
    CreateAloneCommonJFMon(roomName, roomIdx, 225, 219);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 225, 219, 3, '白野猪0', 1);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 225, 219, 1, '角蝇', 1);
    //189 213
    CreateAloneCommonJFMon(roomName, roomIdx, 189, 213);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 189, 213, 3, '黑色恶蛆', 1);
    //167 191
    CreateAloneCommonJFMon(roomName, roomIdx, 167, 191);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 167, 191, 3, '白野猪0', 1);
    //149 173
    CreateAloneCommonJFMon(roomName, roomIdx, 149, 173);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 149, 173, 3, '黑色恶蛆', 1);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 149, 173, 1, '角蝇', 1);
    //125 149
    CreateAloneCommonJFMon(roomName, roomIdx, 125, 149);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 125, 149, 3, '白野猪0', 1);
    //93 133
    CreateAloneCommonJFMon(roomName, roomIdx, 93, 133);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 93, 133, 3, '黑色恶蛆', 1);
    //75 129
    CreateAloneCommonJFMon(roomName, roomIdx, 75, 129);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 75, 129, 3, '白野猪0', 1);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 75, 129, 1, '角蝇', 1);
    //51 105
    CreateAloneCommonJFMon(roomName, roomIdx, 51, 105);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 51, 105, 3, '黑色恶蛆', 1);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 51, 105, 1, '虹魔猪卫', 1);
        
    //飞入并设置延时飞出 
    This_Player.FlyToDynEnvirWithIdx(roomName, roomIdx, 0, 0);
    This_Player.CallOutParam := roomName;
    This_Player.CallOut(This_Npc, 1800, 'callOutFlyBack'); 
  end
  else
  begin
    //****** 刷怪 ******//
    //270 264
    CreateTeamCommonJFMon(roomName, roomIdx, 270, 264);
    //250 244
    CreateTeamCommonJFMon(roomName, roomIdx, 250, 244);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 250, 244, 1, '虹魔猪卫', 1);
    //225 219
    CreateTeamCommonJFMon(roomName, roomIdx, 225, 219);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 225, 219, 1, '电僵王', 1);
    //189 213
    CreateTeamCommonJFMon(roomName, roomIdx, 189, 213);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 250, 244, 1, '虹魔猪卫', 1);
    //167 191
    CreateTeamCommonJFMon(roomName, roomIdx, 167, 191);
    //149 173
    CreateTeamCommonJFMon(roomName, roomIdx, 149, 173);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 149, 173, 1, '虹魔猪卫', 1);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 149, 173, 1, '电僵王', 1);
    //125 149
    CreateTeamCommonJFMon(roomName, roomIdx, 125, 149);
    //93 133
    CreateTeamCommonJFMon(roomName, roomIdx, 93, 133);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 93, 133, 1, '虹魔猪卫', 1);
    //75 129
    CreateTeamCommonJFMon(roomName, roomIdx, 75, 129);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 75, 129, 1, '电僵王', 1);
    //51 105
    CreateTeamCommonJFMon(roomName, roomIdx, 51, 105);
    This_Npc.CreateDynRoomMon(roomName, roomIdx, 93, 133, 1, '虹魔猪卫', 1);
    
    //组队飞入，并设置callOut
    This_Player.GroupCallOut(This_Npc, 'callOutFlyBack', roomName, 1800);
    This_Player.GroupFlyToDynRoom(roomName, roomIdx);  
     
  end;
end;

procedure _goWithTeam;
begin
  if This_Player.MapName <> '3' then
    Exit;
  
  if not This_Player.IsGroupOwner then
  begin
    This_Npc.NpcDialog(This_Player,
      '您不是所在队伍的队长，不能前往\ \' +
      '|{cmd}<返回/@goToJF>'
    );
    Exit;
  end;  
  
  if checkItems then
     flyToJFDungeon(False)
  else
    This_Npc.NpcDialog(This_Player,
      '你没有需要解封的物品，不用来找我\ \' +
      '|{cmd}<返回/@goToJF>'
    );
end;

procedure _goAlone;
begin
  {$IFDEF Q136_hero}
  exit;
  {$ELSE}
  if This_Player.MapName <> '3' then
    Exit;
    
  if This_Player.IsTeamMember then
  begin    
    This_Npc.NpcDialog(This_Player,
      '您现在好像已经有了一起前往的伙伴了，\' +
      '还是和你的伙伴一起前往吧。\ \' +
      '|{cmd}<返回/@goToJF>'
    );
    Exit;
  end;
  
  if This_Player.HaveValidHero then
  begin
    if checkItems then
      flyToJFDungeon(True)
    else
      This_Npc.NpcDialog(This_Player,
        '你没有需要解封的物品，不用来找我\ \' +
        '|{cmd}<返回/@goToJF>'
      );
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你的实力还不够，还是和你的一同前往吧'
    );
  {$ENDIF}  
end;

procedure OnInitialize;
begin
  items[1] := '雷泽项链(封印)';
  items[2] := '唤魔项链(封印)';
  items[3] := '启源项链(封印)';
  
  items[4] := '雷泽手镯(封印)';
  items[5] := '唤魔手镯(封印)';
  items[6] := '启源手镯(封印)';
  
  items[7] := '雷泽戒指(封印)';
  items[8] := '唤魔戒指(封印)';
  items[9] := '启源戒指(封印)';
  
  items[10] := '圣战项链(封印)';
  items[11] := '法神项链(封印)';
  items[12] := '天尊项链(封印)';
  
  items[13] := '圣战手镯(封印)';
  items[14] := '法神手镯(封印)';
  items[15] := '天尊手镯(封印)';
  
  items[16] := '圣战戒指(封印)';
  items[17] := '法神戒指(封印)';
  items[18] := '天尊戒指(封印)';  
end;

//********************
//  天工神剪任务 
//********************

procedure _checkthing;
begin
  if This_Player.MapName = '3' then
  begin
    if This_Player.IsGroupOwner then
    begin
    if This_Player.GetBagItemCount('地下组队卷轴') > 0 then
    begin
      if This_Player.Take('地下组队卷轴', 1) then
        This_Player.GroupFly('T3063~01');
    end
    else if This_Player.GetBagItemCount('矿洞组队卷轴') > 0 then
    begin
      if This_Player.Take('矿洞组队卷轴', 1) then
        This_Player.GroupFly('T3063~01');
    end
    else if This_Player.GetBagItemCount('神殿组队卷轴') > 0 then
    begin
      if This_Player.Take('神殿组队卷轴', 1) then
        This_Player.GroupFly('T3063~01');
    end
    else if This_Player.GetBagItemCount('邪窟组队卷轴') > 0 then
    begin
      if This_Player.Take('邪窟组队卷轴', 1) then
        This_Player.GroupFly('T3063~01');
    end
    else if This_Player.GetBagItemCount('地穴组队卷轴') > 0 then
    begin
      if This_Player.Take('地穴组队卷轴', 1) then
        This_Player.GroupFly('T3063~01');
    end
    else if This_Player.GetBagItemCount('石墓组队卷轴') > 0 then
    begin
      if This_Player.Take('石墓组队卷轴', 1) then
        This_Player.GroupFly('T3063~01');
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有任何组队卷轴啊，我不能送你去');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
        '你不是所在队伍的队长，不能进入');
    end;
  end;
end;


procedure _checkthing1;
begin
  if compareText(This_Player.MapName, '3') = 0 then
  begin
    if This_Player.GetBagItemCount('地下组队卷轴') > 0 then
    begin
    if This_Player.Take('地下组队卷轴', 1) then
        This_Player.Flyto('T3063~01', 0, 0);
    end
    else if This_Player.GetBagItemCount('矿洞组队卷轴') > 0 then
    begin
    if This_Player.Take('矿洞组队卷轴', 1) then
        This_Player.Flyto('T3063~01', 0, 0);
    end
    else if This_Player.GetBagItemCount('神殿组队卷轴') > 0 then
    begin
      if This_Player.Take('神殿组队卷轴', 1) then
        This_Player.Flyto('T3063~01', 0, 0);
    end
    else if This_Player.GetBagItemCount('邪窟组队卷轴') > 0 then
    begin
      if This_Player.Take('邪窟组队卷轴', 1) then
        This_Player.Flyto('T306~01', 0, 0);
    end
    else if This_Player.GetBagItemCount('地穴组队卷轴') > 0 then
    begin
      if This_Player.Take('地穴组队卷轴', 1) then
        This_Player.Flyto('T3063~01', 0, 0);
    end
    else if This_Player.GetBagItemCount('石墓组队卷轴') > 0 then
    begin
      if This_Player.Take('石墓组队卷轴', 1) then
        This_Player.Flyto('T3063~01', 0, 0);
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有任何组队卷轴啊，我不能送你去');
  end;

end;

procedure _gohuan7;
begin
  This_Npc.NpcDialog(This_Player,
    '只要你拥有矿洞组队卷轴、神殿组队卷轴、邪窟组队卷轴、\' +
    '地穴组队卷轴、石墓组队卷轴这五种卷轴中的任意一件\' +
    '我就可以送你前往地下迷宫，那里也有一个地下城守卫\' +
    '他可以送你去宫殿长廊，前去解救天工神剪\' +
    '|{cmd}<组队前往地下迷宫/@checkthing>\' +
    '|{cmd}<单独前往地下迷宫/@checkthing1>\' +
    '|{cmd}<返回/@main>');

end;

Procedure DoNext;
begin
   if (compareText(This_Player.MapName, 'R001~01') = 0) or (compareText(This_Player.MapName, 'R001~02') = 0) or (compareText(This_Player.MapName, 'R001~03') = 0) or 
      (compareText(This_Player.MapName, 'R001~04') = 0) or (compareText(This_Player.MapName, 'R001~05') = 0) or (compareText(This_Player.MapName, 'D2013~01') = 0) or  
      (compareText(This_Player.MapName, 'D2013~02') = 0) or (compareText(This_Player.MapName, 'D2013~06') = 0) or (compareText(This_Player.MapName, 'D2013~04') = 0) or 
      (compareText(This_Player.MapName, 'D2013~05') = 0) or (compareText(This_Player.MapName, 'D717~01') = 0) or (compareText(This_Player.MapName, 'D717~02') = 0) or 
      (compareText(This_Player.MapName, 'D717~06') = 0) or (compareText(This_Player.MapName, 'D717~04') = 0) or (compareText(This_Player.MapName, 'D717~05') = 0) or 
      (compareText(This_Player.MapName, 'D024~01') = 0) or (compareText(This_Player.MapName, 'D024~02') = 0) or (compareText(This_Player.MapName, 'D024~06') = 0) or 
      (compareText(This_Player.MapName, 'D024~07') = 0) or (compareText(This_Player.MapName, 'D024~05') = 0) or (compareText(This_Player.MapName, 'D2079~01') = 0) or 
      (compareText(This_Player.MapName, 'D2079~02') = 0) or (compareText(This_Player.MapName, 'D2079~03') = 0) or (compareText(This_Player.MapName, 'D2079~04') = 0) or 
      (compareText(This_Player.MapName, 'D2079~05') = 0) or (compareText(This_Player.MapName, 'D5071~17') = 0) or (compareText(This_Player.MapName, 'D5071~18') = 0) or 
      (compareText(This_Player.MapName, 'D5071~19') = 0) or (compareText(This_Player.MapName, 'D5071~20') = 0) or (compareText(This_Player.MapName, 'D5071~21') = 0) or 
      (compareText(This_Player.MapName, 'D5071~22') = 0) or (compareText(This_Player.MapName, 'D5071~23') = 0) or (compareText(This_Player.MapName, 'D5071~24') = 0) or 
      (compareText(This_Player.MapName, 'D5071~25') = 0) or (compareText(This_Player.MapName, 'D5071~26') = 0) then  
   begin
      This_Player.Flyto('3',333,333);
   end;
end; 

//焰火屠魔：收3个XX焰火的模板； 
Procedure YanHuoTuMo_01(BaoZi : String; YHMap : String; XPoint : integer ; YPoint : integer; SecGuai : String);
var
temp : integer;
begin
   if compareText(This_Player.MapName, '3') = 0 then
   begin
      if This_Player.MyLFnum >= 1 then
      begin
         This_Player.DecLF(10001, 1, false); 
         This_Npc.CreateMon(YHMap,XPoint,YPoint,1,SecGuai,10);
         This_Player.RandomFlyTo(YHMap);
         This_Player.CallOut(This_Npc,1800,'DoNext');
         if GetG(11,1) >= 499 then             //SetG()和GetG()为全局变量，与NPC和Player无关；                                  
         begin
            SetG(11,1,0);
            This_Npc.CreateMon(YHMap,XPoint,YPoint,1,'天之魔影巨人',1);
            This_Npc.NpcDialog(This_Player,'您竟然触发了恶魔的机关，您自己要当心啊！');            
         end else if GetG(11,1) = -1 then
         begin
            SetG(11,1,1);
         end else
         begin
            temp := GetG(11,1)+1;
            SetG(11,1,temp);
         end;
      end else 
      begin
         This_Npc.NpcDialog(This_Player,
         '您好像没有足够的灵符啊！');
         Exit;
      end;
   end;
end;

//焰火屠魔：收6个XX焰火或者1个XX包的模板；   长空火舞6  一心一意3 
Procedure YanHuoTuMo_02(BaoZii : String; YHMapp : String; XPointt : integer ; YPointt : integer; SecGuaii : String);
var
temp : integer;
ts   : string;
begin
   if compareText(This_Player.MapName, '3') = 0 then
   begin
      if This_Player.MyLFnum >= 1 then
      begin
         This_Player.DecLF(10001, 1, false); 
         
         This_Player.RandomFlyTo(YHMapp);
         This_Npc.CreateMon(YHMapp,XPointt,YPointt,1,SecGuaii,10);
         This_Player.CallOut(This_Npc,1800,'DoNext');
         if GetG(11,1) >= 499 then                                 //SetG()和GetG()为全局变量，与NPC和Player无关； 
         begin            
            SetG(11,1,0);
            This_Npc.CreateMon(YHMapp,XPointt,YPointt,1,'天之魔影巨人',1);
            This_Npc.NpcDialog(This_Player,'您竟然触发了恶魔的机关，您自己要当心啊！');
         end else if GetG(11,1) = -1 then 
         begin
            SetG(11,1,1);
         end else
         begin
            temp := GetG(11,1)+1;
            SetG(11,1,temp); 
         end;
      end else 
      begin
         This_Npc.NpcDialog(This_Player,
         '您好像没有足够的灵符啊！');
         Exit;
      end;
      
      
   end;
end;







Procedure _god5071;
begin
   This_Npc.NpcDialog(This_Player,
   '使用灵符可以选择进入5个屠魔战场中的任意一个。\ \'+
   '|{cmd}<长空火舞(战场一)/@god50711>    ^<长空火舞(战场二)/@god50712>    |<长空火舞(战场三)/@god50713>\ \'+
   '^<长空火舞(战场四)/@god50714>    |<长空火舞(战场五)/@god50715>');
end;

Procedure _god50711;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~17',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~17',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

Procedure _god50712;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~18',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~18',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

Procedure _god50713;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~19',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~19',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

Procedure _god50714;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~20',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~20',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

Procedure _god50715;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~21',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~21',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;



Procedure _god5071_1;
begin
   This_Npc.NpcDialog(This_Player,
   '使用灵符可以选择进入5个屠魔战场中的任意一个。\ \'+
   '|{cmd}<如雾似梦(战场一)/@god50711_1>    ^<如雾似梦(战场二)/@god50712_1>    |<如雾似梦(战场三)/@god50713_1>\ \'+
   '^<如雾似梦(战场四)/@god50714_1>    |<如雾似梦(战场五)/@god50715_1>');
end;

Procedure _god50711_1;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~22',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~22',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

Procedure _god50712_1;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~23',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~23',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

Procedure _god50713_1;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~24',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~24',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

Procedure _god50714_1;
begin
  if (This_Player.GetBagItemCount('长空火舞') >= -1) or (This_Player.GetBagItemCount('长空火舞包') > 0) then
  begin
    YanHuoTuMo_02('长空火舞','D5071~25',24,66,'天之祖玛卫士72');
  end
  else if (This_Player.GetBagItemCount('如雾似梦') >= 6) or (This_Player.GetBagItemCount('如雾似梦包') > 0) then
  begin
    YanHuoTuMo_02('如雾似梦','D5071~25',24,66,'天之祖玛卫士72');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,
     '您好像没有必须的焰火啊！');
     Exit;
  end;
end;

procedure _tumo_Dlg;
begin
   This_Npc.NpcDialog(This_Player,
   '屠魔战场的入口就在我的身后，只是通常都不开启。\'+
   '焰火是有灵气的东西，我懂得如何发挥它的灵气并用它打开入口，\'+
   '给我灵符，我就能帮您打开一次屠魔战场的入口。不\'+
   '同种类焰火能让您去到不同的屠魔战？\'+
   '但凡人在那逗留过久会渐染魔性，故每次进入您只有30分钟时间，\'+
   '|{cmd}<长空火舞/@god5071>         ^<如雾似梦/@god5071_1>  ');
end;

Procedure _dongcha;
begin
   This_Npc.NpcDialog(This_Player,
   '相传在玛法大陆的某些角落，有一批恶魔镇守着六件重装，想\'+
   '要获得这些宝物，就必须首先要杀死这些恶魔，无数的为\'+
   '了获得这些宝物，不惜以自己的生命作为代价，有些人成功了，\'+
   '更多的勇士则倒在了恶魔的脚下，这位，您是否也想去发\'+
   '现这些魔兽的踪迹，给我 5万金币，我就能帮您去查看它们的\'+
   '踪影，给我 5颗金刚石，我就能送您去独闯魔穴。\ \'+
   '|{cmd}<花5万金币，探查魔兽踪影/@paymoney>          |<付5颗金刚石，前往除魔/@paydia>\'+
   '|{cmd}<返回/@main>');
end;

Procedure _paymoney;
begin
   This_Npc.NpcDialog(This_Player,
   '您想查询哪个魔域的恶魔信息呢？\ \'+
   '|{cmd}<困惑殿堂/@kunhuo>                      ^<查询其它的恶魔信息/@qita>\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _qita;
begin
   This_Npc.NpcDialog(This_Player,
   '您还想查询哪里的恶魔信息，虽然我能力有限，但我知道谁可以\'+
   '告诉你其中的秘密，只要你告诉我你想知道的恶魔巢穴就可以了。\ \'+
   '|{cmd}<钳虫巢穴/@askbai>              ^<死亡神殿/@askbi1>              ^<地狱烈焰/@askbi1>\ \'+
   '|{cmd}<堕落坟场/@askbi1>              ^<深渊魔域/@askbi1>              ^<返回/@main>');
end;

Procedure _askbai;
begin
   This_Npc.NpcDialog(This_Player,
   '白日门的向导好像知道一些有关于魔兽的事情，要么您去找\'+
   '他问问看吧。\ \'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _askbi1;
begin
   This_Npc.NpcDialog(This_Player,
   '比奇老兵好像知道一些有关于魔兽的事情，要么您去找\'+
   '他问问看吧。\ \'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _kunhuo;
begin
   if This_Player.GoldNum >=50000 then
   begin
      This_Player.DecGold(50000);
      if CheckOtherMapMon('T140') >= 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '让我掐指算算，\'+
         '好像魔兽就守候在前方，此时不去，更待何时？\ \'+
         '|{cmd}<付5颗金刚石，前往除魔/@paydiamond>');
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '让我掐指算算，可惜，魔兽还没有出现。');
      end;
   end else
   begin
   This_Npc.NpcDialog(This_Player,
   '您好像没有50000金币啊，我也帮不了你了！\');
   end;
end;

Procedure _paydiamond;
begin
   if compareText(This_Player.MapName, '3') = 0  then
   begin
      if This_Player.MyDiamondnum >= 5 then
      begin
         This_Player.TakeDiamond(5,This_NPC);
         This_Player.Flyto('R001',60,98);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '您怎么连5颗金刚石也没有啊？\ \'+
         '|{cmd}<退出/@exit>');
      end;   
   end;   
end;

Procedure _paydia;
begin
   This_Npc.NpcDialog(This_Player,
   '我只能送您去桃源之门，不过要给我5颗金刚石。\ \'+
   '|{cmd}<付5颗金刚石，前往除魔/@paydiamond>\ \'+
   '|{cmd}<返回/@main>');
end;





begin
   This_Npc.NpcDialog(This_Player,
   '前方就是充满危险的恶魔之地，我镇守着这个唯一的入口。\' +
   '只要你交给我一个卷轴，我就能带你和你的队伍去斩妖除魔！\' +
   '前路将会异常凶险，如果没有团队的支持，还是不去为好……\ \' +
  
   '|{cmd}<解救天工神剪/@gohuan7>\'+
   '|{cmd}<焰火屠魔/@tumo_Dlg>          \'+                 //^<使用礼花进行兑换/@lihua> 
   '|{cmd}<洞察魔兽信息/@dongcha>\ \');
end.