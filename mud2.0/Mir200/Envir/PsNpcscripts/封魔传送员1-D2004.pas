{********************************************************************  

*******************************************************************}  
program mir2;  
  
{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas} 
  
procedure _DoExit;  
begin  
  This_Npc.CloseDialog(This_Player);  
end;  
  
procedure _Exit;  
begin  
  This_Npc.CloseDialog(This_Player);  
end;  
  
  
  
procedure _goToMonMap;  
begin  
    if This_Player.MapName = 'D2004' then  
    This_Player.Flyto('D2005',80 + random(3) - 1,80 + random(3) - 1);  
end;  
  
procedure domain;  
begin  
    This_NPC.NpcDialog(This_Player,  
    '这里通向满是野猪的封魔殿，\如果你在历练的过程中遇到<邪恶毒蛇、虹魔猪卫、虹膜蝎卫/c=red>，\就想办法击败它们吧，它们携带的各种宝物会使你背包满满的。\ \'   
    +'|{cmd}<前往光芒回廊/@goToMonMap>        \' 
    +'|{cmd}<购买物品/@buy>            ^<出售物品/@sell>\'
    +ActiveValidateStr  
    );  
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
 
procedure OnInitialize;  
begin  
  
  This_Npc.AddStdMode(22);  
  This_Npc.AddStdMode(23);  
  This_NPC.AddStdMode(0);  
  This_NPC.AddStdMode(25);  
  This_NPC.AddStdMode(30); 
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
  
    
  This_NPC.FillGoods('金创药(小量)', 100, 1); 
  This_NPC.FillGoods('魔法药(小量)', 100, 1);  
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
  
begin  
 domain;  
end.  