{********************************************************************

* 项目名称：
* 单元名称：MiXin01
* 单元作者：
* 摘    要：每日密信任务打白野猪出密信 
* 备    注：

*******************************************************************}

PROGRAM Mir2;

var
  iCount , day, temMX : Integer;
  td : double;
begin
   td := GetNow;
   day := GetDateNum(td);    
   if ( day <> This_Player.GetS(21,2) ) or ( day = This_Player.GetS(21,3) ) or ( This_Player.GetV(16,98) <> 1 ) then
   begin
      Exit;
   end else
   begin
      temMX := random(20)+1;
      if temMX = 10 then
      begin
         This_Player.SetV(16,98,100);
         This_Player.PlayerNotice('密探的信被发现，赶紧去找八周年庆典大使吧！', 2);
      end;
   end;
end.  