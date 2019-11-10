{
*******************************************************************}

program Mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


//===============================================新手任务过程 
procedure dorenwu1;
begin
 This_Npc.NpcDialog(This_Player,
 '年轻的朋友，要想成为真正的勇士必须先要学会如何在这个世界里\'+
 '生存，想要知道如何生存的诀窍吗？先给我100个金币我就告诉你！\ \'+
 '|{cmd}<我接受(任务)/@renwu2>            ^<如何得到金币/@JBshuoming>\'
 );
end; 

procedure dorenwu2;
begin
 This_Npc.NpcDialog(This_Player,
 '去新手引导员那瞧瞧吧！说不定他会有好东西给你。\ \'+
 '|{cmd}<我这就去找新手引导员(任务)/@doexit>\'
 );
end;

Procedure dorenwu3;
begin
 This_NPC.NpcDialog(This_Player,
 '新手指导员正在教导大家一些技能的使用技巧\'+
 '你赶快去听听吧！\ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu4;
begin
 This_Npc.NpcDialog(This_Player,
 '杂货店老板有些事情需要帮助！你去帮他一下吧。\ \ \'+
 '|{cmd}<我这就去(任务)/@renwu2>\'
 );
end;

procedure dorenwu6;
begin
 This_Npc.NpcDialog(This_Player,
 '杂货店老板，让你先去隔壁服装店打个招呼吧！\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu7;
begin
 This_Npc.NpcDialog(This_Player,
 '服装店老板，麻烦你去找一下武器店老板，让他帮我赶制一些针！\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu8;
begin
 This_Npc.NpcDialog(This_Player,
 '武器店老板，烦你去找一下药店老板)，让他来我这里给我的伙计看看伤。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu9;
begin
  This_Npc.NpcDialog(This_Player,
 '对了 新手引导员刚才在这边晃悠，不知道是不是在找你。\ \ \'+
 '|{cmd}<我这就去问问(任务)/@doexit>\'
 );
end;

procedure dorenwu11;
begin
 This_Npc.NpcDialog(This_Player,
 '去找一下书店老板吧！兴许他会有一些可以提升你实力的技能书。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu13;
begin
 This_Npc.NpcDialog(This_Player,
 '书店老板要你现在赶紧去城外消灭5个稻草人吧！\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end; 

procedure dorenwu14;
begin
 This_Npc.NpcDialog(This_Player,
 '你已经成功消灭5个稻草人吧，赶快回去找比奇书店老板！\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu15;
begin
  This_Npc.NpcDialog(This_Player,
 '对了，仓库保管员那里好像有些麻烦事，你去看看能不能帮助他吧。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end; 

procedure dorenwu16;
begin
 This_Npc.NpcDialog(This_Player,
 '附近的蛤蟆每天晚上都在呱呱的叫，真是烦死人了！\'+
 '好心人，赶快帮仓库保管员去城外杀的5个蛤蟆吧。\ \ '+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu18;
begin
 This_Npc.NpcDialog(This_Player,
 '据探子回报，最近沃玛森林的怪物异常活跃！麻烦你去沃玛森林的\'+
 '入口处找一下流浪汉，他对沃玛森林的情况会比较了解！\ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu20;
begin
 This_Npc.NpcDialog(This_Player,
 '从我旁边的入口处进入可以直接到达沃玛森林，在那里你能找到拾荒者。\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu22;
begin
 This_Npc.NpcDialog(This_Player,
 '请你赶快帮沃玛森林拾荒者杀死10个半兽人。\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu24;
begin
 This_Npc.NpcDialog(This_Player,
 '要找到制止他们发狂的方法，看来只有在沃玛森林深入的\'+
 '安家铺子老板才会比较清楚，你快去找他吧！\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu25;
begin
 This_Npc.NpcDialog(This_Player,
 '请你赶快帮安家铺子老板杀死10个半兽战士。\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
end;


procedure dorenwu26;
begin
 This_Npc.NpcDialog(This_Player,
 '安家铺子老板说的没错，我们的城墙是需要加以整修了， \'+
 '但是这里资源匮乏，必须从其他地方开采新的资源才行！ \'+
 '让我先和邻里们商量一下，谢谢你为我跑这一趟，\'+
 '这是给你的酬劳！ \ \'+
 '|{cmd}<谢谢(任务)/@renwu27>\'
 );
end;

procedure dorenwu27;
begin
 This_Npc.NpcDialog(This_Player,
 '当你的等级达到23级时，可前往比奇老兵处领取新的任务。\ \'+ 
 '|{cmd}<好的,我明白了(任务)/@doexit>\'
 );
end;

procedure _renwu27;
begin
 if (This_Player.GetV(103,1)=9) then
 begin
 This_Npc.NpcDialog(This_Player,
 '当你的等级达到23级时，可前往比奇老兵处领取新的任务。\ \'+ 
 '|{cmd}<好的,我明白了(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(103,1,9);        //任务标记
  This_Player.UpdateTaskDetail(103,1);
  This_Npc.CloseDialog(This_Player);
  This_Player.Give('经验',250000);
  This_Player.Give('金创药(中)包',1);
  This_Player.Give('魔法药(中)包',1);
 end;
end;

procedure _renwu1;
begin
if (This_Player.GetV(101,1)=1) then
 begin
  This_Npc.NpcDialog(This_Player,
 '年轻的朋友，要想成为真正的勇士必须先要学会如何在这个世界里\'+
 '生存，想要知道如何生存的诀窍吗？先给我<100个金币/c=red>我就告诉你！\ \'+
 '|{cmd}<我接受(任务)/@renwu2>            ^<如何得到金币/@JBshuoming>\'
 );
 end else
 begin
  This_Player.SetV(101,1,1);          //任务标记
  //#This_Player.AddTaskToUIList(101);   //触发任务日志，已接到任务，弹出任务日志
  This_Player.UpdateTaskDetail(101,1); 
  This_Player.Give('经验',125);
  This_Npc.NpcDialog(This_Player,
 '年轻的朋友，要想成为真正的勇士必须先要学会如何在这个世界里\'+
 '生存，想要知道如何生存的诀窍吗？先给我<100个金币/c=red>我就告诉你。\ \'+
 '|{cmd}<我接受(任务)/@renwu2>            ^<如何得到金币/@JBshuoming>\'
 );
 end;  
end; 
 
procedure _renwu2;
begin
if (This_Player.GetV(101,1)=1) then
 begin
 if (This_Player.GoldNum >= 100) then
  begin
 This_Npc.NpcDialog(This_Player,
 '嗯，那么快就把金币给我了，看来你拥有能够成为勇士的潜质！\'+
 '去新手引导员那瞧瞧吧！说不定他会有好东西给你。\ \'+
 '|{cmd}<我接受(任务)/@renwu3>\'
 );
  end else 
  begin
  This_Npc.NpcDialog(This_Player,
  '你确定你带来了100金币吗？\ \ \'+
  '|{cmd}<如何得到金币/@JBshuoming>\'
  );
  end;
 end;
end;

procedure _renwu3;
begin
 if (This_Player.GoldNum >= 100) and (This_Player.GetV(101,1)=1) then
 begin
 This_Player.DecGold(100);
 This_Player.SetV(101,1,2);         //任务标记
 This_Player.UpdateTaskDetail(101,1); 
 This_Player.Give('经验',315);
 This_Npc.CloseDialog(This_Player);
 //This_player.AutoGotoMap('0',332,270); //添加自动寻路 新手引导员  
 end else 
 begin
 This_Npc.NpcDialog(This_Player,
 '你确定你带来了100金币吗？\ \ \'+
 '|{cmd}<如何得到金币/@JBshuoming>\'
 );
 end;
end; 

procedure _renwu4;
begin
if (This_Player.GetV(102,1)=1) then
 begin
  This_Npc.NpcDialog(This_Player,
 '杂货店老板有些事情需要帮助！你去帮他一下吧。\ \ \'+
 '|{cmd}<我这就去(任务)/@renwu2>\'
 );
 end else
 begin
  This_Player.SetV(102,1,1);        //任务标记
  This_Player.SetV(101,1,9999);
  //#This_Player.DeleteTaskFromUIList(101);         //在任务日志中清除上一个任务，不再显示；
  //#This_Player.AddTaskToUIList(102);              //先删除上一个任务号的内容，再添加下一个任务号的内容，顺序不能错！
  This_Player.UpdateTaskDetail(102,1); 
  This_Player.Give('经验',500);
  This_Npc.CloseDialog(This_Player);
  //This_player.AutoGotoMap('0',377,298); //添加自动寻路 杂货店老板 
 end;  
end; 

procedure _JBshuoming;
begin
  This_Npc.NpcDialog(This_Player,
 '很简单，首先先打开你的包裹，双击武器，即可装备。然后去城外，\'+
 '那里有城外有许多<鸡、羊、鹿。将他们杀死/c=red>后，通过使用<ALT+左键/c=red>\'+
 '挖取他们身上的肉，然后卖给<屠夫/c=red>，就能获取金币了。\ \'+
 '|{cmd}<我接受(任务)/@renwu2>\'
 );
end; 
//============================================================================== 


procedure domain;
var
  Tem101, Tem102, Tem103, Tem104: integer;
begin
   Tem101 := This_Player.GetV(101,1);
   Tem102 := This_Player.GetV(102,1);
   Tem103 := This_Player.GetV(103,1);
   Tem104 := This_Player.GetV(104,1);
   if Tem104 >= 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '修行之路不就是一天一天的积累吗？只有刻苦的修炼，\'+
      '终有一天，你将展现你的光芒。\ \'+
      '|{cmd}<谢谢您的指导/@doexit>\');
   end else if Tem103 >= 1 then
   begin
      case Tem103 of
        1 : dorenwu20;
        2 : This_NPC.NpcDialog(This_Player,'你得去沃玛森林里找拾荒者。\ \|{cmd}<我接受/@doexit>');
        3 : dorenwu20;
        4 : dorenwu20;
        5 : dorenwu24;
        6 : dorenwu25;
        7 : dorenwu25;
        8 : dorenwu26;
        9 : dorenwu27;
      end;
   end else if Tem102 >= 1 then
   begin
      case Tem102 of
        1  : dorenwu4;
        2  : dorenwu6;
        3  : dorenwu7;
        4  : dorenwu8;
        5  : dorenwu9;
        6  : dorenwu11;
        7  : dorenwu13;
        8  : dorenwu13;
        9  : dorenwu14;
        10 : dorenwu15;
        11 : dorenwu16;
        12 : dorenwu16;
        13 : dorenwu18;
      end;
   end else if Tem101 = 4 then
   begin
      This_Npc.NpcDialog(This_Player,
      '我再教你第2步吧！成为玛法勇士还要学会热心助人，\'+
      '正好<杂货店老板/c=red>有些事情需要帮助呢！你去帮他一下吧。\ \'+
      '|{cmd}<我接受(任务)/@renwu4>\'); 
   end else if Tem101 = 3 then 
   begin
      dorenwu3;
   end else if Tem101 = 2 then 
   begin
      dorenwu2;
   end else if Tem101 = 1 then
   begin
      dorenwu1;   
   end else if (This_Player.Level <= 35) and ( Tem101 < 1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '欢迎来到玛法大陆，'+ This_Player.Name + '。不要对你眼前的一切感到奇怪，\'+
      '这片曾经美丽宁静的大陆，如今已经被一股神秘的黑暗势力\'+
      '所笼罩了，情况十分危急！我们正需要像你这样的勇士，\'+
      '来，拿起武器拯救生灵吧！ \ \'+
      '|{cmd}<我接受(任务)/@renwu1>\');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '修行之路不就是一天一天的积累吗？只有刻苦的修炼，\'+
      '终有一天，你将展现你的光芒。\ \'+
      '|{cmd}<谢谢您的指导/@doexit>\');
   end;
end;     

begin
  domain;
end.