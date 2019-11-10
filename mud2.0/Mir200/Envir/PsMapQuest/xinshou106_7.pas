program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(106,1)= 17 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(106,7);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    else if iCount < 1 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(106,7,iCount);
      This_Player.SetV(106,1,18); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死暗黑战士, 赶快回比奇找武馆教头吧！',2);
      This_Player.UpdateTaskDetail(106,1);
    end
    else
    exit; 
  end; 
end.