{
/*******************************************************************************
}

program Mir2;

{$I common.pas}
const
  nextRoomIdxStr = '54';
  preRoomIdxStr = '52';

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '你好，' + This_Player.Name + '这里是藏宝阁53号，你可以直接掷骰子，\'
  +'当骰子点数为<单数/c=red>时，你将会<前进/c=red>这个步数，\'
  +'当骰子点数为<双数/c=red>时，你将会<后退/c=red>这个步数。\'
  +'5个乾坤令可以捆绑成一个乾坤令包。\'
  +'|{cmd}<捆绑乾坤令/@newskill21>\ \'
  +'|{cmd}<投骰子/@touzi>\ \'
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
    '你好，' + This_Player.Name + '这里是藏宝阁53号，你可以直接掷骰子，\'
    +'当骰子点数为<单数/c=red>时，你将会<前进/c=red>这个步数，\'
    +'当骰子点数为<双数/c=red>时，你将会<后退/c=red>这个步数。\'
    +'5个乾坤令可以捆绑成一个乾坤令包。\'
    +'|{cmd}<捆绑乾坤令/@newskill21>\ \'
    +'|{cmd}<投骰子/@touzi>\ \'
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
  dianshu := This_Player.GetV(0,1);
  if dianshu > 0 then
  begin
    //将当前点数存到第11号活动的3号变量中 
    This_Player.SetS(12,3,dianshu);
    case dianshu of
    1,3,5:
      begin 
        This_Npc.NpcDialog(This_Player,
        '你投出的骰子的点数为：' + IntToStr(dianshu) + ' \你可以前进' 
        + IntToStr(dianshu) + '个房间  \ \|{cmd}<移动/@next_cube>');
      end;
    2,4,6:
      begin
        This_Npc.NpcDialog(This_Player,
        '你投出的骰子的点数为：' + IntToStr(dianshu) + ' \你必须后退' 
        + IntToStr(dianshu) + '个房间  \ \|{cmd}<移动/@next_cube>');
      end;
    end;
    This_Player.SetV(0, 1, 0);   
  end;
end; 

procedure _touzi;
var
  last_point : Integer;   //读取记录的房间编号，直接跳转进入该房间；
begin
  //使用任务12的变量3记录投出的骰子数  
  last_point := This_Player.GetS(12, 3);
  if (last_point >= 1) and (last_point <= 6) then
  begin
    //这只处理第一次扔骰子后没移动就退出了的情况
    case last_point of
    1,3,5:
      begin 
        This_Npc.NpcDialog(This_Player,
        '之前，你投出的骰子的点数为：' + IntToStr(last_point) + ' \你可以前进' 
        + IntToStr(last_point) + '个房间  \ \|{cmd}<移动/@next_cube>');
      end;
    2,4,6:
      begin
        This_Npc.NpcDialog(This_Player,
        '之前，你投出的骰子的点数为：' + IntToStr(last_point) + ' \你必须后退' 
        + IntToStr(last_point) + '个房间  \ \|{cmd}<移动/@next_cube>');
      end;
    end;
  end       
  else
  begin
    //第一次投骰子
    This_Player.SetV(0, 1, Random(6)+1);
    This_Npc.PlayDice(This_Player, 1,'@AfterPlayDice');
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
  roomIdx: Integer;
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

procedure decRoom;
var
  roomIdx: Integer;
  roomName, idxStr, desRoom : string;
begin
  //计算当前房间号 
  roomIdx := StrToIntDef(This_Player.CallOutParam, -1);
  if roomIdx = -1 then
    Exit;

  //目标房间号 
  desRoom := IntToStr(This_Player.GetS(12, 2));
  
  //到了目标房间 
  if comPareText(This_Player.CallOutParam, desRoom) = 0 then
    Exit;  
  
  //计算要飞的地图
  roomIdx := roomIdx - 1;
  This_Player.callOutParam := IntToStr(roomIdx);

  if roomIdx < 10 then
    roomName := 'EM002~0' + This_Player.callOutParam
  else
    roomName := 'EM002~' + This_Player.callOutParam;
      
  //开始飞 
  This_Player.RandomFlyTo(roomName);        
  This_Player.CallOut(This_Npc,1,'decRoom');    
end;

procedure _next_cube;
var
  desRoomId, diceNum : Integer;
  bBack : Boolean;
begin
  if compareText(This_Player.MapName, 'EM002~53') <> 0 then
    Exit;

  desRoomId := This_Player.GetS(12, 2);  //房间号 
  diceNum   := This_Player.GetS(12, 3);  //所丢骰子数 
  if (diceNum > 6) or (diceNum < 0) then 
    Exit;
  
  //先保存玩家第一次扔骰子所进入的房间
  if desRoomId < 0 then
  begin
    This_Player.SetS(12, 2, 0);
    desRoomId := 0;
  end;
  
  if not isCurMap(desRoomId) then
    Exit;   

  //  根据骰子数，决定第一步是前进还是后退 
  case diceNum of
  1,3,5:
    begin
      bBack := False;
      desRoomId := desRoomId + diceNum;                 
      This_Player.RandomFlyTo('EM002~54');
      This_Player.callOutParam := nextRoomIdxStr;
    end;
  2,4,6:
    begin
      bBack := True;
      desRoomId := desRoomId - diceNum;
      This_Player.RandomFlyTo('EM002~52');
      This_Player.callOutParam := preRoomIdxStr;
    end; 
  else
    Exit;
  end;
  
  This_Player.SetS(12, 2, desRoomId);
  This_Player.SetS(12, 3, 0);
  
  if bBack then
    This_Player.CallOut(This_Npc,1,'decRoom')
  else   
    This_Player.CallOut(This_Npc,1,'addroom');
  
end;


procedure _leave;
begin
  if compareText(This_Player.MapName, 'EM002~53') = 0 then
  begin
    This_Player.Flyto('3',330,330);
  end;
end; 

begin
  domain;
end.