{
/*******************************************************************************
}

program Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '感谢来到这个神秘的世界，现在的你还过于弱小？\有没有想过找一位可以带你成长的师傅呢？\如果你能找到“王师教头”成为你的师傅，\那你将得到最优厚的待遇。\'
  +'|{cmd}<请告诉我，如何寻找"王师教头"/@ask>\'
  //+'|{cmd}<我想学习玩传奇的入门技巧/@next>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _ask;
begin
  if This_Player.Level >= 8 then
  begin
    This_Npc.NpcDialog(This_Player,
    '盟重聚集了大批的豪杰，\他们当中可能就有“王师教头”，你只需要大叫一声：\“我要拜师”，相信他们一定会来找你的。祝你好运。\'
    +'|{cmd}<好的，我这就去找这些“王师教头”/@doexit>\ \'
    +'|{cmd}<返回/@main>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '盟重聚集了大批的豪杰，\他们当中可能就有“王师教头”，你只需要大叫一声：\“我要拜师”，相信他们一定会来找你的。祝你好运。\不过你现在太弱小了，可能还到达不了土城。\我可以帮你去那里，可惜我现在肚子饿了，\无法发挥我威力无比的法力。\等我吃饱了，我就带你去，嘿嘿。\|{cmd}<返回/@main>'
    );
  end;
end;  

procedure _next;
begin
  This_Npc.NpcDialog(This_Player,
  '首先告诉你与NPC对话的方法. \与NPC对话的方法是点击对话框内的有黄色下划线的字 \就可以和NPC进行互相间的对话了 \第一次比较困难但以后会慢慢习惯的 \ \|{cmd}<下一步/@next1>\'
  );
end;

procedure _next1;
begin
  This_Npc.NpcDialog(This_Player,
  '从以下菜单中选择一下. \'
  +'|{cmd}<物品使用指南/@Wear>\'
  +'|{cmd}<移动指南/@Move>\'
  +'|{cmd}<战斗指南/@Fight>\'
  +'|{cmd}<命令指南/@Talk>\'
  +'|{cmd}<技能指南/@Skill>\'
  +'|{cmd}<快捷键指南/@Hotkey>\'
  +'|{cmd}<退  出/@doexit>'
  );
end;

procedure _wear;
begin
  This_Npc.NpcDialog(This_Player,
  '首先, 如果你按下F9(包裹窗口)和\F10(状态窗口) 窗口就会被打开。\把衣服等物品拖动到你的状态窗口，\并在相应的位置放好，你就可以穿戴上这些物品了。\穿戴的位置 : 衣服－身体  武器－右手, 项链－右上角\            蜡烛－放项链的下面, 手镯－放蜡烛的下面\            戒指－放手镯的下面\ \|{cmd}<返回/@next1>'
  );
end;

procedure _move;
begin
  This_Npc.NpcDialog(This_Player,
  '鼠标左键    作为基本的行动，移动，攻击，移动物品等\鼠标右键    你在其他地方点击住右键的话,\           你可以朝那个方向跑动起来哦！\Shift+左键  强行攻击.\' 
  +'|{cmd}<返回/@next1>，'+ addSpace('', 10) + '|{cmd}<继续/@Move2>'
  );
end;

procedure _move2;
begin
  This_Npc.NpcDialog(This_Player,
  'Ctrl+左键   奔跑. \Ctrl+右键   你能够看到其他玩家的信息, \            它的作用和 F10一样. \Alt+左键    收集物品 <取得/@Getitem>.\双击        如果你双击掉落在地上的物品，你就可以捡起它. \            如果你双击在包裹里的物品，你将使用它\|{cmd}<返回/@Move>'
  );
end;

procedure _Getitem;
begin
 This_Npc.NpcDialog(This_Player,
 '对于那些死去的鸡、羊、鹿、狼等，你可\以在它们的尸体上得到一块一块的优质肉,\在食人植物上，你可以得到一些很重要的物品\对于蜘蛛来说，你可以得到蜘蛛的毒牙.\还有一些别的怪物，也可以从它们身上得到一些物品\ \|{cmd}<返回/@Move>'
 );
end;

procedure _fight;
begin
  This_Npc.NpcDialog(This_Player,
  '基本上来说，你都可以利用左键来进行攻击.\不过，如果你不能进行攻击\你也可以按住Shift + 左键来强行攻击.\|{cmd}<返回/@next1>'
  );
end;

procedure _talk;
begin
  This_Npc.NpcDialog(This_Player,
  '/人名 你能够和在线的玩家进行无距离限制的交流.\     你点击聊天窗口的名字，就自动和这个名字的玩家交流\!    你能够群发消息(信息颜色是黄色的，但是有19秒的限制\     只有在8级以后才能使用.\!!   能够向你的组员发送信息.\!~   可以向所有在线的行会会员发送信息，信息的颜色是绿色的\ \'
  +'|{cmd}<返回/@next1>,'+ addSpace('', 10) + '|{cmd}<继续/@Talk2>'
  );
end;

procedure _talk2;
begin
  This_Npc.NpcDialog(This_Player,
  '@拒绝私聊   拒绝所有信息. 解除这个命令只需要再使用一次\@拒绝人名  可以对具体的某人进行屏蔽，操作和上面一样\@拒绝喊话   此功能只是拒绝群发的消息，操作和上面一样 \@退出门派   脱离行会.\@加入门派   允许加入行会。\@允许联盟   允许行会联盟。\方向键      使用这个，你可以查看过去聊天记录.\ \|{cmd}<返回/@Talk>'
  );
end;

procedure _skill;
begin
  This_Npc.NpcDialog(This_Player,
  '每种职业开始能够学习技能的等级要求都是7级.\战士可以学习<基本剑术/@Onehand>, 道士可以学习<治愈术/@Heal>\魔法师可以学习<火球术/@Fireball>.\这些书都可以在各地的书店买到的. \在这个等级以后，有一些技能也是非常重要的，但这些书是买不到的\你只能通过和暴民战斗或者和其它玩家交易来得到它们.\ \|{cmd}<返回/@next1>'
  );
end;

procedure _Onehand;
begin
  This_Npc.NpcDialog(This_Player,
  '作为一个战士，你可以学习在等级达到7级以后买书来学习它\当你的级别上升了，你的这种基本剑术将使你的命中率越来越高\ \|{cmd}<返回/@Skill>'
  );
end;

procedure _heal;
begin
  This_Npc.NpcDialog(This_Player,
  '作为一个道士，你可以学习在等级达到7级以后买书来学习它\当你的级别上升了，你的这种治愈术将使得你能够很轻松的\治愈你自己和其他人.\ \|{cmd}<返回/@Skill>'
  );
end;

procedure _Fireball;
begin
  This_Npc.NpcDialog(This_Player,
  '作为一个魔法师，你可以学习在等级达到7级以后买书来学习它\当你的级别上升了，它会越来越具备杀伤力的.\ \|{cmd}<返回/@Skill>'
  );
end;

procedure _Hotkey;
begin
  This_Npc.NpcDialog(This_Player,
  'F1~F8    技能的快捷键\F9       包裹窗口\F10      状态窗口\F11      技能状态窗口\Ctrl+H   改变攻击模式\Ctrl+F   改变字体 \Ctrl+A   <附属怪物/@Slave> 改变宠物的攻击模式\ \|{cmd}<返回/@next1>'
  );
end;

procedure _slave;
begin
  This_Npc.NpcDialog(This_Player,
  '附属的怪物就是指魔法师或者道士通过魔法控制的怪物。.\ \|{cmd}<返回/@Hotkey>'
  );
end;

begin
  domain;
end.