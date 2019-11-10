{********************************************************************
* 单元名称：英雄地长老  hero-hero001

* 摘    要：
* 备    注：用到任务号12的1，2，3号变量

*******************************************************************}


program mir2;


procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _BuHero1;
begin
   This_Player.SetV(12,3,1);
   This_Npc.InputDialog(This_Player,'请输入英雄的名字：',0,101);
end;

procedure _BuHero2;
begin
   This_Player.SetV(12,3,2);
   This_Npc.InputDialog(This_Player,'请输入英雄的名字：',0,101);
end;

procedure _BuHero3;
begin
   This_Player.SetV(12,3,3);
   This_Npc.InputDialog(This_Player,'请输入英雄的名字：',0,101);
end;

procedure _BuHero4;
begin
   This_Player.SetV(12,3,4);
   This_Npc.InputDialog(This_Player,'请输入英雄的名字：',0,101);
end;

procedure _BuHero5;
begin
   This_Player.SetV(12,3,5);
   This_Npc.InputDialog(This_Player,'请输入英雄的名字：',0,101);
end;

procedure _BuHero6;
begin
   This_Player.SetV(12,3,6);
   This_Npc.InputDialog(This_Player,'请输入英雄的名字：',0,101);
end;


Procedure p101;
var
j : integer;
begin
   j := This_Player.GetV(12,3);
   if This_Npc.InputOK then
   begin
      if This_Player.CreateHero(This_Npc.InputStr,1,j) = 0 then
      begin
         if This_Player.GetV(111,38) = 1 then
         begin
            if This_Player.SetV(111,38,10) then
            begin
               This_Player.Give('经验',10000);
               This_Player.PlayerNotice('你已经完成了成长之路：英雄相伴任务。',2);
               //This_Player.DeleteTaskFromUIList(1038);
               This_Player.SetV(113,1,1);                                 //接英雄篇：英雄内功
               This_Player.SetV(113,34,1);                                //接英雄篇：护体神盾 
               This_Player.SetV(113,43,1);                                //接英雄篇：英雄合击 
            //   This_Player.AddTaskToUIList(1201);                    //英雄篇第一个任务
            //   This_Player.AddTaskToUIList(1234);                   //英雄34级任务 
               if (j = 2) or (j = 5) then
               begin
                  This_Player.SetV(113,40,1);                             //接英雄篇：法师四级盾 
               end;
            end;
         end;
      end;
   end;
end;


procedure _gohero;
var
  nRetJ, nRetB : integer;
begin
   nRetJ := This_Player.MyHeroState(1);        //检查酒馆英雄返回值 ，0=无，1=有，2=寄放 
   nRetB := This_Player.MyHeroState(0);        //检查白日门英雄返回值 ，0=无，1=有，2=寄放
  { if This_Player.Level < 40 then
   begin
      This_Npc.NpcDialog(This_Player,
      '朋友，你的内力不足，很难通过盟重门徒的考验，\'+
      '还是等你多修炼几日再来吧！');
   end else }
   if ( nRetJ = 1 ) or ( nRetB = 1 ) then
   begin
      This_Npc.NpcDialog(This_Player,
      '受伤的英雄已经康复，希望你能继承我们的理想，\'+
      '去寻找我们自己的家园。\ \'+
      '|{cmd}<离开/@doexit>');
   end else if nRetB = 2 then
   begin  
      This_Npc.NpcDialog(This_Player,
      '你的英雄已经被寄放在酒馆了，\'+
      '希望你能继承我们的理想，去寻找我们自己的家园。\ \'+
      '|{cmd}<离开/@doexit>');
   end else if This_Player.GetV(12,1) = 3 then
   begin
      if nRetB = 0 then
      begin 
         This_Npc.NpcDialog(This_Player,
         '恭喜您可以带领您的英雄去闯荡玛法大陆了，\'+
         '您想带领哪位英雄呢？\ \'+
         '|{cmd}<英雄(男战士)/@BuHero1>      ^<英雄(男法师)/@BuHero2>      ^<英雄(男方士)/@BuHero3>\ \'+
         '|{cmd}<英雄(女战士)/@BuHero4>      ^<英雄(女法师)/@BuHero5>      ^<英雄(女方士)/@BuHero6>\');
      end; 
   end;
end;

procedure _goback;
begin
   if compareText(This_Player.MapName, 'hero001') = 0 then
   begin
      This_Player.Flyto('3',333,333);
   end;
end;


procedure _jineng;
begin
   if This_Player.GetV(12,2) = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您已经领取过书页了，不能再次领取。\ \'+
      '|{cmd}<离开/@doexit>');
   end else
   begin
      if This_Player.FreeBagNum >= 3 then
      begin
         if This_Player.HeroLevel >= 0 then
         begin             
              case This_Player.HeroJob of
               0 : This_Player.BindGive('白日门剑术',1);
               1 : This_Player.BindGive('白日门火球术',1);
               2 : This_Player.BindGive('白日门治愈术',1);
              end;
              
              This_Player.BindGive('书页',2); 
              This_Player.SetV(12,2,1);
              This_Npc.NpcDialog(This_Player,
             '跟随你的英雄都是白日门最优秀的精英，\'+
             '他们都可以掌握白日门特有的各种魔法技能。\'+
             '不过很多白日门的技能书都在一场灾难中被毁得残破不堪，\'+
             '现在只剩下一些零散的书页，而且其中的很多书页已经\'+
             '流散到玛法的各处很难凑齐。\'+
             '我这里还有两片残留的书页，你拿去找白日门的龙人，\'+
             '他也许能从残留的书页里找到一些技能秘籍。\ \'+
             '|{cmd}<好的,我这就去找他/@doexit>');
         end else
         This_Npc.NpcDialog(This_Player,
         '你必须召唤出你的英雄才能领取书页！');
      end else  
      begin
         This_Npc.NpcDialog(This_Player,
         '你的包裹空间不够，请整理后再来领取。');
      end;
   end;
end;

{Procedure _sdhero2;
Begin
   This_Npc.NpcDialog(This_Player,
   '内功是三龙卫流传下来的神奇功法，修炼之后会在人物头顶增加一个\'+
   '黄色条，在人物面板中，增加内功的选项。选中内功选项，\ '+
   '可以查看当前的内功等级和内力值。如果学习了内功技能，\'+
   '则可以通过翻页，察看内功技能。学习内功可以大幅增强个人的攻防\'+
   '能力，随着内功等级的不断提升，将获得更强的战斗能力，\'+
   '同时你可以在盟重内功宗师处学习内功技能，\'+
   '这些技能将让你获得更强大的战斗能力？\ \'+
   '|<哦，那都有什么技能呢？/@sdhero2_1>               ^<返回/@main>'   
);
end;

Procedure _sdhero2_1;
Begin
   This_Npc.NpcDialog(This_Player,
   '<内功技能/c=red>是可以抵御或增强技能伤害的技能，\'+
   '分为：<静之系列/c=red>和<怒之系列/c=red>。\'+
   '|<静之系列/c=red>学习后可以提升角色针对相应技能的防御力，\'+
   '该系列的各种技能适合所有职业学习。\'+
   '|<怒之系列/c=red>学习后可以提升相应的技能攻击力，\'+
   '该系列技能不同职业学习的技能不同。\ \'+
   '|<怎么才能学会技能呢？/@sdhero2_2>\'+
   '|<返回/@sdhero2>'
);
end;

Procedure _sdhero2_2;
Begin
   This_Npc.NpcDialog(This_Player,
   '在盟重内功宗师处使用<绿宝石/c=red>可以换取指定的<内功技能书/c=red>，\'+
   '双击内功技能书即可学会该内功技能，内功技能的升级是在使用过程\'+
   '中完成的，使用技能越多则升级越快。\'+
   '学会内功之后你将拥有<内力/c=red>，使用内功技能是会<消耗内力值/c=red>的，\'+
   '内功等级越高，内力值也就越多。详细的情况你可以去<内功宗师处/c=red>\'+
   '打听或者查询<彩虹精灵/c=red>。\'+
   '听了这么多介绍，那你现在就想学习内功吗？\'+
   '|<好的，我这就要学习/@sdhero2_2_1>           ^<好的，我要让我的英雄学习/@sdhero2_2_2>\'+
   '|<返回/@sdhero2_1>'
);
end;

Procedure _sdhero2_2_1;
var
   i : Integer;

begin       
    i := Random(3);
    if This_Npc.CheckForce(This_Player, true) then
    begin
         This_Npc.NpcDialog(This_Player,
         '你已经学会内功，现在就去努力提升自己的内功等级吧！'       
         );
    end 
    else if i=2 then
    begin
         This_Npc.NpcDialog(This_Player,
         '那好，为了考验你有没有认真学习，我提一个问题考考你，\'+
         '如果你回答正确了我就将内功传授给你。\'+
         '这个问题是：\ \'+
         '|<学习了内功之后到哪里才能学习内功技能呢？/c=red>\ \'+
         '|<盟重内功宗师/@right1>               ^<盟重酒神弟子/@fault>'       
    );
    end 
    else if i=1 then
    begin
         This_Npc.NpcDialog(This_Player,
         '那好，为了考验你有没有认真学习，我提一个问题考考你，\'+
         '如果你回答正确了我就将内功传授给你。\'+
         '这个问题是：\ \'+
         '|<内功技能分为哪两个系列？/c=red>\ \'+
         '|<怒之系列和静之系列/@right1>             ^<怒之系列和凤之系列/@fault>'    
    );
    end 
    else
    begin
        This_Npc.NpcDialog(This_Player,
        '那好，为了考验你有没有认真学习，我提一个问题考考你，\'+
        '如果你回答正确了我就将内功传授给你。\'+
        '这个问题是：\ \'+
        '|<在盟重内功宗师处使用什么可以换取内功技能书？/c=red>\ \'+
        '|<绿宝石/@right1>             ^<黑铁矿/@fault>'
        );
    end
end;

Procedure _right1; 
begin
     if This_Npc.CheckForce(This_Player, true) then
     begin
         This_Npc.NpcDialog(This_Player,
         '你已经学会内功，现在就去努力提升自己的内功等级吧！'       
         );
     end else
     begin
          //This_Npc.EnableForce(This_Player, true)
          This_Npc.NpcDialog(This_Player,     
          '我已经在你的体内播下了内功的种子，只要你勤加练习，\'+
          '这粒种子就会逐渐的壮大，令你成为傲视玛法的高手。\'+
          '加油吧，'+This_Player.Name +'\ \'+
          '|<多谢！/@doexit>'
          );
          
          if This_Player.GetV(111,1) = 1 then
          begin
              if This_Player.SetV(111,1,10) then
              begin
                This_Player.Give('经验',10000);
                This_Player.PlayerNotice('你已经完成了成长之路：学习内功任务。',2);
                This_Player.DeleteTaskFromUIList(1001);
              end;
          end;
     end;
end;

Procedure _fault;
begin
     This_Npc.NpcDialog(This_Player,
     '失败：回答错误，您需要重新回答问题。'
);
end;

Procedure _sdhero2_2_2;
var
   i : Integer;
begin
    i := Random(3);
    if This_Player.HaveValidHero then
    begin         
         if This_Npc.CheckForce(This_Player, false) then
         begin
              This_Npc.NpcDialog(This_Player,
              '你尚未招出你的英雄，或者你的英雄已经学会内功了呀！'       
              );
         end 
         else if i=2 then
              begin
                   This_Npc.NpcDialog(This_Player,
                   '那好，为了考验你有没有认真学习，我提一个问题考考你，\'+
                   '如果你回答正确了我就将内功传授给你。\'+
                   '这个问题是：\ \'+
                   '|<学习了内功之后到哪里才能学习内功技能呢？/c=red>\ \'+
                   '|<盟重内功宗师/@right2>               ^<盟重酒神弟子/@fault>'
                   );
              end
              else if i=1 then
              begin
                    This_Npc.NpcDialog(This_Player,
                    '那好，为了考验你有没有认真学习，我提一个问题考考你，\'+
                    '如果你回答正确了我就将内功传授给你。\'+
                    '这个问题是：\ \'+
                    '|<内功技能分为哪两个系列？/c=red>\ \'+
                    '|<怒之系列和静之系列/@right2>             ^<怒之系列和凤之系列/@fault>'
                    );
              end
              else
              begin
                    This_Npc.NpcDialog(This_Player,
                    '那好，为了考验你有没有认真学习，我提一个问题考考你，\'+
                    '如果你回答正确了我就将内功传授给你。\'+
                    '这个问题是：\ \'+
                    '|<在盟重内功宗师处使用什么可以换取内功技能书？/c=red>\ \'+
                    '|<绿宝石/@right2>             ^<黑铁矿/@fault>' 
                    ); 
              end;
    end
    else
    begin
        This_Npc.NpcDialog(This_Player,
        '你还没有带领英雄，不能让英雄也获得内功！'
        );
    end;
end;


Procedure _right2; 
begin
     if This_Player.HaveValidHero then
     begin
          if This_Npc.CheckForce(This_Player, false) then
          begin
               This_Npc.NpcDialog(This_Player,
               '你已经学会内功，现在就去努力提升自己的内功等级吧！'       
               );
          end
          else
          begin
               //This_Npc.EnableForce(This_Player, false)
               This_Npc.NpcDialog(This_Player,
               '我已经在你的英雄体内播下了内功的种子，只要他勤加练习，\'+
               '这粒种子就会逐渐的壮大，令他成为傲视玛法的高手。\'+
               '加油吧，'+This_Player.Name +'\ \'+
               '|<多谢！/@doexit>'
               );
               
               if This_Player.GetV(113,1) = 1 then
               begin
                  if This_Player.SetV(113,1,10) then
                  begin
                     This_Player.Give('经验',10000);
                     This_Player.PlayerNotice('你已经完成了成长之路：英雄内功任务。',2);
                     This_Player.DeleteTaskFromUIList(1201);
                  end;
               end;
          end;
     end
     else
     begin
         This_Npc.NpcDialog(This_Player,
        '你还没有带领英雄，不能让英雄也获得内功！'
        );
     end         
end; }

//脚本执行的入口
begin
  if This_Player.GetV(12,1) = 3 then
  begin
     This_Npc.NpcDialog(This_Player,
     '受伤的英雄经过我的治疗，大体已经康复。\'+
     '新招募的英雄也刚好都在我这边休息。\'+
     '他们都已经听说了你的事情，都非常愿意跟随你。\'+
     '现在是时候，让这些英雄前往玛法大陆了。\ \'+
     '|{cmd}<带领一个英雄/@gohero>                ^<领取书页/@jineng>\ \'+
     '|{cmd}<返回玛法大陆/@goback>');
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '受伤的英雄经过我的治疗，大体已经康复。\'+
     '新招募的英雄也刚好都在我这边休息。\'+
     '现在是时候让这些英雄前往玛法大陆了。\ \'+
     '|{cmd}<领取书页/@jineng>\ \'+
     '|{cmd}<返回玛法大陆/@goback>');
  end;
end.    