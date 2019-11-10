program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(106,1)= 14 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(106,6);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    else if iCount = 4 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(106,6,iCount);
      This_Player.SetV(106,1,15); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死黑色恶蛆，获得恶蛆粉末：'+inttostr(iCount)+'/5', 2);
      This_Player.PlayerNotice('赶快回去找安家铺子老板吧！', 2);
      This_Player.UpdateTaskDetail(106,1);
      This_Player.UpdateTaskProgress(106,0);
      This_Player.Flyto('1',314,79);
    end
    else if iCount < 4 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(106,6,iCount);
      This_Player.PlayerNotice('你现在已经杀死黑色恶蛆，获得恶蛆粉末：'+Inttostr(iCount)+'/5', 2);
      This_Player.UpdateTaskProgress(106,0);
    end;
  end; 
end.