{
*******************************************************************}

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
   '天工神剪可是我的师父，教会了我很多手艺，不过自从我学成\'+
   '出师之后，我也再也没有见过师父了，后来我才听师兄弟们说\'+
   '起好像师父失踪了，可能是被魔神囚禁了。我们都很焦急，不\'+
   '知你能不能帮助我们找到我们的师父，听说他被囚禁在地下宫\'+
   '殿，魔王为了不让人类前去营救，将魔兽都派去地下宫殿。当\'+
   '然，它们也带去了为数壮观的宝藏。作为报答，我们决定把从\'+
   '没公开过的技艺公布。\ \'+
   '|{cmd}<升级雷霆、光芒、烈焰套装的线索/@shengji>             ^<离开/@doexit>');
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '请放上去要修复的物品。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '修得还算不错。\ \ \' +
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
  This_Npc.SetRebate(200);

  //加载stdmode
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(27);
  This_NPC.AddStdMode(28);
end;

Procedure _Normal;
Begin
   This_Npc.NpcDialog(This_Player,
   '看你的衣服，很像打了很多猎的勇士。\'+
   '以我的能力，能为你做的事情就是帮你\'+
   '修复衣服和头盔，你需要修复衣服和头盔吗？\ \'+
   '|{cmd}<打听天工神剪的故事/@gongdian>\'+
   '|{cmd}<修复衣服/@repair> '+addspace(' ',22)+'|{cmd}<特殊修理/@s_repair>\' +
   '|{cmd}<退出/@doexit>');
end;

Procedure _XiangNian108;
Begin
   This_Npc.NpcDialog(This_Player,
   '我还是怀疑你真的有这等实力。\'+
   '这样吧，石墓五层的楔蛾是种很难对付的生物，而想要获得\'+
   '它们脱落的蛾翼更是需要运气！如果你能给我找来完整的蛾翼，\'+
   '我就相信你说的话！\'+
   '（任务目标：前往石墓五层，杀死楔蛾，获取完整的蛾翼）\ \'+
   '|{cmd}<哎，这人怎么这么死心眼呢！我这就想办法获取蛾翼吧。/@XiangNian108_01>');
end;

Procedure _XiangNian108_01;
Begin
   if This_Player.GetV(108,1) = 12 then
   begin
      This_Player.Give('经验',360000);
      This_Player.SetV(108,1,13);
      This_Player.SetV(108,6,0);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

Procedure _QianBeiDY108;
Begin
   if This_Player.GetV(108,1) = 14 then
   begin
      This_Player.Give('经验',360000);
      This_Player.SetV(108,1,15);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

var
  SMYF108 : integer;
Begin
   SMYF108 := This_Player.GetV(108,1);
   if SMYF108 = 15 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你去石墓阵通知首饰店保管员，让他收拾收拾，我们弟兄也该团聚了。\'+
      '（任务目标：深入石墓阵，找到首饰店保管员）\ \'+
      '|{cmd}<前辈答应回去了？太好了！我这就去找首饰店保管员/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if SMYF108 = 14 then
   begin
      This_Npc.NpcDialog(This_Player,
      '果真是完整的蛾翼。年轻人，看来你比我们几个老家伙都厉害啊！\'+
      '看来玛法这些年人才济济啊！好！好！你去石墓阵通知首饰店保管员，\'+
      '让他收拾收拾，我们弟兄也该团聚了。\'+
      '（任务目标：深入石墓阵，找到首饰店保管员）\ \'+
      '|{cmd}<前辈答应回去了？太好了！我这就去找首饰店保管员/@QianBeiDY108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if SMYF108 = 13 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经给我找来完整的蛾翼了么？\'+
      '（任务目标：前往石墓五层，杀死楔蛾，获取完整的蛾翼）\ \'+
      '|{cmd}<哎，这人怎么这么死心眼呢！我这就想办法获取蛾翼吧。/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if SMYF108 = 12 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经帮流浪汉找回他亲人的骸骨了？\'+
      '我看你年纪轻轻的，你真有这等实力？\ \'+
      '前辈，我只是运气好而已。还请前辈们都返回盟重吧！\'+
      '|{cmd}<流浪汉很想念你们！/@XiangNian108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else
   begin
      _Normal;
   end;
end.