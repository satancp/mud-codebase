{********************************************************************

* 项目名称：
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：石墓五层打楔蛾计数 

*******************************************************************}

Program Mir2;
var
  iCount : integer;
begin
   if This_Player.GetV(108,1) = 13 then
   begin
      iCount := This_Player.GetV(108,6);
      if iCount = -1 then
        Exit;
      else if iCount = 2 then
      begin
         iCount := iCount + 1;
         This_Player.SetV(108,1,14);
         This_Player.SetV(108,6,iCount);
         This_Player.PlayerNotice('你已经获取了完整的蛾翼。', 2);
         This_Player.PlayerNotice('赶快回去找石墓的衣服店老板吧！', 2);
         This_Player.UpdateTaskDetail(108,1);
      end else if iCount < 2 then
      begin
         iCount := iCount + 1;
         This_Player.SetV(108,6,iCount);
      end;
   end;
end.

 