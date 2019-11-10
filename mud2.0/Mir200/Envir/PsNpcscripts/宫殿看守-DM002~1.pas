{
*******************************************************************************}


program Mir2;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _molongqude;
begin
  This_Npc.NpcDialog(This_Player,
    '神秘绒丝、魔龙颚骨、魔龙骨、魔龙牙都是旷世罕见的稀世珍宝，\'+
    '仅靠一己之力是无法获得这些神奇的宝贝，必须拥有队友的协作！\'+
    '在盟重镇魔守将处使用任意一种组队卷轴选择组队前往地下迷宫，\'+
    '通过崎岖的地下迷宫和妖魔守卫的宫殿长廊，到达地下宫殿,\'+
    '您必须拥有千年蛛丝,\'+
    '地下宫殿中宫殿守卫才会透露这些神奇宝贝的获得方法。\'+
    '|{cmd}<返回/@main>');

end;

procedure _zhusi;
begin
  This_Npc.NpcDialog(This_Player,
    '只有真正的孤胆才能获得“盘丝洞”中神秘的千年蛛丝!\'+
    '在盟重镇魔守将处使用任意一种组队卷轴选择单独前往地下迷宫.\'+
    '通过崎岖的地下迷宫和妖魔守卫的宫殿长廊，到达地下宫殿,\'+
    '在地下宫殿的宫殿守卫会告诉您进入“盘丝洞”的方法。\'+
    '|{cmd}<返回/@main>');

end;

procedure _cube;
begin
  This_Npc.NpcDialog(This_Player,
    '你现在的运气点数是'+IntToStr(This_Player.GetV(0, 1))+
    '如果再测的话，很可能就会转运哦。\');

end;

procedure _jinbi;
var
  nDice : Integer;
begin
  if (compareText(This_Player.MapName, 'DM002~1') = 0) then
  begin
    if This_Player.GoldNum >= 2000 then
    begin
      This_Npc.NpcDialog(This_Player, '嗯，那我们<开始/@cube>了!');
      This_Player.DecGold(2000);
      nDice := Random(6)+1;
      This_Player.SetV(0, 1, nDice);
      This_Npc.PlayDice(This_Player, 1, '@cube');
    end
    else
      This_Npc.NpcDialog(This_Player, '你没有足够的金币，还是等你有钱了再来找我吧');
  end;

end;

procedure _next;
var
  nDice : integer;
begin
  nDice := This_Player.GetV(0, 1);
  if nDice = 6 then
  begin
    This_Player.SetV(0, 1, 1);  // 清掉，防client刷
    if This_Player.GoldNum > 100000 then
    begin
      if This_Player.DecGold(100000) then
      begin
        This_Npc.NpcDialog(This_Player,
          '恭喜你，你的运气不错，你掷出的点数是6，\'+
          '我现在就送你去“盘丝洞”，只需要爆裂蜘蛛的数量在100个以上,\'+
          '你就可以获胜，并获得“千年蛛丝”。\');
        This_Player.SetV(26, 2, 1);
        This_Player.SetV(26, 6, 100);
        This_Player.FlyToDynRoom('DuckLight', 0, 0);
        This_Player.CallOutEx(This_Npc, 300, 'TimeOutProc');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你好象没有100000金币啊，那怎么行呢？\' +
        '|{cmd}<退出对话/@exit>');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '很可惜，你掷出的点数是'+inttostr(nDice)+'，\'+
      '看来你只能从头再来，再试试自己的运气了\ \'+
      '|{cmd}<返回/@gohole>');
  end;
end;

procedure _startdu;
begin
  if (compareText(This_Player.MapName, 'DM002~1') = 0) then
  begin
    if This_Player.GoldNum >= 50000 then
    begin
      if This_Player.DecGold(50000) then
      begin
        This_Player.SetV(0, 1, Random(6)+1); 
        This_Npc.PlayDice(This_Player, 1, '@next');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有足够的金币，还是等你有钱了再来找我吧\ \'+
        '|{cmd}<返回/@gohole>');
  end;
end;

procedure _touzi;
begin
  This_Npc.NpcDialog(This_Player,
    '我这里有个被灌注魔力的骰子，也是天工神剪送我的。\'+
    '给我2000金币，我帮你测一下你的运气\ \'+
    '|{cmd}<支付2000金币投骰子/@jinbi>\'+
    '|{cmd}<返回/@main>');

end;

procedure CreateMonD411;
begin
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '牛魔法师', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '牛魔将军', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '牛魔侍卫', 2);
  //This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '电僵王', 1);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '骷髅精灵', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '骷髅锤兵', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '骷髅长枪兵', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '骷髅刀斧手', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '骷髅弓箭手', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 50, 50, 40, '触龙神', 1);
end;

procedure CreateMonD607;
begin
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '红野猪', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '黑色恶蛆', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '黑野猪', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '蜈蚣', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '楔蛾', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '蜈蚣王', 1);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '白野猪', 1);
 // This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '楔蛾王', 1);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '触龙神', 1);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 15, '邪恶钳虫2', 2);
  This_Npc.CreateDynRoomMon(This_Player.DynRoomName, This_Player.DynRoomIdx, 25, 16, 10, '变异史莱姆', 2);
end;

procedure TimeOutProc;
var
  nStep : Integer;
  sMapName : string;
begin
  if CompareText(This_Player.DynRoomName, 'ducklight') = 0 then
  begin
    This_Player.FlyTo('DM002~1', 0, 0)  // 这个是静态房间

  end
  else if CompareText(This_Player.DynRoomName, 'underground1') = 0 then  // D411
  begin
    if (not This_Player.IsGroupOwner) or (This_Player.GetV(26, 4) <> 1) then    // 检查是否队长、是否刚点npc的那人
      Exit;
    nStep := This_Player.GetV(26, 5);
    case nStep of
      0:
      begin
        This_Player.SetV(26, 5, 1);
        This_Player.CallOut(This_Npc, 180, 'TimeOutProc');
        sMapName := This_Player.DynRoomName + IntToStr(This_Player.DynRoomIdx); 
        if CheckOtherMapMon(sMapName) < 70 then
          CreateMonD411;
      end;
      1:
      begin
        This_Player.SetV(26, 5, 2);
        This_Player.CallOut(This_Npc, 180, 'TimeOutProc');
        sMapName := This_Player.DynRoomName + IntToStr(This_Player.DynRoomIdx); 
        if CheckOtherMapMon(sMapName) < 70 then
          CreateMonD411;
      end;
      2:
      begin
        This_Player.SetV(26, 5, 3);
        This_Player.CallOut(This_Npc, 180, 'TimeOutProc');
        sMapName := This_Player.DynRoomName + IntToStr(This_Player.DynRoomIdx); 
        if CheckOtherMapMon(sMapName) < 70 then
          CreateMonD411;
      end;
    else ;
    end;
  end
  else if CompareText(This_Player.DynRoomName, 'underground2') = 0 then  //D607
  begin
    if (not This_Player.IsGroupOwner) or (This_Player.GetV(26, 4) <> 1) then    // 检查是否队长、是否刚点npc的那人
      Exit;
    nStep := This_Player.GetV(26, 5);
    case nStep of
      0:
      begin
        This_Player.SetV(26, 5, 1);
        This_Player.CallOut(This_Npc, 180, 'TimeOutProc');
        sMapName := This_Player.DynRoomName + IntToStr(This_Player.DynRoomIdx); 
        if CheckOtherMapMon(sMapName) < 70 then
          CreateMonD607;
      end;
      1:
      begin
        This_Player.SetV(26, 5, 2);
        This_Player.CallOut(This_Npc, 180, 'TimeOutProc');
        sMapName := This_Player.DynRoomName + IntToStr(This_Player.DynRoomIdx); 
        if CheckOtherMapMon(sMapName) < 70 then
          CreateMonD607;
      end;
      2:
      begin
        This_Player.SetV(26, 5, 3);
        This_Player.CallOut(This_Npc, 180, 'TimeOutProc');
        sMapName := This_Player.DynRoomName + IntToStr(This_Player.DynRoomIdx); 
        if CheckOtherMapMon(sMapName) < 70 then
          CreateMonD607;
      end;
    else ;
    end;
  end;

end;

procedure _starttest;
begin
  if (compareText(This_Player.MapName, 'DM002~1') = 0) then
  begin
    if This_Player.GoldNum > 100000 then
    begin
      if This_Player.DecGold(100000) then
      begin
        This_Player.SetV(26, 2, 1);
        This_Player.SetV(26, 6, 120);
        This_Player.FlyToDynRoom('DuckLight', 0, 0);
        This_Player.CallOutEx(This_Npc, 300, 'TimeOutProc');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你好象没有足够的金币啊，那怎么行呢？\' +
        '|{cmd}<退出对话/@exit>');
  end;
end;


procedure _gohole;
begin
  This_Npc.NpcDialog(This_Player,
    '盘丝洞是非常危险的地方,交给我10万金币，我可以带你去那里\' +
    '你要在保证生存的前提下,让爆裂蜘蛛的数量在120个以上,\' +
    '你只有3分钟的时间,如果完成要求就可以得到一个“千年蛛丝”。\' +
    '|{cmd}<找到盘丝洞里的地下城守卫就可开始挑战>，\' +
    '如果觉得难度太高，也可以给我5万金币，我给你一次掷骰子的机会\' +
    '只要你掷出的点数为6,就可以降低要求，只需要100个以上\' +
    '如果掷出的点数不为6,那你只好再试试运气了\' +
    '|{cmd}<前往盘丝洞/@starttest>            ^<掷骰子，看运气/@startdu>\' +
    '|{cmd}<返回/@main>');

end;

procedure _god411_607;
var
  nRoomIdx : integer;
begin
  if compareText(This_Player.MapName, 'DM002~1') = 0 then
  begin
    if This_Player.GetBagItemCount('千年蛛丝') > 0 then
    begin
      if This_Player.IsGroupOwner then
      begin
        if Random(2) = 0 then
        begin
          if This_Player.Take('千年蛛丝', 1) then
          begin
            nRoomIdx := This_Npc.GetAIdleDynRoomIndex('UnderGround1');
            if nRoomIdx <> -1 then
            begin
              This_Player.GroupFlyToDynRoom('UnderGround1', nRoomIdx);
  //            This_Player.GroupFly('UnderGround1');  // groupmove D411~4
              This_Player.GroupSetV(26, 4, 0);         // 清掉队员组队标志
              This_Player.SetV(26, 4, 1);              // 给队长打上标志
              This_Player.SetV(26, 5, 0);
              This_Player.CallOut(This_Npc, 10, 'TimeOutProc');
            end;
          end;  
        end
        else
        begin
          if This_Player.Take('千年蛛丝', 1) then
          begin
            nRoomIdx := This_Npc.GetAIdleDynRoomIndex('UnderGround2');
            if nRoomIdx <> -1 then
            begin
              This_Player.GroupFlyToDynRoom('UnderGround2', nRoomIdx);
//            This_Player.GroupFly('UnderGround2');  // groupmove D411~4
              This_Player.SetV(26, 4, 1);
              This_Player.SetV(26, 5, 0);
              This_Player.CallOut(This_Npc, 10, 'TimeOutProc');
            end;
          end;  
        end;  
      end
      else
      This_Npc.NpcDialog(This_Player, '你不是所在队伍的队长，不能进入');
    end
    else
      This_Npc.NpcDialog(This_Player, '你没有带来千年蛛丝啊');
  end;

end;

procedure _gofloor1;
begin
  if (compareText(This_Player.MapName, 'DM002~1') = 0) then
  begin
    This_Npc.NpcDialog(This_Player,
      '你们将进入地下宫殿一层，前面将是危险重重。\'+
      '无论发生什么，都要坚信自己的决定。\'+
      '你们是一组人去的，我希望可以看到你们一组人回来。\'+
      '充满理想的年轻人一起努力，还有什么可畏惧的呢？\'+
      '在宫殿一层，你们有20分钟时间去消灭完全部怪物，\'+
      '|{cmd}<一旦进入宫殿一层>，就会触发恶魔的机关，\'+
      '20分钟后，如果没有消灭完怪物，你们将自动返回宫殿。\'+
      '|{cmd}<组队进入宫殿一层/@god411_607>');   // 包括了god607
  end;

end;

procedure _goh007;
begin
  if This_Player.GetBagItemCount('千年蛛丝') > 0 then
  begin
    This_Npc.NpcDialog(This_Player,
      '看来你已经取回了我要的东西，那好吧。\' +
      '我现在就送你们去地下宫殿，但是地下宫殿非常凶险，\' +
      '我不能让你一个人去，你必须组队前往。\' +
      '有人见到天工神剪就在地下宫殿里。\' +
      '|{cmd}<神秘绒丝、魔龙颚骨、魔龙骨、魔龙牙的取得/@molongqude>\' +
      '|{cmd}<前往地下宫殿一层/@gofloor1> \' +
      '|{cmd}<去“盘丝洞”/@gohole>             ^<关于千年蛛丝的线索/@zhusi>\' +
      '|{cmd}<关闭对话/@exit>');
    This_Player.SetV(26, 4, 0);         //mov d8 0
  end
  else
    This_Npc.NpcDialog(This_Player,
      '天工神剪？他早就离开这里了。因为他的手艺出众，\' +
      '所以魔王对他很赏识，让他可以自由出入这里的地下城，\' +
      '只有我知道他在哪里，不过你必须帮我找回一个千年蛛丝。\' +
      '给我10万金币，我就送你去盘丝洞。\' +
      '|{cmd}<神秘绒丝、魔龙颚骨、魔龙骨、魔龙牙的取得/@molongqude>\' +
      '|{cmd}<去“盘丝洞”/@gohole>             ^<关于千年蛛丝的线索/@zhusi>\' +
      '|{cmd}<查看今天的运势/@touzi> \' +
      '|{cmd}<我再准备准备/@exit>');
end;

begin
  This_Npc.NpcDialog(This_Player,
    '你也不要再往下走了，下面已经成为一片废墟了\' +
    '魔王为了“天工神剪”的事，把魔兽都派去了地下宫殿\' +
    '同时也带去了所有的财宝\' +
    '地下宫殿的入口就在宫殿长廊的中间\' +
    '还是让我送你去宫殿长廊吧\' +
    '|{cmd}<去宫殿长廊/@goh007>\');
end.