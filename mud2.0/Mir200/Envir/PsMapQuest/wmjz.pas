program mir2;
//{$I BOSS.pas}   //该脚本里写个cxjsjl的函数 
var
  iCount : Integer;
  begin
    iCount := GetG(71,11);  //打怪计数标记 
    if iCount  <> 1  then
	  begin
      iCount := 0;  
      This_Player.PlayerNotice(This_Player.name +'是全服第一个杀死了BOSS沃玛教主的玩家,特奖励元宝100！', 2);
      This_Player.ScriptRequestAddYBNum(100);
      SetG(71,11,iCount+1) ;
	  This_Player.setv(72,11,10);
      //This_Player.PlayerDialog(cxjsjl);
	  end;
    
end.