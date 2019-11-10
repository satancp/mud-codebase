//--------------------------------------------------
//脚本Npc：封印师
//所在地图：动态房间 FengYin2，使用的地图 T140 
//内容：解封任务中地下的第二层NPC
//      主要负责在玩家接受挑战后解除物品封印 
//备注：使用了0号任务第15、16、17列作为临时变量 
//      15 标记玩家为点击NPC进入该层的队长
//      16 标记解封的次数
//      17 标记能解封的次数，3或5，其他值表示还没接受考验 
//-------------------------------------------------- 


program mir2;

const
  roomName = 'FengYin2'; 
var
  items : array[1..18] of string; //保存所要解封物品的数组 
  itemsStr1 : string;      //雷泽、唤魔、启源解封对话框链接的字符串
  itemsStr2 : string;      //圣战、法神、天尊解封对话框链接的字符串 
  
function IfBeginChall : Boolean;
var
  nc : Integer;
begin
  nc := This_Player.GetV(0, 17);
  if (nc = 5) or (nc = 3) then
    Result := True
  else
    Result := False;
end;
  
procedure _BackMeng;
var
  canJFCount : Integer;
begin
  canJFCount := This_Player.GetV(0, 17);
  if (canJFCount <> 3) and (canJFCount <> 5) then
  begin
    This_Npc.NpcDialog(This_Player,
      '你还没有接受这一关的考验，不能返回盟重'
    );
    Exit;
  end;  

  if This_Npc.CheckCurrMapMon <> 0 then
  begin
    This_Npc.NpcDialog(This_Player,
      '你还没有完成这一关的考验，不能返回盟重'
    );
    Exit;
  end;

  if This_Player.DynRoomName = roomName then
  begin
    This_Player.Flyto('3', 327, 330);
  end;
end;

procedure _beginChallenge;
begin
  This_Npc.NpcDialog(This_Player,
    '如果你支付给我100万，我可以尽力让你轻松闯过考验\' +
    '如果你不给我的话，您也可以接受考验\' +
    '不过下一关你会遇到什么我可不能保证哦！\ \' +
    '|{cmd}<支付100万进行挑战/@chalByPay>\' +
    '|{cmd}<直接进行考验/@chalFree>'
  ); 
end;

procedure ChallengeAlone(beFree : Boolean);
begin  
  if beFree then
  begin
    //标记已经开始了挑战 
    This_Player.SetV(0, 17, 3);
    This_Player.SetV(0, 16, 0);
    //刷怪
    This_Npc.CreateMon('', 14, 16, 10, '虹魔猪卫', 2);
    This_Npc.CreateMon('', 14, 16, 10, '白野猪', 2);
    This_Npc.CreateMon('', 14, 16, 10, '红野猪', 4);
    This_Npc.CreateMon('', 14, 16, 10, '黑野猪', 4);
    This_Npc.CreateMon('', 14, 16, 10, '黑色恶蛆', 2);
    This_Npc.CreateMon('', 14, 16, 10, '蝎蛇', 4); 
    This_Npc.CreateMon('', 14, 16, 10, '楔蛾', 2);
  end
  else
  begin
    if This_Player.GoldNum >= 1000000 then
    begin
      This_Player.DecGold(1000000);
      //标记已经开始了挑战 
      This_Player.SetV(0, 17, 3);
      This_Player.SetV(0, 16, 0);
      //刷怪
      This_Npc.CreateMon('', 14, 16, 10, '虹魔猪卫', 1);
      This_Npc.CreateMon('', 14, 16, 10, '白野猪', 1);
      This_Npc.CreateMon('', 14, 16, 10, '红野猪', 3);
      This_Npc.CreateMon('', 14, 16, 10, '黑野猪', 3);
      This_Npc.CreateMon('', 14, 16, 10, '黑色恶蛆', 2);
      This_Npc.CreateMon('', 14, 16, 10, '蝎蛇', 2); 
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
        '你没有足够的金钱，我看你还是直接闯关吧'
      );
      Exit;
    end;
  end;  
  This_Npc.CloseDialog(This_Player);
end;

procedure ChallengeWithTeam(beFree : Boolean);
begin
  if not ((This_Player.GetV(0, 15) = 45) and This_Player.IsGroupOwner) then
  begin
    This_Npc.NpcDialog(This_Player,
      '你不是之前所在队伍的队长，不能开始挑战'
    );
    Exit; 
  end;
  
  if beFree then
  begin
    //标记已经开始了挑战 
    This_Player.GroupSetV(0, 17, 5);
    This_Player.GroupSetV(0, 16, 0);
    //刷怪
    This_Npc.CreateMon('', 14, 16, 10, '虹魔猪卫', 4);
    This_Npc.CreateMon('', 14, 16, 10, '白野猪', 4);
    This_Npc.CreateMon('', 14, 16, 10, '红野猪', 8);
    This_Npc.CreateMon('', 14, 16, 10, '黑野猪', 8);
    This_Npc.CreateMon('', 14, 16, 10, '黑色恶蛆', 8);
    This_Npc.CreateMon('', 14, 16, 10, '角蝇', 4);
    This_Npc.CreateMon('', 14, 16, 10, '蝎蛇', 8);
    This_Npc.CreateMon('', 14, 16, 10, '楔蛾', 8); 
    This_Npc.CreateMon('', 14, 16, 10, '电僵王', 3);    
  end
  else
  begin
    if This_Player.GoldNum >= 1000000 then
    begin
      This_Player.DecGold(1000000);
      //标记已经开始了挑战 
      This_Player.GroupSetV(0, 17, 5);
      This_Player.GroupSetV(0, 16, 0);
      //刷怪
      This_Npc.CreateMon('', 14, 16, 10, '虹魔猪卫', 2);
      This_Npc.CreateMon('', 14, 16, 10, '白野猪', 2);
      This_Npc.CreateMon('', 14, 16, 10, '红野猪', 5);
      This_Npc.CreateMon('', 14, 16, 10, '黑野猪', 5);
      This_Npc.CreateMon('', 14, 16, 10, '黑色恶蛆', 5);
      This_Npc.CreateMon('', 14, 16, 10, '角蝇', 2);
      This_Npc.CreateMon('', 14, 16, 10, '蝎蛇', 5);
      This_Npc.CreateMon('', 14, 16, 10, '楔蛾', 5); 
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
        '你没有足够的金钱，我看你还是直接闯关吧'
      );
      Exit;
    end;
  end;
  This_Npc.CloseDialog(This_Player);
end;

procedure _chalByPay;
begin
  if This_Player.DynRoomName <> roomName then
    Exit;
    
  if IfBeginChall then
  begin
    This_Npc.NpcDialog(This_Player,
      '您好像已经在接受考验了啊'
    );
    Exit;
  end;
  
  if This_Npc.CheckCurrMapHum > 1 then
    ChallengeWithTeam(False)
  else
    ChallengeAlone(False);
end;

procedure _chalFree;
begin
  if This_Player.DynRoomName <> roomName then
    Exit;
    
  if IfBeginChall then
  begin
    This_Npc.NpcDialog(This_Player,
      '您好像已经在接受考验了啊'
    );
    Exit;
  end;
  
  if This_Npc.CheckCurrMapHum > 1 then
    ChallengeWithTeam(True)
  else
    ChallengeAlone(True);
end;                                

procedure showDisOverDlg;
var
  count : Integer;
  countStr : string;
begin
  count := This_Player.GetV(0, 17);
  if count = 3 then
    countStr := '三'
  else if count = 5 then
    countStr := '五'
  else
    countStr := IntToStr(count);  //正常情况不会达到，用作测试 
     
  This_Npc.NpcDialog(This_Player,
    '你已经成功解除了' + countStr + '次封印了，\' + 
    '我现在的力量已经不能再帮你解封了，\' +
    '先送你返回盟重，你过一会再来找我吧。\ \' +
    '|{cmd}<现在就送我回盟重/@BackMeng>'
  );
end;

procedure showDisSealDlg(str : string);
begin
  This_Npc.NpcDialog(This_Player,
    str +
    itemsStr1 + //该字符串中是交换 雷泽、唤魔、启源的链接 
    '|{cmd}<解封圣战,法神,天尊的封印/@disSeal2>\ \' +
    '|{cmd}<现在就送我回盟重/@BackMeng>'
  );
end;

procedure _disSeal1;
begin
  if This_Player.DynRoomName <> roomName then
    Exit;
    
  if This_Npc.CheckCurrMapMon <> 0 then
  begin
    This_Npc.NpcDialog(This_Player, 
      '你还没有消灭完怪物，不能解除封印'
    );
    Exit;
  end;
  
  if not ifBeginChall then
  begin
    This_Npc.NpcDialog(This_Player,
      '您还没有通过我的考验，不能解封物品'
    );
    Exit;
  end;
  
  if This_Player.GetV(0, 16) >= This_Player.GetV(0, 17) then
    showDisOverDlg
  else
  begin
    if This_Player.GetV(0, 16) > 0 then
      showDisSealDlg(
        '祝贺你，封印已经成功解除，快打开包裹看看吧，\' +
        '你还想解封哪个物品的封印呢？\ \'
      )
    else
      showDisSealDlg(
        '祝贺您成功经过考验，让我看看您想解除封印的物品吧\ \'
      );
  end;
end;
  
procedure _disSeal2;
begin
  This_Npc.NpcDialog(This_Player,
    '我也可以帮你解封封印的圣战、法神、天尊系列的物品\' +
    '至于解封后,他会成为什么,我也无法预知,一切都和你本身有关\' +
    '现在就让我看看你想解封什么吧 \' +
    '解封成功将有可能获得属性更高的天之系列物品\' +
    '即使解封失败，封印的物品也会完好无损，不会消失\' +
    itemsStr2
  );
end;

function CanDisSeal(id : Integer) : Boolean;
begin
  Result := False;
  if This_Player.DynRoomName <> roomName then
    Exit;
    
  if This_Npc.CheckCurrMapMon <> 0 then
  begin
    This_Npc.NpcDialog(This_Player, 
      '你还没有消灭完怪物，不能解除封印'
    );
    Exit;
  end;
  
  if not ifBeginChall then
  begin
    This_Npc.NpcDialog(This_Player,
      '您还没有通过我的考验，不能解封物品'
    );
    Exit;
  end; 
  
  if This_Player.GetBagItemCount(items[id]+'(封印)') > 0 then
    Result := True
  else
    This_Npc.NpcDialog(This_Player,
      '好像你的包裹里没有' + items[id] + '(封印)'
    );
end;

function GetAbilStr(itemType, abilId : Integer) : string;  
begin
  Result := '';
  //雷泽系列 
  if itemType = 1 then
  begin
    case abilId of
      1: Result := '(坚硬)';
      2: Result := '(精纯)';
      3: Result := '(霸气)';
      4: Result := '(神力)';
      5: Result := '(神威)';      
    end; 
  end;
  
  //唤魔系列
  if itemType = 2 then
  begin
    case abilId of 
      1: Result := '(灰暗)';
      2: Result := '(流光)';
      3: Result := '(敏锐)';
      4: Result := '(天作)';
      5: Result := '(神雀)'; 
    end;
  end; 
  
  //启源系列
  if itemType = 3 then
  begin
    case abilId of 
      1: Result := '(暗淡)';
      2: Result := '(精良)';
      3: Result := '(凌厉)';
      4: Result := '(闪耀)';
      5: Result := '(天赐)'; 
    end;
  end;   
end;

//雷泽、唤魔、启源系列 
procedure DoDisSealItem1(id : Integer);
var
  abilId, randomVar  : Integer;
  abilStr : string;
begin
  This_Player.Take(items[id] + '(封印)', 1);
  randomVar := random(1000);
  
  if randomVar < 200 then       //概率 1/5 
    abilId := 1
  else if randomVar < 300 then  //概率 1/10 
    abilId := 2
  else if randomVar < 385 then  //概率 7/80 
    abilId := 3
  else if randomVar < 405 then  //概率 1/50 
    abilId := 4
  else if randomVar < 417 then  //概率 3/250 
    abilId := 5
  else                          //概率 583/1000
  begin 
    showDisSealDlg(
      '|{cmd}<这个封印力量好强，哎……你的' + items[id] + '破碎了！>\' +
      '你还想解除哪个物品的封印呢？\\'
    );    
  end;      
  
  case id of
  1, 4, 7:
    abilStr := getAbilStr(1, abilId);
  2, 5, 8:
    abilStr := getAbilStr(2, abilId);
  3, 6, 9:
    abilStr := getAbilStr(3, abilId);
  else
    abilStr := '';
  end;
  
  if abilStr = '' then
    Exit;
  This_Player.SetV( 0, 16, This_Player.GetV(0, 16)+1 );
  This_Player.Give(items[id]+abilStr, 1);  
  This_Player.PlayerNotice('祝贺你，封印已经成功解除', 0);
  
  if This_Player.GetV(0, 16) >= This_Player.GetV(0, 17) then
  begin
    showDisOverDlg;
  end
  else
    showDisSealDlg(
      '祝贺你，封印已经成功解除，快打开包裹看看吧，\' +
      '你还想解封哪个物品的封印呢？\ \'
    );
end;

//圣战、法神、天尊系列 
procedure DoDisSealItem2(id : Integer);
begin
  This_Player.Take(items[id] + '(封印)', 1);
  This_Player.SetV( 0, 16, This_Player.GetV(0, 16)+1 );
  if random(10) = 1 then
  begin
    This_Player.Give('天之' + items[id], 1);
    This_Player.PlayerNotice('祝贺你，封印已经成功解除，你获得了天之系列的物品', 0); 
  end else
  begin
    This_Player.Give(items[id], 1);
    This_Player.PlayerNotice('祝贺你，封印已经成功解除', 0);
  end;
  
  if This_Player.GetV(0, 16) >= This_Player.GetV(0, 17) then
  begin
    showDisOverDlg;
  end
  else
    showDisSealDlg(
      '祝贺你，封印已经成功解除，快打开包裹看看吧，\' +
      '你还想解封哪个物品的封印呢？\ \'
    );  
end;

procedure _disSealItem(idStr : string);
var
  id : Integer;
begin
  id := StrToIntDef(idStr, -1);
  if id = -1 then
    Exit;
    
  if CanDisSeal(id) then
  begin
    if (id <= 9) and (id >= 1) then
      DoDisSealItem1(id)
    else if (id <= 18) and (id >= 10) then
      DoDisSealItem2(id);
  end;  
end;
  
//初始化要解封物品的字符串，方便后面代码的处理      
procedure OnInitialize;
var
  i : Integer;
  abilStr : string;
begin
  abilStr := '(封印)'
  items[1] := '雷泽项链';
  items[2] := '唤魔项链';
  items[3] := '启源项链';
  
  items[4] := '雷泽手镯';
  items[5] := '唤魔手镯';
  items[6] := '启源手镯';
  
  items[7] := '雷泽戒指';
  items[8] := '唤魔戒指';
  items[9] := '启源戒指';
  
  items[10] := '圣战项链';
  items[11] := '法神项链';
  items[12] := '天尊项链';
  
  items[13] := '圣战手镯';
  items[14] := '法神手镯';
  items[15] := '天尊手镯';
  
  items[16] := '圣战戒指';
  items[17] := '法神戒指';
  items[18] := '天尊戒指'; 
  
  itemsStr1 := '';
  for i:=1 to 9 do
  begin
    itemsStr1 := itemsStr1 + '|{cmd}<' + items[i] + abilStr + 
                           '/@disSealItem~' + IntToStr(i) + '>';
    if (i > 2) and (i mod 3 = 0) then 
      itemsStr1 := itemsStr1 + '\'
    else
      itemsStr1 := itemsStr1 + '      ';
  end; 
  
  itemsStr2 := '';
  for i:=10 to 18 do
  begin
    itemsStr2 := itemsStr2 + '|{cmd}<' + items[i] + abilStr +
                           '/@disSealItem~' + IntToStr(i) + '>';
    if (i > 2) and (i mod 3 = 0) then 
      itemsStr2 := itemsStr2 + '\'
    else
      itemsStr2 := itemsStr2 + '      ';
  end;   
end;        
       
begin
  if IfBeginChall and (This_Npc.CheckCurrMapMon <= 0) then
  begin
    if This_Player.GetV(0, 16) >= This_Player.GetV(0, 17) then
    begin
      showDisOverDlg;
      Exit;
    end
    else if This_Player.GetV(0, 16) >= 0 then
    begin
      showDisSealDlg('你还想解除哪个物品的封印呢？\ \');
    end;
  end
  else
    This_Npc.NpcDialog(This_Player,
      '首先你们必须接受我的考验，考验时间为20分钟。\' +
      '20分钟内消灭所有怪物，就可以通过我的考验，\' +
      '我就可以帮你们解除物品的封印，\' +
      '不过有些封印力量过强的首饰在解封过程中可能会破碎。\' +
      '解封需要耗费我大量魔法力，你一个人来我只能成功解封三次，\' +
      '如果你们组队前来，借助你们的力量，我可以成功解封五次，\' +
      '到时候我就需要休息一下回复我的力量，我会把你送回盟重。\' +
      '|{cmd}<接受考验/@BeginChallenge>                     ^<我要解除封印/@disSeal1>\' +
      '|{cmd}<现在就送我回盟重/@BackMeng>'
    );
end.