function UseItem: Boolean;

begin
  This_Player.PlayerDialog(
  '<此令牌专为本服尊贵会员玩家设计，险恶地图可/c=red>\ \'+  
  '<以直达地图底层，在线买药可以快速补给物品：/c=red>\ \'+  
    '|{cmd}<★城镇地图传送★/@CZ>        ^<★每日福利★/@FULI>\ \'+
    '|{cmd}<★险恶地图传送★/@WX>        ^<★随身仓库制作中★/c=red> \ \'+
    '|{cmd}<★快速买药功能★/@MY>        ^<★待添加★/c=red>' 
    ); 
  end else
  begin
  This_Player.PlayerDialog(
  '此令牌仅供本服会员使用！\ \'
  ); 

  end;

begin
end.