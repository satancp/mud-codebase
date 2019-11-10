{********************************************************************
* 单元名称：白日门龙人-11

* 摘    要：
* 备    注：

*******************************************************************}
program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;                         
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _where;                         
begin
   This_Npc.NpcDialog(This_Player,
   '据说很多技能书页已经流散到玛法的各大魔王身上，\'+
   '屠魔战场中的魔兽也在混乱中抢到了一部分，\'+
   '如果你能找这些书页，我也许能帮你拼出一本完整的技能秘籍。\ \'+
   '|{cmd}<返回/@main>');
end;

procedure _hejiji;                         
begin
   This_Npc.NpcDialog(This_Player,
   '只有特定的白日门技能书上才有记录，\'+
   '用一种特殊的金色粉末撒在技能书上，才能显现出合击技的记录\'+
   '字迹，不过这种特殊的粉末需要消耗大量的金刚石才能提炼出来，\'+
   '提炼这种特殊的粉末需要金刚石88颗。 \ \'+
   '|{cmd}<需要哪些技能书呢/@hejineng>                           ^<返回/@main>\');
end;

procedure _hejineng;                         
begin
   This_Npc.NpcDialog(This_Player,
   '你先看看需要哪种的合击技能，\'+
   '如果你有其中特定的白日门技能书和足够的金刚石，\'+
   '我马上就给你找出其中隐藏的合击技秘籍。\'+
   '|{cmd}<破魂斩 战士和战士/@pohun>             ^<噬魂沼泽 道士和道士/@shihun>\ \'+
   '|{cmd}<火龙气焰 法师和法师/@qiyan>           ^<雷霆一击 战士和法师/@leiting>\ \'+
   '|{cmd}<末日审判 道士和法师/@sheng>           ^<劈星斩 战士和道士/@pixing>');
end;

procedure GeiWoHJJ(book01 : string; book02 : string; HJName : string);                         
begin
   if ( This_Player.GetBagItemCount(book01) >= 1 ) and ( This_Player.GetBagItemCount(book02) >= 1 ) 
      and ( This_Player.MyDiamondnum >= 88 ) then
   begin
      This_Player.Take(book01,1);
      This_Player.Take(book02,1);
      This_Player.TakeDiamond(88,This_Npc);
      This_Player.Give(HJName,1);
      This_Npc.NpcDialog(This_Player,
      ''+HJName+'的秘籍已经被发现，现在把这本秘籍交给你！');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '哎呀，你没有收集齐两本白日门技能书和金刚石啊！');
   end;
end;

procedure _pohun;                         
begin
   This_Npc.NpcDialog(This_Player,
   '破魂斩只有在<白日门烈火>和<白日门半月>这2本技能书中存在线索，\'+
   '想要找到合击技的秘笈，就必须<同时拥有这2本白日门技能书>，\'+
   '如果你还有88颗金刚石，我就能帮你找到其中的线索。\'+
   '成功学习了合击技之后就可以获得一个火龙之心，\'+
   '放在英雄的毒符栏就可以累积怒气值。\'+ 
   '|{cmd}<我有这2本技能书/@pohun1>，帮我找一下合击技的线索吧。\ \'+
   '|{cmd}<返回/@hejineng>                           ^<关闭/@exit>');
end;

procedure _pohun1;                         
begin
   GeiWoHJJ('白日门烈火','白日门半月','破魂斩'); 
end;

procedure _shihun;                         
begin
   This_Npc.NpcDialog(This_Player,
   '噬魂沼泽只有在<白日门真气>和<白日门气功波>这2本技能书中存在线索，\'+
   '想要找到合击技的秘笈，就必须<同时拥有这2本白日门技能书>，\'+
   '如果你还有88颗金刚石，我就能帮你找到其中的线索。\'+ 
   '成功学习了合击技之后就可以获得一个火龙之心，\'+
   '放在英雄的毒符栏就可以累积怒气值。\'+ 
   '|{cmd}<我有这2本技能书/@shihun1>，帮我找一下合击技的线索吧。\ \'+
   '|{cmd}<返回/@hejineng>                    ^<关闭/@exit>');
end;

procedure _shihun1;                         
begin
   GeiWoHJJ('白日门真气','白日门气功波','噬魂沼泽'); 
end;

procedure _qiyan;                         
begin
   This_Npc.NpcDialog(This_Player,
   '火龙气焰只有在<白日门爆裂>和<白日门灭天火>这2本技能书中存在线索，\'+
   '想要找到合击技的秘笈，就必须<同时拥有这2本白日门技能书>，\'+
   '如果你还有88颗金刚石，我就能帮你找到其中的线索。\'+ 
   '成功学习了合击技之后就可以获得一个火龙之心，\'+
   '放在英雄的毒符栏就可以累积怒气值。\'+ 
   '|{cmd}<我有这2本技能书/@qiyan1>，帮我找一下合击技的线索吧。\ \'+
   '|{cmd}<返回/@hejineng>                    ^<关闭/@exit>');
end;

procedure _qiyan1;                         
begin
   GeiWoHJJ('白日门爆裂','白日门灭天火','火龙气焰'); 
end;

procedure _leiting;                         
begin
   This_Npc.NpcDialog(This_Player,
   '雷霆一击只有在<白日门寒冰掌>和<白日门半月>这2本技能书中存在线索，\'+
   '想要找到合击技的秘笈，就必须<同时拥有这2本白日门技能书>，\'+
   '如果你还有88颗金刚石，我就能帮你找到其中的线索。\'+ 
   '成功学习了合击技之后就可以获得一个火龙之心，\'+
   '放在英雄的毒符栏就可以累积怒气值。\'+ 
   '|{cmd}<我有这2本技能书/@leiting1>，帮我找一下合击技的线索吧。\ \'+
   '|{cmd}<返回/@hejineng>                    ^<关闭/@exit>');
end;

procedure _leiting1;                         
begin
   GeiWoHJJ('白日门寒冰掌','白日门半月','雷霆一击'); 
end;

procedure _sheng;                         
begin
   This_Npc.NpcDialog(This_Player,
   '末日审判只有在<白日门启示>和<白日门圣言术>这2本技能书中存在线索，\'+
   '想要找到合击技的秘笈，就必须<同时拥有这2本白日门技能书>，\'+
   '如果你还有88颗金刚石，我就能帮你找到其中的线索。\'+ 
   '成功学习了合击技之后就可以获得一个火龙之心，\'+
   '放在英雄的毒符栏就可以累积怒气值。\'+ 
   '|{cmd}<我有这2本技能书/@sheng1>，帮我找一下合击技的线索吧。\ \'+
   '|{cmd}<返回/@hejineng>                    ^<关闭/@exit>');
end;

procedure _sheng1;                         
begin
   GeiWoHJJ('白日门启示','白日门圣言术','末日审判'); 
end;

procedure _pixing;                         
begin
   This_Npc.NpcDialog(This_Player,
   '劈星斩只有在<白日门困魔咒>和<白日门狮子吼>这2本技能书中存在线索，\'+
   '想要找到合击技的秘笈，就必须<同时拥有这2本白日门技能书>，\'+
   '如果你还有88颗金刚石，我就能帮你找到其中的线索。\'+ 
   '成功学习了合击技之后就可以获得一个火龙之心，\'+
   '放在英雄的毒符栏就可以累积怒气值。\'+ 
   '|{cmd}<我有这2本技能书/@pixing1>，帮我找一下合击技的线索吧。\ \'+
   '|{cmd}<返回/@hejineng>                    ^<关闭/@exit>');
end;

procedure _pixing1;                         
begin
   GeiWoHJJ('白日门困魔咒','白日门狮子吼','劈星斩'); 
end;

procedure _givebook;                         
begin
   This_Npc.NpcDialog(This_Player,
   '如果你有书页的话，你就交给我看看，\'+
   '我可以帮您拼凑一下，看是否可以还原成一本技能秘籍。\'+
   '您可以交给我2片、5片或者8片书页，\'+
   '如果提供的书页越多，越有可能根据里面的提示还原成高级技能书，\'+
   '当然，由于碎片过于残破，不是每次都能还原成原先的技能秘籍，\'+
   '如果还原出来，不是您需要的技能，您可以把书页给我，\'+
   '好让我把这个技能发扬光大，重现当年白日门的风光。\'+
   '如果正是您需要的技能，那您还要给我一颗金刚石作为报答。\'+
   '|{cmd}<递交书页/@dijiao>                                   ^<返回/@main>'); 
end;

procedure _dijiao;                         
begin
   This_Npc.NpcDialog(This_Player,
   '您是想要给我2片、5片还是8片书页呢？\'+
   '如果提供的书页越多，越有可能根据里面的提示还原成高级技能书，\'+
   '|{cmd}<交8片书页更可能获得开天斩、分身术、召唤月灵三本新技能书>，\'+
   '合成技能书，除了书页，还需要一颗金刚石，\'+
   '只有通过金刚石的神奇作用，书页才能拼合在一起，\'+
   '如果鉴定出来，和您需要的不一样，您可以放弃鉴定，\'+
   '如果您放弃，书页不能再还给您了，技能书我会让它发扬光大。\'+
   '|{cmd}<交2片书页/@givetwo>             ^<交5片书页/@givefive>            ^<交8片书页/@giveeight>\'+
   '|{cmd}<让我再考虑考虑/@exit>'); 
end;

//给予角色书籍的模板； 
Procedure GiveBookNow(boname : string);
begin
   if This_Player.MyDiamondnum >= 1 then
   begin
      This_Player.TakeDiamond(1,This_Npc);
      This_Player.Give(boname,1);
      This_Player.SetV(15,2,0);
      This_NPC.CloseDialog(This_Player);
   end else 
   begin
      This_Npc.NpcDialog(This_Player,
      '您怎么好像没有金刚石啊，没有它我也没办法还原啊！');
   end;
end;

//合成技能书模板； 
Procedure checkp4(bookname : string; booknum : integer);
begin
   if This_Player.MyDiamondnum >= 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您给我的书页很重要，可以还原成为<' + bookname + '>！\'+
      '您是要收下这本技能书呢还是打算放弃？\'+
      '如果放弃，那么书页也不能再还给您了。\'+
      '如果您收取这本书，还需要再给我一颗金刚石哦，\'+
      '否则，我也没有办法将这些书页进行还原。\'+
      '|{cmd}<给金刚石，收取这本技能书/@givenote>\ \'+
      '|{cmd}<放弃，我不要了/@exit>'); 
      This_Player.SetV(15,2,booknum);
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '您怎么好像没有金刚石啊，没有它我也没办法还原啊！');
   end;
end;

procedure _givenote;
var
bonum : integer;                         
begin
   bonum := This_Player.GetV(15,2);
   case bonum of
     1  : GiveBookNow('白日门剑术');
     2  : GiveBookNow('白日门攻杀');
     3  : GiveBookNow('白日门火球术');
     4  : GiveBookNow('白日门抗拒');
     5  : GiveBookNow('白日门诱惑术');
     6  : GiveBookNow('白日门地狱火');
     7  : GiveBookNow('白日门雷电术');
     8  : GiveBookNow('白日门大火球');
     9  : GiveBookNow('白日门治愈术');
     10 : GiveBookNow('白日门战法');
     11 : GiveBookNow('白日门施毒术');
     12 : GiveBookNow('白日门火符');
     13 : GiveBookNow('白日门骷髅术');
     14 : GiveBookNow('白日门刺杀');
     15 : GiveBookNow('白日门半月');
     16 : GiveBookNow('白日门野蛮');
     17 : GiveBookNow('白日门爆裂');
     18 : GiveBookNow('白日门火墙');
     19 : GiveBookNow('白日门疾光');
     20 : GiveBookNow('白日门雷光');
     21 : GiveBookNow('白日门骷髅术');
     22 : GiveBookNow('白日门隐身');
     23 : GiveBookNow('白日门群隐');
     24 : GiveBookNow('白日门幽灵盾');
     25 : GiveBookNow('白日门战甲术');
     26 : GiveBookNow('白日门启示');
     27 : GiveBookNow('白日门困魔咒');
     28 : GiveBookNow('白日门气功波');
     29 : GiveBookNow('白日门烈火');
     30 : GiveBookNow('白日门魔法盾');
     31 : GiveBookNow('白日门圣言术');
     32 : GiveBookNow('白日门冰咆哮');
     33 : GiveBookNow('白日门群疗');
     34 : GiveBookNow('白日门神兽术');
     35 : GiveBookNow('白日门狮子吼');
     36 : GiveBookNow('白日门灭天火');
     37 : GiveBookNow('白日门寒冰掌');
     38 : GiveBookNow('白日门真气');
     39 : GiveBookNow('开天斩');
     40 : GiveBookNow('分身术');
     41 : GiveBookNow('召唤月灵');
   end;
end;

procedure _givetwo;
var
fai, boo : integer;                         
begin  
   if ( This_Player.GetBagItemCount('书页') >= 2 ) and ( This_Player.MyDiamondnum >= 1 ) then
   begin
      This_Player.SetV(15,2,0);
      fai := random(10);
      This_Player.Take('书页',2);
      if fai < 3 then
      begin
         This_Npc.NpcDialog(This_Player,
         '很可惜，这2片书页并没有关系，不能修复成技能书！');
      end else
      begin
         boo := random(13)+1;
         case boo of
           1  : checkp4('白日门剑术', 1);
           2  : checkp4('白日门攻杀', 2);
           3  : checkp4('白日门火球术', 3);
           4  : checkp4('白日门抗拒', 4);
           5  : checkp4('白日门诱惑术', 5);
           6  : checkp4('白日门地狱火', 6);
           7  : checkp4('白日门雷电术', 7);
           8  : checkp4('白日门大火球', 8);
           9  : checkp4('白日门治愈术', 9);
           10 : checkp4('白日门战法', 10);
           11 : checkp4('白日门施毒术', 11);
           12 : checkp4('白日门火符', 12);
           13 : checkp4('白日门骷髅术', 13);
         end;
      end; 
   end else if This_Player.GetBagItemCount('书页') < 2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您好像没有带来足够的的书页！');
   end else if This_Player.MyDiamondnum < 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您好像没有金刚石啊，我没办法帮您鉴定啊！'); 
   end;
end;

procedure _givefive;
var
fai, boo, bok2 : integer;                         
begin 
   if ( This_Player.GetBagItemCount('书页') >= 5 ) and ( This_Player.MyDiamondnum >= 1 ) then
   begin
      This_Player.SetV(15,2,0);
      fai := random(10);
      This_Player.Take('书页',5);
      if fai < 3 then
      begin
         This_Npc.NpcDialog(This_Player,
         '很可惜，这5片书页并没有关系，不能修复成技能书！');
      end else if fai < 7 then
      begin
         boo := random(13)+1;
         case boo of
           1  : checkp4('白日门剑术', 1);
           2  : checkp4('白日门攻杀', 2);
           3  : checkp4('白日门火球术', 3);
           4  : checkp4('白日门抗拒', 4);
           5  : checkp4('白日门诱惑术', 5);
           6  : checkp4('白日门地狱火', 6);
           7  : checkp4('白日门雷电术', 7);
           8  : checkp4('白日门大火球', 8);
           9  : checkp4('白日门治愈术', 9);
           10 : checkp4('白日门战法', 10);
           11 : checkp4('白日门施毒术', 11);
           12 : checkp4('白日门火符', 12);
           13 : checkp4('白日门骷髅术', 13);
         end;
      end else
      begin
         bok2 := random(15)+14;
         case bok2 of
           14 : checkp4('白日门刺杀', 14);
           15 : checkp4('白日门半月', 15);
           16 : checkp4('白日门野蛮', 16);
           17 : checkp4('白日门爆裂', 17);
           18 : checkp4('白日门火墙', 18);
           19 : checkp4('白日门疾光', 19);
           20 : checkp4('白日门雷光', 20);
           21 : checkp4('白日门骷髅术', 21);
           22 : checkp4('白日门隐身', 22);
           23 : checkp4('白日门群隐', 23);
           24 : checkp4('白日门幽灵盾', 24);
           25 : checkp4('白日门战甲术', 25);
           26 : checkp4('白日门启示', 26);
           27 : checkp4('白日门困魔咒', 27);
           28 : checkp4('白日门气功波', 28);
         end;
      end;
   end else if This_Player.GetBagItemCount('书页') < 5 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您好像没有带来足够的的书页！');
   end else if This_Player.MyDiamondnum < 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您好像没有金刚石啊，我没办法帮您鉴定啊！'); 
   end;
end;

procedure _giveeight;
var
fai, bkk3, bk4, bok2 : integer;                         
begin
   if ( This_Player.GetBagItemCount('书页') >= 8 ) and ( This_Player.MyDiamondnum >= 1 ) then
   begin
      This_Player.SetV(15,2,0);
      fai := random(10);
      This_Player.Take('书页',8);
      if fai < 3 then
      begin
         This_Npc.NpcDialog(This_Player,
         '很可惜，这8片书页并没有关系，不能修复成技能书！');
      end else if fai < 6 then
      begin
         bok2 := random(15)+14;
         case bok2 of
           14 : checkp4('白日门刺杀', 14);
           15 : checkp4('白日门半月', 15);
           16 : checkp4('白日门野蛮', 16);
           17 : checkp4('白日门爆裂', 17);
           18 : checkp4('白日门火墙', 18);
           19 : checkp4('白日门疾光', 19);
           20 : checkp4('白日门雷光', 20);
           21 : checkp4('白日门骷髅术', 21);
           22 : checkp4('白日门隐身', 22);
           23 : checkp4('白日门群隐', 23);
           24 : checkp4('白日门幽灵盾', 24);
           25 : checkp4('白日门战甲术', 25);
           26 : checkp4('白日门启示', 26);
           27 : checkp4('白日门困魔咒', 27);
           28 : checkp4('白日门气功波', 28);
         end;
      end else if fai < 8 then
      begin
         bkk3 := random(6)+29;
         case bkk3 of
           29 : checkp4('白日门烈火', 29);
           30 : checkp4('白日门魔法盾', 30);
           31 : checkp4('白日门圣言术', 31);
           32 : checkp4('白日门冰咆哮', 32);
           33 : checkp4('白日门群疗', 33);
           34 : checkp4('白日门神兽术', 34);
         end;
      end else
      begin
         bk4 := random(10)+35;
         case bk4 of
           35 : checkp4('白日门狮子吼', 35);
           36 : checkp4('白日门灭天火', 36);
           37 : checkp4('白日门寒冰掌', 37);
           38 : checkp4('白日门真气', 38);
           else
           begin
              if ( bk4 > 38 ) and ( bk4 < 41 ) then
              begin
                 checkp4('开天斩', 39);
              end else if ( bk4 >= 41 ) and ( bk4 < 44 ) then
              begin
                 checkp4('分身术', 40);
              end else if ( bk4 = 44) or ( bk4 = 45 ) then
              begin
                 checkp4('召唤月灵', 41);
              end;
           end
         end;    
      end;
   end else if This_Player.GetBagItemCount('书页') < 8 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您好像没有带来足够的的书页！'); 
   end else if This_Player.MyDiamondnum < 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您好像没有金刚石啊，我没办法帮您鉴定啊！');
   end;  
end;

//脚本执行的入口
Begin
  if (This_Player.HaveValidHero) or (This_Player.GetV(12,1) = 10) then 
  begin
     This_Npc.NpcDialog(This_Player,
     '英雄合击威力无比，因此我派前辈在记录英雄合击时，\'+
     '使用了一种眼睛看不见的特制药水进行书写，\'+
     '并只在部分白日门技能书中留有记录。\'+
     '我们家族一直以来负责保护合击技的秘密，你既然对白日门有恩，\'+
     '我一定会帮你的。\ \'+
     '|{cmd}<我想问下合击技的事情/@hejiji>            \'+
     '|{cmd}<我是来给书页碎片的/@givebook>              ^<哪里还能获得书页呢/@where>\');
     This_Player.SetV(15,2,0);
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '当初，白日门英雄辈出，我的很多师兄弟都身怀绝技，\'+
     '他们将这些绝技都编写成册，以便能让更多的英雄学习和发展，\'+
     '怎可惜被奸细出卖，大多数的英雄都遭受了灭顶之灾，\'+
     '这些秘籍也被奸臣全部抢走，从此不知去向。\'+
     '据说这些秘籍已经流散到了玛法大陆，而且都已经没有完整的\'+
     '书册了，难道您有其中的一些，那您就拿给我看看吧，\'+
     '说不定倒是可以拼成一部完整的技能秘籍。\'+
     '|{cmd}<我想问下合击技的事情/@hejiji>            \'+
     '|{cmd}<我是来给书页碎片的/@givebook>              ^<哪里还能获得书页呢/@where>\');
     This_Player.SetV(15,2,0);
  end;
end.    