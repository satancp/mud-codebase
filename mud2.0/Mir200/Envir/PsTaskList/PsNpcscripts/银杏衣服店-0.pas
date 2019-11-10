{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务

procedure _renwu7;
begin
   if This_Player.GetV(102,1) = 3 then
   begin
      This_Npc.NpcDialog(This_Player,
      '麻烦你去找一下武器店老板，让他帮我赶制一些针，\'+
      '我急着要用呢！可别不当一回事情\'+
      '虽然只是个跑腿的小事，却是关系很大的！\ \'+
      '|{cmd}<我这就去(任务)/@doexit>\');
   end
   else if This_Player.FreeBagNum >= 3 then
   begin
      This_Player.SetV(102,1,3);        //任务标记
      This_Player.UpdateTaskDetail(102,1);
      This_Player.Give('经验',800);
      This_Player.Give('新手头盔',1);
      This_Npc.CloseDialog(This_Player);
      if This_Player.Gender =0 then
      begin
         This_Player.Give('新手盔甲(男)',1); 
      end else
      begin
         This_Player.Give('新手盔甲(女)',1);
      end; 
   end else
   begin 
      This_NPC.NpcDialog(This_Player,
      '请你先整理下你的背包再来找我！\ \'+
      '|{cmd}<好的/@doexit>\');
   end;  
end;
//==============================================================新手任务 

procedure domain;
var
  temp1: integer;
begin
   if This_Player.GetV(102,1) = 2 then 
   begin
      This_Npc.NpcDialog(This_Player,
      +'感谢光临。请问有什么事情帮忙吗？\ \'
      +'|{cmd}<打听天工神剪的故事/@gongdian>             \'//^<成长任务：如何成为玛法勇士/@SCExtra>\'
      +'|{cmd}<买衣服/@buy>'+ addSpace('', 24) + '|{cmd}<修复衣服/@repair>\'
      +'|{cmd}<卖衣服/@sell>'+ addSpace('', 24) + '|{cmd}<特殊修理/@s_repair>\'
      +'|{cmd}<退出/@doexit>');
   end else
   begin
      temp1 := random(2);
      //弹出随机对话（二选一） 
      if temp1 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '刀剑无眼，盔甲有情，有了我裁缝，就多了一份安全。\'
         +'这位客官，我看您一脸福相，咱们这边说话。前两天我一个\'
         +'老客来修理一件烈焰魔衣，这小子走了大运了，听他说找到\'
         +'一个什么藏宝图，这个秘密一般人我可不告诉他.\'
         +'|{cmd}<打听天工神剪的故事/@gongdian>\'
         +'|{cmd}<买衣服/@buy>'+ addSpace('', 24) + '|{cmd}<修复衣服/@repair>\'
         +'|{cmd}<卖衣服/@sell>'+ addSpace('', 24) + '|{cmd}<特殊修理/@s_repair>\'
         +'|{cmd}<退出/@doexit>');
      end
      else
      begin
         This_Npc.NpcDialog(This_Player,
         +'感谢光临。请问有什么事情帮忙吗？\ \'
         +'|{cmd}<打听天工神剪的故事/@gongdian>\'
         +'|{cmd}<买衣服/@buy>'+ addSpace('', 24) + '|{cmd}<修复衣服/@repair>\'
         +'|{cmd}<卖衣服/@sell>'+ addSpace('', 24) + '|{cmd}<特殊修理/@s_repair>\'
         +'|{cmd}<退出/@doexit>');
      end;
   end;
end;

procedure _SCExtra;
begin
  if This_Player.GetV(102,1) = 2 then 
  begin
     This_Player.Take('线团',1);
     This_Npc.NpcDialog(This_Player,
     '是杂货店老板让你送来的吧！你真的是太热心了，看你面生，\'+
     '是不是正在历练中的新手啊！这些装备送你吧！另外麻烦你去\'+
     '找一下<武器店老板/c=red>，让他帮我赶制一些针，我急着要用呢！\ \'+
     '|{cmd}<我接受(任务)/@renwu7>\');
  end; 
end;
   
procedure _GongDian;
begin
  This_Npc.NpcDialog(This_Player,
  +'天工神剪可是我的师傅，教会了我很多手艺，\'
  +'不过自从我学成出师之后，我也再也没有见过师傅了，\'
  +'后来我才听师兄弟们说起好像师傅失踪了，可能是被魔神囚禁了。\'
  +'我们都很焦急，不知道你能不能帮助我们找到我们的师傅，\'
  +'听说他被囚禁在地下宫殿，\'
  +'魔王为了不让人类前去营救，将魔兽都派去地下宫殿，\'
  +'当然，它们也带去了为数壮观的宝藏。\'
  +'作为报答，我们决定把从没公开过的技艺公布。\'
  +'|{cmd}<升级雷霆、光芒、烈焰套装的线索/@shengji>'+ addSpace('', 10) + '|{cmd}<离开/@doexit>'
  );
end;

procedure _Shengji;
begin
  This_Npc.NpcDialog(This_Player,
  +'听说盟重土城的张家布店老板学会了一项技能，\'
  +'能够使用神秘配方对雷霆、光芒、烈焰系列进行升级和合成，\'
  +'不过我不知道具体的情况，要么您亲自去问一下她本人吧。\ \'
  +'|{cmd}<离开/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买什么样的衣服？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '把你要卖的衣服给我看看，我会给你个估价。\我们也经营头盔和帽子，所以如果你不用，\可以在这里卖掉它。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '这里修补衣服，头盔和鞋子\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '这个看上去已经修好了\ \ \ |{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \|{cmd}<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.AddStdMode(15);
  This_Npc.AddStdMode(27);
  This_Npc.AddStdMode(28);
  This_Npc.FillGoods('布衣(男)',50,1);
  This_Npc.FillGoods('布衣(女)',50,1);
  This_Npc.FillGoods('轻型盔甲(男)',50,1); 
  This_Npc.FillGoods('轻型盔甲(女)',50,1);
  This_Npc.FillGoods('中型盔甲(男)',50,1);
  This_Npc.FillGoods('中型盔甲(女)',50,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.