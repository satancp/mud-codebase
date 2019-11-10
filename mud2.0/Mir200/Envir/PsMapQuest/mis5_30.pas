program mir2;

var
  iCount : Integer;
begin
  	This_Player.PlayerNotice('第一步', 2);
  iCount := This_Player.GetV(5, 30);
  This_Player.PlayerNotice('第2步'+inttostr(iCount), 2);
  if iCount = -1 then
  	iCount := 0;
  if iCount < 5 then
  begin
     This_Player.PlayerNotice('第3步'+inttostr(iCount), 2); 	
  	iCount := iCount + 1;
     This_Player.PlayerNotice('第4步'+inttostr(iCount), 2); 
  	This_Player.SetV(5, 30, iCount);
   This_Player.PlayerNotice('第5步'+inttostr(iCount), 2); 	
  end else
  	This_Player.PlayerNotice('你现在已经消灭了半兽人，回去告诉商人吧', 2);
end.