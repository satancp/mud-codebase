{********************************************************************

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

procedure domain;
begin
    //if (random(10) = 0) and (This_Player.GetV(9,19) = 1)then
    if (random(10) = 0) and ((This_Player.GetV(11,1) = 3) or (This_Player.GetV(11,1) = 4))then
    begin
       //This_Player.SetV(9,20,1);
       This_Player.SetV(11,1,4);
       This_NPC.NpcDialog(This_Player,
       '你在找厨师吗？ \ '
       +'我对厨师也不是很了解。 \ '
       +'但是据说毒蛇山谷的米家服装老板知道此事，\'
       +'你可以去找他一下。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end
      else
      This_Npc.NpcDialog(This_Player,
      '欢迎光临，有什么事情吗？\ \'
      +'|{cmd}<买东西/@buy>  \'
      +'|{cmd}<卖东西/@sell>  \'
      +'|{cmd}<询问/@questionprize> 有关东西 \'
      +'|{cmd}<退出/@doexit>');
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '需要购买什么东西？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想卖什么东西？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _questionprize;
begin
  This_Npc.NpcDialog(This_Player,
  '我们店有<地牢逃脱卷/@teleport>，|{cmd}<随机传送卷/@teleport2>，<修复油/@repairoil> 等等。\据说还有从妖怪身上拿到的<回城卷/@steleport>。\ \|{cmd}<返回/@main>'
  );
end;

procedure _steleport;
begin
  This_Npc.NpcDialog(This_Player,
  '回城卷据说来自远古的一种神奇卷轴。\'+
  '但不幸的是，现在已经丢失了。\'+
  '但我们听说有些怪物还有这种卷轴，\'+
  '如果使用它你可以立刻返回村庄。\ \'+
  '|{cmd}<返回/@questionprize>'
  );
end;

procedure _teleport;
begin
  This_Npc.NpcDialog(This_Player,
  '地牢逃脱卷是将自己瞬间移动到最后经过的村庄的咒文书，\当然和相比，它的威力还算弱，\但是救自己一条命，已经足够了。\ \|{cmd}<返回/@main>'
  );
end;

procedure _teleport2;
begin
  This_Npc.NpcDialog(This_Player,
  '随机传送卷是自己目前所在的地图，也就是在或在店里面，\可以移动到任何地方的咒文书。\尽管比较危险，但是还剩很多药的话，\使用这个，会对你打猎有帮助的。\ \|{cmd}<返回/@main>'
  );
end;

procedure _repairoil;
begin
  This_Npc.NpcDialog(This_Player,
  '修复油是提高自己拿着的武器的耐久力的油。\但是因为没有特殊修理的效果，\用修理油修理的武器的耐久力会越来越小。\如果不是很贵的武器，带着一个用来做修理，\会对你长久时间打猎有帮助。\ \|{cmd}<返回/@main>'
  );
end; 

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(25);
  This_NPC.AddStdMode(30);
  This_Npc.FillGoods('地牢逃脱卷',100,1);
  This_Npc.FillGoods('随机传送卷',100,1);
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符(大)', 10, 1);
  This_NPC.FillGoods('超级护身符', 10, 1);
  This_NPC.FillGoods('灰色药粉(少量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 1, 1); 
  This_NPC.FillGoods('灰色药粉(中量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 1, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(大量)', 10, 1);
  This_NPC.FillGoods('超级灰色药粉', 10, 1);
  This_NPC.FillGoods('超级黄色药粉', 10, 1);
  This_Npc.FillGoods('修复油',50,17);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.FillGoods('随机传送卷包',100,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.