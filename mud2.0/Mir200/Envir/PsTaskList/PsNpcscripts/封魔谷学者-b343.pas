{
*******************************************************************}
Program Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _help33;
begin
   This_Npc.NpcDialog(This_Player,
   '施毒术你可以按如下步骤修炼：\'+
   'Lv.1 : 你可以在第 14 级开始修炼.\'+
   'Lv.2 : 你可以在第 17 级开始修炼.\'+
   'Lv.3 : 你可以在第 20 级开始修炼.\ \'+
   '|{cmd}<返回/@helpbooks>');
end;

procedure _help32;
begin
   This_Npc.NpcDialog(This_Player,
   '精神力战法你可以按如下步骤修炼：\'+
   'Lv.1 : 你可以在第 9 级开始修炼.\'+
   'Lv.2 : 你可以在第 13 级开始修炼.\'+
   'Lv.3 : 你可以在第 19 级开始修炼.\ \'+
   '|{cmd}<返回/@helpbooks>');
end;

procedure _help31;
begin
   This_Npc.NpcDialog(This_Player,
   '治愈术你可以按如下步骤修炼：\'+
   'Lv.1 : 你可以在第 7 级开始修炼.\'+
   'Lv.2 : 你可以在第 11 级开始修炼.\'+
   'Lv.3 : 你可以在第 16 级开始修炼. \ \'+
   '|{cmd}<返回/@helpbooks>');
end;

procedure _help22;
begin
   This_Npc.NpcDialog(This_Player,
   '大火球你可以按如下步骤修炼：\'+
   'Lv.1: 你可以在第 19 级开始修炼。\'+
   'Lv.2: 你可以在第 23 级开始修炼。\'+
   'Lv.3: 你可以在第 25 级开始修炼。\ \'+
   '|{cmd}<返回/@helpbooks>');
end;

procedure _help21;
begin
   This_Npc.NpcDialog(This_Player,
   '火球术你可以按如下步骤修炼：\'+
   'Lv.1: 你可以在第 7 级开始修炼。\'+
   'Lv.2: 你可以在第 11 级开始修炼。\'+
   'Lv.3: 你可以在第 16 级开始修炼。\ \'+
   '|{cmd}<返回/@helpbooks>');
end;

procedure _help12;
begin
   This_Npc.NpcDialog(This_Player,
   '攻杀剑术你可以按如下步骤修炼：\'+
   'Lv.1 : 你可以在第 19 级开始修炼。\'+
   'Lv.2 : 你可以在第 22 级开始修炼。\' +
   'Lv.3 : 你可以在第 24 级开始修炼。\ \'+
   '|{cmd}<返回/@helpbooks>');
end;

procedure _help11;
begin
   This_Npc.NpcDialog(This_Player,
   '基本剑术你可以按如下步骤修炼：\'+
   'Lv.1 : 你可以在第 7 级开始修炼\'+
   'Lv.2 : 你可以在第 11 级开始修炼\' +
   'Lv.3 : 你可以在第 16 级开始修炼\ \' +
   '|{cmd}<返回/@helpbooks>');
end;

Procedure _helpbooks;
begin
   This_Npc.NpcDialog(This_Player,
   '你对那种书感兴趣？\ \'+
   '武士可以学<基本剑术/@help11>和<攻杀剑术/@help12>，\'+
   '魔法师可以学<火球术/@help21>和<大火球/@help22>，\'+
   '道士可以学 <治愈术/@help31>、<精神力战法/@help32>和<施毒术/@help33>。\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我看看你的书。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;

Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '请选择你想要买的书。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;

procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);
  //加载道具
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
  This_NPC.FillGoods('中秋礼包', 1000, 1);
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
  //加载stdmode
  This_NPC.AddStdMode(3);
  This_NPC.AddStdMode(4);
end;

Procedure _jineng;
Begin
   This_Npc.NpcDialog(This_Player,
   '你想要知道什么武功秘笈呢？\ \'+
   '|{cmd}<狮子吼/@shizihou>               ^<无极真气/@wuji>\'+
   '|{cmd}<灭天火/@tianhuo>               ^<寒冰掌/@hanbing>               ^<气功波/@qigong>\'+
   '|{cmd}<返回/@main>');
end;

Procedure _qigong;
Begin
   This_Npc.NpcDialog(This_Player,
   '<气功波/c=red>\'+
   '过去，气功术被认为是一种内功的修炼，而并非应用于实战之中。\'+
   '直到一位方士在潜心研究后，对气功术进行改良，发明了气功波\'+
   '从而起到推开周围的怪物而得以防身的作用。\ \'+
   '|{cmd}<返回/@jineng>                               ^<退出/@doexit>');
end;

Procedure _hanbing;
Begin
   This_Npc.NpcDialog(This_Player,
   '<寒冰掌/c=red>\'+
   '据说精通此术者，不但能使对方受到极大的冰冻伤害，并且其巨大的\'+
   '威力跟能将人震出数里之外，让敌人的身心皆受到震撼。\'+
   '传说会这套掌法的天虹法师在寻找传人，不知道他是否找到。\ \'+
   '|{cmd}<返回/@jineng>                               ^<退出/@doexit>');
end;

Procedure _tianhuo;
Begin
   This_Npc.NpcDialog(This_Player,
   '<灭天火/c=red>\'+
   '从前武林中流传着一种火焰魔法的武功流派，\'+
   '在实际攻击时火焰升起的样子看起来仿佛是联想到龙升天。\'+
   '在一场武林浩劫后，灭天火彻底断脉。 \'+
   '最近其武功秘籍在一个深山洞里被发现，因此重新流传到世上。\ \'+
   '|{cmd}<返回/@jineng>                               ^<退出/@doexit>');
end;

Procedure _wuji;
Begin
   This_Npc.NpcDialog(This_Player,
   '<无极真气/c=red>\'+
   '传说由白日门的首任天尊所创，由于年代久远渐渐失传，这套术法\'+
   '据说是通过精神挪移之法，将自己的召唤兽的能力转移到自己身上\'+
   '所以这种技能又被人称为不死真气。\ \'+
   '|{cmd}<返回/@jineng>                               ^<退出/@doexit>');
end;

Procedure _shizihou;
Begin
   This_Npc.NpcDialog(This_Player,
   '<狮子吼/c=red>\'+
   '这是一种非常强大的技能，使用者必须拥有极其强大的力量和毅力，\'+
   '一旦学会便可一骑当千，万军之中取敌将首级如探囊取物。\'+
   '可是他带来的副作用也极其强大，传说过分使用者自身也会受到影响。\'+
   '据说原来的牛魔王也曾会用这种技能，难道.....\ \'+
   '|{cmd}<返回/@jineng>                               ^<退出/@doexit>');
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '封魔谷的诅咒终于消失了？众人都变回了原来的样子，\'+
   '到底发生了什么事情呢？\ \'+
   '|{cmd}<买书/@buy>                         ^<卖书/@sell>   \'+
   '关于<传说中的技能/@jineng>             ^<询问各种武技的细节/@helpbooks> \'+
   '|{cmd}<退出/@doexit>');
end.
