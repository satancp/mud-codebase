const JG_NUM = 500;

function UseItem: Boolean;
var str : string; 
begin

     str := '恭喜你获得' + inttostr(JG_NUM) + '金刚石！';
     This_Player.Give('金刚石',500);
     This_Player.PlayerNotice(str,0);
     Result := true;
end;

begin
end.