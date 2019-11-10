function UseItem: Boolean;
begin
  if This_Player.Level >= 20 then
  begin
    if This_Player.FreeBagNum > 8 then
    begin
      This_Player.Give('25级礼盒',1);
      case This_Player.Job of
        0: 
        begin
          This_Player.Give('金创药中包(赠)',6);
          This_Player.SysGiveGift('斩马刀',1,true);
          
          if This_Player.Gender = 0 then
          begin             
            This_Player.SysGiveGift('重盔甲(男)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*6、重盔甲(男)和25级礼盒。'
            );
          end else
          begin
            This_Player.SysGiveGift('重盔甲(女)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*6、重盔甲(女)和25级礼盒。'
            );
          end;
            
        end;
        1: 
        begin
          This_Player.Give('金创药中包(赠)',1);
          This_Player.Give('魔法药中包(赠)',5);
          This_Player.SysGiveGift('偃月',1,true);
          
          if This_Player.Gender = 0 then
          begin
            This_Player.SysGiveGift('魔法长袍(男)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*1、魔法药中包*5、偃月、魔法长袍(男)和25级礼盒。'
            );
          end else
          begin
            This_Player.SysGiveGift('魔法长袍(女)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*1、魔法药中包*5、偃月、魔法长袍(女)和25级礼盒。'
            );
          end;
            
        end;
        2: 
        begin
          This_Player.Give('金创药中包(赠)',2);
          This_Player.Give('魔法药中包(赠)',4);
          This_Player.SysGiveGift('降魔',1,true);
          if This_Player.Gender = 0 then
          begin
            This_Player.SysGiveGift('灵魂战衣(男)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*1、魔法药中包*5、灵魂战衣(男)和25级礼盒。'
            );
          end else
          begin
            This_Player.SysGiveGift('灵魂战衣(女)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*1、魔法药中包*5、灵魂战衣(女)和25级礼盒。'
            );
          end;
           
        end;
      end; 
      Result := true;
    end 
    else
    begin
      This_Player.PlayerDialog(
      '对不起，包裹空间不足，请预留8个以上再次开启！'
      ); 
      Result := false; 
    end; 
  end
  else
  begin
    This_Player.PlayerDialog(
    '对不起，您的等级尚未达到20级，不能开启新手礼盒！\'
    ); 
    Result := false; 
  end;
end;

begin
end.