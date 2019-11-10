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
  '看~这是些坚固便宜的盔甲，你想试试吗？\你就立刻穿上它吧！对于'+This_npc.GetCastleGuildName+'的成员\打20%的特殊。因为这个城堡属于'+This_npc.GetCastleGuildName+'.\'
  +'|{cmd}<买头盔/@buy> \'
  +'|{cmd}<卖头盔/@sell> \'
  +'|{cmd}<修补头盔/@repair> \'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@DoExit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想要点什么？这个头盔怎么样？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我你要卖的东西，我将给你估价。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你可以在这里修补你的头盔。 \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '好了，这个看上去已经补好了。\ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\' +
    '但费用是普通的3倍！\ \' +
    '|{cmd}<返回/@main>'
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
  This_Npc.FillGoods('青铜头盔',5,1);
  This_Npc.FillGoods('道士头盔',5,1);
  This_Npc.FillGoods('骷髅头盔',5,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  