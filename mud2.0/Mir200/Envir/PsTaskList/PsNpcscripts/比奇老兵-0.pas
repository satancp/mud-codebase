{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}
{$I WarehouseAndMbind.pas}
{$I ActiveValidateCom.pas}
{$I goToMonMap.pas}

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
    This_NPC.NpcDialog(This_Player,
    '比奇城是玛法大陆上最繁华的城市\'
    +'我有很多有趣的事情，你想不想听啊\'
    +'|{cmd}<进入庄园/@baodian>        ^<关于PK/@pk>\'
    +'|{cmd}<坐标询问/@xy>              ^<洞察魔兽信息/@dongcha>\\'
    +'|{cmd}<想瞬间移动/@talkwith>            ^<想去毒蛇山谷/@moveDS>\'
    +'|{cmd}<前往新手村/@goXSMap>            ^<洞穴传送/@goMonMap>\'
    +ActiveValidateStr
    +'|{cmd}<确定/@exit>\ '
    );
end;

procedure _moveDS; 
begin
This_Player.Flyto('2',500,485);
end;

procedure _goXSMap; 
begin
    This_NPC.NpcDialog(This_Player,
    '你想去边界村还是银杏山谷？\ \'
    +'|{cmd}<去边界村/@goXSMap_1>            ^<去银杏山谷/@goXSMap_2>\'
    +'|{cmd}<返回/@main>\ '
    );
end;

procedure _goXSMap_1; 
begin
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',290 + random(3) - 1,615 + random(3) - 1);
end;

procedure _goXSMap_2; 
begin
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',650 + random(3) - 1,625 + random(3) - 1);
end;

procedure _goMonMap;
begin
    This_NPC.NpcDialog(This_Player,
    '你想去哪里？我可以送你一程。\ \'
    +'|{cmd}<前往兽人古墓/@goToNewMonMap_1>              ^<前往洞穴/@goToNewMonMap_2>\'
    +'|{cmd}<前往沃玛森林/@goToNewMonMap_3>              ^<前往比奇废矿/@goToNewMonMap_4>\'
    +'|{cmd}<返回/@main>\ '
    );
end;

procedure _goToNewMonMap_1; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',140 + random(3) - 1,40 + random(3) - 1); 
end;

procedure _goToNewMonMap_2; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',45 + random(3) - 1,115 + random(3) - 1); 
end;

procedure _goToNewMonMap_3; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('1',90 + random(3) - 1,285 + random(3) - 1); 
end;

procedure _goToNewMonMap_4; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',660 + random(3) - 1,220 + random(3) - 1); 
end;

procedure _baodian;
begin
  This_Npc.NpcDialog(This_Player,
  '通过庄园内的“元宝使者”，能与其他玩家进行元宝交易，\您现在要去庄园吗?\ \'
  +'|{cmd}<前往庄园/@zhuangyuan>'
  );
end;

procedure _zhuangyuan;
var temp: integer;
//随机5个点传送
begin
  temp := random(5)+1;
  if This_Player.Level >= 8 then
  begin
    if compareText(This_Player.MapName, '0') = 0 then
    begin
        if temp = 1 then
        begin
        This_Player.Flyto('GA0',59,46);
        end
        else if temp = 2 then
        begin
        This_Player.Flyto('GA0',57,61);
        end
        else if temp = 3 then
        begin
        This_Player.Flyto('GA0',71,72);
        end
        else if temp = 4 then
        begin
        This_Player.Flyto('GA0',59,75);
        end
        else
        begin
        This_Player.Flyto('GA0',67,83);
        end;
    end;  
  end
  else
    This_Npc.NpcDialog(This_Player,
    '你的能力不够，我还不能送你去那里，\当您达到8级的时候再来找我吧！\'
    );  
end;

procedure _dongcha;
begin
  if AutoClothersMapOpen then
  begin
  This_Npc.NpcDialog(This_Player,
  '相传在玛法大陆的某些角落，有一批恶魔镇守着六件重装，\想要获得这些宝物，就必须首先要杀死这些恶魔，\无数的为了获得这些宝物，不惜以自己的生命作为代价，\ 有些人成功了，更多的勇士则倒在了恶魔的脚下，\ 这位，您是否也想去发现这些魔兽的踪迹，\给我5万金币，我就能帮您去查看它们的踪影，\给我5颗金刚石，我就能送您去独闯魔穴。\'
  +'|{cmd}<花5万金币，探查魔兽踪影/@paymoney>\'
  +'|{cmd}<付5颗金刚石，前往除魔/@paydia>'
  );
  end;
end;

procedure _paymoney;
begin
  This_Npc.NpcDialog(This_Player,
  '您想查询哪个魔域的恶魔信息呢？\'
  +'|{cmd}<死亡神殿/@siwang>(霓裳羽衣)'+addSpace('', 10) +'^<堕落坟场/@duoluo>(法神披风)\ \'
  +'|{cmd}<深渊魔域/@shengy>(天尊道袍)'+addSpace('', 10) +'^<地狱烈焰/@diyu>(圣战宝甲)\ \'
  +'|{cmd}<查询其它的恶魔信息/@qita>           ^<返回/@main>\ \'
  );
end;

procedure _paydia;
begin
  This_Npc.NpcDialog(This_Player,
  '我这里能送您去一些魔域的大概地点，但是您要给我5颗金刚石，\至于具体前往魔域的路径，就要靠您智慧的头脑了。\ \'
  +'|{cmd}<去死亡神殿/@paydiamondt118>(霓裳羽衣)'+addSpace('', 10) +'^<去堕落坟场/@paydiamondt115>(法神披风)\'
  +'|{cmd}<去深渊魔域/@paydiamondt119>(天尊道袍)'+addSpace('', 10) +'^<去地狱烈焰/@paydiamondt139>(圣战宝甲)\'
  );
end;

procedure _qita;
begin
  This_Npc.NpcDialog(This_Player,
  '您还想查询哪里的恶魔信息，\虽然我能力有限，但我知道谁可以告诉你其中的秘密，\只要你告诉我你想知道的恶魔巢穴就可以了。\'
  +'|{cmd}<困惑殿堂/@askmen>'+addSpace('', 16) + '|{cmd}<钳虫巢穴/@askbai>\ \'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _askmen;
begin
  This_Npc.NpcDialog(This_Player,
  '盟重的镇魔守将好像知道一些有关于魔兽的事情，\要么您去找他问问看吧。\<关闭/@doexit>'
  );
end;

procedure _askbai;
begin
  This_Npc.NpcDialog(This_Player,
  '白日门的向导好像知道一些有关于魔兽的事情，\要么您去找他问问看吧。\<关闭/@doexit>'
  );
end;  

procedure _siwang;
begin
  if This_Player.GoldNum >= 50000 then
    begin
        if CheckOtherMapMon('T118') >= 1 then                         
        begin
        This_Player.DecGold(50000);
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\好像魔兽就守候在前方，此时不去，更待合时？\<付5颗金刚石，前往除魔/@paydiamondt118>'
        );
        end
        else
        begin
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\可惜，魔兽还没有出现。'
        );
        end;
    end
    else
    begin
    This_Npc.NpcDialog(This_Player,
    '您好像没有50000金币啊，我也帮不了你了！'
    );
    end;
end;

procedure _paydiamondt118;
begin
  if This_Player.GetBagItemCount('金刚石') >= 5 then
  begin
     if compareText(This_Player.MapName, '0') = 0 then
     begin
        This_Player.Take('金刚石',5); 
        This_Player.Flyto('4',205,230);
     end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '您怎么连5颗金刚石也没有啊！'
    );
  end;
end;

procedure _duoluo;
begin
  if This_Player.GoldNum >= 50000 then
    begin
        if CheckOtherMapMon('T115') >= 1 then
        begin
        This_Player.DecGold(50000);
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\好像魔兽就守候在前方，此时不去，更待合时？\<付5颗金刚石，前往除魔/@paydiamondt115>'
        );
        end
        else
        begin
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\可惜，魔兽还没有出现。'
        );
        end;
    end
    else
    begin
    This_Npc.NpcDialog(This_Player,
    '您好像没有50000金币啊，我也帮不了你了！'
    );
    end;
end;

procedure _paydiamondt115;
begin
  if This_Player.GetBagItemCount('金刚石') >= 5 then
  begin
     if compareText(This_Player.MapName, '0') = 0 then
     begin
        This_Player.Take('金刚石',5);
        This_Player.Flyto('1',306,70);
     end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '您怎么连5颗金刚石也没有啊！'
    );
  end;
end;

procedure _shengy;
begin
  if This_Player.GoldNum >= 50000 then
    begin
        if CheckOtherMapMon('T119') >= 1 then
        begin
        This_Player.DecGold(50000);
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\好像魔兽就守候在前方，此时不去，更待合时？\<付5颗金刚石，前往除魔/@paydiamondt119>'
        );
        end
        else
        begin
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\可惜，魔兽还没有出现。'
        );
        end;
    end
    else
    begin
    This_Npc.NpcDialog(This_Player,
    '您好像没有50000金币啊，我也帮不了你了！'
    );
    end;
end;

procedure _paydiamondt119;
begin
  if This_Player.GetBagItemCount('金刚石') >= 5 then
  begin
     if compareText(This_Player.MapName, '0') = 0 then
     begin
        This_Player.Take('金刚石',5);
        This_Player.Flyto('1',213,324);
     end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '您怎么连5颗金刚石也没有啊！'
    );
  end;
end;

procedure _diyu;
begin
  if This_Player.GoldNum >= 50000 then
    begin
        if CheckOtherMapMon('T139') >= 1 then
        begin
        This_Player.DecGold(50000);
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\好像魔兽就守候在前方，此时不去，更待合时？\<付5颗金刚石，前往除魔/@paydiamondt139>'
        );
        end
        else
        begin
        This_Npc.NpcDialog(This_Player,
        '让我掐指算算，\可惜，魔兽还没有出现。'
        );
        end;
    end
    else
    begin
    This_Npc.NpcDialog(This_Player,
    '您好像没有50000金币啊，我也帮不了你了！'
    );
    end;
end;

procedure _paydiamondt139;
begin
  if This_Player.GetBagItemCount('金刚石') >= 5 then
  begin
      if compareText(This_Player.MapName, '0') = 0 then
      begin
        This_Player.Take('金刚石',5);
        This_Player.Flyto('0',444,465);
      end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '您怎么连5颗金刚石也没有啊！'
    );
  end;
end;


procedure _xy;
begin
    This_NPC.NpcDialog(This_Player,
    '比奇最大的城市就是你所在的比奇城，坐标就不用我说了吧！\'
    +'毒蛇山谷的小村很好找，你只要往500 500 的坐标走就能够\'
    +'到了。不过，如果你要到盟重土城，就应该牢记300 300\'
    +'这个数字, 它会指引你走到那里。离流放地很近的沙巴克，是\'
    +'一个危险的区域，我记得以前在600 300找到它的。不过我要提\'
    +'醒你，每个省份的坐标都是不同的，可别在比奇找沙巴克哦！\'
    +'所以，要记住每个通往其他省的关口。\'
    +'另外，从沃玛森林的45 30就可以到达刚刚被发现的的白日门\'
    +'|{cmd}<返回/@main>'

    );

end;

procedure _pk;
begin
    This_NPC.NpcDialog(This_Player,
    '如果遇到PK的人，可要自己保重哦！虽然说PK的人\'
    +'会受到流放的处罚，可这是在他们死亡以后进行的。\'
    +'奉劝大家不要PK，流放到边疆以后的日子可不好过，\'
    +'相信每一个在流放村里孤苦伶仃，没有装备，没有\'
    +'补给的度过日子的人都会同意我这句话。\'
    +'差点忘了告诉大家，沙巴克离流放地最近，是一个\'
    +'流放犯出没的区域，千万小心财不露白哦！\\'
    +'|{cmd}<返回/@main>'
    );


end;


procedure _talkwith;
begin
    This_NPC.NpcDialog(This_Player,
    '不要相信什么凌波微步,其实这个东西很\'
    +'简单,只要你付钱,什么问题不能解决呢?\'
    +'来吧,小伙子,这个世界充满危险,让我送你一程吧!\\'
    +'|{cmd}<到比奇商店/@move0>\'
    +'|{cmd}<向白日门移动/@move1> \'
    +'|{cmd}<向毒蛇山谷入口移动/@move2> \'
    +'|{cmd}<向封魔谷移动/@move3> \'
    +'|{cmd}<返回/@main>'
    );

end;



procedure _move0;
begin
This_NPC.NpcDialog(This_Player,
'你想到哪个商店？这可是免费体验服务啊！\\'
+'|{cmd}<服装店/@move01>\'
+'|{cmd}<武器店/@move02>\'
+'|{cmd}<首饰店/@move03>\'
+'|{cmd}<返回/@main>'
);

end;

procedure _move01;
begin
This_Player.RandomFlyTo('0106');
end;

procedure _move02;
begin
This_Player.RandomFlyTo('0103');
end;

procedure _move03;
begin
This_Player.RandomFlyTo('0105');
end;

procedure _move1;
begin
    This_NPC.NpcDialog(This_Player,
    '我不喜欢一句话说很多次,没有钱的话\'
    +'你自己应该知道怎么做.去白日门是吧?\'
    +'2000大洋,一分也不能少.\\'
    
    +'|{cmd}<移动/@pay1> \ '
    +'|{cmd}<不/@talkwith> '
    );
  
end;


procedure _pay1;
begin
    IF This_Player.GoldNum >= 2000 then
    begin
        This_Player.DecGold(2000);
        This_Player.Flyto('11',136,368);
    end else
    This_NPC.NpcDialog(This_Player,
    '你开玩笑吗？你没钱还想移动？\'
    +'我再也不想见到你。\ '
    
    +'|{cmd}<返回/@main>'
    );

end;

procedure _move2;
begin
This_NPC.NpcDialog(This_Player,
'移动到毒蛇山谷当然也需要有钱，\'
+'总不能免费把你移动到那儿吧？\'
+'去毒蛇山谷需要1000金币。\ '
+'支付这些钱，移动吗？\ \'

+'|{cmd}<移动/@pay2> \'
+'|{cmd}<不/@talkwith>'



);

end;

procedure _pay2;
begin
    IF This_Player.GoldNum >= 1000 then
    begin
        This_Player.DecGold(1000);
        This_Player.Flyto('0',667,90);
    end else
    This_NPC.NpcDialog(This_Player,
    '你在开玩笑吗？没钱还想移动？\'
    +'我再也不想见到你。\ '
    
    +'|{cmd}<返回/@main>'
    );

end;

procedure _move3;
begin
    This_NPC.NpcDialog(This_Player,
    '我不喜欢一句话说很多次,没有钱的话\'
    +'你自己应该知道怎么做.去封魔谷是吧?\'
    +'2000大洋,一分也不能少.\ \'
    +'|{cmd}<移动/@pay3> \ '
    +'|{cmd}<不/@talkwith> '
);
  
end;


procedure _pay3;
begin
    IF This_Player.GoldNum >= 2000 then
    begin
        This_Player.DecGold(2000);
        This_Player.Flyto('4',240,200);
    end else
    This_NPC.NpcDialog(This_Player,
    '你开玩笑吗？你没钱还想移动？\'
    +'我再也不想见到你。\ '
    +'|{cmd}<返回/@main>'
    );

end;

begin
 domain;
end.