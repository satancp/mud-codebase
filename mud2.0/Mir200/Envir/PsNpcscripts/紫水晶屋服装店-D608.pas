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
   '我只处理衣物。\'+
   '真正的工匠是不会什么都做的，\'+
   '什么都会做的，那肯定是骗子。。。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '看！活干的多漂亮啊，对不对 ？\ \ \' +
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
  This_NPC.AddStdMode(27);
  This_NPC.AddStdMode(28);
end;

procedure _normal;
begin
   This_Npc.NpcDialog(This_Player,
   '你找我有什么事情？\ \'+
   '|{cmd}<打听天工神剪的故事/@gongdian>\'+
   '|{cmd}<修补衣物/@repair>  '+addspace(' ',20)+'|{cmd}<特殊修理/@s_repair>\' +
   '|{cmd}<退出/@doexit>');
end;

//------------------------------------------------------------------------------
//成长任务
procedure _mission106_1_3;
begin
  if This_Player.GetV(106,1) = 3 then
  begin
    This_NPC.CloseDialog(This_Player);
  end
  else if This_Player.GetV(106,1) = 2 then
  begin
    This_Player.SetV(106,1,3);
    This_Player.SetV(106,2,0);
    This_Player.UpdateTaskDetail(106,1); 
    This_NPC.CloseDialog(This_Player);
  end
  else
  exit;
end;

procedure _mission106_1_3_fns;
begin
  if This_Player.GetV(106,1) = 5 then
  begin
    This_Npc.NpcDialog(This_Player,
    '东西收集齐了，记得交给药店老板，他就在盟重！\'
    +'（任务目标：杀死3只蜈蚣，并收集3个蜈蚣的毒囊。\'
    +'交给盟重的药店老板）\ \'
    +'|{cmd}<好的，我这就去/@doexit>'
    );
  end
  else if This_Player.GetV(106,1) = 4 then
  begin
    This_Npc.NpcDialog(This_Player,
    '拿到情报就可以向盟重老兵交差了。不过盟重有名的药店老板，\'
    +'在我来这里之前，曾经托我帮他收集3个蜈蚣的毒囊。\'
    +'他需要这种材料制造对抗兽人的毒药。等你收集齐了，\'
    +'就回盟重把毒囊带给药店老板吧！\'
    +'（任务目标：杀死3只蜈蚣）\ \'
    +'|{cmd}<好的，等我收集齐了，就把东西交给他/@doexit>'
    );
    This_Player.Give('经验',200000);
    This_Player.SetV(106,1,5);
    This_Player.UpdateTaskDetail(106,1);
    This_Player.SetV(106,3,0); 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你杀死了5只跳跳蜂，带来它们携带的情报了吗？\ \'
    ); 
  end;
end;
//------------------------------------------------------------------------------ 

Begin
   if This_Player.GetV(106,1) = 5 then
   begin
     This_Npc.NpcDialog(This_Player,
    '东西收集齐了，记得交给药店老板，他就在盟重！\'
    +'（任务目标：杀死3只蜈蚣，并收集3个蜈蚣的毒囊。\'
    +'交给盟重的药店老板）\ \'
    +'|{cmd}<好的，我这就去/@doexit>          ^<我有别的事情找你/@normal>' 
    );
   end
   else if This_Player.GetV(106,1) = 4 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你已经找到了情报了么？\'
     +'（任务目标：杀死跳跳蜂5只，并找到它们身上的情报，\'
     +'交给紫水晶屋的布衣店老板）\ \'
     +'|{cmd}<我已经找到了/@mission106_1_3_fns>\ \' 
     +'|{cmd}<我有别的事情找你/@normal>' 
     );
   end 
   else if This_Player.GetV(106,1) = 3 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你已经找到了情报了么？\'
     +'（任务目标：杀死跳跳蜂5只，并找到它们身上的情报，\'
     +'交给紫水晶屋的布衣店老板）\ \'
     +'|{cmd}<我正在找/@doexit>\ \' 
     +'|{cmd}<我有别的事情找你/@normal>' 
     );
   end
   else if This_Player.GetV(106,1) = 2 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你是怎么找到我的？……原来是老兵叫你来的。\'
     +'嗯，我这里的确出了些问题。我最近得知半兽人使用了一种新的生物\'
     +'跳跳蜂传递情报。这种生物比蝙蝠更难以抓捕，我想了很多法子，\'
     +'都没有办法逮到他们，所以一直没有给老兵消息，\'
     +'你可以帮我杀死跳跳蜂，把情报夺过来么？\'
     +'（任务目标：杀死跳跳蜂5只）\ \'
     +'|{cmd}<嗯，交给我吧！/@mission106_1_3>           ^<我有别的事情找你/@normal>' 
     );
   end
   else
   begin 
   This_Npc.NpcDialog(This_Player,
   '你找我有什么事情？\ \'+
   '|{cmd}<打听天工神剪的故事/@gongdian>\'+
   '|{cmd}<修补衣物/@repair>  '+addspace(' ',20)+'|{cmd}<特殊修理/@s_repair>\' +
   '|{cmd}<退出/@doexit>');
   end;
end.