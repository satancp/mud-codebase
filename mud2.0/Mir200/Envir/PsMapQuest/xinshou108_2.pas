{********************************************************************

* 项目名称：
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：石墓一层打红野猪计数 

*******************************************************************}

Program Mir2;
var
  iCount, iCount02, temp01, temp02, iTod: integer;
  sTod : double;
begin
   temp01 := This_Player.GetV(108,1);
   temp02 := This_Player.GetV(23,1);
   sTod := GetNow();
   iTod := GetDateNum(sTod);
   
   if This_Player.GetV(108,1) = 2 then
   begin
      iCount := This_Player.GetV(108,2);
      if iCount = -1 then
        Exit;
      else if iCount = 4 then
      begin
         iCount := iCount + 1;
         This_Player.SetV(108,1,3);
         This_Player.SetV(108,2,iCount);
         This_Player.PlayerNotice('你现在已经杀死红野猪：5/5', 2);
         This_Player.PlayerNotice('赶快回去找流浪汉吧！', 2);
         This_Player.UpdateTaskDetail(108,1);
         This_Player.UpdateTaskProgress(108,0);
      end else if iCount < 4 then
      begin
         iCount := iCount + 1;
         This_Player.SetV(108,2,iCount);
         This_Player.PlayerNotice('你现在已经杀死红野猪：'+inttostr(iCount)+'/5', 2);
         This_Player.UpdateTaskProgress(108,0);
      end;
      end else if This_Player.GetV(108,1) = 8 then
      begin
         iCount := This_Player.GetV(108,5);
         if (iCount = -1) or (iCount = 5) then
         begin
                                                    //若满足该条件，该过程为空过程 
         end else 
         begin
            iCount := Random(10) + 1;
            if iCount = 5 then
            begin
               This_Player.SetV(108,1,9);
               This_Player.SetV(108,5,iCount);
               This_Player.PlayerNotice('你已经在红野猪的身上找到了由遗骸制作而成的项链。', 2);
               This_Player.PlayerNotice('赶快回去找流浪汉吧！', 2);
               This_Player.UpdateTaskDetail(108,1);
            end;
         end;
      end; 
   
      if (This_Player.GetV(23,1) = 5) and (iTod = This_Player.GetV(23,24)) then
      begin
         iCount02 := This_Player.GetV(23,12);
         if iCount02 = 9 then
         begin
            iCount02 := iCount02 + 1;
            This_Player.SetV(23,1,10);                               //已完成打怪 
            This_Player.SetV(23,12,iCount02);                        //打怪计数 
            This_Player.PlayerNotice('你现在已经杀死红野猪：10/10', 2);
            This_Player.PlayerNotice('赶快回去找活动使者吧！', 2);
         end else if (iCount02 < 9) and (iCount02 >= 0) then
         begin
            iCount02 := iCount02 + 1;
            This_Player.SetV(23,12,iCount02);
            This_Player.PlayerNotice('你现在已经杀死红野猪：'+inttostr(iCount02)+'/10', 2);
         end;
      end;
end.

 