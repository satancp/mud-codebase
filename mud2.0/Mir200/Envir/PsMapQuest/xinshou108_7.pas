{********************************************************************

* 项目名称：
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：死亡棺材打邪恶钳虫计数 

*******************************************************************}

program mir2;

var
  iCount, iCount02, iTod: Integer;
  sTod : double;
begin
     sTod := GetNow();
     iTod := GetDateNum(sTod);
     
  if This_Player.GetV(108,1)= 17 then //判断是否领取任务 
  begin
    iCount := This_Player.GetV(108,7);  //打怪计数标记 
    if iCount = -1 then
    begin
      iCount := 0; 
  	end   
    if iCount < 1 then
	  begin
  	  iCount := iCount + 1;
  	  This_Player.SetV(108,7,iCount);
      This_Player.SetV(108,1,18); // 完成任务标记 
      This_Player.PlayerNotice('你已经杀死邪恶钳虫，获得了钳虫角。',2);
      This_Player.PlayerNotice('赶快回比奇找流浪汉吧！', 2);
      This_Player.UpdateTaskDetail(108,1);
    end;
  end;
     
     if (This_Player.GetV(23,10) = 5) and (iTod = This_Player.GetV(23,24)) then
     begin
        iCount02 := This_Player.GetV(23,21);
        if iCount02 = -1 then
        begin
           iCount02 := 0; 
  	    end
        if iCount02 = 1 then
	      begin
  	       iCount02 := iCount02 + 1;
  	       This_Player.SetV(23,21,iCount02);
           This_Player.SetV(23,10,10);                                  // 完成任务标记 
           This_Player.PlayerNotice('你现在已经杀死邪恶钳虫：'+inttostr(iCount02)+'/2', 2);
           This_Player.PlayerNotice('赶快回去找活动使者吧！', 2);
        end 
        else if iCount02 = 0 then
        begin
  	       iCount02 := iCount02 + 1;
  	       This_Player.SetV(23,21,iCount02);
           This_Player.PlayerNotice('你现在已经杀死邪恶钳虫：'+Inttostr(iCount02)+'/2', 2);
        end;
     end; 
end.