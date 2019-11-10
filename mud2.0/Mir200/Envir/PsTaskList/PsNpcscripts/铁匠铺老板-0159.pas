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
  '欢迎光临.  感谢您到我们的铁匠铺.\ \'
  +'|{cmd}<买武器/@buy>\'
  +'|{cmd}<卖武器/@sell>\'
  +'|{cmd}<修理武器/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<返回盟重/@moveout>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _moveout;
begin  
    if This_Player.MapName = '0159' then 
    This_Player.Flyto('3',327 + random(3) - 1,317 + random(3) - 1); 
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买些什么武器？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我你要卖的武器。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你要修理武器吗？\给我你要修理的武器。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看起来修好了，欢迎下次再来。\ \' +
    '|{cmd}<返回/@main>'
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
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.AddStdMode(43);
  This_Npc.FillGoods('木剑',50,1);
  This_Npc.FillGoods('青铜剑',50,1);
  This_Npc.FillGoods('铁剑',50,1); 
  This_Npc.FillGoods('匕首',50,1);
  This_Npc.FillGoods('修罗',50,1);
  This_Npc.FillGoods('凝霜',50,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.