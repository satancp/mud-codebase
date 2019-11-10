{
/*******************************************************************************
}

program Mir2;

{$I common.pas}
const
  nextRoomIdxStr = '1';

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '你好,' + This_Player.Name + '这里是藏宝阁0号，\你将获得一次前进的机会。\'
  +'另外，如果你有多余的乾坤令，可以在我这里捆绑。\5个乾坤令可以捆绑成一个乾坤令包。\'
  +'|{cmd}<开始投骰子/@touzi_1>            ^<捆绑乾坤令/@newskill21>\ \'
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
    '这是藏宝阁0号，你可以直接通过这里前进。\5个乾坤令可以捆绑成一个乾坤令包。\'
    +'|{cmd}<捆绑乾坤令/@newskill21>\ \'
    +'|{cmd}<开始投骰子/@touzi_1>\ \'
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
       //将当前点数存到第12号活动的3号变量中 
       This_Player.SetS(12,3,dianshu);
       This_Npc.NpcDialog(This_Player,
         '你投出的骰子的点数为：'+IntToStr(dianshu) +'\你可以前进'+IntToStr(dianshu) +'个房间 \ \|{cmd}<移动/@next_cube>');
          //清空点数,防止刷脚本
       This_Player.SetV(0, 1, 0);   
  end;
end; 


procedure _touzi_1;
begin
  This_Npc.NpcDialog(This_Player,
  '如果你之前没有完成考验而中途离开，\这次你将直接到达上次你离开时所在的藏宝阁。\ \|{cmd}<进入藏宝阁/@touzi>');
end;

procedure _touzi;
var
  room_id : Integer;    //上次所在的房间数
  last_point : Integer; //
  //读取记录的房间编号，直接跳转进入该房间；
  //任务12的2号变量记录上次投骰子决定的房间数 
begin
  room_id := This_Player.GetS(12, 2);
  
  //判断第一次投骰子没有结束即离开，重新进入原骰子决定的房间
  //使用任务12的变量3记录投出的骰子数  
  last_point := This_Player.GetS(12, 3);
  if This_Player.Level < 35 then
  begin
    This_Npc.NpcDialog(This_Player,
    '必须达到35级以上，方可进入藏宝阁！');
  end
  else if (room_id >= 1) and (room_id <= 65)then
  begin
    //飞入指定的某个编号的房间地图
    if room_id >= 60 then
    begin
      This_Player.RandomFlyTo('EM002~60');
    end
    else if room_id < 10 then
    begin     
      This_Player.RandomFlyTo('EM002~0' + IntToStr(room_id));
    end
    else
    begin
      This_Player.RandomFlyTo('EM002~' + IntToStr(room_id));
    end;
  end 
  else if (last_point >= 1) and (last_point <= 6) then
  begin
    //这只处理第一次扔骰子后没移动就退出了的情况 
    This_Npc.NpcDialog(This_Player,
      '之前，你投出的骰子的点数为：' + IntToStr(last_point) + ' \你可以前进' 
      + IntToStr(last_point) + '个房间  \ \|{cmd}<移动/@next_cube>');
  end     
  else
  begin
    //第一次投骰子
    This_Player.SetV(0, 1, Random(6)+1);
    This_Player.SetS(12,2,0);
    This_Player.SetS(12,3,0);
    This_Player.SetS(12,4,0);
    This_Player.SetS(12,5,0);
    This_Player.SetS(12,6,0);
    This_Player.SetS(12,7,0);
    This_Npc.PlayDice(This_Player, 1,'@AfterPlayDice');
  end;
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
    
  //计算当前地图 
  if roomIdx < 10 then
    roomName := 'EM002~0' + This_Player.callOutParam
  else
    roomName := 'EM002~' + This_Player.callOutParam;
  //有问题，可能是刷脚本 
  if compareText(This_Player.MapName, roomName) <> 0 then
    Exit;

  //目标房间号 
  desRoom := IntToStr(This_Player.GetS(12, 2));
  
  //到了目标房间 
  if ( compareText(This_Player.MapName, 'EM002~60') = 0 ) or 
     ( comPareText(This_Player.CallOutParam, desRoom) = 0 ) then
    Exit;  
  
  //计算要飞的地图 
  roomIdx := roomIdx + 1 
  This_Player.callOutParam := IntToStr(roomIdx);
  if roomIdx < 10 then
    roomName := 'EM002~0' + This_Player.callOutParam
  else
    roomName := 'EM002~' + This_Player.callOutParam;
      
  //开始飞 
  This_Player.RandomFlyTo(roomName);        
  This_Player.CallOut(This_Npc,1,'addroom');    
end;


procedure _next_cube;
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
  
  //这里必须是从12号活动的3号变量中读取，
  //不能直接读取骰子点数的0号任务的1号变量 
  desRoomId := desRoomId + diceNum;
  This_Player.SetS(12, 2, desRoomId);
  This_Player.SetS(12, 3, 0);
  
  This_Player.RandomFlyTo('EM002~01');
  if diceNum > 1 then
  begin    
    This_Player.CallOut(This_Npc,1,'addroom');
    This_Player.callOutParam := nextRoomIdxStr;
  end;
end;

procedure _leave;
begin
  if compareText(This_Player.MapName, 'EM002') = 0 then
  begin
    This_Player.Flyto('3',330,330);
  end;
end; 

begin
  domain;
end.   
    