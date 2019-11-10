{********************************************************************

* 项目名称：
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program mir2;

var
  iCount, iTod: Integer;
  sTod : double;

begin
  sTod := GetNow();
  iTod := GetDateNum(sTod);
  
  if (This_Player.GetV(23,6) = 5) and (iTod = This_Player.GetV(23,24)) then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(23,17);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    else if iCount = 14 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(23,17,iCount);
      This_Player.SetV(23,6,10);                                  // 完成任务标记 
      This_Player.PlayerNotice('你现在已经杀死鸡：'+inttostr(iCount)+'/15', 2);
      This_Player.PlayerNotice('赶快回去找活动使者吧！', 2);
    end
    else if iCount < 14 then
    begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(23,17,iCount);
      This_Player.PlayerNotice('你现在已经杀死鸡：'+Inttostr(iCount)+'/15', 2);
    end;
  end; 
end.