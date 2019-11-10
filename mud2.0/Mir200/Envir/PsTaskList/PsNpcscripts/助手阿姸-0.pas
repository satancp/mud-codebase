{********************************************************************

*******************************************************************}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
var str : string;
begin
    if (This_Player.Level < 11) and (This_Player.GetV(11,7) <= 0) then
    str := '|{cmd}<我明白了/@new01>\'
    else
    str := '';

    This_NPC.NpcDialog(This_Player,
     '十多年了，没想到能与你再会。当年我苦读玛法通史，\'
    +'就是为了帮上你们的忙，如今时代变迁，已没有我的用武之地了，\'
    +'真有点唏嘘啊~\ \'
    +str
   );
end;


procedure _new01;
begin
   This_NPC.NpcDialog(This_Player,
   '这么快就学会了?\'
   +'那我问你几道问题\'
   +'如果你都答对的话\'
   +'我会给你一封介绍信\'
   +'拿着它去找村里的屠夫\'
   +'他会给你一份工作的\'
   +'|{cmd}<问吧/@quest11>\'
   +'|{cmd}<没兴趣/@exit>'
   );

end;

procedure _quest11;
begin
   This_NPC.NpcDialog(This_Player,
   '好,我开始问了,看清楚答案啊!\'
   +'第一道:\'
   +'打开包裹的快捷键是什么?\\'
   +'|{cmd}<F9/@quest2>\'
   +'|{cmd}<F10/@wrong>\'
   +'|{cmd}<F11/@wrong>\'
   +'|{cmd}<F12/wrong>'
   );

end;

procedure _wrong;
begin
   This_NPC.NpcDialog(This_Player,
   '很抱歉,你回答错了\'
   +'你还需要继续学习\'
   +'才能在这个大陆生存下去\'
   +'|{cmd}<再试一次/@quest11>\'
   +'|{cmd}<好的/@exit>'
   
   );

end;

procedure _quest2;
begin
   This_NPC.NpcDialog(This_Player,
   '不错,再来第二道:\'
   +'攻击方式一共有多少种?\\'
   +'|{cmd}<3种/@wrong>\'
   +'|{cmd}<4种/@wrong>\'
   +'|{cmd}<5种/@quest3>\'
   +'|{cmd}<6种/@wrong>'
   );

end;

procedure _quest3;
begin
   This_NPC.NpcDialog(This_Player,
   '答对了,不过你清楚每种攻击模式的用法吗?\'
   +'再来第三道:\'
   +'跟同一个组队里的所有说话的命令是什么?\\'
   +'|{cmd}<!/@wrong>\'
   +'|{cmd}<!!/@quest4>\'
   +'|{cmd}<!~/@wrong>'
   );

end;

procedure _quest4;
begin
   This_NPC.NpcDialog(This_Player,
   '厉害厉害，再来一道\'
   +'如何查看别人的装备?\\'
   +'|{cmd}<ctrl+左键/@wrong>\'
   +'|{cmd}<alt+左键/@wrong>\'
   +'|{cmd}<ctrl+右键/@quest5>\'
   +'|{cmd}<alt+右键/@wrong>'
   
   );

end;

procedure _quest5;
begin
   This_NPC.NpcDialog(This_Player,
   '在从动物尸体上挖取物品的时候\'
   +'最好的方法是什么?\\'
   
   +'|{cmd}<左键双击尸体/@wrong>\'
   +'|{cmd}<按住ctrl+点击左键/@wrong>\'
   +'|{cmd}<ctrl与左键同时按住/@wrong>\'
   +'|{cmd}<alt与左键同时按住/@right1>'
   );

end;

procedure _right1;
begin
    if This_Player.GetV(11,7) <= 0 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
           This_Player.Give('介绍信',1);
           This_Player.SetV(11,7,1);
           This_NPC.NpcDialog(This_Player,
           '既然你已经知道了怎样在这里混日子\'
           +'那我就给你一封介绍信吧\'
           +'拿着它去找我们村里的屠夫\'
           +'他就会告诉你下一步该怎么做\\'
           +'|{cmd}<确定/@exit>\'
           +'|{cmd}<再学一次/@main>'
           );
        end else
        This_NPC.NpcDialog(This_Player,
       '你的包裹太满了！'
       );
    end else
    This_NPC.NpcDialog(This_Player,
       '拿着我的信去找村里的屠夫\'
       +'他会给你一定好处的哦!~\\'
       +'|{cmd}<确定/@exit>\'
       +'|{cmd}<再学一次/@main>'
       );
end;


procedure _Wear;
begin
   This_NPC.NpcDialog(This_Player,
   '首先, 如果你按下F9(包裹窗口)和\'
   +'F10(状态窗口) 窗口就会被打开。\'
   +'把衣服等物品拖动到你的状态窗口，\'
   +'并在相应的位置放好，你就可以穿戴上这些物品了。\'
   +'穿戴的位置 : 衣服－身体  武器－右手, 项链－右上角\'
   +'蜡烛－放项链的下面, 手镯－放蜡烛的下面\'
   +'戒指－放手镯的下面\ \'
   +'|{cmd}<返回/@Main>'
   
   
   );

end;

procedure _Move;
begin
   This_NPC.NpcDialog(This_Player,
   '鼠标左键    作为基本的行动，移动，攻击，移动物品等\'
   +'|鼠标右键    你在其他地方点击住右键的话,\'
   +'           你可以朝那个方向跑动起来哦！\        '
   +'|Shift+左键  强行攻击.\ '
   +'|{cmd}<返回/@Main>，<继续/@Move2>'
   );

end;

procedure _Move2;
begin
   This_NPC.NpcDialog(This_Player,
   'Ctrl+左键   奔跑. \'
   +'|Ctrl+右键   你能够看到其他玩家的信息, \'
   +'            它的作用和 F10一样. \'
   +'|Alt+左键    收集物品 <取得/@Getitem>.\'
   +'|双击        如果你双击掉落在地上的物品，你就可以捡起它. \'
   +'            如果你双击在包裹里的物品，你将使用它\'
   +'|{cmd}<返回/@Move>'
   );

end;

procedure _Getitem;
begin
   This_NPC.NpcDialog(This_Player,
   '对于那些死去的鸡、羊、鹿、狼等，你可\'
   +'以在它们的尸体上得到一块一块的优质肉,\'
   +'在食人植物上，你可以得到一些很重要的物品\'
   +'对于蜘蛛来说，你可以得到蜘蛛的毒牙.\ '
   +'还有一些别的怪物，也可以从它们身上得到一些物品\\'
   +'|{cmd}<返回/@Move>'
   );

end;

procedure _Fight;
begin
   This_NPC.NpcDialog(This_Player,
   '基本上来说，你都可以利用左键来进行攻击.\ '
   +'不过，如果你不能进行攻击\ '
   +'你也可以按住Shift + 左键来强行攻击.\ '
   +'|{cmd}<返回/@Main>'
   );

end;

procedure _Talk;
begin
   This_NPC.NpcDialog(This_Player,
   '/人名 你能够和在线的玩家进行无距离限制的交流.\'
   +'     你点击聊天窗口的名字，就自动和这个名字的玩家交流\'
   +'|!    你能够群发消息(信息颜色是黄色的，但是有19秒的限制\'
   +'     只有在8级以后才能使用.\'
   +'|!!   能够向你的组员发送信息.\'
   +'|!~   可以向所有在线的行会会员发送信息，信息的颜色是绿色的\ \'
   +'|{cmd}<返回/@Main>,<继续/@Talk2>'
   
   
   
   );

end;

procedure _Talk2;
begin
   This_NPC.NpcDialog(This_Player,
   '@拒绝私聊   拒绝所有信息. 解除这个命令只需要再使用一次\'
   +'|@拒绝人名  可以对具体的某人进行屏蔽，操作和上面一样\'
   +'|@拒绝喊话   此功能只是拒绝群发的消息，操作和上面一样 \'
   +'|@退出门派   脱离行会.\'
   +'|@加入门派   允许加入行会。\'
   +'|@允许联盟   允许行会联盟。\'
   +'|方向键      使用这个，你可以查看过去聊天记录.\ \'
   +'|{cmd}<返回/@Talk>'
   );

end;

procedure _Skill;
begin
   This_NPC.NpcDialog(This_Player,
   '每种职业开始能够学习技能的等级要求都是7级.\'
   +'|战士可以学习<基本剑术/@Onehand>, |道士可以学习<治愈术/@Heal>\'
   +'|魔法师可以学习<火球术/@Fireball>.\'
   +'|这些书都可以在各地的书店买到的. \ '
   +'在这个等级以后，有一些技能也是非常重要的，但这些书是买不到的\'
   +'你只能通过和暴民战斗或者和其它玩家交易来得到它们.\ \'
   +'|{cmd}<返回/@Main>'
   );

end;

procedure _Onehand;
begin
   This_NPC.NpcDialog(This_Player,
   '作为一个战士，你可以学习在等级达到7级以后买书来学习它\'
   +'当你的级别上升了，你的这种基本剑术将使你的命中率越来越高\ \'
   +'|{cmd}<返回/@Skill>'
   );

end;

procedure _Heal;
begin
   This_NPC.NpcDialog(This_Player,
   '作为一个道士，你可以学习在等级达到7级以后买书来学习它\'
   +'当你的级别上升了，你的这种治愈术将使得你能够很轻松的\'
   +'治愈你自己和其他人.\ \'
   +'|{cmd}<返回/@Skill>'
   );

end;

procedure _Fireball;
begin
   This_NPC.NpcDialog(This_Player,
   '作为一个魔法师，你可以学习在等级达到7级以后买书来学习它\'
   +'当你的级别上升了，它会越来越具备杀伤力的.\ \'
   
   +'|{cmd}<返回/@Skill>'
   
   );

end;

procedure _Hotkey;
begin
   This_NPC.NpcDialog(This_Player,
   'F1~F8    技能的快捷键\'
   +'F9       包裹窗口\'
   +'F10      状态窗口\'
   +'F11      技能状态窗口\'
   +'Ctrl+H   改变攻击模式\'
   +'Ctrl+F   改变字体 \'
   +'Ctrl+A   <附属怪物/@Slave> 改变宠物的攻击模式\ \'
   +'|{cmd}<返回/@Main>'
   );

end;

procedure _Slave;
begin
   This_NPC.NpcDialog(This_Player,
   '附属的怪物就是指魔法师或者道士通过魔法控制的怪物。.\ \'
   +'|{cmd}<返回/@Hotkey>'
   
   );

end;

//脚本执行的入口
begin
  domain;
end.