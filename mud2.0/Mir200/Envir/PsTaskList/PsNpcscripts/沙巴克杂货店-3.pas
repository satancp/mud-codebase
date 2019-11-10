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
  '杂货店的定义是什么?它意味着什么东西都卖.\让我们按你的意愿给你必要的物品. \按这个城堡领主'+This_npc.GetCastleGuildName+'的命令我们给行会成员八折的优惠..\\'
  +'|{cmd}<购买物品/@buy>\'
  +'|{cmd}<出售物品/@sell>\'
  +'|{cmd}<退出/@doexit>'
  );
end;



procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
  '我们出售护身符，卷轴，修复油等 .\另外，行会回城卷仅供行会成员使用.\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
  '人们出售各种物品...\ \世道艰难啊, 唉，选择你要出售的物品吧...\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;




//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(25);
  This_Npc.AddStdMode(30);
  This_Npc.FillGoods('地牢逃脱卷',100,1);
  This_Npc.FillGoods('随机传送卷',100,1);
  This_Npc.FillGoods('行会回城卷',100,1);
  This_Npc.FillGoods('护身符',100,1); 
  This_Npc.FillGoods('修复油',50,1);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.FillGoods('随机传送卷包',100,1);
  This_Npc.FillGoods('行会回城卷包',100,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.