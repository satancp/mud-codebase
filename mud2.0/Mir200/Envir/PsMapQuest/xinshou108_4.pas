{********************************************************************
* 项目名称：
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：石墓二层打黑色恶蛆计数 

*******************************************************************}

Program Mir2;
var
  iCount : integer;
begin
   if This_Player.GetV(108,1) = 6 then
   begin
      iCount := This_Player.GetV(108,4);
      if (iCount = -1) or (iCount = 5) then
      begin
        Exit;
      end else
      begin
         iCount := Random(5) + 1;
         if iCount = 5 then
         begin
           This_Player.SetV(108,1,7);
           This_Player.SetV(108,4,iCount);
           This_Player.PlayerNotice('你已经在黑色恶蛆的身上找到了遗�  �', 2);
           This_Player.PlayerNotice('赶快回去找流浪汉吧！', 2);
           This_Player.UpdateTaskDetail(108,1);
         end;
      end;
   end;
end.

 