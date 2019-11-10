function UseItem: Boolean;
begin
  if This_Player.Level >= 30 then
  begin
    if This_Player.FreeBagNum > 11 then
    begin
      This_Player.Give('35级礼盒',1);
      case This_Player.Job of
        0: 
        begin
        This_Player.Give('超级金创药(赠)',10);
        This_Player.SysGiveGift('修复神水',1,true);
        This_Player.PlayerDialog(
        '你获得了：超级金创药*10、修复神水和35级礼盒。'
        );
        end;
        1: 
        begin
        This_Player.Give('超级金创药(赠)',2);
        This_Player.Give('超级魔法药(赠)',8);
        This_Player.SysGiveGift('修复神水',1,true);
        This_Player.PlayerDialog(
        '你获得了：超级金创药*2、超级魔法药*8、修复神水和35级礼盒。'
        );
        end;
        2: 
        begin
        This_Player.Give('超级金创药(赠)',4);
        This_Player.Give('超级魔法药(赠)',6);
        This_Player.SysGiveGift('修复神水',1,true);
        This_Player.PlayerDialog(
        '你获得了：超级金创药*4、超级魔法药*6、修复神水和35级礼盒。'
        );
        end;
      end; 
      Result := true;
    end 
    else
    begin
      This_Player.PlayerDialog(
      '对不起，包裹空间不足，请预留11个以上再次开启！'
      ); 
      Result := false; 
    end; 
  end
  else
  begin
    This_Player.PlayerDialog(
    '对不起，您的等级尚未达到30级，不能开启新手礼盒！\'
    ); 
    Result := false; 
  end;
end;

begin
end.