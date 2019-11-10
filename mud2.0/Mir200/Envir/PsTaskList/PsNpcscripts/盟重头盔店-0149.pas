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
  '感谢！我能为你做点什么？\\'
  +'|{cmd}<买头盔/@buy> \'
  +'|{cmd}<卖头盔/@sell> \'
  +'|{cmd}<修补头盔/@repair> \'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买什么样的头盔？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '把你要卖的头盔给我看看，\我会给你估价。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '这里你可以修补头盔.\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '这个看上去已经补好了。\ \|{cmd}<返回/@main>'
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



//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(15);
  This_Npc.AddStdMode(16);
  This_Npc.FillGoods('青铜头盔',5,1);
  This_Npc.FillGoods('道士头盔',5,1);
  This_Npc.FillGoods('骷髅头盔',5,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  