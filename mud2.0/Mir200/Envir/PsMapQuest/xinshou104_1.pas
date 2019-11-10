program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(104,1)= 2 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(104,2);  //打怪计数标记 
    if iCount < 0 then
    begin
      Exit; 
  	end   
    else if iCount = 1 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(104,2, iCount);
      This_Player.SetV(104,1,3); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经获得了破烂的情报：'+inttostr(iCount)+'/2', 2);
      This_Player.PlayerNotice('赶快回去找合家药店老板吧！', 2);
      This_Player.UpdateTaskDetail(104,1);
      This_Player.UpdateTaskProgress(104,0);
    end
    else if iCount < 1 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(104,2,iCount);
      This_Player.PlayerNotice('你现在已经获得了破烂的情报：'+Inttostr(iCount)+'/2', 2);
      This_Player.UpdateTaskProgress(104,0);
    end;
  end; 
end.