program mir2;
var
  iCount : Integer;
  begin
    iCount := This_Player.GetV(71,2);  //打怪计数标记 
    if iCount  <> 0  then
    begin
      iCount := 0; 
      This_Player.PlayerNotice('你杀死了守城战士,元宝+10！', 2);
      This_Player.ScriptRequestAddYBNum(10);
     end 
	else 
	  begin
	  This_Player.PlayerNotice('你杀死了守城战士,元宝+10！', 2);
      This_Player.ScriptRequestAddYBNum(10);
	  end;
    
end.