program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(104,1)= 9 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(104,4);  //打怪计数标记 
    if iCount < 0 then
    begin
      Exit; 
  	end   
    else if iCount = 2 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(104,4,iCount);
      This_Player.SetV(104,1,10); // 完成任务标记 
      This_Player.PlayerNotice('你已经收集到了木料：'+inttostr(iCount)+'/3', 2);
      This_Player.PlayerNotice('赶快回去找合家铺子老板！', 2);
      This_Player.UpdateTaskDetail(104,1);
      This_Player.UpdateTaskProgress(104,0);
    end
    else if iCount < 2 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(104,4,iCount);
      This_Player.PlayerNotice('你已经收集到了木料：'+Inttostr(iCount)+'/3', 2);
      This_Player.UpdateTaskProgress(104,0);
    end;
  end; 
end.