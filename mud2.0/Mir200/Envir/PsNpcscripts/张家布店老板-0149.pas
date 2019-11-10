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
  This_Npc.NpcDialog(This_Player,
   '欢迎，你需要点什么？\ \'
   +'|{cmd}<买衣服/@buy>' + addSpace('', 16) + '^<修补衣服/@repair>\'
   +'|{cmd}<卖衣服/@sell>' + addSpace('', 16) + '^<特殊修理/@s_repair>\'
   +'|{cmd}<返回盟重/@moveout>\'
   +'|{cmd}<退出/@doexit>'
   );
end;

procedure _moveout;
begin  
    if This_Player.MapName = '0149' then 
    This_Player.Flyto('3',313 + random(3) - 1,303 + random(3) - 1); 
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买什么样的衣服？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '把你要卖的衣服给我看看，我会给你个估价。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '请放上去要修补的衣服。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看来修补得很不错。\ \ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \|{cmd}<返回/@main>'
  );
end;
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
  This_Npc.FillGoods('恶魔长袍(男)',30,1);
  This_Npc.FillGoods('恶魔长袍(女)',30,1);
  This_Npc.FillGoods('战神盔甲(男)',30,1);
  This_Npc.FillGoods('战神盔甲(女)',30,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.