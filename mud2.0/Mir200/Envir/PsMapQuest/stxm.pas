program mir2;

var
  iCount : Integer;
  begin
    iCount := GetG(71,15);  //打怪计数标记 
    if iCount  <> 1  then
	  begin
      iCount := 0;  
      This_Player.PlayerNotice(This_Player.name +'是全服第一个杀死了BOSS双头血魔的玩家,特奖励元宝100！', 2);
      This_Player.ScriptRequestAddYBNum(100);
      SetG(71,15,iCount+1) ;
	  This_Player.setv(72,15,10);
	  end;
    
end.