{
*******************************************************************}

Program Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '我会修好它！\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '它看起来已经修好了，\'+
    '如果您有别的武器要修理，就来找我。\ \' +
    '|{cmd}<返回/@main>'
  );
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
   '已经修理好了，看起来很不错嘛！\' +
   '|{cmd}<返回/@main>');
end;


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);
  //加载stdmode  
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
end;



Procedure _newskill;
Begin
   If This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事吗？\');
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 6 then
      Begin
         This_Npc.NpcDialog(This_Player,
         '最近，沃玛寺庙三层有白日门门徒在历练，\'+
         '以杀掉教主为目标，他需要一些药品的补给，\'+
         '我又抽不开身，麻烦你给他带去两包超级金创药。\');
      end else if This_Player.GetV(10,1) = 5 then
      begin
         This_Npc.NpcDialog(This_Player,
         '真是不容易啊，他居然还记得我，\' +
         '我以为我在这废村里呆久了，自己也变得无人关心了呢。\'+
         '是这样的，最近，沃玛寺庙三层有白日门门徒在历练，\'+
         '以杀掉教主为目标，他需要一些药品的补给，\'  +
         '我又抽不开身，麻烦你给他带去两包超级金创药。\');
         This_Player.SetV(10,1,6);      
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你得先去盟重酒馆找鉴宝散人领取鉴宝手信！\');
   end;  
end;

procedure _normal;
begin
   if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，需要我帮什么忙吗？\ \'+  
      '|{cmd}<修理武器/@repair> \'+
      '|{cmd}<特殊修理/@s_repair>\'+
      '|{cmd}<退出/@doexit>');
   end 
   else if (This_Player.GetV(10,1) = 5) or (This_Player.GetV(10,1) = 6) then
   begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，需要我帮什么忙吗？\ \'+ 
      '|{cmd}<修理武器/@repair> \'+
      '|{cmd}<特殊修理/@s_repair>\ \'+
      '|{cmd}<是比奇书店的老板叫我来的/@newskill>');
   end 
   else
   begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，需要我帮什么忙吗？\ \'+  
      '|{cmd}<修理武器/@repair> \'+
      '|{cmd}<特殊修理/@s_repair>\'+
      '|{cmd}<退出/@doexit>');
   end;
end;

//------------------------------------------------------------------------------
//成长任务模块
procedure _mission104_1;
begin
  This_Npc.NpcDialog(This_Player,
  '不是的，情报我们另有办法破解的。不过，你也别怪他，\'
  +'他收集粪虫身上的物质是因为发现这种物质从一定程度上\'
  +'可以防止兽人的尸体变成骷髅。你知道，粪虫实在太臭了。\'
  +'所以他就想着法子诓人去收集材料，以帮助他的研究。\'
  +'其实也挺难为他的，材料也很难闻的，为了大伙，他也牺牲不少。\'
  +'|{cmd}<原来是这样啊，呵呵，没事，我不怪他。/@mission104_1_1>\ \'
  +'|{cmd}<我有别的事情找你/@normal>'
  ); 
end;

procedure _mission104_1_1;
begin
  This_Npc.NpcDialog(This_Player,
  '你还挺通情理的嘛！在合家药店老板破解情报的时候，\'
  +'你就帮我们运点物资过来吧！你看，这里是个边哨，什么东西都缺。\'
  +'（任务目标：鸡肉2份，肉2份）\ \'
  +'|{cmd}<东西不少呢，我如何才能在最短的时间内集齐东西呢？/@mission104_1_2>\ \'
  +'|{cmd}<我有别的事情找你/@normal>'
  ); 
end;

procedure _mission104_1_2;
begin
  if This_Player.GetV(104,1) = 7 then
  begin
    This_Npc.NpcDialog(This_Player,
    '我们的物资你都收集好了么？\'
    +'（任务目标：鸡肉2份，肉2份）'
    );
  end
  else if This_Player.GetV(104,1) = 6 then
  begin
    This_Npc.NpcDialog(This_Player,
    '很简单，如果自己收集有困难的话，可以跟大陆上其他的勇士们\'
    +'相互交换物资或者向他们购买！\'
    +'（交易过程：双方角色面对面，把要交易的东西放入交易栏内，\'
    +'确认后则交易成功。不懂的地方可以向彩虹精灵询问）\'
    +'好的，我知道了，是（鸡肉2份，肉2份）吧？\'
    +'|{cmd}<我这就去/@doexit>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    );
    This_Player.SetV(104,1,7);
    This_Player.UpdateTaskDetail(104,1);
  end
  else
  exit; 
end;

procedure _mission104_1_fns;
begin
   if This_Player.GetV(104,1) = 8 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你见到合家铺子老板了么？\ \'
     +'|{cmd}<我这就去/@doexit>'
     );
   end
   else if This_Player.GetV(104,1) = 7 then
   begin
     if (This_Player.GetBagItemCount('鸡肉') >= 2) and (This_Player.GetBagItemCount('肉') >= 2) then
     begin
       This_Player.Take('鸡肉',2);
       This_Player.Take('肉',2);
       This_Player.Give('经验',150000);
       This_Player.SetV(104,1,8);
       This_Player.UpdateTaskDetail(104,1);
       This_Npc.NpcDialog(This_Player,
       '太好了，在这荒野的地方，有了这些东西，我们的日子也能好过点了\'
       +'真是谢谢你了！合家铺子老板说东西已经破解了，让你过去一趟。\ \'
       +'|{cmd}<已经破解了？好的，我这就去看看/@doexit>'
       ); 
     end
     else
     begin
       This_Npc.NpcDialog(This_Player,
       '所有的物品你都收集好了吗？'); 
     end; 
   end
   else
   exit;
end;

procedure _mission106;
begin
  if This_Player.GetV(106,1) = 16 then
  begin
    This_Player.SetV(106,1,17);
    This_Player.SetV(106,7,0);
    This_Player.UpdateTaskDetail(106,1);
    This_Npc.CloseDialog(This_Player); 
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '请你消灭暗黑战士后向比奇武馆教头报告。');
  end;
end;

//------------------------------------------------------------------------------
//1-22任务 
procedure _renwu25;
begin
 if (This_Player.GetV(103,1)=6) then
 begin
 This_Npc.NpcDialog(This_Player,
 '你赶快再帮我杀10个僵尸吧！\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(103,1,6);        //任务标记
  This_Player.UpdateTaskDetail(103,1);
  This_Player.SetV(103,3,0);
  This_Npc.CloseDialog(This_Player);
  This_Player.Give('经验',150000);
  // 自动寻路 半兽战士 
 end;
end;


procedure _renwu26;
begin
 if (This_Player.GetV(103,1)=8) then
 begin
 This_Npc.NpcDialog(This_Player,
 '你快回城去,告诉<任务使者/c=red>，让他尽快修筑城墙，并时刻注意城外\'+
 '的一切动静！\ \'+ 
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(103,1,8);        //任务标记
  This_Player.UpdateTaskDetail(103,1);
  This_Npc.CloseDialog(This_Player);
  This_Player.Give('经验',200000);
  This_Player.Give('回城卷',1);
  //This_Player.AutogotoMap('0',332,263); // 自动寻路 任务特使 
 end;
end; 
//------------------------------------------------------------------------------ 

var
  WWQ104, WWQ103, WWQ106: integer;
Begin
   WWQ104 := This_Player.GetV(104,1);
   WWQ103 := This_Player.GetV(103,1);
   WWQ106 := This_Player.GetV(106,1);
   if WWQ106 = 17 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你已经成功消灭了暗黑战士了么？与它对抗的时候一定要小心！\'
     +'(任务目标：消灭暗黑战士，并向比奇武馆教头报告)\ \'
     +'|{cmd}<你就等我的好消息吧！/@mission106>        ^<我有武器的事情找你/@normal>'
     );
   end 
   else if WWQ106 = 16 then
   begin
     This_Npc.NpcDialog(This_Player,
     '我看，勇士的力量又有提升啊，真是让人欣慰。保护玛法的重任\'
     +'将落在你们这些强者身上。白日门门徒为了破坏兽人们的计划，\'
     +'不幸临难。却同时激怒了暗黑战士！它正在组织军队，\'
     +'准备大规模的进攻。我们必须想办法消灭它，让它们群龙无首，\'
     +'不攻自破！它平时就藏在沃玛寺庙的深处！我必须要提醒你，\'
     +'至少要达到27级，你才有与它一拼之力。\'
     +'任务完成后请及时向比奇武馆教头报告！\'
     +'(任务目标：消灭暗黑战士，并向比奇武馆教头报告)\'
     +'|{cmd}<我愿意接受这样的挑战/@mission106>        ^<我有武器的事情找你/@normal>'
     );
   end
   else if WWQ106 = 15 then
   begin
     This_Npc.NpcDialog(This_Player,
     '我看，勇士的力量又有提升啊，真是让人欣慰。保护玛法的重任\'
     +'将落在你们这些强者身上。白日门门徒为了破坏兽人们的计划，\'
     +'不幸临难。却同时激怒了暗黑战士！它正在组织军队，\'
     +'准备大规模的进攻。我们必须想办法消灭它，让它们群龙无首，\'
     +'不攻自破！它平时就藏在沃玛寺庙的深处！我必须要提醒你，\'
     +'至少要达到27级，你才有与它一拼之力。\'
     +'任务完成后请及时向比奇武馆教头报告！\'
     +'(任务目标：消灭暗黑战士，并向比奇武馆教头报告)\'
     +'|{cmd}<我愿意接受这样的挑战/@mission106>        ^<我有武器的事情找你/@normal>'
     );
     This_Player.Give('经验',300000);
     This_Player.SetV(106,1,16);
     This_Player.UpdateTaskDetail(106,1); 
   end
   else if WWQ104 = 8 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你见到合家铺子老板了么？\ \'
     +'|{cmd}<我这就去/@doexit>\ \'
     +'|{cmd}<我有别的事情找你/@normal>');
   end
   else if WWQ104 = 7 then
   begin
     This_Npc.NpcDialog(This_Player,
     '我们的物资你都收集好了么？\'
    +'（任务目标：鸡肉2份，肉2份）\ \'
    +'|{cmd}<我已经收集好了/@mission104_1_fns>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    );
   end
   else if WWQ104 = 6 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你身上这味道……你不会是帮合家药店老板取粪虫身上的材料了吧？\'
     +'哎呀，跟他说了多少次了，那个家伙还是这样使唤人。\ \'
     +'|{cmd}<他说需要粪虫身上的物质破解情报啊/@mission104_1>\ \'
     +'|{cmd}<我有别的事情找你/@normal>'
     ); 
   end
   else if WWQ103 = 8 then
   begin
     This_Npc.NpcDialog(This_Player,
     '你快回城去,告诉<任务使者/c=red>,让他尽快修筑城墙,并时刻注意城外\'+
     '的一切动静！\ \'+ 
     '|{cmd}<好的,我这就去(任务)/@doexit>            ^<我有别的事情找你/@normal>\');
   end 
   else if WWQ103 = 7 then
   begin
     This_Npc.NpcDialog(This_Player,
     '谢谢你救了我！关于制止半兽族发狂的方法,我倒是没有！\'+
     '不过请你快回城去，告诉<任务使者/c=red>，让他尽快修筑城墙，\'+
     '并时刻注意城外的一切动静，千万不可掉以轻心！为了让\'+
     '你能快速回城，我送你一个回城卷，双击后即可回城！\ \'+
     '|{cmd}<我接受(任务)/@renwu26>              ^<我有别的事情找你/@normal>\'
     );
   end 
   else if WWQ103 = 6 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你赶快再帮我<杀10个僵尸/c=red>！\ \'+
      '|{cmd}<好的，我这就去(任务)/@doexit>                 ^<我有别的事情找你/@normal>\'
      );
   end 
   else if WWQ103 = 5 then 
   begin
      This_Npc.NpcDialog(This_Player,
      '比奇矿区的僵尸特别的凶残，我好多人手都在那里一去不回！\'+ 
      '你能再帮我<杀10个僵尸/c=red>吗？\ \'+ 
      '|{cmd}<我接受(任务)/@renwu25>               ^<我有别的事情找你/@normal>'
      );
   end    
   else if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，需要我帮什么忙吗？\ \'+  
      '|{cmd}<修理武器/@repair> \'+
      '|{cmd}<特殊修理/@s_repair>\'+
      '|{cmd}<退出/@doexit>');
   end 
   else if (This_Player.GetV(10,1) = 5) or (This_Player.GetV(10,1) = 6) then
   begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，需要我帮什么忙吗？\ \'+ 
      '|{cmd}<修理武器/@repair> \'+
      '|{cmd}<特殊修理/@s_repair>\ \'+
      '|{cmd}<是比奇书店的老板叫我来的/@newskill>');
   end 
   else
   begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，需要我帮什么忙吗？\ \'+  
      '|{cmd}<修理武器/@repair> \'+
      '|{cmd}<特殊修理/@s_repair>\'+
      '|{cmd}<退出/@doexit>');
   end;
end.