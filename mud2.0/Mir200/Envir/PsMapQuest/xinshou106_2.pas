program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(106,1)= 3 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(106,2);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    else if iCount = 4 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(106,2,iCount);
      This_Player.SetV(106,1,4); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死跳跳蜂，获得传递的情报：'+inttostr(iCount)+'/5', 2);
      This_Player.PlayerNotice('赶快回去找紫水晶屋服装店老板吧！', 2);
      This_Player.UpdateTaskDetail(106,1);
      This_Player.UpdateTaskProgress(106,0);
    end
    else if iCount < 4 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(106,2,iCount);
      This_Player.PlayerNotice('你现在已经杀死跳跳蜂，获得传递的情报：'+Inttostr(iCount)+'/5', 2);
      This_Player.UpdateTaskProgress(106,0);
    end;
  end; 
end.