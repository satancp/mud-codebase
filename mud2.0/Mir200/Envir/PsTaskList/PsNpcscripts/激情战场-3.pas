{
*******************************************************************}

Program Mir2;



Procedure _doexit;
begin
   This_NPC.CloseDialog(This_Player);
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
      '<的各种精妙的招式/c=red>！\ \'+
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

Procedure _exit;
begin
   This_NPC.CloseDialog(This_Player);
end;

Procedure _goout;
begin
   if This_Player.Level >= 11 then
   begin
      This_NPC.NpcDialog(This_Player,
      '我已经帮不了你什么了\'+
      '现在您可以自己去探索玛法大陆的秘密了。\ \'+
      '|{cmd}<我想知道玛法大陆最新的变化/@change>\ \'+
      '|{cmd}<离开/@exit>');
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '想去哪里呢？\ \'+
      '|{cmd}<附近/@gotob>\'+
      '|{cmd}<比奇城/@gotom>');
   end;
end;

Procedure _gotom;
var  
RM : integer;
begin
   if compareText(This_Player.MapName,'0') = 0 then
   begin
      RM := Random(6) + 1
      if RM = 6 then
      begin
         This_Player.Flyto('0',330,266);
      end else if RM = 5 then
      begin
         This_Player.Flyto('0',326,270);
      end else if RM = 4 then
      begin
         This_Player.Flyto('0',322,266);
      end else if RM = 3 then
      begin
         This_Player.Flyto('0',324,258);
      end else if RM = 2 then
      begin
         This_Player.Flyto('0',332,258);
      end else
      begin
         This_Player.Flyto('0',337,263);  
      end;
      This_NPC.CloseDialog(This_Player);  
   end;
end;

Procedure _gotob;
var  
RN : integer;
begin
   if compareText(This_Player.MapName,'0') = 0 then
   begin
      RN := Random(6) + 1
      if RN = 6 then
      begin
         This_Player.Flyto('0',611,586);
      end else if RN = 5 then
      begin
         This_Player.Flyto('0',608,589);
      end else if RN = 4 then
      begin
         This_Player.Flyto('0',604,593);
      end else if RN = 3 then
      begin
         This_Player.Flyto('0',607,596);
      end else if RN = 2 then
      begin
         This_Player.Flyto('0',610,593);
      end else
      begin
         This_Player.Flyto('0',615,588);
      end; 
      This_NPC.CloseDialog(This_Player); 
   end;
end;

Procedure _change;
begin
   This_NPC.NpcDialog(This_Player,
   '现在，在银杏山谷和边界山村都可以进行元宝锻造了，\'+
   '你只要找这些地方的<炼金师/c=red>就可以申请进行锻造。\ \'+
   '|{cmd}<返回/@main>');
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
   end;   }
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
   if This_Player.Level >= 25 then
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你已经正式毕业，\'+
      '请前往土城进行修炼。\ \'+
      '|{cmd}<返回/@gointo>');
   end else if This_Player.Level >= 0 then
   begin
      if compareText(This_Player.MapName,'0') = 0 then
         This_Player.RandomFlyTo('0139~13');
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '这位勇士，你的能力还不够，修炼场对你来说太危险了，\'+
      '你现在可以先去银杏山谷或者边界山村附近进行修炼。');
   end;
end;


procedure _heian;
begin
   if This_Player.MyLFnum >= 50 then
   begin
   if This_Player.Level >= 45 then
   begin
   This_Player.Flyto('f011',84 ,118);
   This_Npc.NpcNotice(This_Player.Name + '前往激情战场,寻找传说中的黄金武器去了！');
  begin
    This_Player.DecLF(0, 50, false); 
   end;
  end 
  else  
  begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不足45，不能前往。'
   );   
  end;  
 end 
 else
 begin
   This_Npc.NpcDialog(This_Player,
   '灵符不足。'
   ); 
    end;
    end;

begin
 // This_Npc.showbook(This_Player, 1, 0, '@gowolong'); 
  This_Npc.NpcDialog(This_Player,
   '激情战场，每6小时刷新一只恶魔，血量88888\ \' 
   +'防魔70-70，攻击100，可以爆出特殊黄金武器！\'
   +'|1.黄金裁决-攻击<5-45/c=red>，需要45级佩戴.\'
   +'|2.紫金嗜魂法杖-魔法<5-15/c=red>，需要45级佩戴.\'
   +'|3.赤金逍遥扇-道术<5-15/c=red>，需要45级佩戴.\'
   +'|需要<45级/c=red>以上才能进入,\'
   +'|进入消耗<50灵符/c=red>,\'
   +'|{cmd}<真的？我去看看！/@heian>'
    );  
end.  








   