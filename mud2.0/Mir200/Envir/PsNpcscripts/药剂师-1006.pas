{********************************************************************

*******************************************************************}
PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


Procedure _makedrug;
Begin
   This_Npc.NpcDialog(This_Player,
   '请选择你要炼的药。\'+
   '对了，你炼药需要的材料带齐了吧？\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Makedrug(This_Player);
end;

Procedure _helpmakedrug;
begin
   This_Npc.NpcDialog(This_Player,
   '这里可以炼的药只有两种。\ \'+
   '|{cmd}<灰色毒粉的功能/@helpdrug1>\'+
   '|{cmd}<黄色毒粉的功能/@helpdrug2>\'+
   '|{cmd}<灰色毒粉的原料/@helpmakedrug1>\'+
   '|{cmd}<黄色毒粉的原料/@helpmakedrug2>\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _helpdrug1;
begin
   This_Npc.NpcDialog(This_Player,
   '道士用灰色毒粉施毒时，敌人中毒会减掉体力。\ \'+
   '|{cmd}<返回/@helpmakedrug>');
end;

Procedure _helpdrug2;
begin
   This_Npc.NpcDialog(This_Player,
   '道士用黄色毒粉施毒时，敌人中毒会降低防御能力。\ \'+
   '|{cmd}<返回/@helpmakedrug>');
end;

Procedure _helpmakedrug1;
begin
   This_Npc.NpcDialog(This_Player,
   '|制作灰色毒粉(少量)的原料是： <食人树的果子/@helpitem_1> 1个，\'+ 
   '毒蜘蛛牙齿 2个,食人树叶 4个。\'+
   '|制作灰色毒粉(中量)的原料是： <食人树的果子/@helpitem_1> 2个，\'+ 
   '毒蜘蛛牙齿 4个,食人树叶 8个。\'+
   '|制作灰色毒粉(大量)的原料是： <食人树的果子/@helpitem_1> 3个，\'+ 
   '毒蜘蛛牙齿 6个,食人树叶 12个。\ \'+
   '|{cmd}<返回/@helpmakedrug>');
end;


Procedure _helpmakedrug2;
begin
   This_Npc.NpcDialog(This_Player,
   '|制作黄色毒粉(少量)的原料是： <蛆卵/@helpitem_2> 1个, 蝎子尾\'+
   '1个, 食人树叶 4个。\'+
   '|制作黄色毒粉(中量)的原料是： <蛆卵/@helpitem_2> 2个, 蝎子尾\'+
   '2个, 食人树叶 8个。\'+
   '|制作黄色毒粉(大量)的原料是： <蛆卵/@helpitem_2> 3个, 蝎子尾\'+
   '3个, 食人树叶 12个。\ \'+
   '|{cmd}<返回/@helpmakedrug>');
end;

Procedure _helpitem_1;
begin
   This_Npc.NpcDialog(This_Player,
   '从食人花的身上，可以得到食人树的果子，\'+
   '但是恐怕每5个食人花中你才能得到一个果实。\ \'+
   '|{cmd}<返回/@helpmakedrug1>');
end;


Procedure _helpitem_2;
begin
   This_Npc.NpcDialog(This_Player,
   '抓到洞穴里的洞蛆，就可以得到蛆卵。\'+
   '长得像圆圆的茧。\ \'+
   '|{cmd}<返回/@helpmakedrug2>');
end;



procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);
  //加载道具
  This_NPC.FillGoods('灰色药粉(少量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 1, 1); 
  This_NPC.FillGoods('灰色药粉(中量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 1, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(大量)', 1, 1);
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(42);
end;




Begin
   This_Npc.NpcDialog(This_Player,
   '我们道士啊，就是心灵手巧。想当年我是有名的药师呢！\'+
   '对了，你来炼什么药啊？ \ \'+
   '|{cmd}<炼药/@makedrug>\'+
   '|{cmd}<我介绍点炼药的知识给你吧！听说明./@helpmakedrug>\'+
   '|{cmd}<退出/@doexit>');
end.