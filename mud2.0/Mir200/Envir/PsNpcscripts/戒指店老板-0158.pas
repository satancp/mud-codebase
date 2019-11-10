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
  '欢迎. 我可以帮你什么吗?\ \'
  +'|{cmd}<购买戒指/@buy>  ' + addSpace('', 24) + '^<出售戒指/@sell> \'
  +'|{cmd}<修理戒指/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<返回盟重/@moveout>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _moveout;
begin  
    if This_Player.MapName = '0158' then 
    This_Player.Flyto('3',300 + random(3) - 1,300 + random(3) - 1); 
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你要购买哪个戒指?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '您出售哪种戒指?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '您要修理戒指?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它是好的.\ \|{cmd}<返回/@main>'
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
  This_Npc.AddStdMode(22);
  This_Npc.AddStdMode(23);
  This_Npc.FillGoods('古铜戒指',3,3);
  This_Npc.FillGoods('六角戒指',3,3);
  This_Npc.FillGoods('玻璃戒指',3,3);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  