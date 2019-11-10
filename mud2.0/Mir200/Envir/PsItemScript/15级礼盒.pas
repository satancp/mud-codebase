function UseItem: Boolean;
begin
  if This_Player.Level >= 15 then
  begin
    if This_Player.FreeBagNum > 8 then
    begin
      This_Player.Give('20级礼盒',1);
      case This_Player.Job of
        0: 
        begin
          This_Player.Give('金创药中包(赠)',6);
          This_Player.SysGiveGift('八荒',1,true);
          This_Player.SysGiveGift('攻杀剑术',1,true);
          This_Player.PlayerDialog(
          '你获得了：金创药中包*6、八荒、攻杀剑术和20级礼盒。'
          );
            
        end;
        1: 
        begin
          This_Player.Give('金创药中包(赠)',1);
          This_Player.Give('魔法药中包(赠)',5);
          This_Player.SysGiveGift('海魂',1,true);
          This_Player.SysGiveGift('雷电术',1,true);
          This_Player.PlayerDialog(
          '你获得了：金创药中包*1、魔法药中包*5、海魂、雷电术和20级礼盒。'
          );  
        end;
        2: 
        begin
          This_Player.Give('金创药中包(赠)',2);
          This_Player.Give('魔法药中包(赠)',4);
          This_Player.SysGiveGift('半月',1,true);
          This_Player.SysGiveGift('召唤骷髅',1,true);
          This_Player.SysGiveGift('护身符',1,true);
          This_Player.PlayerDialog(
          '你获得了：金创药中包*2、魔法药中包*4、半月、召唤骷髅、护身符和20级礼盒。'
          );
           
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
    '对不起，您的等级尚未达到15级，不能开启新手礼盒！\'
    ); 
    Result := false; 
  end;
end;

begin
end.