{********************************************************************

*******************************************************************}


program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    //if (random(10) = 0) and (This_Player.GetV(9,19) = 1)then
    if (random(10) = 0) and ((This_Player.GetV(11,1) = 3) or (This_Player.GetV(11,1) = 4))then
    begin
       //This_Player.SetV(9,20,1);
       This_Player.SetV(11,1,4);
       This_NPC.NpcDialog(This_Player,
       '你在找厨师吗？ \ '
       +'我对厨师也不是很了解。 \ '
       +'但是据说毒蛇山谷的米家服装老板知道此事，\'
       +'你可以去找他一下。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end
      else
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，有什么事情吗？\ \'
      +'|{cmd}<买东西/@buy>  \'
      +'|{cmd}<卖东西/@sell>  \'
      +'|{cmd}<询问/@questionprize> 有关东西 \'
      +'|{cmd}<退出/@doexit>');
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '需要购买什么东西？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想卖什么东西？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _questionprize;
begin
  This_Npc.NpcDialog(This_Player,
  '我们店有<地牢逃脱卷/@teleport>，|{cmd}<随机传送卷/@teleport2>，<修复油/@repairoil> 等等。\据说还有从妖怪身上拿到的<回城卷/@steleport>。\ \|{cmd}<返回/@main>'
  );
end;

procedure _steleport;
begin
  This_Npc.NpcDialog(This_Player,
  '回城卷据说来自远古的一种神奇卷轴。\'+
  '但不幸的是，现在已经丢失了。\'+
  '但我们听说有些怪物还有这种卷轴，\'+
  '如果使用它你可以立刻返回村庄。\ \'+
  '|{cmd}<返回/@questionprize>'
  );
end;

procedure _teleport;
begin
  This_Npc.NpcDialog(This_Player,
  '地牢逃脱卷是将自己瞬间移动到最后经过的村庄的咒文书，\当然和相比，它的威力还算弱，\但是救自己一条命，已经足够了。\ \|{cmd}<返回/@main>'
  );
end;

procedure _teleport2;
begin
  This_Npc.NpcDialog(This_Player,
  '随机传送卷是自己目前所在的地图，也就是在或在店里面，\可以移动到任何地方的咒文书。\尽管比较危险，但是还剩很多药的话，\使用这个，会对你打猎有帮助的。\ \|{cmd}<返回/@main>'
  );
end;

procedure _repairoil;
begin
  This_Npc.NpcDialog(This_Player,
  '修复油是提高自己拿着的武器的耐久力的油。\但是因为没有特殊修理的效果，\用修理油修理的武器的耐久力会越来越小。\如果不是很贵的武器，带着一个用来做修理，\会对你长久时间打猎有帮助。\ \|{cmd}<返回/@main>'
  );
end; 

//初始化操作
procedure OnInitialize; 
begin 
 
  This_Npc.AddStdMode(22); 
  This_Npc.AddStdMode(23); 
  This_NPC.AddStdMode(0); 
  This_NPC.AddStdMode(25); 
  This_NPC.AddStdMode(42); 
  This_Npc.AddStdMode(3); 
  This_NPC.AddStdMode(5); 
  This_NPC.AddStdMode(6); 
  This_NPC.AddStdMode(43); 
  This_NPC.AddStdMode(4); 
  This_NPC.AddStdMode(10); 
  This_NPC.AddStdMode(11); 
  This_NPC.AddStdMode(15); 
  This_Npc.AddStdMode(24); 
  This_Npc.AddStdMode(26); 
  This_Npc.AddStdMode(19); 
  This_Npc.AddStdMode(20); 
  This_Npc.AddStdMode(21); 
 
   
    This_NPC.FillGoods('金创药(小量)', 200, 1); 
    This_NPC.FillGoods('魔法药(小量)', 200, 1);  
    This_NPC.FillGoods('金创药(中量)', 100, 1); 
    This_NPC.FillGoods('魔法药(中量)', 100, 1); 
    This_NPC.FillGoods('强效金创药', 100, 1); 
    This_NPC.FillGoods('强效魔法药', 100, 1); 
    This_NPC.FillGoods('金创药(小)包', 100, 1); 
    This_NPC.FillGoods('魔法药(小)包', 100, 1); 
    This_NPC.FillGoods('金创药(中)包', 100, 1); 
    This_NPC.FillGoods('魔法药(中)包', 100, 1);   
    This_NPC.FillGoods('超级金创药', 100, 1); 
    This_NPC.FillGoods('超级魔法药', 100, 1);   
    This_Npc.FillGoods('地牢逃脱卷',100,1);  
    This_Npc.FillGoods('随机传送卷',100,1);  
    This_Npc.FillGoods('护身符',100,1);   
  This_NPC.FillGoods('灰色药粉(少量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 1, 1); 
  This_NPC.FillGoods('灰色药粉(中量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 1, 1);
      
    This_NPC.FillGoods('木剑', 50, 1);  
    This_NPC.FillGoods('青铜剑', 50, 1);   
    This_NPC.FillGoods('铁剑', 50, 1);  
    This_NPC.FillGoods('短剑', 50, 1);  
    This_NPC.FillGoods('匕首', 50, 1);  
    This_NPC.FillGoods('海魂', 50, 1); 
    This_NPC.FillGoods('八荒', 50, 1); 
    This_NPC.FillGoods('半月', 50, 1); 
    This_NPC.FillGoods('凌风', 10, 1);   
    This_NPC.FillGoods('偃月', 10, 1); 
    This_NPC.FillGoods('破魂', 10, 1); 
    This_NPC.FillGoods('降魔', 10, 1); 
    This_NPC.FillGoods('斩马刀', 10, 1); 
    This_NPC.FillGoods('修罗', 50, 1); 
    This_NPC.FillGoods('凝霜', 50, 1); 
      
    This_Npc.FillGoods('古铜戒指',3,3);  
    This_Npc.FillGoods('六角戒指',3,3);  
    This_Npc.FillGoods('玻璃戒指',3,3);  
     
    This_Npc.FillGoods('皮制手套',5,1); 
    This_Npc.FillGoods('小手镯',3,3); 
    This_Npc.FillGoods('银手镯',3,3); 
    This_Npc.FillGoods('铁手镯',3,3); 
    This_Npc.FillGoods('死神手套',3,3); 
    This_Npc.FillGoods('魔法手镯',3,3);  
     
    This_Npc.FillGoods('青铜头盔',5,1); 
    This_Npc.FillGoods('道士头盔',5,1); 
    This_Npc.FillGoods('布衣(男)',50,1); 
    This_Npc.FillGoods('布衣(女)',50,1); 
    This_Npc.FillGoods('轻型盔甲(男)',50,1);  
    This_Npc.FillGoods('轻型盔甲(女)',50,1); 
    This_Npc.FillGoods('中型盔甲(男)',50,1); 
    This_Npc.FillGoods('中型盔甲(女)',50,1); 
    
    This_NPC.FillGoods('火球术', 100, 1); 
    This_NPC.FillGoods('治愈术', 100, 1); 
    This_NPC.FillGoods('基本剑术', 100, 1); 
    This_NPC.FillGoods('精神力战法', 100, 1); 
    This_NPC.FillGoods('大火球', 100, 1); 
    This_NPC.FillGoods('攻杀剑术', 100, 1); 
    This_NPC.FillGoods('施毒术', 100, 1); 
    This_NPC.FillGoods('抗拒火环', 100, 1); 
    This_NPC.FillGoods('地狱火', 100, 1); 
    This_NPC.FillGoods('雷电术', 100, 1); 
    This_NPC.FillGoods('疾光电影', 100, 1); 
    This_NPC.FillGoods('灵魂火符', 100, 1); 
    This_NPC.FillGoods('幽灵盾', 100, 1); 
    This_NPC.FillGoods('神圣战甲术', 100, 1); 
    This_NPC.FillGoods('刺杀剑术', 100, 1); 
    This_NPC.FillGoods('困魔咒', 100, 1); 
    This_NPC.FillGoods('召唤骷髅', 100, 1); 
    This_NPC.FillGoods('隐身术', 100, 1); 
    This_NPC.FillGoods('集体隐身术', 100, 1); 
    This_NPC.FillGoods('诱惑之光', 100, 1); 
    This_NPC.FillGoods('瞬息移动', 100, 1); 
    This_NPC.FillGoods('火墙', 100, 1); 
    This_NPC.FillGoods('爆裂火焰', 100, 1); 
    This_NPC.FillGoods('地狱雷光', 100, 1); 
    This_NPC.FillGoods('半月弯刀', 100, 1); 
    This_NPC.FillGoods('野蛮冲撞', 100, 1); 
    This_NPC.FillGoods('心灵启示', 100, 1); 
    This_NPC.FillGoods('群体治愈术', 100, 1); 
    This_NPC.FillGoods('魔法盾', 100, 1); 
    This_NPC.FillGoods('圣言术', 100, 1); 
   
  This_Npc.SetRebate(100); 
end; 

//脚本执行的入口
begin
  domain;
end.