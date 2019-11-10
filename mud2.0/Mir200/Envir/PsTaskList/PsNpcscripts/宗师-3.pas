{
*******************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _exit;
begin
   This_Npc.CloseDialog(This_Player);
end;





Procedure domain;
var
  ZongS108, ZongS109 : integer;
Begin
   ZongS108 := This_Player.GetV(108,1);
   ZongS109 := This_Player.GetV(109,1);
   if ZongS109 = 4 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经见到盟重铁匠了么？\ \'+
      '|{cmd}<好的，我这就去/@doexit>\ \'
      +'|{cmd}<使用精元丹换取经验/@njingyuan>');
   end else if ZongS109 = 3 then
   begin
      This_Npc.NpcDialog(This_Player,
      '嗯，去找下盟重铁匠吧。他要推荐个老朋友给你认识！\ \'+
      '（任务目标：去见见盟重铁匠吧）\'+
      '|{cmd}<好的，我这就去/@Qitafenfu108_01>\ \'
      +'|{cmd}<使用精元丹换取经验/@njingyuan>');
   end else if ZongS109 = 2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '镇魔守将奉命镇守藏宝阁。那里面是我们的前辈们\'+
      '为了玛法的未来从城镇的废墟中抢救回来的物质。\'+
      '你要好好的利用！那么你找到乾坤令了么？\'+
      '（任务目标：进入藏宝阁，如果可能，请带回一个乾坤令。\'+
      '使用灵符有一定几率从密室守护兽身上挖取乾坤令）\'+
      '|{cmd}<我没有找到乾坤令。那是什么东西？/@CangBGe108_01>\'+
      '|{cmd}<这里是一个乾坤令，你看对么/@CangBGe108_02>？\'
      +'|{cmd}<使用精元丹换取经验/@njingyuan>');
   end else if ZongS109 = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '我再问你一遍，法师技能中有没有刺杀？\ \'+
      '|{cmd}<好像是有的/@KaoWo10801>！\'+
      '|{cmd}<没有！/@KaoWo10802>\ \'
      +'|{cmd}<使用精元丹换取经验/@njingyuan>');
   end else if ZongS108 = 19 then
   begin
      This_Npc.NpcDialog(This_Player,
      '是流浪汉介绍你来的？信里说是你帮他找回了他亲人的骸骨？\'+
      '也消灭了邪恶钳虫？嗯，不错，你是块好材料！这样吧！你先了解\'+
      '下人物技能都有哪些吧！如果已经了解了，那么我要考考你！\ \'+
      '|{cmd}<我已经了解了，你可以考我/@KaoWo108>\ \'
      +'|{cmd}<使用精元丹换取经验/@njingyuan>');
   end else
   begin
     This_Npc.NpcDialog(This_Player,
      '你先了解一下各个职业的技能，继续在玛法大陆上接受历练吧！\ \'
      +'|{cmd}<使用精元丹换取经验/@njingyuan>'); 
   end;
end;

procedure _njingyuan;
begin
  if This_Player.GetBagItemCount('精元丹') > 0 then
  begin
    This_Player.Take('精元丹',1);
    This_Player.Give('经验',400000);
    This_Npc.NpcDialog(This_Player,
      '你已经使用1个精元丹获得经验：400000，你还需要继续兑换吗？\ \'
      +'|{cmd}<继续使用精元丹换取经验/@njingyuan>\ \'
      +'|{cmd}<关闭/@doexit>'); 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '如果你带来了精元丹，就赶快交给我吧！\'
      +'我可以帮你兑换成经验！ \'); 
  end; 
end;

Procedure _KaoWo108;
begin
   if This_Player.GetV(108,1) = 19 then
   begin
      This_Player.Give('经验',400000);
      This_Npc.NpcDialog(This_Player,
      '请问法师技能中有没有刺杀？\ \'+
      '|{cmd}<好像是有的/@KaoWo10801>！\'+
      '|{cmd}<没有！/@KaoWo10802>');
      This_Player.SetV(108,1,100);
      This_Player.SetV(109,1,1);
      //#This_Player.DeleteTaskFromUIList(108);
      //#This_Player.AddTaskToUIList(109);
      This_Player.UpdateTaskDetail(109,1);
   end;
end;

Procedure _KaoWo10801;
begin
   This_Npc.NpcDialog(This_Player,
   '看来你没有仔细阅读技能啊！法师技能是没有刺杀的。\'+
   '年轻人，做事切不可心浮气躁！\'+
   '这样看来你还是需要多加修行才是！你去找<镇魔守将/@c=red>吧。\'+
   '就说是我让你进的！\'+
   '（任务目标：进入藏宝阁，如果可能，请带回一个乾坤令。\'+
   '使用灵符有一定几率从密室守护兽身上挖取乾坤令）\ \'+
   '|{cmd}<好的，我去藏宝阁找找看/@CangBGe108>');
end;

Procedure _KaoWo10802;
begin
   This_Npc.NpcDialog(This_Player,
   '不错，不错，你学习的很认真。接下来你要好好修习！\去找镇魔守将吧。就说是我让你进的！\'+
   '（任务目标：进入藏宝阁，如果可能，请带回一个乾坤令。\'+
   '使用灵符有一定几率从密室守护兽身上挖取乾坤令）\ \'+
   '|{cmd}<好的，我去藏宝阁找找看/@CangBGe108>');
end;

Procedure _CangBGe108;
begin
   if This_Player.GetV(109,1) = 1 then
   begin
      if This_Player.FreeBagNum >= 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '镇魔守将奉命镇守藏宝阁。那里面是我们的前辈们\'+
         '为了玛法的未来从城镇的废墟中抢救回来的物质。\'+
         '你要好好的利用！那么你找到乾坤令了么？\'+
         '（任务目标：进入藏宝阁，如果可能，请带回一个乾坤令。\'+
         '使用灵符有一定几率从密室守护兽身上挖取乾坤令）\ \'+
         '|{cmd}<我没有找到乾坤令。那是什么东西？/@CangBGe108_01>\'+
         '|{cmd}<这里是一个乾坤令，你看对么/@CangBGe108_02>？');
         This_Player.Give('经验',400000);
         This_Player.SetV(109,1,2);
         This_Player.UpdateTaskDetail(109,1);
      end else
      begin
        This_Npc.NpcDialog(This_Player,
        '你的包裹空间不够，我怎么送东西给你呢？'); 
      end;
   end;
end;     

Procedure _CangBGe108_01;
begin
   if This_Player.GetV(109,1) = 2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '没有找到乾坤令？没有关系，这个只是你试炼的第一步！\'+
      '那么你可能见到里面有1只密室守护兽。\ \'+ 
      '|{cmd}<好的，我记住了。请问你还有什么吩咐么？/@Qitafenfu108>');
      This_Player.Give('经验',400000);
      This_Player.SetV(109,1,3);
      //This_Player.UpdateTaskDetail(109,1);
   end;
end; 

Procedure _CangBGe108_02;
begin
   if This_Player.GetV(109,1) = 2 then
   begin
      if This_Player.GetBagItemCount('乾坤令') >= 1 then
      begin
         if This_Player.FreeBagNum >= 1 then
         begin
            This_Npc.NpcDialog(This_Player,
            '你已经找到乾坤令了？不错，不错，这个是给你的奖励。\'+
            '你应该见到里面有1只密室守护兽吧？\ \'+ 
            '|{cmd}<好的，我记住了。请问你还有什么吩咐么？/@Qitafenfu108>');
            This_Player.Give('经验',600000);
            This_Player.SetV(109,1,3);
            //This_Player.UpdateTaskDetail(109,1);
         end else
         begin
           This_Npc.NpcDialog(This_Player,
           '你的包裹空间不够，我怎么送东西给你呢？'); 
         end;
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '看来你没有找到乾坤令……\ \'+
         '|{cmd}<哦，我确实没有找到乾坤令，那是什么东西？/@CangBGe108_01>\');
      end;
   end; 
end; 

Procedure _Qitafenfu108;
begin
   if This_Player.GetV(109,1) = 3 then
   begin
      This_Npc.NpcDialog(This_Player,
      '嗯，去找下盟重铁匠吧。他要推荐个老朋友给你认识！\ \'+
      '（任务目标：去见见盟重铁匠吧）\'+
      '|{cmd}<好的，我这就去/@Qitafenfu108_01>');
   end;
end;

Procedure _Qitafenfu108_01;
begin
   if This_Player.GetV(109,1) = 3 then
   begin
      This_Player.SetV(109,1,4);
      This_Player.UpdateTaskDetail(109,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;    


Begin
   domain;
end.