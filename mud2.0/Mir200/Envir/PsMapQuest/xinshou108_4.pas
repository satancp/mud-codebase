{********************************************************************
* ÏîÄ¿Ãû³Æ£º
* µ¥ÔªÃû³Æ£º 
* µ¥Ôª×÷Õß£º
* Õª    Òª£º
* ±¸    ×¢£ºÊ¯Ä¹¶ş²ã´òºÚÉ«¶ñÇù¼ÆÊı 

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
           This_Player.PlayerNotice('ÄãÒÑ¾­ÔÚºÚÉ«¶ñÇùµÄÉíÉÏÕÒµ½ÁËÒÅº  £', 2);
           This_Player.PlayerNotice('¸Ï¿ì»ØÈ¥ÕÒÁ÷ÀËºº°É£¡', 2);
           This_Player.UpdateTaskDetail(108,1);
         end;
      end;
   end;
end.

 