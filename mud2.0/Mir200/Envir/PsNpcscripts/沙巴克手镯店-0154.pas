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
  '感谢来商店. 我们专卖手镯.你要购买哪种手镯?\我们为'+This_npc.GetCastleGuildName+'行会成员提供20%的优惠.\听说土城的首饰店老板可以升级雷霆、烈焰、光芒系列首饰，\要么你去找他打听打听吧，或许能对你有帮助。\'
  +'|{cmd}<购买/@buy>手镯\'
  +'|{cmd}<出售/@sell>手镯\'
  +'|{cmd}<修理手镯/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '让我们为你挑选合适的手镯.\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '您打算出售手镯 ?\我们也回收手套.\ \|{cmd}<返回/@main>'
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
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！\ \|{cmd}<返回/@main>'
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