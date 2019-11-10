{
/*******************************************************************************
}

program Mir2;

{$I common.pas}
const
  nextRoomIdxStr = '23';

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '你好,' + This_Player.Name + '这里是藏宝阁22号，我需要5个<乾坤令/c=red>。\'
  +'在完成我的要求之后，你可以掷骰子前进。\5个乾坤令可以捆绑成一个乾坤令包\'
  +'|{cmd}<捆绑乾坤令/@newskill21>\ \'
  +'|{cmd}<给予乾坤令开始投骰子/@touzi>\ \'
  +'|{cmd}<离开藏宝阁/@leave>'
  );
end;

procedure _newskill21;
begin
  if This_Player.GetBagItemCount('乾坤令') >= 5 then
  begin
    This_Player.Take('乾坤令',5);
    This_Player.Give('乾坤令包',1);
    This_Npc.NpcDialog(This_Player,
    '你好,' + This_Player.Name + '这里是藏宝阁22号，我需要5个<乾坤令/c=red>。\'
    +'在完成我的要求之后，你可以掷骰子前进。\5个乾坤令可以捆绑成一个乾坤令包\'
    +'|{cmd}<捆绑乾坤令/@newskill21>\ \'
    +'|{cmd}<给予乾坤令开始投骰子/@touzi>\ \'
    +'|{cmd}<离开藏宝阁/@leave>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '5个乾坤令可以捆绑成一个乾坤令包。\如果你已经带来了，就交给我吧！');
  end;
end;

//投骰子结束后的处理过程，用来决定和记录投出的骰子数
//注意：扔骰子后回调的函数需要加下划线 
procedure _AfterPlayDice();
var 
  dianshu:integer; //投骰子的结果变量 
begin
  //玩家0号任务的1号变量表示刚刚扔的1个骰子的点数 
  dianshu := This_Player.GetS(12, 3);
  if dianshu > 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你投出的骰子的点数为：'+IntToStr(dianshu) +'\你可以前进'+IntToStr(dianshu) +'个房间\'
    +'另外，你也可以选择同时再获得一个神秘天赐再移动\'
    +'你必须保留1个以上的包裹空间，否则领取不到可不要怪我哦！ \ \'
    +'|{cmd}<直接移动/@next_cube>             ^<给我天赐，开始移动/@next_cube_2> \ \');
    //清空点数,防止刷脚本
    This_Player.SetV(0, 1, 0);   
  end;
end; 

procedure _touzi;
var
  last_point, dianshu : Integer;   //读取记录的房间编号，直接跳转进入该房间；
begin
  //使用任务12的变量3记录投出的骰子数  
  last_point := This_Player.GetS(12, 3);
  if (last_point >= 1) and (last_point <= 6) then
  begin
    //这只处理第一次扔骰子后没移动就退出了的情况 
    This_Npc.NpcDialog(This_Player,
      '之前，你投出的骰子的点数为：' + IntToStr(last_point) + ' \你可以前进' 
      + IntToStr(last_point) + '个房间  \ \|{cmd}<移动/@next_cube>');
  end     
  else if This_Player.GetBagItemCount('乾坤令包') >= 1 then 
  begin
    This_Player.Take('乾坤令包',1);
    //第一次投骰子
    dianshu := Random(6) + 1;
    This_Player.SetV(0, 1, dianshu); 
    This_Player.SetS(12,3, dianshu);    
    This_Npc.PlayDice(This_Player, 1,'@AfterPlayDice');
  end
  else if This_Player.GetBagItemCount('乾坤令') >= 5 then 
  begin
    This_Player.Take('乾坤令',5);
    //第一次投骰子
    dianshu := Random(6) + 1;
    This_Player.SetV(0, 1, dianshu); 
    This_Player.SetS(12,3, dianshu);
    This_Npc.PlayDice(This_Player, 1,'@AfterPlayDice');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '5个乾坤令可以捆绑成一个乾坤令包。\如果你已经带来了，就交给我吧！');
  end;    
end;

function isCurMap(idx: Integer): Boolean;
var
  roomName : string;
begin
  //计算房间是否为当前所在，以免出现刷脚本 
  if idx < 10 then
    roomName := 'EM002~0' + IntToStr(idx)
  else
    roomName := 'EM002~' + IntToStr(idx);  
    
  if compareText(This_Player.MapName, roomName) = 0 then
    Result := True
  else
    Result := False;      
end;


procedure addroom;
var
  roomIdx : Integer;
  roomName, idxStr, desRoom : string;
begin
  //计算当前房间号 
  roomIdx := StrToIntDef(This_Player.CallOutParam, -1);
  if roomIdx = -1 then
    Exit;
    
  //目标房间号 
  desRoom := IntToStr(This_Player.GetS(12, 2));
  
  //到了目标房间 
  if ( compareText(This_Player.MapName, 'EM002~60') = 0 ) or 
     ( comPareText(This_Player.CallOutParam, desRoom) = 0 ) then
    Exit;  
  
  //计算要飞的地图 
  roomIdx := roomIdx + 1;
  This_Player.callOutParam := IntToStr(roomIdx);
  if roomIdx < 10 then
    roomName := 'EM002~0' + This_Player.callOutParam
  else
    roomName := 'EM002~' + This_Player.callOutParam;
      
  //开始飞 
  This_Player.RandomFlyTo(roomName);        
  This_Player.CallOut(This_Npc,1,'addroom');    
end;


procedure next_cube;
var
  desRoomId, diceNum : Integer;
begin
  desRoomId := This_Player.GetS(12, 2);  //房间号 
  diceNum   := This_Player.GetS(12, 3);  //所丢骰子数 
  if diceNum > 6 then 
    Exit;
  
  //先保存玩家第一次扔骰子所进入的房间
  if desRoomId < 0 then
  begin
    This_Player.SetS(12, 2, 0);
    desRoomId := 0;
  end;
  
  if not isCurMap(desRoomId) then
    Exit; 
    
  desRoomId := desRoomId + diceNum;
  This_Player.SetS(12, 2, desRoomId);
  This_Player.SetS(12, 3, 0);
  
  This_Player.RandomFlyTo('EM002~23');
  if diceNum > 1 then
  begin    
    This_Player.CallOut(This_Npc,1,'addroom');
    This_Player.callOutParam := nextRoomIdxStr;
  end;
end;

procedure _next_cube;
begin
  next_cube;
end;

procedure _next_cube_2;
begin
  This_Player.Give('神秘天赐',1);
  next_cube; 
end;


procedure _leave;
begin
  if compareText(This_Player.MapName, 'EM002~22') = 0 then
  begin
    This_Player.Flyto('3',330,330);
  end;
end; 

begin
  domain;
end.