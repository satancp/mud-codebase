program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(105,1)= 4 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(105,2);  //打怪计数标记 
    if iCount < 0 then
    begin
      Exit; 
  	end   
    else if iCount = 2 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(105,2,iCount);
      This_Player.SetV(105,1,5); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死了沃玛勇士：'+inttostr(iCount)+'/3', 2);
      This_Player.PlayerNotice('赶快回去找白日门勇士吧！', 2);
      This_Player.UpdateTaskDetail(105,1);
      This_Player.UpdateTaskProgress(105,0);
    end
    else if iCount < 2 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(105,2,iCount);
      This_Player.PlayerNotice('你现在已经杀死了沃玛勇士：'+Inttostr(iCount)+'/3', 2);
      This_Player.UpdateTaskProgress(105,0);
    end;
  end; 
end.