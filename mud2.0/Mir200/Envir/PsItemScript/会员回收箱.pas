function UseItem: Boolean;
var
d1 , d2 : integer;
s1 , s2 : double;
t1 : integer; 
begin 
s1 := GetNow;
d1 := This_Player.Getv(86,1);
s2 := ConvertDBToDateTime(d1);
d2 := minusDataTime(s1,s2); 
if d2 > 604800 then    //读秒 3600*24*7 =604800秒  此处可以更改到期时间及测试功能，如修改许同时修改点卡使者处的！ 
begin
This_Player.PlayerDialog('周卡过期！'); 
This_Player.Setv(86,2,0);
Result := true;  //点击物品后物品消失

end else 
  if This_Player.GetV(86,2) =1 then
  begin
  This_Player.PlayerDialog(
  '<本宝典专为本服尊贵会员玩家设计，险恶地图可/c=red>\ \'+  
  '<以直达地图底层，在线买药可以快速补给物品：/c=red>\ \'+  
    '|{cmd}<★地图传送★/@CS>   ^<★开启神力★/@KQSHENLI>     ^<★每日福利★/@FULI> \'
   +'|{cmd}<★灵符商店★/@lingfu>  ^<★货币互换★/@huhuan>  ^<★买药★/@my> \'
   +'|{cmd}<★一键回收★/@huishou>  ^<★一键48级★/@sjls> ^<★等待添加★/c=red>\'    
    );
    Result := false; //点击物品后物品不消失！！1
end else
  begin
  This_Player.PlayerDialog(
  '此宝典仅供会员使用！'
  ); 
  end;
  
end;

begin
end.