const LF_NUM = 50;

function UseItem: Boolean;
var str : string; 
begin

     str := '¹§Ï²Äã»ñµÃ' + inttostr(LF_NUM) + 'Áé·û£¡';
     This_Player.AddLF(0,LF_NUM);    
     This_Player.PlayerNotice(str,0);
     Result := true;
end;

begin
end.
