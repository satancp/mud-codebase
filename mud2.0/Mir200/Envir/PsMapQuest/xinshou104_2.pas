program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(104,1)= 4 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(104,3);  //打怪计数标记 
    if iCount < 0 then
    begin
      Exit; 
  	end   
    else if iCount = 2 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(104, 3, iCount);
      This_Player.SetV(104,1,5); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经获得了情报药水：'+inttostr(iCount)+'/3', 2);
      This_Player.PlayerNotice('赶快回去找合家药店老板吧！', 2);
      This_Player.UpdateTaskDetail(104,1);
      This_Player.UpdateTaskProgress(104,0);
    end
    else if iCount < 2 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(104, 3, iCount);
      This_Player.PlayerNotice('你现在已经获得了情报药水：'+Inttostr(iCount)+'/3', 2);
      This_Player.UpdateTaskProgress(104,0);
    end;
  end; 
end.