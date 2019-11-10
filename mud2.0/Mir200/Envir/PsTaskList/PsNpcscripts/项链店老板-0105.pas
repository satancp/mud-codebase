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
  '欢迎光临，有什么事情需要我帮忙吗？\ \'
  +'|{cmd}<购买/@buy>项链' + addSpace('', 22) + '^<出售项链/@sell>\'
  +'|{cmd}<修理项链/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '您要买项链吗?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '您出售哪种项链?\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '您要修理项链吗?\ \|{cmd}<返回/@main>'
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
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
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
  This_Npc.AddStdMode(19);
  This_Npc.AddStdMode(20);
  This_Npc.AddStdMode(21);
  This_Npc.FillGoods('金项链',3,3);
  This_Npc.FillGoods('传统项链',3,3);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  