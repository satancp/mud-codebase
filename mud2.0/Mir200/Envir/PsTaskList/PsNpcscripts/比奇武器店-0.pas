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
  '感谢光临。请问有什么事情帮忙吗？\ \'
  +'|{cmd}<修理武器/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '别看我像喝醉了酒，我会好好给你磨的。\全包在我身上。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '修好了。\如果还有要修理的武器，就在这儿修理吧。\ \' +
    '|{cmd}<返回/@main>'
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
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.