program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(106,1)= 12 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(106,5);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    else if iCount = 4 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(106,5,iCount);
      This_Player.SetV(106,1,13); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死钳虫，获得钳虫的外壳：'+inttostr(iCount)+'/5', 2);
      This_Player.PlayerNotice('赶快回去找盟重武器店老板吧！', 2);
      This_Player.UpdateTaskDetail(106,1);
      This_Player.UpdateTaskProgress(106,0);
    end
    else if iCount < 4 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(106,5,iCount);
      This_Player.PlayerNotice('你现在已经杀死钳虫，获得钳虫的外壳：'+Inttostr(iCount)+'/5', 2);
      This_Player.UpdateTaskProgress(106,0);
    end;
  end; 
end.