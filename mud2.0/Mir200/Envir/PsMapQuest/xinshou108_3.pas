{********************************************************************
* 项目名称：
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：石墓一层打黑野猪计数 

*******************************************************************}

Program Mir2;
var
  iCount : integer;
begin
   if This_Player.GetV(108,1) = 4 then
   begin
      iCount := This_Player.GetV(108,3);
      if iCount = -1 then
        Exit;
      else if iCount = 4 then
      begin
         iCount := iCount + 1;
         This_Player.SetV(108,1,5);
         This_Player.SetV(108,3,iCount);
         This_Player.PlayerNotice('你现在已经杀死黑野猪：5/5', 2);
         This_Player.PlayerNotice('赶快回去找流浪汉吧！', 2);
         This_Player.UpdateTaskDetail(108,1);
         This_Player.UpdateTaskProgress(108,0);
      end else if iCount < 4 then
      begin
         iCount := iCount + 1;
         This_Player.SetV(108,3,iCount);
         This_Player.PlayerNotice('你现在已经杀死黑野猪：'+inttostr(iCount)+'/5', 2);
         This_Player.UpdateTaskProgress(108,0);
      end;
   end;
end.

 