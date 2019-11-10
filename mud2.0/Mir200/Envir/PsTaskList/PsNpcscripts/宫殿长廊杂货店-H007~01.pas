{
/************************************************************************}



Program Mir2;


{$I common.pas}


PROCEDURE _shengji;
begin
   This_Npc.NpcDialog(This_Player,
   '听说盟重土城的张家布店老板学会了一项技能，能够使用\'+
   '神秘配方对雷霆、光芒、烈焰系列进行升级和合成，不过\'+
   '我不知道具体的情况，要么您亲自去问一下她本人吧。\ \'+
   '|{cmd}<离开/@doexit>\');
end;


Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _gongdian;
Begin
   This_Npc.NpcDialog(This_Player,
   '天工神剪可是我的师傅，教会了我很多手艺，不过自从我学成\'+
   '出师之后，我也再也没有见过师傅了后来我才听师兄弟们说起\'+
   '好像师傅失踪了，可能是被魔神囚禁了。我们都很焦急，不知\'+
   '道你能不能帮助我们找到我们的师傅，听说他被囚禁在地下宫\'+
   '殿，魔王为了不让人类前去营救，将魔兽都派去地下宫殿。当\'+
   '然，它们也带去了为数壮观的宝藏。作为报答，我们决定把从\'+
   '没公开过的技艺公布。\ \'+
   '|{cmd}<升级雷霆、光芒、烈焰套装的线索/@shengji>             ^<离开/@doexit>');
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您要修理吗？我可是个万能工匠哦！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '怎么样，修好了吧？看起来比新的还值钱！\ \' +
  '|{cmd}<返回/@main>');
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙，你可太幸运了，我正好有材料做特殊修补，\'+
   '但费用是普通的三倍！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_SRepair(This_Player);
end;


procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   '已经修理好了，看起来很不错嘛！\ \' +
   '|{cmd}<返回/@main>');
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我您要卖的物品。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;

procedure OnInitialize;
var
  i : integer;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
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
    This_NPC.FillGoods('地牢逃脱卷', 100, 1);
  This_NPC.FillGoods('随机传送卷', 100, 1);
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符(大)', 10, 1);  
  This_NPC.FillGoods('灰色药粉(中量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 10, 1);
  //加载stdmode 
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3); 
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(43);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;



Begin
   This_Npc.NpcDialog(This_Player, 
   '你竟然能跑到这里来？看在你这么卖命的份上，\'+
   '顺便告诉你一下，一旦进入迷宫，就再也不能回头了！\ \' +
   '|{cmd}<打听天工神剪的故事/@gongdian>\'+
   '|{cmd}<买/@buy>                            ^<卖/@sell>\' +
   '|{cmd}<修理/@repair>                          ^<特殊修理/@s_repair>\'+
   '|{cmd}<退出/@doexit>');
end.