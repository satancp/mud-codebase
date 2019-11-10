{
*******************************************************************}

program Mir2; 

var
d1 , d2 : integer;
s1 , s2 : double;
t1 : integer;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _cx;
begin
     This_Npc.NpcDialog(This_Player, 
     '周卡可以享受:\|'
     +'1.☆☆<免费自由传送/c=red>☆☆\|'
	 +'2.☆☆<快捷买药/c=red>☆☆\|'
	 +'3.☆☆<每日福利/c=red>☆☆\|'
	 +'4.☆☆<灵符商店/c=red>☆☆\|'
	 +'5.☆☆<货币互换/c=red>☆☆\|'
	 +'6.☆☆<一键48级/c=red>☆☆\|'
	 +'7.☆☆<免费领取1.2到2.0倍神力等/c=red>☆☆\|'
     );
end;

Procedure _zk;
begin
   s1 := GetNow;
d1 := This_Player.Getv(86,1);
s2 := ConvertDBToDateTime(d1);
d2 := minusDataTime(s1,s2);
t1 := This_Player.Getv(86,2);
if t1< 0 then   This_Player.Setv(86,2,0);
      if This_Player.YBNum >= 888 then 
   begin
      if  t1 < 1 then 
          begin 
          This_Player.PsYBConsum(This_NPC,'xin',20001,888,1);  
          This_Player.Setv(86,1, ConvertDateTimeToDB(s1));
          This_Player.Setv(86,2,1); 
          This_Player.give('会员回收箱',1);
          This_Npc.NpcDialog(This_Player,'你成功购买了周卡！'); 
          ServerSay('土豪玩家<' + This_Player.Name + '>加入了会员,将享受特殊服务.', 2);		  
          end else This_Npc.NpcDialog(This_Player,'你已经是周卡会员，不需要重复购买！');
   end else This_Npc.NpcDialog(This_Player,'你没有足够的元宝！'); 
   
end; 
Procedure _zkgn;
begin
s1 := GetNow;
d1 := This_Player.Getv(86,1);
s2 := ConvertDBToDateTime(d1);
d2 := minusDataTime(s1,s2); 
if d2 > 604800 then                   //读秒 3600*24*7 =604800秒  此处可以更改到期时间及测试功能，如修改许同时修改GM宝典中的！ 
begin 
this_Npc.NpcDialog(This_Player,'周卡过期！'); 
This_Player.Setv(86,2,0);
end else 
begin 
    This_Player.PlayerDialog(
  '<专为本服尊贵会员玩家设计，险恶地图可/c=red>\ \'+  
  '<以直达地图底层，在线买药可以快速补给物品：/c=red>\ \'+  
    '|{cmd}<★地图传送★/@CS>   ^<★开启神力★/@KQSHENLI>     ^<★每日福利★/@FULI> \'
   +'|{cmd}<★灵符商店★/@lingfu>  ^<★货币互换★/@huhuan>   ^<★买药★/@my> \'  
    ); 
end;
end;


procedure _dhhy;
begin
  This_Npc.NpcDialog(This_Player,
  '本服会员功能需要商场购买<会员回收箱/=red>\ '+
  '或者使用积分在我这里换取，会员可以进入会员战场，并\'+ 
  '拥有强大的随身功能，每日补给等.\'+ 
  '会员回收箱为本服会员专用道具.\'+ 
  '双击会员回收箱可以使用会员随身功能，\'+ 
  '超级实用，详细功能请购买会员后体验.\' +
  '如果你有30个会员积分，我也可以帮给你兑换一个.\' +
  '会员回收箱，会员积分在地下夺宝，藏宝阁产出.\' +
  '|{cmd}<合成会员回收箱/@goldrole> \' 

  );
end;


procedure _goldrole;
begin
  This_Npc.NpcDialog(This_Player,
  '如果你有30个会员积分，交给我，我会给你一个会员回收箱。\'
  +'会员回收箱为绑定物品，不可丢弃，交易，死亡不爆，放在包里可以使用多种会员功能！\'
  +'|{cmd}<使用会员积分获得会员回收箱/@goldjifen> \'
  +'|{cmd}<捆会员积分/@bindgold>\'               
  );
end;

procedure _golditemreq;
begin
  This_Npc.ReqItemByGoldAct(This_Player);
end;

procedure _goldjifen;
begin
  if This_Player.GetBagItemCount('会员积分') >= 30 then
  begin
    This_Player.Take('会员积分',30);
    This_Player.Give('会员回收箱',1);
	ServerSay('土豪玩家<' + This_Player.Name + '>使用会员积分兑换了会员,将享受特殊服务.', 2);		
    This_Npc.NpcDialog(This_Player,
    '会员回收箱已经给你了，双击之后，就可以享受会员功能！');
    
   
     
  end
  else if this_Player.GetBagItemCount('会员积分包') >= 5 then
  begin
    This_Player.Take('会员积分包',5);
    This_Player.Give('会员回收箱',1);
    This_Npc.NpcDialog(This_Player,
    '会员回收箱已经给你了，双击之后，就可以享受会员功能！');
     
  end
  else if This_Player.GetBagItemCount('会员积分包') = 4 then
  begin
    if This_Player.GetBagItemCount('会员积分') >= 6 then
    begin
       This_Player.Take('会员积分包',4);
       This_Player.Take('会员积分',6);
       This_Player.Give('会员回收箱',1);
       This_Npc.NpcDialog(This_Player,
       '会员回收箱已经给你了，双击之后，就可以享受会员功能！');
    
    end;
  end
  else if this_Player.GetBagItemCount('会员积分包') = 3 then
  begin
    if This_Player.GetBagItemCount('会员积分') >= 12 then
    begin
       This_Player.Take('会员积分包',3);
       This_Player.Take('会员积分',12);
       This_Player.Give('会员回收箱',1);
       This_Npc.NpcDialog(This_Player,
       '会员回收箱已经给你了，双击之后，就可以享受会员功能！');
    
     
    end;
  end
  else if this_Player.GetBagItemCount('会员积分包') = 2 then
  begin
    if This_Player.GetBagItemCount('会员积分') >= 18 then
    begin
    This_Player.Take('会员积分包',2);
    This_Player.Take('会员积分',18);
    This_Player.Give('会员回收箱',1);
    This_Npc.NpcDialog(This_Player,
     '会员回收箱已经给你了，双击之后，就可以享受会员功能！');
    end;
  end
  else if this_Player.GetBagItemCount('会员积分包') = 1 then
  begin
    if This_Player.GetBagItemCount('会员积分') >= 24 then
    begin
       This_Player.Take('会员积分包',1);
       This_Player.Take('会员积分',24);
       This_Player.Give('会员回收箱',1);
       This_Npc.NpcDialog(This_Player,
        '会员回收箱已经给你了，双击之后，就可以享受会员功能！');
       
       
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你好像没有足够的会员积分啊，\这个会员凭证我暂时不能给你。\请你继续努力吧！\'
    );
  end;
end;

procedure _bindgold;
begin
  This_Npc.NpcDialog(This_Player,
  '我可以帮你把6个会员积分捆为一个会员积分包，\不过每捆一次收费5000金币。\你想让我帮你捆会员积分吗？\ \'
  +'|{cmd}<捆会员积分/@bindinggold>\ \'
  //+'|{cmd}<返回/@goldrole>'
  );
end;

procedure _bindinggold;
begin
  if This_Player.GoldNum < 5000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你连5000金币都没有，我怎么帮你捆呢？\');
  end
  else if This_Player.GetBagItemCount('会员积分') >= 6 then
  begin
    This_Player.Take('会员积分',6);
    This_Player.DecGold(5000);
    This_Player.Give('会员积分包',1); 
    This_Npc.NpcDialog(This_Player,
    '已经帮你将6个积分捆成1个会员积分包，\如果你还有积分，我可以继续帮你捆成会员积分包。\ \'
    +'|{cmd}<继续捆/@bindinggold>\ \'
    +'|{cmd}<返回/@goldrole>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够的会员积分啊，没办法帮你捆成一包，\请继续努力吧。\ \|{cmd}<返回/@goldrole>');
  end;
end;

function xin(price, num: Integer):boolean; 
begin
   result := true;  
end;

procedure _zzyb;
begin
    This_NPC.NpcDialog(This_Player,
       '☆☆☆欢迎光临【笑傲武林】自助中心☆☆☆\|'              
     +' ☆☆本中心为了玩家自动吃包里小额元宝和灵符而设计☆☆\|'
     +' ☆☆下线后再次上线需要重新开启☆☆\|'
    +'{cmd}<开启/@kq> \');
end;

procedure kq;
begin
  if This_Player.GetBagItemCount('1灵符礼包') >0  then
  begin
      This_Player.Take('1灵符礼包', 1);
      This_Player.AddLF(1,1);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('2灵符礼包')>0  then
  begin
      This_Player.Take('2灵符礼包', 1);
      This_Player.AddLF(1,2);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('5灵符礼包')>0  then
  begin
      This_Player.Take('5灵符礼包', 1);
      This_Player.AddLF(1,5);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('10灵符礼包')>0  then
  begin
      This_Player.Take('10灵符礼包', 1);
      This_Player.AddLF(1,10);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('20灵符礼包')>0  then
  begin
      This_Player.Take('20灵符礼包', 1);
      This_Player.AddLF(1,20);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('50灵符礼包')>0  then
  begin
      This_Player.Take('50灵符礼包', 1);
      This_Player.AddLF(1,50);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('100灵符礼包')>0  then
  begin
      This_Player.Take('100灵符礼包', 1);
      This_Player.AddLF(1,100);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
   if This_Player.GetBagItemCount('1元宝')>0  then
  begin
      This_Player.Take('1元宝', 1);
      This_Player.ScriptRequestAddYBNum(1);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('2元宝')>0  then
  begin
      This_Player.Take('2元宝', 1);
      This_Player.ScriptRequestAddYBNum(2);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('5元宝')>0  then
  begin
      This_Player.Take('5元宝', 1);
      This_Player.ScriptRequestAddYBNum(5);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('10元宝')>0  then
  begin
      This_Player.Take('10元宝', 1);
      This_Player.ScriptRequestAddYBNum(10);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('20元宝')>0  then
  begin
      This_Player.Take('20元宝', 1);
      This_Player.ScriptRequestAddYBNum(20);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('20元宝')>0  then
  begin
      This_Player.Take('50元宝', 1);
      This_Player.ScriptRequestAddYBNum(50);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
      This_Player.CallOut(This_NPC,5,'kq');
end; 

procedure _kq;
begin
kq;
end;
Begin     
    This_Npc.NpcDialog(This_Player,
	'尊敬的传奇玩家你好，在这里我可以提供一些不破坏游戏 \|'
    +'公平性的会员功能，有利于保持服务器的健康运行。\|'
	+'周卡包含免费:\|'
	+'★地图传送★开启神力★每日福利★快速买药符等功能★\|'
	+'只需要<888元宝/c=red>,就可以享受一周的特殊服务!\|'
	
    +'|{cmd}<购买周卡/@zk>  ^<合成会员/@dhhy> \' 
    +'|{cmd}<查询周卡功能/@cx>  ^<自助元宝/@zzyb> \'
    );
end.