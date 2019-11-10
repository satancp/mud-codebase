const SW_NUM = 50;

function UseItem: Boolean;
var str : string; 
begin

     str := '¹§Ï²Äã»ñµÃ' + inttostr(SW_NUM) + 'ÉùÍû£¡';
     This_Player.MyShengwan := This_Player.MyShengwan + 50;
     This_Player.PlayerNotice(str,0);
     Result := true;
end;

begin
end.