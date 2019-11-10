{********************************************************************

* 项目名称：
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：石墓三层打红野猪计数 

*******************************************************************}

Program Mir2;
var
  iCount : integer;
begin
   if This_Player.GetV(108,1) = 8 then
   begin
      iCount := This_Player.GetV(108,5);
      if (iCount = -1) or (iCount = 5) then
        Exit;
      else
      begin
         iCount := Random(5) + 1;
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
end.

 