program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(103,1) = 3 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(103,2);  //打怪计数标记 
    if iCount < 0 then
    begin
      Exit; 
  	end   
    else if iCount = 9 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(103,2,iCount);
      This_Player.SetV(103,1,4); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死了骷髅：'+inttostr(iCount)+'/10', 2);
      This_Player.PlayerNotice('赶快回去找拾荒者吧！', 2);
      This_Player.UpdateTaskDetail(103,1);
      This_Player.UpdateTaskProgress(103,0);
    end
    else if iCount < 9 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(103,2,iCount);
      This_Player.PlayerNotice('你现在已经杀死了骷髅：'+Inttostr(iCount)+'/10', 2);
      This_Player.UpdateTaskProgress(103,0);
    end;
  end; 
end.