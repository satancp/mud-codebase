function UseItem: Boolean;
var str : string; 
begin
  if This_Player.Level >= 11 then
  begin
    if This_Player.FreeBagNum > 5 then
    begin
      This_Player.Give('15级礼盒',1);
      case This_Player.Job of
        0: 
        begin
          This_Player.Give('金创药中包(赠)',3);
          
          if This_Player.Gender = 0 then
          begin
            This_Player.SysGiveGift('轻型盔甲(男)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*3、轻型盔甲(男)和15级礼盒。'
            );
          end else
          begin
            This_Player.SysGiveGift('轻型盔甲(女)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*3、轻型盔甲(女)和15级礼盒。'
            );
          end;
            
        end;
        1: 
        begin
          This_Player.Give('金创药中包(赠)',1);
          This_Player.Give('魔法药中包(赠)',2);
          if This_Player.Gender = 0 then
          begin
            This_Player.SysGiveGift('轻型盔甲(男)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*3、轻型盔甲(男)和15级礼盒。'
            );
          end else
          begin
            This_Player.SysGiveGift('轻型盔甲(女)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*1、魔法药中包*2、轻型盔甲(女)和15级礼盒。'
            );
          end;
            
        end;
        2: 
        begin
          This_Player.Give('金创药中包(赠)',2);
          This_Player.Give('魔法药中包(赠)',1);
          if This_Player.Gender = 0 then
          begin
            This_Player.SysGiveGift('轻型盔甲(男)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*3、轻型盔甲(男)和15级礼盒。'
            );
          end else
          begin
            This_Player.SysGiveGift('轻型盔甲(女)',1,true);
            This_Player.PlayerDialog(
            '你获得了：金创药中包*2、魔法药中包*1、轻型盔甲(女)和15级礼盒。'
            );
          end;
           
        end;
      end; 
      Result := true;
    end 
    else
    begin
      This_Player.PlayerDialog(
      '对不起，包裹空间不足，请预留5个以上再次开启！'
      ); 
      Result := false; 
    end; 
  end
  else
  begin
    This_Player.PlayerDialog(
    '对不起，您的等级尚未达到11级，不能开启新手礼盒！\'
    ); 
    Result := false; 
  end;
end;

begin
end.