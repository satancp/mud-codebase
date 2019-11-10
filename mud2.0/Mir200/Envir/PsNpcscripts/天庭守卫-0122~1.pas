program mir2;

// 开新手卡 写在Compiler.inc中
{.$DEFINE NEWBIE_CARD}


procedure _mount;
begin
  This_Npc.NpcDialog(This_Player,
    '您现在拥有圣殿灵符：' + IntToStr(This_Player.NickLinFu) + '\ \' +
    '|{cmd}<返回/@chaxun>'
  )  
end;

procedure _dating;
begin
  This_Npc.NpcDialog( This_Player,
    '传说天关之中除了大家众所周知的奇珍异宝之外，\' +
    '其实还存在着圣殿，其中也隐藏着宝藏。\' +
    '只有使用圣殿灵符才可以进入天关中的圣殿，\' +
    '寻找其中隐藏的宝藏。\ \' +
    '|{cmd}<返回/@chaxun>'
  );
end;

procedure _chaxun;
begin
  This_Npc.NpcDialog( This_Player,
    '|{cmd}<查询圣殿灵符数量/@mount>\ \'  +
    '|{cmd}<打听圣殿宝藏/@dating>\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _shengdian;
begin
  if This_Player.NickLinFu > 0 then
  begin
    if compareText(This_Player.MapName, '0122~1') = 0 then
    begin
       This_Player.RandomFlyTo('D515~304');
    end;
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你的圣殿灵符在哪里呢？'
    );
end;

procedure _jinrutong;
begin
  This_Npc.EnterRouteWayByLF(This_Player, True);
  
  if This_Player.GetV(111,7) = 1 then
  begin
     if This_Player.SetV(111,7,10) then
     begin
        This_Player.Give('经验',10000);
        //#This_Player.DeleteTaskFromUIList(1007);
        This_Player.PlayerNotice('你已经完成了成长之路：天关寻宝。', 2); 
     end;
  end;
  
  if This_Player.GetV(111,8) = 1 then
  begin
     if This_Player.SetV(111,8,10) then
     begin
        This_Player.Give('经验',10000);
        //#This_Player.DeleteTaskFromUIList(1008);
        This_Player.PlayerNotice('你已经完成了成长之路：魔王岭拒敌。', 2); 
     end;  
  end; 
end;

procedure _gomo;
begin
//  This_Player.Tell('[Test]: ok', 2);
  This_Npc.NpcDialog(This_Player,
    '知道来找我，消息还挺灵通的嘛。\' +
    '给我一张灵符，我就送你去天关通道。\ \' +
    '|{cmd}<使用一张灵符进入天关通道/@jinrutong>\ \' +
    '|{cmd}<返回/@main>                       ^<关闭/@exit>');

end;

procedure _newbiejinrutong;
begin
  {$IFDEF Q136_hero}
  exit;
  {$ELSE}
  //This_Npc.NewBieEnterRouteWayByLF(This_Player);
  {$ENDIF}
end;

procedure _xijie1;
begin
  This_Npc.NpcDialog( This_Player,
    '|{cmd}<了解闯天关的细节/@xijie>\ \' +
    '|{cmd}<查看魔王岭细则/@rule>\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _xijie;
begin
  This_Npc.NpcDialog( This_Player,
    '|{cmd}<为什么提示我“天关通道已经满员，请稍后再试”/@why>\' +
    '|{cmd}<在天关中获得的金刚石如何显示/@xianshi>\' +
    '|{cmd}<天关通道是否就是天关/@shifou>\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _why;
begin
  This_Npc.NpcDialog( This_Player,
    '如果玩家对自己的实力有信心，可以[选择消灭怪物]\' +
    '在没有灵符的保护下进入天关通道\' +
    '玩家必须只身消灭完天关通道里的所有怪物，才能进入天关夺宝\' +
    '这样的通道一共有10条\' +
    '如果满员就会提示：“天关通道已经满员，请稍后再试”\ \' +
    '|{cmd}<返回上一页/@xijie>'
  );
end;

procedure _xianshi;
begin
  This_Npc.NpcDialog( This_Player,
    '如果您在天关中获得了金刚石，那么在同一天关中是无法显示的\' +
    '如果您进入下一天关，或返回天庭，就可以看到增加的金刚石了\ \' +
    '|{cmd}<返回上一页/@xijie>'
  );
end;

procedure _shifou;
begin
  This_Npc.NpcDialog( This_Player,
    '天关通道并不是天关，只是天庭通往天关的通道\' +
    '天关通道里没有宝藏，真正的宝藏是隐藏在天关里的\ \' +
    '|{cmd}<返回上一页/@xijie>'
  );
end;

procedure _rule;
begin
  This_Npc.NpcDialog( This_Player,
    '调遣你的弓箭手，拦截逃离的怪物，获得怪物盗走的宝物\' +
    '逃离的怪物越少，您能获得的物品将更加丰富\' +
    '不放走1个怪物，更有机会获得<金天赐>\' +
    '拦截47-49个怪物，可获得银天赐；拦截41-46个怪物，可获得铜天赐\' +
    '拦截的怪物少于41个，还可以获得木天赐\' +
    '每次摆放弓箭手，都需要付出1张灵符\' +
    '|{cmd}<什么是弩牌？/@rule4>\' +
    '|{cmd}<如何摆放弓箭手/@rule1>\' +
    '|{cmd}<如何移动弓箭手/@rule2>\'
  );
end;

procedure _rule1;
begin
  This_Npc.NpcDialog( This_Player,
    '比赛开始，第一次摆放弓箭手时\' +
    '您可以点击<“选择摆放弓箭手位置”>选择摆放第一个弓箭手的位置\' +
    '第一个弓箭手位置一旦放置完毕，则怪物大军开始逃离！\' +
    '您的弓箭手杀死怪物，会在杀死怪物的弓箭手旁掉落<“弩牌”/@rule4>\' +
    '当您拥有5个弩牌时可以选择<“使用5个弩牌换取弓箭手”>\' +
    '同时您<“必须付出1张灵符”>，将获得再次选择摆放1个弓箭手的机会\' +
    '如果您再交出弩牌后没有立刻摆放弓箭手\' +
    '可以再次选择<“选择摆放弓箭手位置”>进行摆放\' +
    '|{cmd}<下一页/@next>'
  );
end;

procedure _next;
begin
  This_Npc.NpcDialog( This_Player,
    '每次阻击战中您只能摆放6个弓箭手\ \' +
    '|{cmd}<退出/@exit>'
  );
end;

procedure _rule2;
begin
  This_Npc.NpcDialog( This_Player,
    '当您的包裹里存在1个弩牌，并且拥有1个以上弓箭手时\' +
    '您可以选择<“使用1个弩牌移动弓箭手”>\' +
    '先选择要移动的弓箭手后，再选择要放置的位置，即可移动\' +
    '如果您已经选择了移动弓箭手，但是放置的位置错误\' +
    '可以再次选择<“选择摆放弓箭手位置”>摆放弓箭手\' +
    '移动弓箭手<“不需要付出灵符”>\ \' +
    '|{cmd}<退出/@exit>'
  );
end;

procedure _rule4;
begin
  This_Npc.NpcDialog( This_Player,
    '弩牌为召唤和移动弓箭手的凭证\' +
    '你可以使用5个弩牌和1张灵符换取1个弓箭手为你作战\' +
    '或者使用1个弩牌为你的1个弓箭手移位\' +
    '杀死逃离的怪物有机会获得弩牌\' +
    '弩牌只能在魔王岭中使用，一旦带离魔王岭，它将失去魔力\' +
    '再进入魔王岭时会被传送之力所粉碎\ \' +
    '|{cmd}<退出/@exit>'
  );
end;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _gozhuang;
var
  rValue, x, y : Integer;
begin
 if compareText(This_Player.MapName, '0122~1') = 0 then
 begin  
  rValue := random(5);
  case rValue of 
  0 :
    This_Player.FlyTo('Ga0', 70, 71);
  1 :
    This_Player.FlyTo('Ga0', 73, 64);
  2 :
    This_Player.FlyTo('Ga0', 73, 69);
  3 :
    This_Player.FlyTo('Ga0', 62, 72);
  4 :
    This_Player.FlyTo('Ga0', 61, 64);
  end;
 end;
end;

Procedure _buylingfu;
var
  num : integer;
begin
  num := This_Player.GetV(14,3);
  if num < 0 then
  begin
    num := 0;
    This_Player.SetV(14,3,0);
    This_Npc.NpcDialog(This_Player,
    '通过我，可以将您的游戏时间兑换成灵符；\'
    +'兑换标准：月卡用户1天游戏时间兑换1张灵符，\'
    +'秒卡用户4小时游戏时间兑换1张灵符.先扣天卡，后扣秒卡\'
    +'如秒天卡同时存在并且购买数量超过天卡额度，则需要分两次购买\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\ ' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'你还没有兑换灵符。\'
    +'|{cmd}<加一张/@sjaddone> ^<加五张/@sjaddfive> ^<加十张/@sjaddten>      ^<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    );
  end
  else if num = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '通过我，可以将您的游戏时间兑换成灵符；\'
    +'兑换标准：月卡用户1天游戏时间兑换1张灵符，\'
    +'秒卡用户4小时游戏时间兑换1张灵符.先扣天卡，后扣秒卡\'
    +'如秒天卡同时存在并且购买数量超过天卡额度，则需要分两次购买\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\ ' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'你还没有兑换灵符。\'
    +'|{cmd}<加一张/@sjaddone> ^<加五张/@sjaddfive> ^<加十张/@sjaddten>      ^<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    );
  end
  else if num < 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '通过我，可以将您的游戏时间兑换成灵符；\'
    +'兑换标准：月卡用户1天游戏时间兑换1张灵符，\'
    +'秒卡用户4小时游戏时间兑换1张灵符.先扣天卡，后扣秒卡\'
    +'如秒天卡同时存在并且购买数量超过天卡额度，则需要分两次购买\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\ ' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'你打算兑换' + inttostr(num) + '张灵符\'
    +'|{cmd}<加一张/@sjaddone> ^<加五张/@sjaddfive> ^<加十张/@sjaddten>      ^<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    );
  end
  else
  begin
    num := 1000;
    This_Player.SetV(14,3,num);
    This_Npc.NpcDialog(This_Player,
    '一次最多可兑换1000张灵符，\'
    +'您已经选择兑换1000张灵符，是否进行兑换？\ \'
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    ); 
  end;
end;

procedure _sjbuylf;
var
  needm, miao, needLF: integer;
begin
  //需要兑换的灵符数； 
  needm := This_Player.GetV(14,3)*4*3600; 
  miao := This_Player.HaveTimeNum;
  if miao >= needm then
  begin
    needLF := This_Player.GetV(14,3);
    This_Npc.ReqUseTimeBuyLF(This_Player, needLF);
    This_Player.SetV(14,3,0);
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '您的秒卡数不够。\ \|{cmd}<返回/@main>');
  end;
end;

procedure _chklinfu;
begin
  This_Npc.NpcDialog(This_Player,
  '你当前的灵符总数是：' + inttostr(This_Player.MyLFnum)
  ); 
end;

Procedure showchklinfu;
var
  num : integer;
begin
  num := This_Player.GetV(14,3);
  if num < 0 then
  begin
    num := 0;
    This_Player.SetV(14,3,0);
    This_Npc.NpcDialog(This_Player,
    '通过我，可以将您的游戏时间兑换成灵符；\'
    +'兑换标准：月卡用户1天游戏时间兑换1张灵符，\'
    +'秒卡用户4小时游戏时间兑换1张灵符.先扣天卡，后扣秒卡\'
    +'如秒天卡同时存在并且购买数量超过天卡额度，则需要分两次购买\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\ ' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'你还没有兑换灵符。\'
    +'|{cmd}<加一张/@sjaddone> ^<加五张/@sjaddfive> ^<加十张/@sjaddten>      ^<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    );
  end
  else if num = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '通过我，可以将您的游戏时间兑换成灵符；\'
    +'兑换标准：月卡用户1天游戏时间兑换1张灵符，\'
    +'秒卡用户4小时游戏时间兑换1张灵符.先扣天卡，后扣秒卡\'
    +'如秒天卡同时存在并且购买数量超过天卡额度，则需要分两次购买\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\ ' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'你还没有兑换灵符。\'
    +'|{cmd}<加一张/@sjaddone> ^<加五张/@sjaddfive> ^<加十张/@sjaddten>      ^<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    );
  end
  else if num < 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '通过我，可以将您的游戏时间兑换成灵符；\'
    +'兑换标准：月卡用户1天游戏时间兑换1张灵符，\'
    +'秒卡用户4小时游戏时间兑换1张灵符.先扣天卡，后扣秒卡\'
    +'如秒天卡同时存在并且购买数量超过天卡额度，则需要分两次购买\'
    +'如您进行灵符的兑换，则视您已经同意以上兑换规则。\ ' 
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'你打算兑换' + inttostr(num) + '张灵符\'
    +'|{cmd}<加一张/@sjaddone> ^<加五张/@sjaddfive> ^<加十张/@sjaddten>      ^<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    );
  end
  else
  begin
    num := 1000;
    This_Player.SetV(14,3,num);
    This_Npc.NpcDialog(This_Player,
    '一次最多可兑换1000张灵符，\'
    +'您已经选择兑换1000张灵符，是否进行兑换？\ \'
    +'|{cmd}<查询灵符/@chklinfu>\'
    +'|{cmd}<减一张/@sjdecone> ^<减五张/@sjdecfive> ^<减十张/@sjdecten>\'
    +'|{cmd}<确定兑换/@sjbuylf>                  ^<返回/@main>'
    ); 
  end;
end;

procedure sjaddlinfu(num : integer);
var
  allnum : integer;
begin
  allnum := This_Player.GetV(14,3) + num;
  if  allnum < 1000 then
  begin
    This_Player.SetV(14,3,allnum);
    showchklinfu;
  end
  else
  begin
    This_Player.SetV(14,3,1000);
    showchklinfu;
  end;
end; 

Procedure _sjaddten;
begin
   sjaddlinfu(10);
end;

Procedure _sjaddfive;
begin
   sjaddlinfu(5);
end;

Procedure _sjaddone;
begin
   sjaddlinfu(1);
end;

procedure sjdeclinfu(num : integer);
var
  allnum : integer;
begin
  allnum := This_Player.GetV(14,3) - num;
  if  allnum > 0 then
  begin
    This_Player.SetV(14,3,allnum);
    showchklinfu;
  end
  else
  begin
    This_Player.SetV(14,3,0);
    showchklinfu;
  end;
end; 

procedure _sjdecten;
begin
  sjdeclinfu(10);
end;

procedure _sjdecfive;
begin
  sjdeclinfu(5);
end;

procedure _sjdecone;
begin
  sjdeclinfu(1);
end;


begin
    This_Npc.NpcDialog(This_Player,
    '我将助你进入天关通道，穿越通道即可到达重重天关中的其中一关！\' +
    '打败该处天关内的怪物，便可获得该处天关中的宝藏！\' +
    '不过天关通道内有怪物把守，怪物强大，难以直接穿越；\' +
    '使用灵符，怪物将无法看到你，你可以直接穿越通道闯入天关！\' +
    //'|{cmd}<前往魔王岭或天关/@gomo>                ^<进入圣殿天关/@shengdian>\' +   ^<使用游戏时间兑换灵符/@buylingfu>
    '|{cmd}<前往魔王岭/@gomo>\' +
    
    '|{cmd<返回庄园/@gozhuang>\');
end.