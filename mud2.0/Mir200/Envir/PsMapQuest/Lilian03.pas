{********************************************************************
* 项目名称：每日历练任务25-29级 
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：
*******************************************************************}

program mir2;

var
  iCount, iTod: Integer;
  sTod : double;

begin
  sTod := GetNow();
  iTod := GetDateNum(sTod);
  
  if (This_Player.GetS(22,24) = 320) and (iTod = This_Player.GetS(22,23)) then //判断是否领取任务 
  begin
    iCount := This_Player.GetS(22,27);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    else if iCount = 9 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetS(22,27,iCount);
      This_Player.SetS(22,24,350);                                  // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死恶魔蜈蚣：'+inttostr(iCount)+'/10', 2);
      This_Player.PlayerNotice('赶快回去找恶兽看守人吧！', 2);
    end
    else if iCount < 9 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetS(22,27,iCount);
      This_Player.PlayerNotice('你现在已经杀死恶魔蜈蚣：'+Inttostr(iCount)+'/10', 2);
    end;
  end; 
end.