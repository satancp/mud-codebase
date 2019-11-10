
function UseItem: Boolean;
var str : string; 
LF_NUM , temp_rdm : integer;
begin
    temp_rdm := random(1000);
    if temp_rdm < 222 then LF_NUM :=10
    else if temp_rdm < 441 then LF_NUM :=20
    else if temp_rdm < 741 then LF_NUM :=30
    else if temp_rdm < 881 then LF_NUM :=40
    else if temp_rdm < 961 then LF_NUM :=50
    else if temp_rdm < 999 then LF_NUM :=100
    else LF_NUM :=1000;
     str := '¹§Ï²Äã»ñµÃ' + inttostr(LF_NUM) + 'Áé·û£¡';
     This_Player.AddLF(0,LF_NUM);    
     This_Player.PlayerNotice(str,0);
     Result := true;
end;

begin
end.
