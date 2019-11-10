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

procedure _Normal;
begin
  This_Npc.NpcDialog(This_Player,
  '欢迎，我们有各种各样的衣服 。请告诉我你想买哪一种，\对于'+This_npc.GetCastleGuildName+'的成员是要打20%的折扣的。\因为这个城堡属于'+This_npc.GetCastleGuildName+'。\' 
   +'|{cmd}<买衣服/@buy>' + addSpace('', 18) + '^<卖衣服/@sell>\'
   +'|{cmd}<修复衣服/@repair>' + addSpace('', 16) + '^<特殊修理/@s_repair>\'
   +'|{cmd}<退出/@doexit>'
   );
end;
   


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想要什么？这件衣服怎么样？\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '把你要卖的给我看看，我会给你一个估价。\头盔或帽子在旁边商店， \您可以到那里去看看。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你的衣服看上去很旧了，在这里修补一下？\ \|{cmd}<返回/@main>'
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
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>' +
    '\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \|{cmd}<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.FillGoods('布衣(男)',50,1);
  This_Npc.FillGoods('布衣(女)',50,1);
  This_Npc.FillGoods('轻型盔甲(男)',50,1); 
  This_Npc.FillGoods('轻型盔甲(女)',50,1);
  This_Npc.FillGoods('中型盔甲(男)',50,1);
  This_Npc.FillGoods('中型盔甲(女)',50,1);
  This_Npc.FillGoods('幽灵战衣(男)',50,1);
  This_Npc.FillGoods('幽灵战衣(女)',50,1);
  This_Npc.FillGoods('恶魔长袍(男)',50,1);
  This_Npc.FillGoods('恶魔长袍(女)',50,1);
  This_Npc.FillGoods('战神盔甲(男)',50,1);
  This_Npc.FillGoods('战神盔甲(女)',50,1);
  This_Npc.SetRebate(100);
end;


//脚本执行的入口
begin
     _Normal;
end.