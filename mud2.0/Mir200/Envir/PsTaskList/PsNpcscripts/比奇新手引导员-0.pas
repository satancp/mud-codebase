{
*******************************************************************}

Program Mir2;



Procedure _doexit;
begin
   This_NPC.CloseDialog(This_Player);
end;

Procedure _shuoming;
begin
   This_NPC.NpcDialog(This_Player,
   '|{cmd}<怎样使用商城元宝/@yuanbao>\'+
   '|{cmd}<怎样前往天关/@tianguan>\'+
   '|{cmd}<返回/@main>');
end;

Procedure _yuanbao;
begin
   This_NPC.NpcDialog(This_Player,
   '点击操作界面的“商铺”按钮，可以进入传奇商铺。\'+
   '充值购买的元宝，可以在商铺中购买任意种类的商城道具。\'+
   '|{cmd}<返回/@shuoming>');
end;

Procedure _tianguan;
begin
   This_NPC.NpcDialog(This_Player,
   '通过玛法大陆各地的老兵，可前往天庭。\'+
   '与天庭守卫对话，即可使用勇士卡内灵符免费前往天关。\'+
   '进入一次，勇士卡中的灵符相应的扣除一张。\'+
   '|{cmd}<返回/@shuoming>');
end;

Procedure _howuse;
begin
   This_NPC.NpcDialog(This_Player,
   '这是一张神奇的卡片，是专门为你这样的年轻人准备的。\'+
   '在22级之前可以帮助你尽快的成长，这也是所有玛法人的心愿，\'+
   '勇士卡中有一些金灿灿的“元宝”，可以在传奇商铺中购买物品。\'+
   '它们都是完全免费的，很快你就知道它们的大用途了！\'+
   '不用担心它们很快会用光，因为每当你的等级提升到一定阶段，\'+
   '勇士卡内的元宝数量还会不断增加。\'+
   '卡内还含有一些刻满了神秘文字的符咒，玛法人叫它“灵符”，\'+
   '使用灵符闯入危险重重的“天关”，将是你经历磨炼的第一步。\'+
   '|{cmd}<返回/@shuoming>');
end;

Procedure _guize;
begin
   This_NPC.NpcDialog(This_Player,
   '1) 目前，勇士卡只能在1-21级使用。\'+
   '达到22级之后，勇士卡不再显示，卡内元宝、卡内灵符也同时失效。\'+
   '2) 勇士卡内元宝，可用来购买特定的商城道具。\'+
   '点击操作界面右下角的“铺”按钮，可进入商铺购买相应道具。\'+
   '3) 勇士卡中的元宝只能本人使用，均无法交易。\ \'+
   '|{cmd}<下一页/@nextpage>                               ^<返回/@shuoming>');
end;

Procedure _nextpage;
begin
   This_NPC.NpcDialog(This_Player,
   '4) 随着你等级的提升，勇士卡中的元宝额度也会随之增加。\'+
   '—勇士卡内元宝的额度可以累积。\'+
   '上一个额度的元宝数量，将累计到下一个额度，直到你达到22级。\'+
   '5) 在你同时拥有勇士卡内元宝和充值元宝的情况下，\'+
   '购买商城道具将优先使用勇士卡内元宝。\ \'+
   '|{cmd}<下一页/@nextpage2>                              ^<上一页/@guize>');
end;

Procedure _nextpage2;
begin
   This_NPC.NpcDialog(This_Player,
   '6) 勇士卡内元宝，只能购买以下指定的商城道具：\'+
   '气血石(大)    幻魔石(大)    双倍秘籍\'+
   '气血石(中)    幻魔石(中)    双倍宝典\'+
   '气血石(小)    幻魔石(小)    双倍卷轴\'+
   '魔血石(大)    修复神水        比奇回城石\'+
   '7) 勇士卡内灵符可用来进入天关，与天庭内的天庭守卫对话，\'+
   '即可进入。\ \'+
   '|{cmd}<返回上一页/@nextpage>');
end;

Procedure _shengji;
begin
   This_NPC.NpcDialog(This_Player,
   '1级： 勇士卡内元宝 2个\'+
   '17级：勇士卡内元宝 4个\'+
   '21级：勇士卡内元宝 6个        勇士卡内灵符  1个\ \'+
   '|{cmd}<返回/@shuoming>');
end;

Procedure _gointo;
begin
   if This_Player.Level < 46 then
   begin
      This_NPC.NpcDialog(This_Player,
      '感谢您，你可以根据自身的实力选择进入修炼场进行修炼，\'+
      '但是需要提醒你，每个修炼场都有三层，危险程度一层比\'+
      '一层高，建议你携带足够补给药品后进入！\ \'+
      '|{cmd}<骷髅谷(适合15-22级)/@gointo17>\'+
      '|{cmd}<恶虫岛(适合23-30级)/@gointo28>\'+
      '|{cmd}<邪恶谷(适合31-39级)/@gointo35>\'+
      '|{cmd}<勇者殿堂(适合40-45级)/@gointo36>\'+
      '|{cmd}<返回/@main>');
   end;
   
  { if (This_Player.GetV(111,15) = 1) and (This_Player.Level < 46) then
   begin
      if This_Player.SetV(111,15,10) then
      begin
         This_Player.Give('经验',10000);
         This_Player.PlayerNotice('你已经完成了成长之路：勇者的试炼任务。',2);
         //#This_Player.DeleteTaskFromUIList(1015);
      end;
   end; }
end;

Procedure _gointo36;
begin
   if This_Player.Level >= 46 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力已经得到了提升，\'+
      '这里的修炼场已经不再适合你，\'+
      '你可以前往玛法大陆各地，进行新的修炼！\ \'+
      '|{cmd}<返回/@gointo>');
   end else if This_Player.Level >= 40 then
   begin
      if compareText(This_Player.MapName,'0') = 0 then
         This_Player.RandomFlyTo('n111');
   end else if This_Player.Level >= 15 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，这个修炼场对你来说太危险了，\'+
      '你现在可以先去低级别的修炼场进行修炼。\ \'+
      '|{cmd}<返回/@gointo>');
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，修炼场对你来说太危险了，\'+
      '你现在可以先去银杏山谷或者边界山村附近进行修炼。');
   end;
end;

Procedure _gointo35;
begin
   if This_Player.Level >= 40 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力已经得到了提升，\'+
      '这里已经不再适合你，你可以前往下一个修炼场进行修炼。\ \'+
      '|{cmd}<返回/@gointo>');
   end else if This_Player.Level >= 31 then
   begin
      if compareText(This_Player.MapName,'0') = 0 then
         This_Player.RandomFlyTo('n103');
   end else if This_Player.Level >= 15 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，这个修炼场对你来说太危险了，\'+
      '你现在可以先去15--22级或23--30级的修炼场进行修炼。\ \'+
      '|{cmd}<返回/@gointo>');
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，修炼场对你来说太危险了，\'+
      '你现在可以先去银杏山谷或者边界山村附近进行修炼。');
   end;
end;

Procedure _gointo28;
begin
   if This_Player.Level >= 31 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力已经得到了提升，\'+
      '这里已经不再适合你，你可以前往下一个修炼场进行修炼。\ \'+
      '|{cmd}<返回/@gointo>');
   end else if This_Player.Level >= 23 then
   begin
      if compareText(This_Player.MapName,'0') = 0 then
         This_Player.RandomFlyTo('n106');
   end else if This_Player.Level >= 15 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，这个修炼场对你来说太危险了，\'+
      '你现在可以先去15--22级的修炼场进行修炼。\ \'+
      '|{cmd}<返回/@gointo>');
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，修炼场对你来说太危险了，\'+
      '你现在可以先去银杏山谷或者边界山村附近进行修炼。');
   end;
end;


Procedure _gointo17;
begin
   if This_Player.Level >= 23 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力已经得到了提升，\'+
      '这里已经不再适合你，你可以前往下一个修炼场进行修炼。\ \'+
      '|{cmd}<返回/@gointo>');
   end else if This_Player.Level >= 15 then
   begin
      if compareText(This_Player.MapName,'0') = 0 then
         This_Player.RandomFlyTo('n102');
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，修炼场对你来说太危险了，\'+
      '你现在可以先去银杏山谷或者边界山村附近进行修炼。');
   end;
end;

Procedure _sdhero;
begin
   This_NPC.NpcDialog(This_Player,
   '只要你达到11级，就可以通过各大城市的之门去之地，\'+
   '在那里找到圣地使者了解和学习内功，\'+
   '同样那里也可以带你的学会内功！\'+
   '当然，你也可以通过去寻找高级战士、高级魔法师以及高级道士，\'+
   '通过他们的考验来学习内功。\ \'+
   '|{cmd}<返回/@main>');
end;


//==============================================================新手任务 
Procedure dorenwu2;
begin
   if 1 = 1 then
   begin
      This_NPC.NpcDialog(This_Player,
      '年轻的勇士，很高兴见到你，我已经听说了你的事情，现在\'+
      '我为你准备了一本<技能书/c=red>，相信会对你今后的历练有所帮助的！\ \ \'+
      '|{cmd}<我接受(任务)/@renwu3>\');
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '年轻的勇士，很高兴见到你，我已经听说了你的事情，现在\'+
      '我为你准备了一本<技能书/c=red>，相信会对你今后的历练有所帮助的！\'+
      '同时我可以帮助你学会内功，打下内力修为的根基，\'+
      '等你将来游历到了<盟重土城/c=red>，可以去<找内功宗师精修内功/c=red>\'+
      '|{cmd}<的各种精妙的招式/c=red>！\ \'+
      '|{cmd}<我接受(任务)/@renwu3>\');
   end;
end;

Procedure dorenwu3;
begin
 This_NPC.NpcDialog(This_Player,
 '打开你的包裹，将技能书放入相应的包裹内，双击后即可学习。\'+
 '当学习完技能后，打开主界面上的技能界面设定相应的快捷键\'+
 '便可开启和使用技能。接着去找任务使者吧！他还有重要的课程要\'+
 '教你呢！ \ \'+
 '|{cmd}<我接受(任务)/@renwu4>\'
 );
end;

Procedure dorenwu4;
begin
 This_NPC.NpcDialog(This_Player,
 '去找任务使者吧，他还有重要的课程要教你呢！ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 ); 
end;

Procedure dorenwu9;
begin
 This_NPC.NpcDialog(This_Player,
 '刚才邻里们都来跟我说你很热心的帮助了他们，我很高兴。\'+
 '看来我没有看错你！ 玛法大陆就是需要你这样的年轻人。\'+
 '不过你要学的东西还有很多！你愿意接着进行学习吗？\ \'+
 '|{cmd}<我接受(任务)/@renwu10>\'
 );
end;

procedure dorenwu11;
begin
 This_Npc.NpcDialog(This_Player,
 '去找一下<书店老板/c=red>吧！\'+
 '兴许他会有一些可以提升你实力的技能书\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;


Procedure _renwu4;
begin
 if (This_Player.GetV(101,1)=4) then
 begin
 This_NPC.NpcDialog(This_Player,
 '去找任务使者吧！他还有重要的课程要教你呢！ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 ); 
 end
 else if (This_Player.GetV(101,1)=3) then
 begin
 This_NPC.CloseDialog(This_Player);
 This_Player.SetV(101,1,4);           //任务标记
 This_Player.UpdateTaskDetail(101,1);  
 This_Player.Give('经验',500);
 //This_player.AutoGotoMap('0',332,263);//添加自动寻路 任务使者  
 end;   
end;

Procedure _renwu3;
var
  RWTem101 : integer;
begin
   RWTem101 := This_Player.GetV(101,1);
   if RWTem101 = 3 then
   begin 
      This_NPC.NpcDialog(This_Player,
      '打开你的包裹，将技能书放入相应的包裹内，\'+
      '双击后即可学习。当学习完技能后,打开主界面\'+
      '上的技能界面设定相应的快捷键便可开启和使用技能。\'+
      '接着去找任务使者吧！他还有重要的课程要教你呢！ \ \'+
      '|{cmd}<我接受(任务)/@renwu4>\');
   end else if RWTem101 = 2 then
   begin
      if This_Player.FreeBagNum < 3 then
      begin
         This_NPC.NpcDialog(This_Player,
         '请你先整理下你的背包再来找我！\ \'+
         '|{cmd}<好的/@doexit>\');
      end else
      begin
         if 1 = 1 then
         begin
            This_Player.SetV(101,1,3);           //任务标记 
            This_Player.UpdateTaskDetail(101,1); 
            //This_Player.AddGold(5000);
            This_Player.Give('经验',500);
            This_NPC.NpcDialog(This_Player,
            '打开你的包裹，将技能书放入相应的包裹内，\'+
            '双击后即可学习。当学习完技能后,打开主界面\'+
            '上的技能界面设定相应的快捷键便可开启和使用技能。\'+
            '接着去找任务使者吧！他还有重要的课程要教你呢！ \ \'+
            '|{cmd}<我接受(任务)/@renwu4>\');
            if This_Player.Job = 0 then
            begin
               This_Player.Give('基本剑术',1);
            end else
            if This_Player.Job = 1 then
            begin
               This_Player.Give('火球术',1);
            end else
            begin   
               This_Player.Give('治愈术',1);
               This_Player.Give('精神力战法',1);
            end;   
         end else
         begin
            This_Player.SetV(101,1,3);           //任务标记 
            This_Player.UpdateTaskDetail(101,1); 
            //This_Player.AddGold(5000);
            This_Player.Give('经验',500);
            This_NPC.NpcDialog(This_Player,
            '打开你的包裹，将技能书放入相应的包裹内，\'+
            '双击后即可学习。当学习完技能后,打开主界面\'+
            '上的技能界面设定相应的快捷键便可开启和使用技能。\'+
            '接着去找任务使者吧！他还有重要的课程要教你呢！ \ \'+
            '|{cmd}<我接受(任务)/@renwu4>\');
            //This_NPC.EnableForce(This_Player, True);
            if This_Player.Job = 0 then
            begin
               This_Player.Give('基本剑术',1);
            end else
            if This_Player.Job = 1 then
            begin
               This_Player.Give('火球术',1);
            end else
            begin   
               This_Player.Give('治愈术',1);
               This_Player.Give('精神力战法',1);
            end;              
         end;         
      end;
   end; 
end;

Procedure _renwu10;
begin
 This_NPC.NpcDialog(This_Player,
 '要成为真正的勇士，光靠装备是不行的，去找一下书店老板吧！\'+
 '兴许他会有一些可以提升你实力的技能书，若你的等级达到\'+
 '学习技能的标准。可以向书店老板购买一本学习！\ \'+
 '|{cmd}<我接受(任务)/@renwu11>\'
 );
end;

procedure _renwu11;
begin
 if (This_Player.GetV(102,1)=6) then
 begin
  This_Npc.NpcDialog(This_Player,
 '去找一下书店老板吧！\'+
 '兴许他会有一些可以提升你实力的技能书。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(102,1,6);        //任务标记
  This_Player.UpdateTaskDetail(102,1);
  This_Player.Give('经验',2500);
  This_Npc.CloseDialog(This_Player);
  //This_player.AutoGotoMap('0',325,249);//自动寻路书店老板 
 end;  
end; 
//======================================================================= 


procedure domain;
var
  BXS102, BXS101 : integer;
begin
   BXS102 := This_Player.GetV(102,1);
   BXS101 := This_Player.GetV(101,1);
   if ((BXS102 >= 5) and (BXS102 <= 6)) or ((BXS101 >= 2) and (BXS101 <= 4)) then
   begin
      This_NPC.NpcDialog(This_Player,
      '为了抵御半兽人军团的袭击，国王特别开辟的勇士修炼场，\'+
      '凡45级以下勇士可以从我这里进入修炼场进行修炼，\'+
      '为了大家的安全，每次进入修炼场需要勇士们自行携带药品。\ \'+
      '|{cmd}<我要进行修炼/@gointo>\'
      //+'|{cmd}<成长任务：如何成为玛法勇士/@ExtraBQSD>\'
      );
   end else
   begin
      if This_Player.Level >= 46 then
      begin
         This_NPC.NpcDialog(This_Player,
         '知道你脚下的土地，有过多少辉煌的历史吗？\'+
         '这里的人们曾经和半兽人殊死搏斗，\'+
         '这里也是唯一没有被半兽人攻破的城池。\'+
         '一代代的在这里孕育成长，\'+
         '相信总有一天，你也会成为其中的一员！\');
      end else
      begin
         This_NPC.NpcDialog(This_Player,
         '为了抵御半兽人军团的袭击，国王特别开辟的勇士修炼场，\'+
         '凡45级以下勇士可以从我这里进入修炼场进行修炼，\'+
         '为了大家的安全，每次进入修炼场需要勇士们自行携带药品。\ \'+
         '|{cmd}<我要进行修炼/@gointo>\');
      end;
   end;
end;

Procedure _ENSGoZY;
var
f : integer;
Begin
   if This_Player.GetBagItemCount('恩师帖') < 1 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你没有恩师帖，我不能送你去庄园.');
   end else 
   begin
     if compareText(This_Player.MapName, '0') = 0 then
     begin
      f := random(5);
      if  f = 4 then
      begin
        This_Player.Flyto('GA0',70,71);
      end;
      if  f = 3 then
      begin
        This_Player.Flyto('GA0',73,64);
      end;
        if  f = 2 then
      begin
        This_Player.Flyto('GA0',73,69);
      end;
      if  f = 1 then
      begin
        This_Player.Flyto('GA0',62,72);
      end;  
      if  f = 0 then
      begin
        This_Player.Flyto('GA0',61,64);
      end;
     end;
   end;
end;

procedure _lingyi();
begin
  This_Npc.NpcDialog(This_Player,
  '你是前来领取恩施帖的吧，我马上给你，不过\'
  +'请您先预留足够的包裹空间，否则，不能正常领取可不要怪我哦！\ \'
  +'我确认有足够包裹空间，<领取恩师贴/@ReqPodPrize>\ \'
  );
end;

procedure _ReqPodPrize();
begin
  //领取活动奖励 
  This_Npc.ReqPopGift(This_Player);
end;

procedure _ExtraBQSD;
var
  BXS102, BXS101 : integer;
begin
   BXS102 := This_Player.GetV(102,1);
   BXS101 := This_Player.GetV(101,1);
   if BXS102 = 6 then
   begin
      dorenwu11;
   end else if BXS102 = 5 then
   begin
      dorenwu9;
   end else if BXS101 = 4 then
   begin 
      dorenwu4;
   end else if BXS101 = 3 then
   begin
      dorenwu3;
   end else if BXS101 = 2 then
   begin
      dorenwu2;
   end;
end;

begin
   domain;
end.