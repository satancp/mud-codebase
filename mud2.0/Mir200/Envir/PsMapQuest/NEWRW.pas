program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(102,1)=8 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(102,2);  //打怪计数标记 
    if iCount < 0 then
    begin
      Exit;                              //因为已经在接任务的时候将该字段置零，所以不可能到这一步； 
  	end   
    else if iCount = 9 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(102,2,iCount);
      This_Player.SetV(102,1,9);       // 打怪完成标记 
      This_Player.PlayerNotice('你现在已经杀死了稻草人：'+inttostr(iCount)+'/10', 2);
      This_Player.PlayerNotice('赶快回去找书店老板吧！', 2);
      This_Player.UpdateTaskDetail(102,1);          //参数为0表不刷新任务日志，参数为1表示刷新 
      This_Player.UpdateTaskProgress(102,0);
    end
    else if iCount < 9 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(102,2, iCount);
      This_Player.PlayerNotice('你现在已经杀死了稻草人：'+Inttostr(iCount)+'/10', 2);
      This_Player.UpdateTaskProgress(102,0);
    end;
  end; 
end.