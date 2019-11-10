program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(102,1)=11 then      //判断是否领取任务 
  begin
    iCount := This_Player.GetV(102,3);    //打怪计数标记 
    if iCount < 0 then
    begin
      Exit; 
  	end   
    else if iCount = 14 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(102,3,iCount);
      This_Player.SetV(102,1,12);           // 打怪完成标记 
      This_Player.PlayerNotice('你现在已经杀死了半兽人：'+inttostr(iCount)+'/15', 2);
      This_Player.PlayerNotice('赶快回去找仓库保管员吧！', 2);
      This_Player.UpdateTaskDetail(102,1);
      This_Player.UpdateTaskProgress(102,0);
    end
    else if iCount < 14 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(102,3, iCount);
      This_Player.PlayerNotice('你现在已经杀死了半兽人：'+Inttostr(iCount)+'/15', 2);
      This_Player.UpdateTaskProgress(102,0);
    end;
  end; 
end.