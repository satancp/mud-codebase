{
******************************************************************}

program Mir2;

{$I common.pas}
{$I PlatinaConfig.pas}  //添加白金帐号奖励的配置文件                                                         

var tempo:integer;        //这个变量的使用是否可以做全局变量????? 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//屠魔周赛； 
Procedure _tumolj;
begin
   This_Npc.NpcDialog(This_Player,
   '我这里的奖品都是国王为勇士而备的，\'+
   '只有上周位列魔王岭屠魔赛前十名的勇士，才有资格领取'+
   '只能在我这里领取上一周的奖励，如果你获奖了，请及时来领取'+
   '每次将从奖励列表中随机抽取1件，所以先预留出6个包裹空间吧。 \'+
   '我确认有足够包裹空间，<领取奖励/@getMountainPrize>\ \'+
   '|{cmd}<查询屠魔赛可以获得的奖励/@chaxun>          ^<了解屠魔赛规则/@liaojietumo>\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _getMountainPrize;
begin
   {$IFDEF Q135_neigong}
   exit;
   {$ELSE}
   case This_Npc.getMountainPrize(This_Player) of
      0  : This_Npc.NpcDialog(This_Player,'奖励已经给你了，快去检查一下包裹吧！');
      -1 : This_Npc.NpcDialog(This_Player,'活动尚未开始，不能领取奖励。');
      -2 : This_Npc.NpcDialog(This_Player,'你预留的包裹空间太少了，无法装下我给你的奖赏，\请先整理包裹后再来我这里领取吧。');
      -3 : This_Npc.NpcDialog(This_Player,'你的奖品已经领取过了，\如果想在此获得奖赏，下周就要继续努力啦！\祝你屠魔成功！');
      -4 : This_Npc.NpcDialog(This_Player,'年轻人，还要继续努力啊，\你似乎不在领奖名单上，我无法给你国王的奖赏');
   end;
   {$ENDIF}   
end;


Procedure _chaxun;
begin
   This_Npc.NpcDialog(This_Player,
   '|{cmd}<第1名奖励查询/@first>\'+
   '|{cmd}<第2名奖励查询/@second>\'+
   '|{cmd}<第3名奖励查询/@third>\'+
   '|{cmd}<第4-6名奖励查询/@fourth>\'+
   '|{cmd}<第7-10名奖励查询/@seventh>');
end;
   
Procedure _first;
begin
   This_Npc.NpcDialog(This_Player,
   '第1名：<星王冠 星王腰带 星王靴>\'+
   '       ^<战神、真魂、圣魔系列，狂战、混世、太极系列>\'+
   '       ^<强化雷霆、强化光芒、强化烈焰系列>\'+
   '       ^<斗笠、祝福糕、白金积分>\'+
   '       ^<雷霆、光芒、烈焰系列>\ \'+
   '|{cmd}<返回/@tumolj>');
end;    

Procedure _second;
begin
   This_Npc.NpcDialog(This_Player,
   '第2名：<战神、真魂、圣魔系列，狂战、混世、太极系列>\'+
   '       ^<强化雷霆、强化光芒、强化烈焰系列>\'+
   '       ^<斗笠、祝福糕、白金积分>\'+
   '       ^<雷霆、光芒、烈焰系列>\ \'+
   '|{cmd}<返回/@tumolj>');
end;

Procedure _third;
begin
   This_Npc.NpcDialog(This_Player,
   '第3名：<狂战、混世、太极系列>\'+
   '       ^<强化雷霆、强化光芒、强化烈焰系列>\'+
   '       ^<斗笠、祝福糕、白金积分>\'+
   '       ^<雷霆、光芒、烈焰系列>\ \'+
   '|{cmd}<返回/@tumolj>');
end;  

Procedure _fourth;
begin
   This_Npc.NpcDialog(This_Player,
   '第4-6名：<强化雷霆、强化光芒、强化烈焰系列>\'+
   '         ^<斗笠、祝福糕、白金积分>\'+
   '         ^<雷霆、光芒、烈焰系列>\'+
   '         ^<各类藏宝图>\ \'+
   '|{cmd}<返回/@tumolj>');
end; 

Procedure _seventh;
begin
   This_Npc.NpcDialog(This_Player,
   '第7-10名：<斗笠、祝福糕、白金积分>\'+
   '          ^<雷霆、光芒、烈焰系列>\'+
   '          ^<各类藏宝图>\ \'+
   '|{cmd}<返回/@tumolj>');
end; 


Procedure _liaojietumo;
begin
   This_Npc.NpcDialog(This_Player,
   '魔王岭的怪物异常强大，因此要获得奖赏可不是件容易的事情。\'+
   '只有当你成功歼灭所有怪物时，方可记上一次战功。\'+
   '当天的战绩可于第二天早上7点后，在屠魔赛上查询到。\'+
   '每周，比奇国王都会根据勇士全歼怪物的次数，\'+
   '给予战绩最显赫的前10名勇士，以丰厚的奖励！\'+
   '全歼的次数越多，则战绩越显赫，获得的奖赏就越珍贵，\'+
   '战绩位列首位者，还可获得神秘大奖！\'+
   '全歼怪物次数的记录周期为:每周日早上7点至下周日早上7点。\'+
   '|{cmd}<返回/@tumolj>');
end;


procedure domain;
begin
  {$IFDEF Q106_tumomatch}
  This_Npc.NpcDialog(This_Player,
  '听说过白金令牌和伏魔令的传说了吧，我知道其中的一些秘密，\如果你有白金凭证或者圣诞白金凭证，我可以帮你把它凝练，\我也知道去获取白金令牌和伏魔令的途径，我可以送你去，\通过白金令牌获得的物品，我可以帮你解除怪物的魔咒，还原它们。\' 
  +'|{cmd}<领取白金帐号领奖/@baijin>                ^<了解白金令牌和伏魔令/@liaojie>\'
  +'|{cmd}<领取活动道具奖励/@lingyi>                ^<凝练白金令牌/@hecheng>\'
  +'|{cmd}<使用白金积分交换白金凭证/@huanli>                                \'
  +'|{cmd}<接受考验获取伏魔令/@goqifu>\'
  +'|{cmd}<使用祝福糕、伏魔令/@zhufu>              ^<解除领取物品的禁锢/@jiejin>\'
  );
  {$ELSE}
  This_Npc.NpcDialog(This_Player,
  '听说过白金令牌和伏魔令的传说了吧，我知道其中的一些秘密，\如果你有白金凭证或者圣诞白金凭证，我可以帮你把它凝练，\我也知道去获取白金令牌和伏魔令的途径，我可以送你去，\通过白金令牌获得的物品，我可以帮你解除怪物的魔咒，还原它们。\' 
  +'|{cmd}<领取白金帐号领奖/@baijin>                ^<了解白金令牌和伏魔令/@liaojie>\'
  +'|{cmd}<领取活动道具奖励/@lingyi>                ^<凝练白金令牌/@hecheng>\'
 // +'|{cmd}<领取魔王岭屠魔周赛奖励/@tumolj>          \'
  +'|{cmd}<使用白金积分交换白金凭证/@huanli>         |{cmd}<接受考验获取伏魔令/@goqifu>\'
  +'|{cmd}<使用祝福糕、伏魔令/@zhufu>              ^<解除领取物品的禁锢/@jiejin>\'
  );
  {$ENDIF}
end;

//临时测试使用,正式放出时必须删除此接口 
procedure _addlevel;
begin
  This_Player.PlatLv := This_Player.PlatLv + 1; 
end; 

/////////////////////////////领取白金帐号奖励/////////////////////////////////// 

procedure _baijin;
begin
  This_Npc.NpcDialog(This_Player,
  '天官赐福，财源广进。此话不假啊！\跟你透露一个消息吧，<白金帐号61级以上也可以领取奖励了/c=red>。\ \'
  +'|{cmd}<领取白金账号奖励/@lingqu>\ \'
  +'|{cmd}<查看白金账号奖励/@chakan>\ \'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _lingqu;
begin
  This_Npc.NpcDialog(This_Player,
  '请确认有足够的包裹空间放置奖品，否则不能正常领取\而且您将不再可以重新领取因包裹空间不足没有正常领取的奖品\有没有听过<祝福糕>，这可是天上的美味，我一直非常喜欢吃\但是这种糕点非常稀有和珍贵。如果有人可以给我一块的话\作为回报，我可以让他在领取白金奖励时有一定特权\可以根据自己的心愿得到梦寐以求的稀世珍宝。\'
  +'|{cmd}<我的包裹有足够的空间，领取白金账号奖励/@PlatinaReq>\' 
  +'|{cmd}<查看白金账号奖励/@chakan>\'
  +'|{cmd}<返回/@main>                                 ^<关闭/@doexit>'
  );
end;

procedure _PlatinaReq;
begin
  //This_Npc.ReqItemByPlatina(This_Player);
  //现在是通过脚本直接完成各个等级的白金帐号的奖励配置
  GivePlatinaReward(); 
end;

procedure _chakan;
begin
  This_Npc.NpcDialog(This_Player,
  '白金帐号的奖品设置：在相应等级可领取相应的奖品\由于受到恶魔的垂涎，这些物品都被恶魔禁锢了\'
  +'51级：雷霆项链、雷霆腰带、雷霆护腕、雷霆战靴、雷霆战戒\'
  +'烈焰项链、烈焰腰带、烈焰护腕、烈焰魔靴、烈焰魔戒、\'
  +'光芒项链、光芒腰带、光芒护腕、光芒道靴、光芒道戒中随机一件\'
  +'52级：强化雷霆、烈焰、光芒系列首饰中随机一件\'
  +'53、54级：狂战戒指、狂战手镯、混世戒指、混世手镯、\太极手镯、太极戒指中随机一件\'
  +'|{cmd}<查看下一页/@next>             ^<返回/@main>'
  );
end;

procedure _next;
begin
  This_Npc.NpcDialog(This_Player,
  '55级：誓言腰带、 预言头盔、 传说魔靴中随机一件\' 
  +'56级：狂战戒指、狂战手镯、混世戒指、混世手镯、太极手镯、\'
  +'太极戒指、圣魔项链、圣魔手镯、圣魔戒指、战神项链、战神手镯、\'
  +'战神戒指、真魂项链、真魂手镯、真魂戒指随机一件\'
  +'57级：战神项链、战神手镯、战神戒指、圣魔项链、圣魔手镯、\圣魔戒指、真魂项链、真魂手镯、真魂戒指随机一件\'
  +'|{cmd}<查看上一页/@chakan>             ^<查看下一页/@next2>\'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _next2;
begin
  This_Npc.NpcDialog(This_Player,
  '58级、59级：银星勋章、寂静之手中随机一件\60-62级：星王靴、星王腰带、星王冠中随机一件\'
  +'63-65级：包含<星王首饰>在内的星王全套中任意一件\66级：包含<星王首饰>在内的星王全套中任意一件，\更有机会获得三把神器<开天、镇天、玄天>的其中一把\ \'
  +'|{cmd}<查看上一页/@next>               ^<返回/@main>'
  );
end;

procedure _liaojie;
begin
  This_Npc.NpcDialog(This_Player,
  '传说得到白金令牌后，双击使用后，就可以变为白金账号，\每当你达到一特定的等级，就可以获取神秘的装备，\听说这些装备都是上古战神留下的，具体是什么我们都无法得知。\不过这些上古物品由于受到诅咒，不能佩戴，\而伏魔令是解除咒语的重要秘笈之一，只有使用伏魔令，\被恶魔所诅咒的装备才能恢复它本来的面目，重新可以佩戴使用，\只要你带着神器和伏魔令，找我就可以了。\|{cmd}<返回/@main>'
  );
end;

/////////////////////////兑换白金积分//////////////////////////////////////////// 

procedure _huanli;
begin
  This_Npc.NpcDialog(This_Player,
  '咳咳，你有白金积分吗？\我对白金积分非常感兴趣，据说它源自沙巴克的一个传说。\如果你把手头的白金积分给我，我会非常感激你，\作为回报，我会给你白金凭证！\给我30个白金积分，我就送你一个白金凭证。\ \'
  +'|{cmd}<给30个白金积分/@givethirty>换取白金凭证\'
  +'|{cmd}<返回/@main>'
  );
end;

//完成成长之路任务 
Procedure StudyRoad;
begin
   if This_Player.GetV(111,51) = 1 then
   begin
      if This_Player.SetV(111,51,10) then
      begin
         This_Player.Give('经验',10000);
         This_Player.PlayerNotice('你已经完成了成长之路：白金凭证任务。',2);
         //#This_Player.DeleteTaskFromUIList(1051);
      end;
   end;
end;

procedure _givethirty;
begin
  if This_Player.GetBagItemCount('白金积分') >= 30 then
  begin
    This_Player.Take('白金积分',30);
    This_Player.Give('白金凭证',1);
    This_Npc.NpcDialog(This_Player,
    '谢谢你给我白金积分，一个白金凭证送给你，礼轻情意重！\');
    //成长之路
    StudyRoad; 
  end
  else if This_Player.GetBagItemCount('白金积分包') >= 5 then
  begin
    This_Player.Take('白金积分包',5);
    This_Player.Give('白金凭证',1);
    This_Npc.NpcDialog(This_Player,
    '谢谢你给我白金积分，一个白金凭证送给你，礼轻情意重！\');
    
    StudyRoad;
  end
  else if This_Player.GetBagItemCount('白金积分包') = 4 then
  begin
    if This_Player.GetBagItemCount('白金积分') >= 6 then
    begin
    This_Player.Take('白金积分包',4);
    This_Player.Take('白金积分',6);
    This_Player.Give('白金凭证',1);
    This_Npc.NpcDialog(This_Player,
    '谢谢你给我白金积分，一个白金凭证送给你，礼轻情意重！\');
    
    StudyRoad;
    end;
  end
  else if this_Player.GetBagItemCount('白金积分包') = 3 then
  begin
    if This_Player.GetBagItemCount('白金积分') >= 12 then
    begin
    This_Player.Take('白金积分包',3);
    This_Player.Take('白金积分',12);
    This_Player.Give('白金凭证',1);
    This_Npc.NpcDialog(This_Player,
    '谢谢你给我白金积分，一个白金凭证送给你，礼轻情意重！\');
    
    StudyRoad;
    end;
  end
  else if this_Player.GetBagItemCount('白金积分包') = 2 then
  begin
    if This_Player.GetBagItemCount('白金积分') >= 18 then
    begin
    This_Player.Take('白金积分包',2);
    This_Player.Take('白金积分',18);
    This_Player.Give('白金凭证',1);
    This_Npc.NpcDialog(This_Player,
    '谢谢你给我白金积分，一个白金凭证送给你，礼轻情意重！\');
    
    StudyRoad;
    end;
  end
  else if this_Player.GetBagItemCount('白金积分包') = 1 then
  begin
    if This_Player.GetBagItemCount('白金积分') >= 24 then
    begin
    This_Player.Take('白金积分包',1);
    This_Player.Take('白金积分',24);
    This_Player.Give('白金凭证',1);
    This_Npc.NpcDialog(This_Player,
    '谢谢你给我白金积分，一个白金凭证送给你，礼轻情意重！\');
    
    StudyRoad;
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你好像没有足够的白金积分啊，\这个白金凭证我暂时不能给你。\请你继续努力吧！\'
    );
  end;
end;

/////////////////////////////凝练白金令牌///////////////////////////////////// 

procedure _hecheng;
begin
  This_Npc.NpcDialog(This_Player,
  '凝练白金令牌，需要一个白金凭证或者圣诞白金凭证，\只要有其中一个，我就可以帮你把它变为白金令牌，\听说庄园的管家非常善于猜拳游戏，我也是其中高手，\要么和我猜上一拳，赢了我，我就马上给你凝练白金令牌。\不过话说回来，赌一拳可要50万金币哦，没钱可不行啊！\'
  +'|{cmd}<好，开始猜拳/@xiufu>\ \'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _lingyi();
begin
  This_Npc.NpcDialog(This_Player,
  '您是前来领奖的吧，我马上给您，\'
  +'不过请您先预留30个包裹空间，\'
  +'否则，不能正常领取物品可不要怪我哦！\ \'
  + '我确认有足够包裹空间，\'
  +'|{cmd}<领取奖励/@ReqPodPrize>\ \'
  );
end;

procedure _ReqPodPrize();
begin
  //领取活动奖励 
  This_Npc.ReqPopGift(This_Player);
end;

procedure _goqifu;
begin
  This_Npc.NpcDialog(This_Player,
    '有祈福凭证，才能召唤出那些圣兽。\' +
    '进入考验场以后，你只有消灭全部的圣兽，才有可能获得伏魔令，\' +
    '1个祈福凭证可以投1个骰子，3个祈福凭证可以投2个骰子，\' +
    '5个祈福凭证可以投3个骰子，\' +
    '使用的骰子越多，越有可能获得怪物携带的伏魔令。\' +
    '你只有20分钟的时间去获得伏魔令。\ \' +
    '|{cmd}<前往挑战获得伏魔令/@gointo2>              ^<返回/@main>\'
  );
end;

procedure getBack;
begin
  if compareText(This_Player.DynRoomName, 'qifuRoom') = 0 then
    This_Player.Flyto('3', 327, 333);
end;

procedure _gointo2;
begin
  if This_Player.MapName <> '3' then
    Exit;
  
  if This_Player.GetBagItemCount('祈福凭证') > 0 then
  begin
    This_Player.FlyToDynRoom('qifuRoom', 15, 12);
    This_Player.CallOut(This_Npc, 1200, 'getBack');
  end
  else
    This_Npc.NpcDialog(This_Player,
      '您好象没有祈福凭证，我也不能帮你啊!'
    );    
end;

procedure _xiufu;
begin
  if This_Player.GoldNum < 500000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '好像你没有足够的金币啊，不要想骗我哦！');
  end
  else if (This_Player.GetBagItemCount('白金凭证') >= 1) or
          (This_Player.GetBagItemCount('圣诞白金凭证') >= 1) then
  begin
    tempo := random(3)+1;
    This_Npc.NpcDialog(This_Player,
    '好，有勇气，来吧，看看谁的运气更好，\'
    + '不过事先说明了，打平也是你输哦，输了可别怪我哦，\'
    + '如果你赢了，给我白金凭证就可以凝练了。\'
    + '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\ \'
    + '|{cmd}<让我想一会/@doexit>'
    );
  end;
end;

procedure _cjd;
begin
  if tempo = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出剪刀……我也是剪刀……打平,还是你输，呵呵！');
    This_Player.DecGold(500000);
    tempo := 0;
  end
  else if tempo = 2 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出剪刀……我出石头……哈哈，你输了！');
    This_Player.DecGold(500000);
    tempo := 0;
  end
  else if tempo = 3 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出剪刀……我出布……哎呀，我输了\你是不是现在就要凝练白金令牌呢？\'
    +'|{cmd}<是，我要凝练白金令牌/@giveji1>\'
    +'|{cmd}<算了，还是下次吧/@doexit>');
    This_Player.DecGold(500000);
    tempo := 0;
    This_Player.SetV(34,1,100);
  end;
end; 
  
procedure _cst;
begin
  if tempo = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出石头……我出剪刀……哎呀，我输了\你是不是现在就要凝练白金令牌呢？\'
    +'|{cmd}<是，我要凝练白金令牌/@giveji1>\'
    +'|{cmd}<算了，还是下次吧/@doexit>');
    This_Player.DecGold(500000);
    tempo := 0;
    This_Player.SetV(34,1,100);
  end
  else if tempo = 2 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出石头……我也出石头……打平,还是你输，呵呵！');
    This_Player.DecGold(500000);
    tempo := 0;
  end
  else if tempo = 3 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出石头……我出布……哈哈，你输了！\');
    This_Player.DecGold(500000);
    tempo := 0;
  end;
end;

procedure _cbp;
begin
  if tempo = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出布……我出剪刀……哈哈，你输了！\' );
    This_Player.DecGold(500000);
    tempo := 0;
  end
  else if tempo = 2 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出布……我出石头……哎呀，我输了\你是不是现在就要凝练白金令牌呢？\'
    +'|{cmd}<是，我要凝练白金令牌/@giveji1>\'
    +'|{cmd}<算了，还是下次吧/@doexit>');
    This_Player.DecGold(500000);
    tempo := 0;
    This_Player.SetV(34,1,100);
  end
  else if tempo = 3 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你出布……我也出布……打平,还是你输，呵呵！\');
    This_Player.DecGold(500000);
    tempo := 0;
  end;
end;

procedure _giveji1;
begin
  if This_Player.GetV(34,1) = 100 then
  begin
    if This_Player.GetBagItemCount('白金凭证') >= 1 then
    begin
      This_Player.Take('白金凭证',1);
      This_Player.Give('白金令牌',1);
      This_Npc.CloseDialog(This_Player);
    end
    else if This_Player.GetBagItemCount('圣诞白金凭证') >= 1 then
    begin
      This_Player.Take('圣诞白金凭证',1);
      This_Player.Give('白金令牌',1);
      This_Npc.CloseDialog(This_Player);
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '您没有白金凭证或者圣诞白金凭证，我也无能为力啊！');
    end;
  end;
end; 

///////////////////////////祝福糕///////////////////////////////////////////////

procedure _zhufu;
begin
  This_Npc.NpcDialog(This_Player,
  '听说过祝福糕吗，据说它除了美味之外，还带有不可思议的力量，\我很想尝试一下它的美味，您能帮我找到它吗？\只要您能把它交给我，我可以帮您完成一件让您意想不到的事情，\如您对解开禁锢后的物品不满意，\我可以将该物品转变为任意职业的相同物品。\只要您把祝福糕和想要转变的物品交给我就可以了，\剩下的事情您就交给我吧，包您称心如意！\ \'
  +'|{cmd}<使用祝福糕换物品/@huan>                 ^<使用伏魔令换物品/@fumohuan>'
  );
end;

procedure _huan;
begin
  This_Npc.NpcDialog(This_Player,
  '您想要使用祝福糕换成哪个物品？\'
  +'|{cmd}<神合项链/@shenhlian1>           ^<神合手镯/@sheheShou1>           ^<神合戒指/@shenhejie1>\'
  +'|{cmd}<疾风项链/@jiflian2>           ^<疾风手镯/@jifenshou2>           ^<疾风戒指/@jifenjie2>\'
  +'|{cmd}<怒血项链/@nuxuelian3>           ^<怒血手镯/@nuxueshou3>           ^<怒血戒指/@nuxuejie3>\'
  +'|{cmd}<银星勋章(战)/@yinxin1>       ^<银星勋章(法)/@yinxin2>       ^<银星勋章(道)/@yinxin3>\'
  +'|{cmd}<狂战手镯/@kuang1>           ^<混世手镯/@kuang2>           ^<太极手镯/@kuang3>\'
  +'|{cmd}<狂战戒指/@hunshi1>           ^<混世戒指/@hunshi2>           ^<太极戒指/@hunshi3>\ \'
  +'|{cmd}<下一页/@next1>                       ^<返回/@main>'
  );
end;

procedure _next1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想要使用祝福糕换成哪个物品？\'
  +'|{cmd}<寂静之手(战)/@jijing1>       ^<寂静之手(法)/@jijing2>       ^<寂静之手(道)/@jijing3>\'
  +'|{cmd}<星王战靴/@xinxie1>           ^<星王法靴/@xinxie2>           ^<星王道靴/@xinxie3>\'
  +'|{cmd}<星王腰带(战)/@xinyao1>       ^<星王腰带(法)/@xinyao2>       ^<星王腰带(道)/@xinyao3>\'
  +'|{cmd}<星王项链(战)/@xinneck1>       ^<星王项链(法)/@xinneck2>       ^<星王项链(道)/@xinneck3>\'
  +'|{cmd}<星王护腕(战)/@xinarml1>       ^<星王护腕(法)/@xinarml2>       ^<星王护腕(道)/@xinarml3>\'
  +'|{cmd}<星王战盔/@xintou1>           ^<星王法冠/@xintou2>           ^<星王道盔/@xintou3>\ \'
  +'|{cmd}<下一页/@next12>             ^<上一页/@huan>            ^<返回/@main>'
  );
end;

procedure _next12;
begin
  This_Npc.NpcDialog(This_Player,
  '您想要使用祝福糕换成哪个物品？\'
  +'|{cmd}<星王战戒/@xinring1>           ^<星王魔戒/@xinring2>           ^<星王道戒/@xinring3>\'  
  +'|{cmd}<誓言腰带(战)/@shiyan1>       ^<誓言腰带(法)/@shiyan2>       ^<誓言腰带(道)/@shiyan3>\'
  +'|{cmd}<预言头盔(战)/@yuyan1>       ^<预言头盔(法)/@yuyan2>       ^<预言头盔(道)/@yuyan3>\'
  +'|{cmd}<传说魔靴(战)/@chuan1>       ^<传说魔靴(法)/@chuan2>       ^<传说魔靴(道)/@chuan3>\ \' 
  +'|{cmd}<上一页/@next1>                     ^<返回/@main>'
  );
end;

procedure sayyes();
begin
  This_Npc.NpcDialog(This_Player,
  '终于找到我梦寐以求的祝福糕了，我总算可以大快朵颐了。\您也获得了您梦寐以求的天下极品了吧，哈哈！'
  );
end;

//用祝福糕和装备换其他装备的模板代码
procedure DoExchangeWithCake(item_src: string; item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '您好像还缺少必要的物品啊！');
  end
  else if This_Player.GetBagItemCount('祝福糕') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '您好像还缺少必要的物品啊！');
  end
  else
  begin
  This_Player.Take(item_src,1);
  This_Player.Take('祝福糕',1);
  This_Player.Give(item_des,1);
  sayyes;
  end;
end; 

procedure _shenhlian1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪一个项链来交换神合项链呢？\ \'
  +'|{cmd}<疾风项链/@shenhlian1_01>            ^<怒血项链/@shenhlian1_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _shenhlian1_01;
begin
  DoExchangeWithCake('疾风项链', '神合项链');
end;

procedure _shenhlian1_02;
begin
  DoExchangeWithCake('怒血项链', '神合项链');
end;

procedure _sheheShou1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪一个手镯来交换神合手镯呢？\ \'
  +'|{cmd}<疾风手镯/@sheheShou1_01>            ^<怒血手镯/@sheheShou1_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _sheheShou1_01;
begin
  DoExchangeWithCake('疾风手镯', '神合手镯');
end;

procedure _sheheShou1_02;
begin
  DoExchangeWithCake('怒血手镯', '神合手镯');
end;

procedure _shenhejie1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪一个戒指来交换神合戒指呢？\ \'
  +'|{cmd}<疾风戒指/@shenhejie1_01>            ^<怒血戒指/@shenhejie1_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _shenhejie1_01;
begin
  DoExchangeWithCake('疾风戒指', '神合戒指');
end;

procedure _shenhejie1_02;
begin
  DoExchangeWithCake('怒血戒指', '神合戒指');
end;

procedure _jiflian2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪一个项链来交换疾风项链呢？\ \'
  +'|{cmd}<神合项链/@jiflian2_01>            ^<怒血项链/@jiflian2_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _jiflian2_01;
begin
  DoExchangeWithCake('神合项链', '疾风项链');
end;

procedure _jiflian2_02;
begin
  DoExchangeWithCake('怒血项链', '疾风项链');
end;

procedure _jifenshou2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪一个手镯来交换疾风手镯呢？\ \'
  +'|{cmd}<神合手镯/@jifenshou2_01>            ^<怒血手镯/@jifenshou2_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _jifenshou2_01;
begin
  DoExchangeWithCake('神合手镯', '疾风手镯');
end;

procedure _jifenshou2_02;
begin
  DoExchangeWithCake('怒血手镯', '疾风手镯');
end;

procedure _jifenjie2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪一个戒指来交换疾风戒指呢？\ \'
  +'|{cmd}<神合戒指/@jifenjie2_01>            ^<怒血戒指/@jifenjie2_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _jifenjie2_01;
begin
  DoExchangeWithCake('神合戒指', '疾风戒指');
end;

procedure _jifenjie2_02;
begin
  DoExchangeWithCake('怒血戒指', '疾风戒指');
end;

procedure _nuxuelian3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个项链来交换怒血项链呢？\ \'
  +'|{cmd}<神合项链/@nuxuelian3_01>            ^<疾风项链/@nuxuelian3_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _nuxuelian3_01;
begin
  DoExchangeWithCake('神合项链', '怒血项链');
end;

procedure _nuxuelian3_02;
begin
  DoExchangeWithCake('疾风项链', '怒血项链');
end;

procedure _nuxueshou3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个手镯来交换怒血手镯呢？\ \'
  +'|{cmd}<神合手镯/@nuxueshou3_01>            ^<疾风手镯/@nuxueshou3_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _nuxueshou3_01;
begin
  DoExchangeWithCake('神合手镯', '怒血手镯');
end;

procedure _nuxueshou3_02;
begin
  DoExchangeWithCake('疾风手镯', '怒血手镯');
end;

procedure _nuxuejie3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个戒指来交换怒血戒指呢？\ \'
  +'|{cmd}<神合戒指/@nuxuejie3_01>            ^<疾风戒指/@nuxuejie3_02>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _nuxuejie3_01;
begin
  DoExchangeWithCake('神合戒指', '怒血戒指');
end;

procedure _nuxuejie3_02;
begin
  DoExchangeWithCake('疾风戒指', '怒血戒指');
end;

procedure _shiyan1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个誓言腰带来交换誓言腰带(战)呢？\ \'
  +'|{cmd}<誓言腰带(法)/@shiyanf1>            ^<誓言腰带(道)/@shiyand1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _shiyanf1;
begin
  DoExchangeWithCake('誓言腰带(法)', '誓言腰带(战)');
end;

procedure _shiyand1;
begin
  DoExchangeWithCake('誓言腰带(道)', '誓言腰带(战)');
end;

procedure _shiyan2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个誓言腰带来交换誓言腰带(法)呢？\ \'
  +'|{cmd}<誓言腰带(战)/@shiyanf2>            ^<誓言腰带(道)/@shiyand2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _shiyanf2;
begin
  DoExchangeWithCake('誓言腰带(战)', '誓言腰带(法)');  
end;

procedure _shiyand2;
begin
  DoExchangeWithCake('誓言腰带(道)', '誓言腰带(法)');   
end; 

procedure _shiyan3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个誓言腰带来交换誓言腰带(道)呢？\ \'
  +'|{cmd}<誓言腰带(战)/@shiyanf3>            ^<誓言腰带(法)/@shiyand3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _shiyanf3;
begin
  DoExchangeWithCake('誓言腰带(战)', '誓言腰带(道)');   
end;

procedure _shiyand3;
begin
  DoExchangeWithCake('誓言腰带(法)', '誓言腰带(道)');   
end;

procedure _yuyan1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个预言头盔来交换预言头盔(战)呢？\ \'
  +'|{cmd}<预言头盔(法)/@yuyanf1>            ^<预言头盔(道)/@yuyand1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _yuyanf1;
begin
  DoExchangeWithCake('预言头盔(法)', '预言头盔(战)');   
end;

procedure _yuyand1;
begin
  DoExchangeWithCake('预言头盔(道)', '预言头盔(战)');   
end;

procedure _yuyan2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个预言头盔来交换预言头盔(法)呢？\ \'
  +'|{cmd}<预言头盔(战)/@yuyanf2>            ^<预言头盔(道)/@yuyand2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _yuyanf2;
begin
  DoExchangeWithCake('预言头盔(战)', '预言头盔(法)');    
end;

procedure _yuyand2;
begin
  DoExchangeWithCake('预言头盔(道)', '预言头盔(法)');   
end; 

procedure _yuyan3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个预言头盔来交换预言头盔(道)呢？\ \'
  +'|{cmd}<预言头盔(战)/@yuyanf3>            ^<预言头盔(法)/@yuyand3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _yuyanf3;
begin
  DoExchangeWithCake('预言头盔(战)', '预言头盔(道)');   
end;

procedure _yuyand3;
begin
  DoExchangeWithCake('预言头盔(法)', '预言头盔(道)');   
end;

procedure _chuan1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个传说魔靴来交换传说魔靴(战)呢？\ \'
  +'|{cmd}<传说魔靴(法)/@chuanf1>            ^<传说魔靴(道)/@chuand1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _chuanf1;
begin
  DoExchangeWithCake('传说魔靴(法)', '传说魔靴(战)');  
end;

procedure _chuand1;
begin
  DoExchangeWithCake('传说魔靴(道)', '传说魔靴(战)');   
end;

procedure _chuan2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个传说魔靴来交换传说魔靴(法)呢？\ \'
  +'|{cmd}<传说魔靴(战)/@chuanf2>            ^<传说魔靴(道)/@chuand2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _chuanf2;
begin
  DoExchangeWithCake('传说魔靴(战)', '传说魔靴(法)');   
end;

procedure _chuand2;
begin
  DoExchangeWithCake('传说魔靴(道)', '传说魔靴(法)');   
end; 

procedure _chuan3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个传说魔靴来交换传说魔靴(道)呢？\ \'
  +'|{cmd}<传说魔靴(战)/@chuanf3>            ^<传说魔靴(法)/@chuand3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _chuanf3;
begin
  DoExchangeWithCake('传说魔靴(战)', '传说魔靴(道)');   
end;

procedure _chuand3;
begin
  DoExchangeWithCake('传说魔靴(法)', '传说魔靴(道)');   
end;

procedure _kuang1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用混世手镯还是太极手镯来交换狂战手镯呢？\ \'
  +'|{cmd}<混世手镯/@kuangf1>            ^<太极手镯/@kuangd1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _kuangf1;
begin
  DoExchangeWithCake('混世手镯', '狂战手镯');    
end;

procedure _kuangd1;
begin
  DoExchangeWithCake('太极手镯', '狂战手镯');   
end;

procedure _kuang2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用狂战手镯还是太极手镯来交换混世手镯呢？\ \'
  +'|{cmd}<狂战手镯/@kuangf2>            ^<太极手镯/@kuangd2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _kuangf2;
begin
  DoExchangeWithCake('狂战手镯', '混世手镯');   
end;

procedure _kuangd2;
begin
  DoExchangeWithCake('太极手镯', '混世手镯');  
end; 

procedure _kuang3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用狂战手镯还是混世手镯来交换太极手镯呢？\ \'
  +'|{cmd}<狂战手镯/@kuangf3>            ^<混世手镯/@kuangd3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _kuangf3;
begin
  DoExchangeWithCake('狂战手镯', '太极手镯');   
end;

procedure _kuangd3;
begin
  DoExchangeWithCake('混世手镯', '太极手镯');  
end;

procedure _hunshi1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用混世戒指还是太极戒指来交换狂战戒指呢？\ \'
  +'|{cmd}<混世戒指/@hunshif1>            ^<太极戒指/@hunshid1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _hunshif1;
begin
  DoExchangeWithCake('混世戒指', '狂战戒指');   
end;

procedure _hunshid1;
begin
  DoExchangeWithCake('太极戒指', '狂战戒指');   
end;

procedure _hunshi2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用狂战戒指还是太极戒指来交换混世戒指呢？\ \'
  +'|{cmd}<狂战戒指/@hunshif2>            ^<太极戒指/@hunshid2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _hunshif2;
begin
  DoExchangeWithCake('狂战戒指', '混世戒指');   
end;

procedure _hunshid2;
begin
  DoExchangeWithCake('太极戒指', '混世戒指');  
end; 

procedure _hunshi3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用狂战戒指还是混世戒指来交换太极戒指呢？\ \'
  +'|{cmd}<狂战戒指/@hunshif3>            ^<混世戒指/@hunshid3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _hunshif3;
begin
  DoExchangeWithCake('狂战戒指', '太极戒指');   
end;

procedure _hunshid3;
begin
  DoExchangeWithCake('混世戒指', '太极戒指');   
end;

procedure _yinxin1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个银星勋章来交换银星勋章(战)呢？\ \'
  +'|{cmd}<银星勋章(法)/@yinxinf1>            ^<银星勋章(道)/@yinxind1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _yinxinf1;
begin
  DoExchangeWithCake('银星勋章(法)', '银星勋章(战)');   
end;

procedure _yinxind1;
begin
  DoExchangeWithCake('银星勋章(道)', '银星勋章(战)');   
end;

procedure _yinxin2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个银星勋章来交换银星勋章(法)呢？\ \'
  +'|{cmd}<银星勋章(战)/@yinxinf2>            ^<银星勋章(道)/@yinxind2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _yinxinf2;
begin
  DoExchangeWithCake('银星勋章(战)', '银星勋章(法)');   
end;

procedure _yinxind2;
begin
  DoExchangeWithCake('银星勋章(道)', '银星勋章(法)');   
end; 

procedure _yinxin3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个银星勋章交换银星勋章(道)呢？\ \'
  +'|{cmd}<银星勋章(战)/@yinxinf3>            ^<银星勋章(法)/@yinxind3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _yinxinf3;
begin
  DoExchangeWithCake('银星勋章(战)', '银星勋章(道)');   
end;

procedure _yinxind3;
begin
  DoExchangeWithCake('银星勋章(法)', '银星勋章(道)');     
end;

procedure _jijing1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个寂静之手来交换寂静之手(战)呢？\ \'
  +'|{cmd}<寂静之手(法)/@jijingf1>            ^<寂静之手(道)/@jijingd1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _jijingf1;
begin
  DoExchangeWithCake('寂静之手(法)', '寂静之手(战)');  
end;

procedure _jijingd1;
begin
  DoExchangeWithCake('寂静之手(道)', '寂静之手(战)');  
end;

procedure _jijing2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个寂静之手来交换寂静之手(法)呢？\ \'
  +'|{cmd}<寂静之手(战)/@jijingf2>            ^<寂静之手(道)/@jijingd2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _jijingf2;
begin
  DoExchangeWithCake('寂静之手(战)', '寂静之手(法)');  
end;

procedure _jijingd2;
begin
  DoExchangeWithCake('寂静之手(道)', '寂静之手(法)');    
end; 

procedure _jijing3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个寂静之手交换寂静之手(道)呢？\ \'
  +'|{cmd}<寂静之手(战)/@jijingf3>            ^<寂静之手(法)/@jijingd3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _jijingf3;
begin
  DoExchangeWithCake('寂静之手(战)', '寂静之手(道)');   
end;

procedure _jijingd3;
begin
  DoExchangeWithCake('寂静之手(法)', '寂静之手(道)');   
end;

procedure _xinxie1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用星王法靴还是星王道靴来交换星王战靴呢？\ \'
  +'|{cmd}<星王法靴/@xinxief1>            ^<星王道靴/@xinxied1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinxief1;
begin
  DoExchangeWithCake('星王法靴', '星王战靴');    
end;

procedure _xinxied1;
begin
  DoExchangeWithCake('星王道靴', '星王战靴');    
end;

procedure _xinxie2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用星王战靴还是星王道靴来交换星王法靴呢？\ \'
  +'|{cmd}<星王战靴/@xinxief2>            ^<星王道靴/@xinxied2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinxief2;
begin
  DoExchangeWithCake('星王战靴', '星王法靴');   
end;

procedure _xinxied2;
begin
  DoExchangeWithCake('星王道靴', '星王法靴');   
end; 

procedure _xinxie3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用星王战靴还是星王法靴交换星王道靴呢？\ \'
  +'|{cmd}<星王战靴/@xinxief3>            ^<星王法靴/@xinxied3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinxief3;
begin
  DoExchangeWithCake('星王战靴', '星王道靴');   
end;

procedure _xinxied3;
begin
  DoExchangeWithCake('星王法靴', '星王道靴');   
end;

procedure _xinyao1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王腰带来交换星王腰带(战)呢？\ \'
  +'|{cmd}<星王腰带(法)/@xinyaof1>            ^<星王腰带(道)/@xinyaod1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinyaof1;
begin
  DoExchangeWithCake('星王腰带(法)', '星王腰带(战)');   
end;

procedure _xinyaod1;
begin
  DoExchangeWithCake('星王腰带(道)', '星王腰带(战)');   
end;

procedure _xinyao2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王腰带来交换星王腰带(法)呢？\ \'
  +'|{cmd}<星王腰带(战)/@xinyaof2>            ^<星王腰带(道)/@xinyaod2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinyaof2;
begin
  DoExchangeWithCake('星王腰带(战)', '星王腰带(法)'); 
end;

procedure _xinyaod2;
begin
  DoExchangeWithCake('星王腰带(道)', '星王腰带(法)');   
end; 

procedure _xinyao3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王腰带交换星王腰带(道)呢？\ \'
  +'|{cmd}<星王腰带(战)/@xinyaof3>            ^<星王腰带(法)/@xinyaod3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinyaof3;
begin
  DoExchangeWithCake('星王腰带(战)', '星王腰带(道)');   
end;

procedure _xinyaod3;
begin
  DoExchangeWithCake('星王腰带(法)', '星王腰带(道)');   
end;

procedure _xintou1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王冠来交换星王战盔呢？\ \'
  +'|{cmd}<星王法冠/@xintouf1>            ^<星王道盔/@xintoud1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xintouf1;
begin
  DoExchangeWithCake('星王法冠', '星王战盔');  
end;

procedure _xintoud1;
begin
  DoExchangeWithCake('星王道盔', '星王战盔');   
end;

procedure _xintou2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王冠来交换星王法冠呢？\ \'
  +'|{cmd}<星王战盔/@xintouf2>            ^<星王道盔/@xintoud2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xintouf2;
begin
  DoExchangeWithCake('星王战盔', '星王法冠');   
end;

procedure _xintoud2;
begin
  DoExchangeWithCake('星王道盔', '星王法冠');   
end; 

procedure _xintou3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王冠交换星王道盔呢？\ \'
  +'|{cmd}<星王战盔/@xintouf3>            ^<星王法冠/@xintoud3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xintouf3;
begin
  DoExchangeWithCake('星王战盔', '星王道盔');   
end;

procedure _xintoud3;
begin
  DoExchangeWithCake('星王法冠', '星王道盔');   
end;

procedure _xinneck1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王项链来交换星王项链(战)呢？\ \'
  +'|{cmd}<星王项链(法)/@xinneckf1>            ^<星王项链(道)/@xinneckd1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinneckf1;
begin
  DoExchangeWithCake('星王项链(法)', '星王项链(战)');   
end;

procedure _xinneckd1;
begin
  DoExchangeWithCake('星王项链(道)', '星王项链(战)');   
end;

procedure _xinneck2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王项链来交换星王项链(法)呢？\ \'
  +'|{cmd}<星王项链(战)/@xinneckf2>            ^<星王项链(道)/@xinneckd2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinneckf2;
begin
  DoExchangeWithCake('星王项链(战)', '星王项链(法)');  
end;

procedure _xinneckd2;
begin
  DoExchangeWithCake('星王项链(道)', '星王项链(法)');   
end; 

procedure _xinneck3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王项链交换星王项链(道)呢？\ \'
  +'|{cmd}<星王项链(战)/@xinneckf3>            ^<星王项链(法)/@xinneckd3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinneckf3;
begin
  DoExchangeWithCake('星王项链(战)', '星王项链(道)');   
end;

procedure _xinneckd3;
begin
  DoExchangeWithCake('星王项链(法)', '星王项链(道)');   
end;

procedure _xinarml1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王护腕来交换星王护腕(战)呢？\ \'
  +'|{cmd}<星王护腕(法)/@xinarmlf1>            ^<星王护腕(道)/@xinarmld1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinarmlf1;
begin
  DoExchangeWithCake('星王护腕(法)', '星王护腕(战)');   
end;

procedure _xinarmld1;
begin
  DoExchangeWithCake('星王护腕(道)', '星王护腕(战)');    
end;

procedure _xinarml2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王护腕来交换星王护腕(法)呢？\ \'
  +'|{cmd}<星王护腕(战)/@xinarmlf2>            ^<星王护腕(道)/@xinarmld2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinarmlf2;
begin
  DoExchangeWithCake('星王护腕(战)', '星王护腕(法)');   
end;

procedure _xinarmld2;
begin
  DoExchangeWithCake('星王护腕(道)', '星王护腕(法)');   
end; 

procedure _xinarml3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王护腕交换星王护腕(道)呢？\ \'
  +'|{cmd}<星王护腕(战)/@xinarmlf3>            ^<星王护腕(法)/@xinarmld3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinarmlf3;
begin
  DoExchangeWithCake('星王护腕(战)', '星王护腕(道)');   
end;

procedure _xinarmld3;
begin
  DoExchangeWithCake('星王护腕(法)', '星王护腕(道)');   
end;

procedure _xinring1;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王戒指来交换星王战戒呢？\ \'
  +'|{cmd}<星王魔戒/@xinringf1>            ^<星王道戒/@xinringd1>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinringf1;
begin
  DoExchangeWithCake('星王魔戒', '星王战戒');   
end;

procedure _xinringd1;
begin
  DoExchangeWithCake('星王道戒', '星王战戒');  
end;

procedure _xinring2;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王戒指来交换星王魔戒呢？\ \'
  +'|{cmd}<星王战戒/@xinringf2>            ^<星王道戒/@xinringd2>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinringf2;
begin
  DoExchangeWithCake('星王战戒', '星王魔戒');   
end;

procedure _xinringd2;
begin
  DoExchangeWithCake('星王道戒', '星王魔戒');   
end; 

procedure _xinring3;
begin
  This_Npc.NpcDialog(This_Player,
  '您想使用哪个星王戒指交换星王道戒呢？\ \'
  +'|{cmd}<星王战戒/@xinringf3>            ^<星王魔戒/@xinringd3>\ \'
  +'|{cmd}<返回/@huan>'
  );
end;

procedure _xinringf3;
begin
  DoExchangeWithCake('星王战戒', '星王道戒');   
end;

procedure _xinringd3;
begin
  DoExchangeWithCake('星王魔戒', '星王道戒');     
end;

//////////////////////////////伏魔令换物品////////////////////////////////////// 

procedure _fumohuan;
begin
  This_Npc.NpcDialog(This_Player,
  '您想换成哪个物品：\ \'
  +'|{cmd}<王者勋章(战)/@xunzh>        ^<王者勋章(道)/@xunzhand>        ^<王者勋章(法)/@xunzhanf>\'
  +'|{cmd}<勇者勋章(战)/@yongzz>        ^<勇者勋章(道)/@yongzd>        ^<勇者勋章(法)/@yongzf>\'
  );
end;

procedure _xunzh;
begin
  This_Npc.NpcDialog(This_Player,
  '您想用哪个物品来兑换王者勋章(战)？\ \'
  +'|{cmd}<王者勋章(道)/@xunzhanzh_1>       ^<王者勋章(法)/@xunzhanzh_2>'
  );
end;

//用伏魔令换物品的模板 
procedure DoExchangeWithFML(item_src: string; item_des: string);
begin
  if This_Player.GetBagItemCount('伏魔令') = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '每次兑换都需要消耗一个伏魔令，你好像没有伏魔令啊！');
  end
  else if This_Player.GetBagItemCount(item_src) = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '您好像缺少必要物品啊！');
  end
  else
  begin
  This_Player.Take(item_src,1);
  This_Player.Take('伏魔令',1);
  This_Player.Give(item_des,1);
  This_Npc.NpcDialog(This_Player,
  '已经兑换成功，赶快打开包裹看看吧！');
  end;
end;

procedure _xunzhanzh_1;
begin
  DoExchangeWithFML('王者勋章(道)', '王者勋章(战)');  
end;

procedure _xunzhanzh_2;
begin
  DoExchangeWithFML('王者勋章(法)', '王者勋章(战)');   
end;

procedure _xunzhand;
begin
  This_Npc.NpcDialog(This_Player,
  '您想用哪个物品来兑换王者勋章(道)？\ \'
  +'|{cmd}<王者勋章(战)/@xunzhand_1>       ^<王者勋章(法)/@xunzhand_2>'
  );
end;

procedure _xunzhand_1;
begin
  DoExchangeWithFML('王者勋章(战)', '王者勋章(道)');   
end;

procedure _xunzhand_2;
begin
  DoExchangeWithFML('王者勋章(法)', '王者勋章(道)');   
end;

procedure _xunzhanf;
begin
  This_Npc.NpcDialog(This_Player,
  '您想用哪个物品来兑换王者勋章(法)？\ \'
  +'|{cmd}<王者勋章(战)/@xunzhanf_1>       ^<王者勋章(道)/@xunzhanf_2>'
  );
end;

procedure _xunzhanf_1;
begin
  DoExchangeWithFML('王者勋章(战)', '王者勋章(法)');  
end;

procedure _xunzhanf_2;
begin
  DoExchangeWithFML('王者勋章(道)', '王者勋章(法)');  
end;

procedure _yongzz;
begin
  This_Npc.NpcDialog(This_Player,
  '您想用哪个物品来兑换勇者勋章(战)？\ \'
  +'|{cmd}<勇者勋章(道)/@yongzz_1>       ^<勇者勋章(法)/@yongzz_2>'
  );
end;

procedure _yongzz_1;
begin
  DoExchangeWithFML('勇者勋章(道)', '勇者勋章(战)');  
end;

procedure _yongzz_2;
begin
  DoExchangeWithFML('勇者勋章(法)', '勇者勋章(战)');  
end;

procedure _yongzd;
begin
  This_Npc.NpcDialog(This_Player,
  '您想用哪个物品来兑换勇者勋章(道)？\ \'
  +'|{cmd}<勇者勋章(战)/@yongzd_1>       ^<勇者勋章(法)/@yongzd_2>'
  );
end;

procedure _yongzd_1;
begin
  DoExchangeWithFML('勇者勋章(战)', '勇者勋章(道)');  
end;

procedure _yongzd_2;
begin
  DoExchangeWithFML('勇者勋章(法)', '勇者勋章(道)');    
end;

procedure _yongzf;
begin
  This_Npc.NpcDialog(This_Player,
  '您想用哪个物品来兑换勇者勋章(法)？\ \'
  +'|{cmd}<勇者勋章(战)/@yongzf_1>       ^<勇者勋章(道)/@yongzf_2>'
  );
end;

procedure _yongzf_1;
begin
  DoExchangeWithFML('勇者勋章(战)', '勇者勋章(法)');    
end;

procedure _yongzf_2;
begin
  DoExchangeWithFML('勇者勋章(道)', '勇者勋章(法)');  
end;

///////////////////////////伏魔令解禁锢///////////////////////////////////////// 

procedure _jiejin;
begin
  This_Npc.NpcDialog(This_Player,
  '传说这些稀世物品都是当年一个沙巴克城主找遍玛法大陆才发现的，\他把这些宝物都藏在了一个隐秘的地方，只有少数几个密友才知道，\不知为何，却被大陆上几大魔头之一的祖玛教主知晓了这个秘密，\它联合几大魔头，对这些宝物进行了禁锢，成为了没有属性的物品，\只有天尊使用过的伏魔令再加上一种神秘魔法，才能解除恶魔的禁锢,\幸好这种魔法没有失传，我也已经学会了，我可以解除禁锢，\如果你有伏魔令，那就把禁锢的物品交给我吧，我来帮你解除禁锢。\'
  +'|{cmd}<解除白金物品的禁锢/@jingu>                    ^<解除圣殿物品的禁锢/@shendianjingu>\'
  +'|{cmd}<免费解除雷霆、光芒、烈焰物品的禁锢/@freejingu>                  |<返回/@main>'
  );
end;

procedure _shendianjingu;              
begin
  This_Npc.NpcDialog(This_Player,
  '您想解除哪个物品的禁锢呢？\ \'
  +'|{cmd}<圣殿靴(禁锢)/@sdboots>                  ^<圣殿腰带(禁锢)/@sdyaodai>\ \'
  +'|{cmd}<返回/@jiejin>'
  );
end;

//伏魔令解物品禁锢模板
//item_src表示为禁锢的物品，
//item_des1表示解开战士，item_des2表示解开道士，item_des3表示解开法师 
procedure OpenLockWithFML(item_src, item_des1, item_des2, item_des3: string);
var 
  temp : integer;
begin
  temp := Random(3)+1;
  if This_Player.GetBagItemCount('伏魔令') = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '每次兑换都需要消耗一个伏魔令，你好像没有伏魔令啊！');
  end
  else if This_Player.GetBagItemCount(item_src) = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '您好像没有足够的物品啊，还是先找到了再来找我吧！');
  end
  else
  begin
    This_Player.Take(item_src,1);
    This_Player.Take('伏魔令',1);
    //根据随机数给予不同的解禁锢物品 
    if temp = 1 then
    begin
      This_Player.Give(item_des1,1);
    end
    else if temp = 2 then
    begin
      This_Player.Give(item_des2,1);
    end
    else
    begin
      This_Player.Give(item_des3,1);
    end;
    
    This_Npc.NpcDialog(This_Player,
            '祝贺您，物品的禁锢已经解除了！赶快打开包裹看看吧！');  
  end;
end;

procedure OpenLockWithFMLOne(item_src, item_des : string);
begin
  if This_Player.GetBagItemCount('伏魔令') = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '每次兑换都需要消耗一个伏魔令，你好像没有伏魔令啊！');
  end
  else if This_Player.GetBagItemCount(item_src) = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '您好像没有足够的物品啊，还是先找到了再来找我吧！');
  end
  else
  begin
    This_Player.Take(item_src,1);
    This_Player.Take('伏魔令',1);
    This_Player.Give(item_des,1);
    This_Npc.NpcDialog(This_Player,
            '祝贺您，物品的禁锢已经解除了！赶快打开包裹看看吧！');  
  end;
end; 

procedure _sdboots;
begin
  OpenLockWithFML('圣殿靴(禁锢)', '圣殿战靴', '圣殿道靴', '圣殿魔靴');  
end;

procedure _sdyaodai;
begin
  OpenLockWithFML('圣殿腰带(禁锢)', '圣殿腰带(战)', '圣殿腰带(道)', '圣殿腰带(法)');  
end;

procedure _jingu;
begin
  This_Npc.NpcDialog(This_Player,
  '您想解除哪个物品的禁锢呢？\'
  +'|{cmd}<誓言腰带(禁锢)/@shiyan>    ^<预言头盔(禁锢)/@yunyan>    ^<传说魔靴(禁锢)/@chushu>\'
  +'|{cmd}<狂战戒指(禁锢)/@kuajie>    ^<混世戒指(禁锢)/@hunjie>    ^<太极戒指(禁锢)/@taijie>\'
  +'|{cmd}<狂战手镯(禁锢)/@kuawan>    ^<混世手镯(禁锢)/@hunwan>    ^<太极手镯(禁锢)/@taiwan>\'
  +'|{cmd}<战神戒指(禁锢)/@zanjie>    ^<圣魔戒指(禁锢)/@senjie>    ^<真魂戒指(禁锢)/@zenjie>\'
  +'|{cmd}<战神手镯(禁锢)/@zanwan>    ^<圣魔手镯(禁锢)/@senwan>    ^<真魂手镯(禁锢)/@zenwan>\' 
  +'|{cmd}<战神项链(禁锢)/@zanlan>    ^<圣魔项链(禁锢)/@senlan>    ^<真魂项链(禁锢)/@zenlan>\ \'
  +'|{cmd}<下一页/@nextjie>                    ^<返回/@jiejin>'
  );
end;

procedure _freejingu;
begin
  This_Npc.NpcDialog(This_Player,
  '雷霆、光芒、烈焰物品不再需要伏魔令便可直接解除禁锢。\'
  +'您想解除哪个物品的禁锢呢？\'
  +'|{cmd}<雷霆战戒(禁锢)/@leijie>    ^<光芒道戒(禁锢)/@guajie>    ^<烈焰魔戒(禁锢)/@liejie>\'
  +'|{cmd}<雷霆护腕(禁锢)/@leiwan>    ^<光芒护腕(禁锢)/@guawan>    ^<烈焰护腕(禁锢)/@liewan>\'
  +'|{cmd}<雷霆项链(禁锢)/@leilan>    ^<光芒项链(禁锢)/@gualan>    ^<烈焰项链(禁锢)/@lielan>\'
  +'|{cmd}<雷霆腰带(禁锢)/@leiyao>    ^<光芒腰带(禁锢)/@guayao>    ^<烈焰腰带(禁锢)/@lieyao>\'
  +'|{cmd}<雷霆战靴(禁锢)/@leixie>    ^<光芒道靴(禁锢)/@guaxie>    ^<烈焰魔靴(禁锢)/@liexie>\ \'
  +'|{cmd}<返回/@jiejin>'
  );
end;

procedure _nextjie;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<银星勋章(禁锢)/@yinxin>    ^<寂静之手(禁锢)/@jishou>\'
  +'|{cmd}<星王腰带(禁锢)/@xinyao>    ^<星王靴(禁锢)/@xinxie>      ^<星王冠(禁锢)/@xinguan>\'
  +'|{cmd}<星王项链(禁锢)/@xinnek>    ^<星王护腕(禁锢)/@xinrig>    ^<星王戒指(禁锢)/@xinrin>\ \'
  +'|{cmd}<上一页/@jingu>                     ^<返回/@jiejin>'
  );
end;

procedure _shiyan;
begin
  OpenLockWithFML('誓言腰带(禁锢)', '誓言腰带(战)', '誓言腰带(道)', '誓言腰带(法)'); 
end;

procedure _yunyan;
begin
  OpenLockWithFML('预言头盔(禁锢)', '预言头盔(战)', '预言头盔(道)', '预言头盔(法)');   
end;

procedure _chushu;
begin
  OpenLockWithFML('传说魔靴(禁锢)', '传说魔靴(战)', '传说魔靴(道)', '传说魔靴(法)');   
end;

//更改模板：魔龙装备不再收取伏魔令了，而换为直接兑换；
procedure FROpenLockWithFMLOne(item_src, item_des : string);
begin
  if This_Player.GetBagItemCount(item_src) = 0  then
  begin
    This_Npc.NpcDialog(This_Player,
    '您好像没有' + item_src + '啊，还是先找到了再来找我吧！');
  end
  else
  begin
    This_Player.Take(item_src,1);
    This_Player.Give(item_des,1);
    This_Npc.NpcDialog(This_Player,
            '祝贺您，物品的禁锢已经解除了！赶快打开包裹看看吧！');  
  end;
end; 
 
procedure _leijie;
begin
  FROpenLockWithFMLOne('雷霆战戒(禁锢)', '雷霆战戒');  
end;

procedure _leiwan;
begin
  FROpenLockWithFMLOne('雷霆护腕(禁锢)', '雷霆护腕');   
end;

procedure _leilan;
begin
  FROpenLockWithFMLOne('雷霆项链(禁锢)', '雷霆项链');   
end;

procedure _leiyao;
begin
  FROpenLockWithFMLOne('雷霆腰带(禁锢)', '雷霆腰带');  
end;

procedure _leixie;
begin
  FROpenLockWithFMLOne('雷霆战靴(禁锢)', '雷霆战靴');    
end;

procedure _guajie;
begin
  FROpenLockWithFMLOne('光芒道戒(禁锢)', '光芒道戒');    
end;

procedure _guawan;
begin
  FROpenLockWithFMLOne('光芒护腕(禁锢)', '光芒护腕');   
end;

procedure _gualan;
begin
  FROpenLockWithFMLOne('光芒项链(禁锢)', '光芒项链');   
end;

procedure _guayao;
begin
  FROpenLockWithFMLOne('光芒腰带(禁锢)', '光芒腰带');  
end;

procedure _guaxie;
begin
  FROpenLockWithFMLOne('光芒道靴(禁锢)', '光芒道靴');    
end;

procedure _liejie;
begin
  FROpenLockWithFMLOne('烈焰魔戒(禁锢)', '烈焰魔戒');   
end;

procedure _liewan;
begin
  FROpenLockWithFMLOne('烈焰护腕(禁锢)', '烈焰护腕');    
end;

procedure _lielan;
begin
  FROpenLockWithFMLOne('烈焰项链(禁锢)', '烈焰项链');   
end;

procedure _lieyao;
begin
  FROpenLockWithFMLOne('烈焰腰带(禁锢)', '烈焰腰带');  
end;

procedure _liexie;
begin
  FROpenLockWithFMLOne('烈焰魔靴(禁锢)', '烈焰魔靴');   
end;

procedure _kuajie;
begin
  OpenLockWithFMLOne('狂战戒指(禁锢)', '狂战戒指');  
end;

procedure _kuawan;
begin
  OpenLockWithFMLOne('狂战手镯(禁锢)', '狂战手镯');    
end;

procedure _hunjie;
begin
  OpenLockWithFMLOne('混世戒指(禁锢)', '混世戒指');   
end;

procedure _hunwan;
begin
  OpenLockWithFMLOne('混世手镯(禁锢)', '混世手镯');
end;

procedure _taijie;
begin
  OpenLockWithFMLOne('太极戒指(禁锢)', '太极戒指');
end;

procedure _taiwan;
begin
  OpenLockWithFMLOne('太极手镯(禁锢)', '太极手镯');
end;

procedure _zanjie;
begin
  OpenLockWithFMLOne('战神戒指(禁锢)', '战神戒指');  
end;

procedure _zanwan;
begin
  OpenLockWithFMLOne('战神手镯(禁锢)', '战神手镯');   
end;

procedure _zanlan;
begin
  OpenLockWithFMLOne('战神项链(禁锢)', '战神项链');   
end;

procedure _senjie;
begin
  OpenLockWithFMLOne('圣魔戒指(禁锢)', '圣魔戒指');   
end;

procedure _senwan;
begin
  OpenLockWithFMLOne('圣魔手镯(禁锢)', '圣魔手镯');   
end;

procedure _senlan;
begin
  OpenLockWithFMLOne('圣魔项链(禁锢)', '圣魔项链');   
end;

procedure _zenjie;
begin
  OpenLockWithFMLOne('真魂戒指(禁锢)', '真魂戒指');  
end;

procedure _zenwan;
begin
  OpenLockWithFMLOne('真魂手镯(禁锢)', '真魂手镯');  
end;

procedure _zenlan;
begin
  OpenLockWithFMLOne('真魂项链(禁锢)', '真魂项链');   
end;

procedure _yinxin;
begin
  OpenLockWithFML('银星勋章(禁锢)', '银星勋章(战)', '银星勋章(道)', '银星勋章(法)');   
end;

procedure _jishou;
begin
  OpenLockWithFML('寂静之手(禁锢)', '寂静之手(战)', '寂静之手(道)', '寂静之手(法)');    
end;

procedure _xinyao;
begin
  OpenLockWithFML('星王腰带(禁锢)', '星王腰带(战)', '星王腰带(道)', '星王腰带(法)');    
end;

procedure _xinxie;
begin
  OpenLockWithFML('星王靴(禁锢)', '星王战靴', '星王道靴', '星王法靴');   
end;

procedure _xinguan;  
begin
  OpenLockWithFML('星王冠(禁锢)', '星王战盔', '星王道盔', '星王法冠');    
end;

procedure _xinnek;
begin
  OpenLockWithFML('星王项链(禁锢)', '星王项链(战)', '星王项链(道)', '星王项链(法)');   
end;

procedure _xinrig;
begin
  OpenLockWithFML('星王护腕(禁锢)', '星王护腕(战)', '星王护腕(道)', '星王护腕(法)');   
end;

procedure _xinrin;
begin
  OpenLockWithFML('星王戒指(禁锢)', '星王战戒', '星王道戒', '星王魔戒');    
end;      

begin
  domain;
end.   