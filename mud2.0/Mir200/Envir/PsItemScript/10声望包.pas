const SW_NUM = 10;

function UseItem: Boolean;
var str : string; 
begin

     str := '��ϲ����' + inttostr(SW_NUM) + '������';
     This_Player.MyShengwan := This_Player.MyShengwan + 10;
     This_Player.PlayerNotice(str,0);
     Result := true;
end;

begin
end.