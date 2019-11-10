function UseItem: Boolean;
var
str:string;
begin
  if This_Player.Level >= 7 then
  begin
    if This_Player.FreeBagNum > 6 then
    begin
      This_Player.Give('11级礼盒',1);
      This_Player.Give('金创药中包(赠)',1);
      This_Player.SysGiveGift('乌木剑',1,True);
    
      case This_Player.Job of
        0:
        begin
          This_Player.SysGiveGift('牛角戒指',2,True);
          This_Player.SysGiveGift('基本剑术',1,True);
          str:='基本剑术*1、牛角戒指*2';
        end;
        1:
        begin
          This_Player.SysGiveGift('六角戒指',2,True);
          This_Player.SysGiveGift('火球术',1,True);
          str:='火球术*1、六角戒指*2';
        end;
        2:
        begin
          This_Player.SysGiveGift('玻璃戒指',2,True);
          This_Player.SysGiveGift('精神力战法',1,True);
          This_Player.SysGiveGift('治愈术',1,True);
          str:='治愈术*1、精神力战法*1、玻璃戒指*2';
        end;
      end;
      
      This_Player.PlayerDialog(
      '你获得了：乌木剑、金创药中包、'+str+'和11级礼盒。'
      );
      Result := true;
    end 
    else
    begin
      This_Player.PlayerDialog(
      '对不起，包裹空间不足，请预留6个以上再次开启！'
      ); 
      Result := false; 
    end; 
  end
  else
  begin
    This_Player.PlayerDialog(
    '对不起，您的等级尚未达到7级，不能开启新手礼盒！\'
    ); 
    Result := false; 
  end;
end;

begin
end.