{
/*******************************************************************************

/*******************************************************************************
}

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
  '欢迎, 您想要些什么？ \我们这里有许多便宜锋利的剑。请您挑选。\根据这个城堡的主人'+This_npc.GetCastleGuildName+'的命令， \我们特别对'+This_npc.GetCastleGuildName+'成员提供20%的折扣。\'
  +'|{cmd}<买武器/@buy>\'
  +'|{cmd}<卖武器/@sell>\'
  +'|{cmd}<修理武器/@repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '不要担心我们这里武器的数量，请您尽量挑选您需要的武器。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '放下你要卖的武器。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '想修理武器吗？  你想修理哪个？\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看起来完全修好了？  还有要修理的吗？\ \' +
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