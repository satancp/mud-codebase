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
   '我只管衣服，\'+
   '有实力的匠人不会做这个做那个的，\'+
   '只有没有实力的人才什么都做。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '你看，是不是很出色？\ \ \' +
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

procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载stdmode
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(27);
  This_NPC.AddStdMode(28);
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '你好，钱再好，我也不想再来这么危险的地方了，你知道上门\'+
   '修理其费用多高吗？价钱可是一般时候的两倍啊，我都这样说了，\'+
   '你还坚持的话，那么我就为你跑一趟，不过价贵所值是真的。\ \'+
   '|{cmd}<打听天工神剪的故事/@gongdian>\'+
   '|{cmd}<修补衣物/@repair>  '+addspace(' ',26)+'|{cmd}<特殊修理/@s_repair>\' +
   '|{cmd}<退出/@doexit>');
end.