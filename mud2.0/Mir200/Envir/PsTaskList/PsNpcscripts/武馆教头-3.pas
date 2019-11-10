{
*******************************************************************}

program Mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '真正的勇士，可以失去生命，但不能没有挑战！\只有真正的勇士，才了解战斗的意义！\不仅是为了胜利，更是为了寻找自己的使命和存在的意义！\' 
  +'|{cmd}<如何成为王师教头/@wangshi>\'
  +'|{cmd}<查询声望点数/@checkswry>\'
  +'|{cmd}<师傅如何收徒/@chakanbs>\'
  +'|{cmd}<我要拜师/@sdbaishi>                     ^<解除师徒关系/@left>\'
  +'|{cmd}<领取荣誉勋章/@get>                 ^<修理荣誉勋章/@xiuli>\'
  +'|{cmd}<了解挑战详情/@tiaozhan>                 ^<离开/@doexit>\'
  );
end;

procedure _wangshi;
begin
  This_Npc.NpcDialog(This_Player,
  '比奇国王号召所有勇士成为王师教头来保卫玛法大陆，\只要现在收徒，你就会成为王师教头，\以后你所收的徒弟都将成为王师弟子。 \ \'
  //+'|{cmd}<王师教头可获得的奖赏/@jiangshang>\ \'
  +'|{cmd}<返回/@main>                   ^<离开/@doexit>'
  );
end;

procedure _jiangshang;
begin
  This_Npc.NpcDialog(This_Player,
  '兽人的进攻迫在眉睫，比奇边境村烽火连连。\为了抵抗兽人的进攻，\比奇国王号召天下豪杰担负起培养玛法年轻勇士的责任。\成为王师教头后，只要你培养的王师弟子顺利出师，\并到达一定的等级时，国王将会有丰厚的<道具奖赏/@daoju>给你，\此外，你还可以额外得到你<每一个/c=red>弟子在35级到46级修炼过程中，\所获得<经验中5％/c=red>作为奖赏。\|{cmd}<返回/@main>'
  );
end;

procedure _daoju;
begin
  This_Npc.NpcDialog(This_Player,
  '当你任何一个王师弟子在47级以后，到50级这个阶段内，\每升一级，你就可以获得一下物品中的一件：\雷霆战戒、雷霆护腕、雷霆项链、雷霆腰带、雷霆战靴\光芒道戒、光芒护腕、光芒项链、光芒腰带、光芒道靴\烈焰魔戒、烈焰护腕、烈焰项链、烈焰腰带、烈焰魔靴\ \|{cmd}<返回/@wangshi>'
  );
end;

procedure _checkswry;
begin
  This_Npc.NpcDialog(This_Player,
  '您目前的声望值：' + inttostr(This_Player.MyShengwan)
  );
end; 

procedure _chakanbs;
begin
  This_Npc.NpcDialog(This_Player,
  '只要你的等级高于35级，你就可以收徒了，\当然，在第一次收徒前你必须在聊天框中输入:@允许收徒\这样你才能接受别人的拜师请求，\如果你输入:@拒绝收徒，将拒绝所有人对自己的拜师请求\允许收徒的指令你只需输入一次即可终身享用，\只有在你使用拒绝收徒的指令后以后才需要再次输入\ \|{cmd}<返回/@main>'
  );
  
  if This_Player.GetV(111,3) = 1 then
  begin
     if This_Player.SetV(111,3,10) then
     begin
        This_Player.Give('经验',10000);
        This_Player.PlayerNotice('你已经完成了成长之路：王师弟子任务。',2);
        //#This_Player.DeleteTaskFromUIList(1003);
     end;
  end;
end;

procedure _sdbaishi;
begin
  This_Npc.InputDialog(This_Player, '请输入你拜师对象的角色名（若含有英文字符请区分大小写）', 0, 101);
end;

procedure P101;
begin
  if This_Npc.InputOK then
  begin
    This_Npc.RequestBaiShi(This_Player, This_Npc.InputStr);
  end;
end;

procedure _agrbaishi;
begin
  This_Player.AgreeBaishi(This_Npc);
end;

procedure _disbaishi;
begin
  This_Player.DisAgreeBaishi(This_Npc);
end;

procedure _left;
begin
  This_Npc.NpcDialog(This_Player,
  '你想解除什么关系？\徒弟离开师父要交五万，\师傅离开徒弟需要十万。\请按照你的实际情况选择，\如果乱选也是会被扣钱的。\ \'
  +'|{cmd}<离开师父/@npclishi>\'
  +'|{cmd}<离开徒弟/@sdshikai>\'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _kaichu_M0;
begin
  This_Npc.NpcKickOutStu(This_Player, 0);
end;

procedure _kaichu_M1;
begin
  This_Npc.NpcKickOutStu(This_Player, 1);
end;

procedure _kaichu_M2;
begin
  This_Npc.NpcKickOutStu(This_Player, 2);
end;

procedure _kaichu_M3;
begin
  This_Npc.NpcKickOutStu(This_Player, 3);
end;

procedure _kaichu_M4;
begin
  This_Npc.NpcKickOutStu(This_Player, 4);
end;

procedure  _sdshikai;
begin
  This_Npc.SendKaiChuList(This_Player);
end;

procedure _npclishi;
begin
  This_Player.NpcLeaveTec(This_Npc);
end;

procedure _get;
begin
  This_Npc.NpcDialog(This_Player,
  '想要领取荣誉勋章的话你必须要有荣誉值\而荣誉值是通过消耗声望值获得的\当你有了足够的荣誉值之后，\就可以到土城的悦来客栈二楼\找勋章守护人兑换各级荣誉勋章了！\ \'
  +'|{cmd}<返回/@main>\'
  +'|{cmd}<离开/@doexit>'
  );
end;

procedure _xiuli;
begin
  This_Npc.NpcDialog(This_Player,
  '我的手艺已经不行了，\不过你可以找各个城市的小贩试试看，\说不定他们可以帮到你哦！\ \'
  +'|{cmd}<返回/@main>\'
  +'|{cmd}<离开/@doexit>'
  );
end;

procedure _tiaozhan;
begin
  This_Npc.NpcDialog(This_Player,
  '那个月圆之夜玛法巅峰的决斗情形，\怕是已经没有人记得清了。\如今返回家园之路有天险相阻；\南面石原半兽人又虎视眈眈！\玛法大陆不仅需要实力超群的勇士来守卫，\更需要有后起之秀来不断延续这一使命！\国王现已颁令举行“群英挑战赛”，寻找真正的强者！\'
  +'|{cmd}<了解挑战规则/@tiaozhanrule>\'
  +'|{cmd}<了解挑战积分规则/@jifenrule>'
  );
end;

procedure _tiaozhanrule;
begin
  This_Npc.NpcDialog(This_Player,
  '1、双方面对而站，点击“排行榜”钮旁的“挑战”钮即可申请挑战\2、双方抵押道具，完毕后确定，即自动传入挑战地图，挑战开始\3、抵押时，仓库须有足够空间，以确保能放下双方抵押物的总量\4、一方被击倒、或离开挑战地图、或离线均判定为挑战失败\5、五分钟内未分胜负，则判定为双方战平\6、挑战时须公平单挑：不能带，不能补给、不能使用传送类道具\7、胜利方可获得挑战积分，还可以获得失败方抵押的道具\8、抵押的道具需要在挑战结束后在仓库中获取\'
  +'|{cmd}<了解挑战积分规则/@jifenrule>                         ^<返回/@main>'
  );
end;

procedure _jifenrule;
begin
  This_Npc.NpcDialog(This_Player,
  '挑战结束后，会按照以下规则给予、扣除积分\1、挑战双方一方级别为35级以下时，双方没有积分变化\2、双方级别都到达35级且相差10级以内时，\     胜方获得一点积分，负方扣除一点积分\3、双方级别都到达35级且相差10级以上时，\     胜方获得二点积分，负方扣除二点积分\4、若负方挑战前积分已到达负五分，则双方没有积分变化\   \'
  +'|{cmd}<了解挑战规则/@tiaozhanrule>                             ^<返回/@main>'
  );
end;

begin
  domain;
end.