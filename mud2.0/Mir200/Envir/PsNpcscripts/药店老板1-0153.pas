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
    '这里是卖药的... 什么？你已经知道了？\哼，好吧，那么买了东西赶紧走吧，能走多快就走多快\你是'+This_npc.GetCastleGuildName+'的成员吗？ \那么我会给你打20%的折扣， 这有什么好奇怪的？ \'
    +'|{cmd}<买药品/@buy>\'
    +'|{cmd}<卖药品/@sell>\'
    +'|{cmd}<退出/@doexit>'
    );
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '找到你想要的了吗？\怎么这么慢？请快点做出选择！\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想卖东西？这太过分了，我的生意最近不大好。。。\卖了以后赶紧该干啥干啥去吧！\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('金创药(小量)',100,1);
  This_Npc.FillGoods('魔法药(小量)',100,1);
  This_Npc.FillGoods('金创药(中量)',200,1); 
  This_Npc.FillGoods('魔法药(中量)',200,1);
  This_Npc.FillGoods('强效金创药',100,1);
  This_Npc.FillGoods('强效魔法药',100,1);
  This_Npc.FillGoods('金创药(小)包',100,1);
  This_Npc.FillGoods('魔法药(小)包',100,1);
  This_Npc.FillGoods('金创药(中)包',100,1);
  This_Npc.FillGoods('魔法药(中)包',100,1);
  This_Npc.FillGoods('超级金创药',100,1); 
  This_Npc.FillGoods('超级魔法药',100,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.