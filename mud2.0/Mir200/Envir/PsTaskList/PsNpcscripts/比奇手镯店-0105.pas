{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '客官，感谢光临。有件稀罕事，前天有个客官来我这\修理首饰，您猜他要修什么？雷霆护腕！\听说土城的首饰店老板可以升级雷霆、烈焰、光芒系列首饰，\要么你去找他打听打听吧，或许能对你有帮助。\'
  +'|{cmd}<买手镯/@buy>'+ addSpace('', 16) + '|{cmd}<卖手镯/@sell>\'
  +'|{cmd}<修理手镯/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<神秘升级材料的线索/@molongqude>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请选择你要购买的手镯.\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '您出售哪种手镯?\我们也处理手套.\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你可以修理各种手镯,手套. \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去修好了.\ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _molongqude;
begin
  This_Npc.NpcDialog(This_Player,
  '神秘绒丝、魔龙颚骨、魔龙骨、魔龙牙都是旷世罕见的稀世珍宝，\仅靠一己之力是无法获得这些神奇的宝贝，必须拥有队友的协作！\在盟重镇魔守将处使用任意一种组队卷轴选择组队前往地下迷宫，\通过崎岖的地下迷宫和妖魔守卫的宫殿长廊，到达地下宫殿,\您必须拥有千年蛛丝,\地下宫殿中宫殿守卫才会透露这些神奇宝贝的获得方法。\|{cmd}<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(24);
  This_Npc.AddStdMode(26);
  This_Npc.FillGoods('小手镯',3,3);
  This_Npc.FillGoods('银手镯',3,3);
  This_Npc.FillGoods('铁手镯',3,3);
  This_Npc.FillGoods('死神手套',3,3);
  This_Npc.FillGoods('魔法手镯',3,3);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  