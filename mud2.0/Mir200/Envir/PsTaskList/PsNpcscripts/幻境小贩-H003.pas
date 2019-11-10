
{********************************************************************

*******************************************************************}
{$I common.pas}

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '你竟然能跑到这里来？\'
   +'看在你这么卖命的份上，我就帮助你一下。\'
   +'顺便告诉你一下，一旦进入幻境迷宫，就再也不能回头了！\ \'
   +'|<买/@buy>\'
   +'|<卖/@sell>\'
   +'|<修理/@repair>\'
   +'|<特殊修理/@s_repair>\'
   +'|<退出/@exit>'
   );
end;

procedure _Repair;
begin
   This_NPC.NpcDialog(This_Player,
   '您要修理吗?\'
   +'我可是个万能工匠哦！\\'
   );

  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '怎么样，修好了吧？看起来比新的还值钱！\ \|<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|<返回/@main>'
  );
end;




procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '您想买些什么?\ \ \|<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我您要卖的物品.\ \ \|<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.AddStdMode(43);
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.AddStdMode(15);
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_Npc.AddStdMode(25);
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(19);
  This_Npc.AddStdMode(20);
  This_Npc.AddStdMode(21);
  This_Npc.AddStdMode(22);
  This_Npc.AddStdMode(23);
  This_Npc.AddStdMode(24);
  This_Npc.AddStdMode(26);
  This_Npc.FillGoods('金创药(小量)',100,1);
  This_Npc.FillGoods('魔法药(小量)',100,1);
  This_Npc.FillGoods('金创药(中量)',100,1);
  This_Npc.FillGoods('魔法药(中量)',100,1);
  This_Npc.FillGoods('强效金创药',100,1);
  This_Npc.FillGoods('强效魔法药',100,1);
  This_Npc.FillGoods('金创药（小）包',100,1);
  This_Npc.FillGoods('魔法药（小）包',100,1);
  This_Npc.FillGoods('金创药（中）包',100,1);
  This_Npc.FillGoods('魔法药（中）包',100,1);
  This_Npc.FillGoods('超级金创药',100,1);
  This_Npc.FillGoods('超级魔法药',100,1);
  This_Npc.FillGoods('地牢逃脱卷',100,1);
  This_Npc.FillGoods('随机传送卷',100,1);
  This_Npc.FillGoods('护身符',10,1);
  This_Npc.FillGoods('护身符（大）',10,1);
  This_Npc.FillGoods('灰色药粉(中量)',10,1);
  This_Npc.FillGoods('黄色药粉(中量)',10,1);

end;

//脚本执行的入口
begin
  domain;
end.