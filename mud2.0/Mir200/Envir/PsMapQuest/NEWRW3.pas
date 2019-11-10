program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(103,1)=6 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(103,3);  //打怪计数标记 
    if iCount < 0 then
    begin
      Exit; 
  	end   
    else if iCount = 9 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(103,3,iCount);
      This_Player.SetV(103,1,7); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死了僵尸：'+inttostr(iCount)+'/10', 2);
      This_Player.PlayerNotice('赶快回去找安家铺子老板吧！', 2);
      This_Player.UpdateTaskDetail(103,1);
      This_Player.UpdateTaskProgress(103,0);
    end
    else if iCount < 9 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(103,3, iCount);
      This_Player.PlayerNotice('你现在已经杀死了僵尸：'+Inttostr(iCount)+'/10', 2);
      This_Player.UpdateTaskProgress(103,0);
    end;
  end; 
end.