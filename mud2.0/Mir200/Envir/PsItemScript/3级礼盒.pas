function UseItem: Boolean;  
begin     
  if This_Player.Level >= 3 then
  begin
    if This_Player.FreeBagNum > 1 then
    begin
      This_Player.Give('7级礼盒',1);
      This_Player.SysGiveGift('传统项链',1,true);
       This_Player.SysGiveGift('金条',1,true);
       This_Player.SysGiveGift('金条',1,true);
      case This_Player.Job of
      0: This_Player.SysGiveGift('铁手镯',2,true);
      1: This_Player.SysGiveGift('铁手镯',2,true);
      2: This_Player.SysGiveGift('铁手镯',2,true);
      
      end;
      This_Player.PlayerDialog(
      '你获得了：传统项链*1，铁手镯*2，金条和7级礼盒。'
      );
      Result := true;
    end 
    else
    begin
      This_Player.PlayerDialog(
      '对不起，包裹空间不足，请预留3个以上再次开启！'
      ); 
      Result := false; 
    end; 
  end
  else
  begin
    This_Player.PlayerDialog(
    '对不起，您的等级尚未达到3级，不能开启新手礼盒！\'
    ); 
    Result := false; 
  end;
end;

begin
end.