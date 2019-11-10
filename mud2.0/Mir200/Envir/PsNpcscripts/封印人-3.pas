{
/*******************************************************************************
}

program mir2;

var 
  items : array[1..18] of string;

procedure TimeOutProc;
begin
  if LowerCase(This_Player.MapName) = 'd2002~04' then
    This_Player.FlyTo('3', 333, 333)
  else if LowerCase(This_Player.MapName) = 'd2002~05' then
    This_Player.FlyTo('3', 333, 333)
  else if LowerCase(This_Player.MapName) = 'd2002~06' then
    This_Player.FlyTo('3', 333, 333)
  else if LowerCase(This_Player.MapName) = 'd2002~07' then
    This_Player.FlyTo('3', 333, 333)
  else if LowerCase(This_Player.MapName) = 'd2002~08' then
    This_Player.FlyTo('3', 333, 333)
  else if LowerCase(This_Player.MapName) = 'd2002~09' then
    This_Player.FlyTo('3', 333, 333)
  else if LowerCase(This_Player.MapName) = 'd2002~10' then
    This_Player.FlyTo('3', 333, 333);
               
end;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  if This_Player.GetV(30, 8) = 5 then
  begin
    This_Npc.NpcDialog(This_Player,
      '祝贺你成功通过考验，我现在就给你解封物品。\' +
      '你就把需要解封的头盔交给我吧，一次只能解封一个。\' +
      '|{cmd}<我要解除首饰物品的封印/@goToJF>\' +
      '|{cmd}<解开头盔封印/@opentou>                      ^<交换魔族指令书/@mozu>\' +
      '|{cmd}<升级黄金头盔/@start>\' +
      '|{cmd}<鉴定黑铁头盔(封印)/@heijin>')
  end
  else
  begin
    {$IFDEF Q106_goldhelm}
    This_Npc.NpcDialog(This_Player,
      '每天我都会面朝雪山，向雪山背后家的方向祈福！\'
      +'我这里的魔族指令书，本来也只有千年蛛丝才能交换，\'
      +'这些天却不知为何，回家的愿望忽然变得强烈起来！\'
      +'这样吧，如果你身上有祈福凭证的话，\'
      +'我也可以帮你换成一本魔族指令书。\'
      +'那么，你想用哪件物品来进行交换呢？\ \'
      +'|{cmd}<使用千年蛛丝交换/@zhusi>              ^<使用祈福凭证交换/@qifu>');
    {$ELSE}  
    This_Npc.NpcDialog(This_Player,
      '经过多年的修炼，我已经掌握了多项手艺，\' +
      '除了解开头盔的封印和升级黄金头盔外，\' +
      '最近我又掌握了火云石的淬炼。\' +
      '请问你找我有什么事？\' +
      '|{cmd}<我要解除首饰物品的封印/@goToJF>\' +
      '|{cmd}<升级黄金头盔/@start>                  ^<交换魔族指令书/@mozu>\' +
      '|{cmd}<鉴定黑铁头盔(封印)/@heijin>\' +
      '|{cmd}<解开头盔封印/@jiefengtou>');
    {$ENDIF}    
  end;
end;

procedure _goToJF;
begin
  This_Npc.NpcDialog(This_Player,
    '年轻人，你要解除首饰的封印？\' +
    '如果你拥有一支精诚团结而且拥有强大力量的队伍，\' +
    '那解封路上的种种危险自然不能给你的队伍带来困难。\' +
    '如果你要凭借一己之力单独前往，我也非常佩服你的勇气，\' +
    '那就让我助你一臂之力，祝你马到成功！\ \' +
    '|{cmd}<了解更多解封信息/@moreJFInfo>\' +
    '|{cmd}<我和朋友一起去/@goWithTeam>                    ^<我要单独前往/@goAlone>'

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

procedure callOutFlyBack;
begin
  if This_Player.DynRoomName = This_Player.CallOutParam then
    This_Player.Flyto('3', 323, 333);
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


procedure _jiefengtou;
begin
  This_Npc.NpcDialog(This_Player,
    '你要解封头盔吗？不过首先要满足一个条件\' +
    '你必须完成我一个任务，然后我才给你解封\' +
    '我可以送你去一张，那里是魔神封印之地\' +
    '会有很多地蛙出现,地蛙之下就是万劫不复的魔神之地\' +
    '消灭完三批地蛙，你就可以到我这里解除头盔的封印\' +
    '时间总共6分钟，时间到后将会自动送回盟重\' +
    '有没有听说过极品黑铁头盔和黄金头盔啊，这些可是不传的秘密\' +
    '|{cmd}<前往考验/@god2002>\' +
    '|{cmd}<返回/@main>\');
end;

procedure checkroom;
begin
  if CheckOtherMapHum('D2002~04') = 0 then
  begin
    This_Player.SetV(30, 8, 1);     // mov d8 1
    This_Npc.ClearMon('D2002~04');
    This_Player.CallOut(This_Npc, 600, 'TimeOutProc');
    This_Player.FlyTo('D2002~04', 0, 0);
  end
  else if CheckOtherMapHum('D2002~05') = 0 then
  begin
    This_Player.SetV(30, 8, 1);     // mov d8 1
    This_Npc.ClearMon('D2002~05');
    This_Player.CallOut(This_Npc, 600, 'TimeOutProc');
    This_Player.FlyTo('D2002~05', 0, 0);
  end
  else if CheckOtherMapHum('D2002~06') = 0 then
  begin
    This_Player.SetV(30, 8, 1);     // mov d8 1
    This_Npc.ClearMon('D2002~06');
    This_Player.CallOut(This_Npc, 600, 'TimeOutProc');
    This_Player.FlyTo('D2002~06', 0, 0);
  end
  else if CheckOtherMapHum('D2002~07') = 0 then
  begin
    This_Player.SetV(30, 8, 1);     // mov d8 1
    This_Npc.ClearMon('D2002~07');
    This_Player.CallOut(This_Npc, 600, 'TimeOutProc');
    This_Player.FlyTo('D2002~07', 0, 0);
  end
  else if CheckOtherMapHum('D2002~08') = 0 then
  begin
    This_Player.SetV(30, 8, 1);     // mov d8 1
    This_Npc.ClearMon('D2002~08');
    This_Player.CallOut(This_Npc, 600, 'TimeOutProc');
    This_Player.FlyTo('D2002~08', 0, 0);
  end
  else if CheckOtherMapHum('D2002~09') = 0 then
  begin
    This_Player.SetV(30, 8, 1);     // mov d8 1
    This_Npc.ClearMon('D2002~09');
    This_Player.CallOut(This_Npc, 600, 'TimeOutProc');
    This_Player.FlyTo('D2002~09', 0, 0);
  end
  else if CheckOtherMapHum('D2002~10') = 0 then
  begin
    This_Player.SetV(30, 8, 1);     // mov d8 1
    This_Npc.ClearMon('D2002~10');
    This_Player.CallOut(This_Npc, 600, 'TimeOutProc');
    This_Player.FlyTo('D2002~10', 0, 0);
  end
  else
    This_Npc.NpcDialog(This_Player,
      '目前所有的考验场已经满员,请稍候再来吧');
end;

procedure _god2002;
begin
  if (This_Player.GetBagItemCount('圣战头盔(封印)') > 0) or (This_Player.GetBagItemCount('天尊头盔(封印)') > 0) or
    (This_Player.GetBagItemCount('法神头盔(封印)') > 0) or (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    checkroom;
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你没有相应的头盔需要解封,还是到其他地方看看吧');
end;

procedure _opentou;
begin
  if This_Player.GetV(30, 8) = 5 then    // equal D8 5
  begin
    This_Npc.NpcDialog(This_Player,
      '你想解开哪个头盔的封印呢？\' +
      '把它交给我，让我看看吧。\ \' +
      '|{cmd}<解封圣战头盔(封印)/@warrtou>             ^<解封法神头盔(封印)/@fashitou>\' +
      '|{cmd}<解封天尊头盔(封印)/@taostou>             ^<解封黑铁头盔(封印)/@heitou>\' +
      '|{cmd}<返回/@main>');
  end;
end;

procedure _warrtou;
begin
  if This_Player.GetV(30, 8) = 5 then    // equal D8 5
  begin
    This_Player.SetV(30, 8, 0);
    if This_Player.GetBagItemCount('圣战头盔(封印)') > 0 then
    begin
      if Random(10) = 7 then
      begin
        This_Player.Take('圣战头盔(封印)', 1);
        This_Player.Give('天之圣战头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '看来你的运气相当不错,天之圣战头盔已经解封成功');
      end
      else
      begin
        This_Player.Take('圣战头盔(封印)', 1);
        This_Player.Give('圣战头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '圣战头盔已经解封成功');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有相应的物品需要解封');
  end;
end;

procedure _fashitou;
begin
  if This_Player.GetV(30, 8) = 5 then    // equal D8 5
  begin
    This_Player.SetV(30, 8, 0);
    if This_Player.GetBagItemCount('法神头盔(封印)') > 0 then
    begin
      if Random(10) = 7 then
      begin
        This_Player.Take('法神头盔(封印)', 1);
        This_Player.Give('天之法神头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '看来你的运气相当不错,天之法神头盔已经解封成功');
      end
      else
      begin
        This_Player.Take('法神头盔(封印)', 1);
        This_Player.Give('法神头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '法神头盔已经解封成功');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有相应的物品需要解封');
  end;
end;

procedure _taostou;
begin
  if This_Player.GetV(30, 8) = 5 then    // equal D8 5
  begin
    This_Player.SetV(30, 8, 0);
    if This_Player.GetBagItemCount('天尊头盔(封印)') > 0 then
    begin
      if Random(10) = 7 then
      begin
        This_Player.Take('天尊头盔(封印)', 1);
        This_Player.Give('天之天尊头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '看来你的运气相当不错,天之天尊头盔已经解封成功');
      end
      else
      begin
        This_Player.Take('天尊头盔(封印)', 1);
        This_Player.Give('天尊头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '天尊头盔已经解封成功');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有相应的物品需要解封');
  end;
end;

procedure _heitou;
begin
  if This_Player.GetV(30, 8) = 5 then    // equal D8 5
  begin
    This_Player.SetV(30, 8, 0);
    if This_Player.GetBagItemCount('黑铁头盔(封印)') > 0 then
    begin
      if Random(10) = 7 then
      begin
        This_Player.Take('黑铁头盔(封印)', 1);
        This_Player.Give('天之黑铁头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '看来你的运气相当不错,天之黑铁头盔已经解封成功');
      end
      else
      begin
        This_Player.Take('黑铁头盔(封印)', 1);
        This_Player.Give('黑铁头盔', 1);
        This_Npc.NpcDialog(This_Player,
          '黑铁头盔已经解封成功');
      end;
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有相应的物品需要解封');
  end;
end;

procedure _mozu;
begin
  This_Npc.NpcDialog(This_Player,
    '每天我都会面朝雪山，向雪山背后家的方向祈福！\' +
    '我这里的魔族指令书，本来也只有千年蛛丝才能交换，\' +
    '这些天却不知为何，回家的愿望忽然变得强烈起来！\' +
    '这样吧，如果你身上有祈福凭证的话，\' +
    '我也可以帮你换成一本魔族指令书。\' +
    '那么，你想用哪件物品来进行交换呢？\' +
    '|{cmd}<使用千年蛛丝交换/@zhusi>\' +
    '|{cmd}<使用祈福凭证交换/@qifu>\' +
    '|{cmd}<返回/@main>');
end;

procedure _zhusi;
begin
  if (This_Player.GetBagItemCount('千年蛛丝') > 0) then
  begin
    This_Player.Take('千年蛛丝', 1);
    This_Player.Give('魔族指令书', 1);
    This_Npc.NpcDialog(This_Player,
      '恭喜，给你一本魔族指令书。\ \' +
      '|{cmd}<返回/@mozu>                   ^<关闭/@doexit>');
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你好像没有千年蛛丝啊！');
end;

procedure _qifu;
begin
  if (This_Player.GetBagItemCount('祈福凭证') > 0) then
  begin
    This_Player.Take('祈福凭证', 1);
    This_Player.Give('魔族指令书', 1);
    This_Npc.NpcDialog(This_Player,
      '恭喜，给你一本魔族指令书。\ \' +
      '|{cmd}<返回/@mozu>                   ^<关闭/@doexit>')
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你好像没有祈福凭证啊！');
end;

procedure _start;
begin
  This_Npc.NpcDialog(This_Player,
    '只有<黑铁头盔(极品)>才能升级成黄金头盔。\' +
    '黑铁头盔(极品)升级成黄金头盔还需要你提供一些材料：\' +
    '天工之锤、真视秘籍、地苦胆、四叶参和有黄金成分的首饰。\' +
    '关于何处可以得到这些材料，我也有一些经验，可以让你参考，\' +
    '一旦开始升级，你包裹里的所有首饰和材料我都会收取作为原料。\' +
    '|{cmd}<我确认使用原有材料升级黄金头盔/@UpHelm>           ^<关于材料的出处/@about2>\' +
    '|{cmd}<使用绿宝石矿、紫水晶矿/@other1>升级黄金头盔\' +
    '|{cmd}<使用勋章之心、祈福项链/@other2>升级黄金头盔\' +
    '|{cmd}<返回/@main>');
end;

procedure _UpHelm;
begin
  This_Npc.UpHelmet(This_Player);
end;

procedure _other1;
begin
  This_Npc.NpcDialog(This_Player,
    '如果你有绿宝石矿、紫水晶矿，\' +
    '也可以单独用来升级黄金头盔，\' +
    '如果使用这些材料升级，一旦失败，所有的材料都将被回收。\' +
    '你确认要开始升级黄金头盔吗？\' +
    '|{cmd}<开始/@shengji1>升级黄金头盔\ \' +
    '|{cmd}<返回/@start>');
end;

procedure _other2;
begin
  This_Npc.NpcDialog(This_Player,
    '如果你有勋章之心、祈福项链，\' +
    '也可以单独用来升级黄金头盔，\' +
    '如果使用这些材料升级，一旦失败，所有的材料都将被回收。\' +
    '你确认要开始升级黄金头盔吗？\' +
    '|{cmd}<开始/@shengji2>升级黄金头盔\ \' +
    '|{cmd}<返回/@start>');
end;

procedure _shengji1;
begin
  if (This_Player.GetBagItemCount('紫水晶矿') > 0)
    and (This_Player.GetBagItemCount('绿宝石矿') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(极品)') > 0) then
  begin
    This_Player.Take('紫水晶矿', 1);
    This_Player.Take('绿宝石矿', 1);
    This_Player.Take('黑铁头盔(极品)', 1);
    if Random(1000) = 888 then
    begin
      This_Player.Give('黄金头盔', 1);
      This_Npc.NpcDialog(This_Player,
        '你的运气真是好，黄金头盔合成成功了！');
    end
    else
      This_Npc.NpcDialog(This_Player,
        '太可惜了，合成失败了！');
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你好像没有必要的物品啊，我不能帮你合成。');
end;

procedure _shengji2;
begin
  if (This_Player.GetBagItemCount('勋章之心') > 0)
    and (This_Player.GetBagItemCount('祈福项链') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(极品)') > 0) then
  begin
    This_Player.Take('勋章之心', 1);
    This_Player.Take('祈福项链', 1);
    This_Player.Take('黑铁头盔(极品)', 1);
    if Random(1000) = 888 then
    begin
      This_Player.Give('黄金头盔', 1);
      This_Npc.NpcDialog(This_Player,
        '你的运气真是好，黄金头盔合成成功了！');
    end
    else
      This_Npc.NpcDialog(This_Player,
        '太可惜了，合成失败了！');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '你好像没有必要的物品啊，我不能帮你合成。');
  end;
end;

procedure _about2;
begin
  This_Npc.NpcDialog(This_Player,
    '|{cmd}<天工之锤>在焰火屠魔里可以得到，为了防止失手，必须给我2个以上。\' +
    '|{cmd}<真视秘籍>在传奇商铺中可以得到，它可以让我更好的掌握火候。\' +
    '|{cmd}<地苦胆、四叶参>分别在沃玛教主和祖玛教主身上可以得到。\' +
    '还需要给我一些<含有黄金成分的沃玛和祖玛首饰>，\' +
    '通常在<焰火屠魔>和<暗之教主>身上，可以得到这些首饰。\' +
    '这些首饰的数量决定升级的成功率，具体数量我也不是很有把握。\' +
    '所以升级之时，我会拿掉你<包裹中所有的首饰作为材料>。\' +
    '如果你包裹里有我看得上眼的头盔的话，我就拿去作为报酬了哦。\' +
    '|{cmd}<返回/@start>');
end;

procedure _heijin;
begin
  This_Npc.NpcDialog(This_Player,
    '我可以很负责的说，只有<黑铁头盔(极品)>才能升级成黄金头盔。\' +
    '|{cmd}<黑铁头盔(封印)>中，有不少<黑铁头盔(极品)>，可惜无人知晓。\' +
    '给我<黑铁头盔(封印)>和<组队任务卷轴>，我就可以帮你鉴定。\' +
    '如果给我<紫水晶矿>、<绿宝石矿>，或者<勋章之心>、<祈福项链>，\' +
    '我也可以同时帮你鉴定，但是一旦失败，原料就将被收回。\' +
    '|{cmd}<使用组队卷轴来鉴定/@teamjian>\' +
    '|{cmd}<使用紫水晶矿和绿宝石矿来鉴定/@kuangjian>\' +
    '|{cmd}<使用勋章之心和祈福项链来鉴定/@thingjian>\' +
    '|{cmd}<返回/@main>');
end;

procedure _heitou1;
begin
  if Random(10) < 3 then
  begin
    This_Player.Give('黑铁头盔(极品)', 1);
    This_Npc.NpcDialog(This_Player,
      '看来你的运气不错，竟然是个黑铁头盔(极品)啊！\' +
      '黑铁头盔(极品)升级成黄金头盔还需要你提供一些材料：\' +
      '天工之锤、真视秘籍、地苦胆、四叶参和有黄金成分的首饰。\' +
      '关于何处可以得到这些材料，我也有一些经验，可以让你参考。\' +
      '|{cmd}<关于材料的出处/@about2>\' +
      '|{cmd}<返回/@heijin>\');
  end
  else
  begin
    This_Player.Give('黑铁头盔', 1);
    This_Npc.NpcDialog(This_Player,
      '可惜，解封普普通通，只是个黑铁头盔！\  \' +
      '|{cmd}<返回/@heijin>');
  end;
end;

procedure _kuang;
begin
  if (This_Player.GetBagItemCount('矿洞组队卷轴') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    This_Player.Take('矿洞组队卷轴', 1);
    This_Player.Take('黑铁头盔(封印)', 1);
    _heitou1;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '你好像没有黑铁头盔(封印)或组队卷轴呀。\' +
      '是不是看错了？\' +
      '|{cmd}<返回/@heijin>');
  end;
end;

procedure _sheng;
begin
  if (This_Player.GetBagItemCount('神殿组队卷轴') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    This_Player.Take('神殿组队卷轴', 1);
    This_Player.Take('黑铁头盔(封印)', 1);
    _heitou1;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '你好像没有黑铁头盔(封印)或组队卷轴呀。\' +
      '是不是看错了？\' +
      '|{cmd}<返回/@heijin>');
  end;
end;

procedure _xieku;
begin
  if (This_Player.GetBagItemCount('邪窟组队卷轴') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    This_Player.Take('邪窟组队卷轴', 1);
    This_Player.Take('黑铁头盔(封印)', 1);
    _heitou1;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '你好像没有黑铁头盔(封印)或组队卷轴呀。\' +
      '是不是看错了？\' +
      '|{cmd}<返回/@heijin>');
  end;
end;

procedure _dixue;
begin
  if (This_Player.GetBagItemCount('地穴组队卷轴') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    This_Player.Take('地穴组队卷轴', 1);
    This_Player.Take('黑铁头盔(封印)', 1);
    _heitou1;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '你好像没有黑铁头盔(封印)或组队卷轴呀。\' +
      '是不是看错了？\' +
      '|{cmd}<返回/@heijin>');
  end;
end;

procedure _shimu;
begin
  if (This_Player.GetBagItemCount('石墓组队卷轴') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    This_Player.Take('石墓组队卷轴', 1);
    This_Player.Take('黑铁头盔(封印)', 1);
    _heitou1;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '你好像没有黑铁头盔(封印)或组队卷轴呀。\' +
      '是不是看错了？\' +
      '|{cmd}<返回/@heijin>');
  end;
end;

procedure _kuangjian;
begin
  if (This_Player.GetBagItemCount('紫水晶矿') > 0)
    and (This_Player.GetBagItemCount('绿宝石矿') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    This_Player.Take('紫水晶矿', 1);
    This_Player.Take('绿宝石矿', 1);
    This_Player.Take('黑铁头盔(封印)', 1);
    if Random(2) = 1 then
    begin
      This_Player.Give('黑铁头盔(极品)', 1);
      This_Npc.NpcDialog(This_Player,
        '看来你的运气不错，竟然是个黑铁头盔(极品)啊！\' +
        '黑铁头盔(极品)升级成黄金头盔还需要你提供一些材料：\' +
        '天工之锤、真视秘籍、地苦胆、四叶参和有黄金成分的首饰。\' +
        '关于何处可以得到这些材料，我也有一些经验，可以让你参考。\' +
        '|{cmd}<关于材料的出处/@about2>\' +
        '|{cmd}<返回/@heijin>\');
    end
    else
      This_Npc.NpcDialog(This_Player,
        '很可惜，失败了，这个不是黑铁头盔(极品)！\  \' +
        '|{cmd}<返回/@heijin>');
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你好像没有足够的物品啊，我不能帮你鉴定。');
end;

procedure _thingjian;
begin
  if (This_Player.GetBagItemCount('勋章之心') > 0)
    and (This_Player.GetBagItemCount('祈福项链') > 0)
    and (This_Player.GetBagItemCount('黑铁头盔(封印)') > 0) then
  begin
    This_Player.Take('勋章之心', 1);
    This_Player.Take('祈福项链', 1);
    This_Player.Take('黑铁头盔(封印)', 1);
    if Random(2) = 1 then
    begin
      This_Player.Give('黑铁头盔(极品)', 1);
      This_Npc.NpcDialog(This_Player,
        '看来你的运气不错，竟然是个黑铁头盔(极品)啊！\' +
        '黑铁头盔(极品)升级成黄金头盔还需要你提供一些材料：\' +
        '天工之锤、真视秘籍、地苦胆、四叶参和有黄金成分的首饰。\' +
        '关于何处可以得到这些材料，我也有一些经验，可以让你参考。\' +
        '|{cmd}<关于材料的出处/@about2>\' +
        '|{cmd}<返回/@heijin>\');
    end
    else
      This_Npc.NpcDialog(This_Player,
        '很可惜，失败了，这个不是黑铁头盔(极品)！\  \' +
        '|{cmd}<返回/@heijin>');
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你好像没有足够的物品啊，我不能帮你鉴定。');
end;

procedure _teamjian;
begin
  This_Npc.NpcDialog(This_Player,
    '你想要使用哪个组队卷轴来鉴定呢？\ \' +
    '|{cmd}<矿洞组队卷轴/@kuang>           ^<神殿组队卷轴/@sheng>           ^<邪窟组队卷轴/@xieku>\' +
    '|{cmd}<地穴组队卷轴/@dixue>           ^<石墓组队卷轴/@shimu>\' +
    '|{cmd}<返回/@heijin>');
end;

//脚本执行的入口
begin
  domain;
end.