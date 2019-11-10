const YB_NUM = 50;

function UseItem: Boolean;
var str : string; 
begin

     str := 'Ôö¼Ó' + inttostr(YB_NUM) + 'Ôª±¦£¡';
     This_Player.ScriptRequestAddYBNum(YB_NUM);    
     This_Player.PlayerNotice(str,0);
     Result := true;
end;

begin
end.