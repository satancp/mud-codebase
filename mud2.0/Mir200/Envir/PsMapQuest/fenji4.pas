program mir2;

var
  iCount : Integer;

begin
  if This_Player.GetV(19,1)=6 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(19,2);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    else if iCount =24 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(19,2,iCount);
      This_Player.SetV(19,1,8); // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死了雪域冰狼：'+inttostr(iCount)+'/25', 2);
      This_Player.PlayerNotice('赶快回去找关卡任务使者吧！', 2);
    end
    else if iCount <24 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(19,2, iCount);
      This_Player.PlayerNotice('你现在已经杀死了雪域冰狼：'+Inttostr(iCount)+'/25', 2);
    end;
  end; 
end.