{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '感谢，你想买些武技修炼的书吗？\ \'
  +'|{cmd}<买书/@buy>  \'
  +'|{cmd}<卖书/@sell>   \'
  +'|{cmd}<询问各种武技的细节/@helpbooks> \ \'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请选择你想要买的书。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我看看你的书。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _drink;
begin
  This_Npc.NpcDialog(This_Player, 
    '当年为了抵抗半兽人的侵略，玛法人从遥远的东方请来了一名术士，\研制出一种特殊技能，这种特殊技能的作用在于修炼后将会在人体\本身产生一种隐性的能量，而它的神奇之处在于，当处于醉酒状态\时能够增强人体的体力，加强战斗力。随着历史的推延，玛法人早就\忘记了这本技能书的真正作用，你现在就可以去找盟重书店老板，\他可以帮你学习这个技能。\'
    );
end;

procedure _helpbooks;
begin
  This_Npc.NpcDialog(This_Player, 
    '你对那种书感兴趣？\ \武士可以学<基本剑术/@help11>和<攻杀剑术/@help12>\魔法师可以学<火球术/@help21>和<大火球/@help22>\道士可以学<治愈术/@help31>,<精神力战法/@help32>和<施毒术/@help33>\ \ |{cmd}<返回/@main>'
    );
end;

procedure _help11;
begin
  This_Npc.NpcDialog(This_Player, 
    '基本剑术你可以按如下步骤修炼：\Lv.1 : 你可以在第 7 级开始修炼\Lv.2 : 你可以在第 11 级开始修炼\Lv.3 : 你可以在第 16 级开始修炼\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help12;
begin
  This_Npc.NpcDialog(This_Player, 
    '攻杀剑术你可以按如下步骤修炼：\Lv.1 : 你可以在第 19 级开始修炼。\Lv.2 : 你可以在第 22 级开始修炼。\Lv.3 : 你可以在第 24 级开始修炼。\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help21;
begin
  This_Npc.NpcDialog(This_Player, 
    '火球术你可以按如下步骤修炼：\Lv.1: 你可以在第 7 级开始修炼。\Lv.2: 你可以在第 11 级开始修炼。\Lv.3: 你可以在第 16 级开始修炼。\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help22;
begin
  This_Npc.NpcDialog(This_Player, 
    '大火球你可以按如下步骤修炼：\Lv.1: 你可以在第 19 级开始修炼。\Lv.2: 你可以在第 23 级开始修炼。\Lv.3: 你可以在第 25 级开始修炼。\ \ |{cmd}<返回/@helpbooks>'
    );
end; 

procedure _help31;
begin
  This_Npc.NpcDialog(This_Player, 
    '治愈术你可以按如下步骤修炼：\Lv.1 : 你可以在第 7 级开始修炼.\Lv.2 : 你可以在第 11 级开始修炼.\Lv.3 : 你可以在第 16 级开始修炼.\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help32;
begin
  This_Npc.NpcDialog(This_Player, 
    '精神力战法你可以按如下步骤修炼：\Lv.1 : 你可以在第 9 级开始修炼.\Lv.2 : 你可以在第 13 级开始修炼.\Lv.3 : 你可以在第 19 级开始修炼.\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help33;
begin
  This_Npc.NpcDialog(This_Player, 
    '施毒术你可以按如下步骤修炼：\Lv.1 : 你可以在第 14 级开始修炼.\Lv.2 : 你可以在第 17 级开始修炼.\Lv.3 : 你可以在第 20 级开始修炼.\ \ |{cmd}<返回/@helpbooks>'
    );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_NPC.FillGoods('火球术', 100, 1);
  This_NPC.FillGoods('治愈术', 100, 1); 
  This_NPC.FillGoods('基本剑术', 100, 1);
  This_NPC.FillGoods('精神力战法', 100, 1);
  This_NPC.FillGoods('施毒术', 100, 1);
  This_NPC.FillGoods('大火球', 100, 1);
  This_NPC.FillGoods('抗拒火环', 100, 1);
  This_NPC.FillGoods('灵魂火符', 100, 1);
  This_NPC.FillGoods('雷电术', 100, 1);
  This_NPC.FillGoods('攻杀剑术', 100, 1);
  This_NPC.FillGoods('刺杀剑术', 100, 1); 
  This_NPC.FillGoods('半月弯刀', 100, 1);
  This_NPC.FillGoods('野蛮冲撞', 100, 1);
  This_NPC.FillGoods('烈火剑法', 100, 1);
  This_NPC.FillGoods('召唤骷髅', 100, 1);
  This_NPC.FillGoods('隐身术', 100, 1);
  This_NPC.FillGoods('集体隐身术', 100, 1);
  This_NPC.FillGoods('幽灵盾', 100, 1);
  This_NPC.FillGoods('神圣战甲术', 100, 1);
  This_NPC.FillGoods('心灵启示', 100, 1);
  This_NPC.FillGoods('困魔咒', 100, 1); 
  This_NPC.FillGoods('群体治愈术', 100, 1);
  This_NPC.FillGoods('召唤神兽', 100, 1);
  This_NPC.FillGoods('诱惑之光', 100, 1);
  This_NPC.FillGoods('地狱火', 100, 1);
  This_NPC.FillGoods('瞬息移动', 100, 1);
  This_NPC.FillGoods('爆裂火焰', 100, 1);
  This_NPC.FillGoods('火墙', 100, 1);
  This_NPC.FillGoods('疾光电影', 100, 1);
  This_NPC.FillGoods('地狱雷光', 100, 1);
  This_NPC.FillGoods('魔法盾', 100, 1);
  This_NPC.FillGoods('圣言术', 100, 1);
  This_NPC.FillGoods('冰咆哮', 100, 1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.    
