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
    +'|{cmd}<买药品/@buy>\'
    +'|{cmd}<卖药品/@sell>\'
    +'|{cmd}<打听关于特殊药水的消息/@talk> \'
    +'|{cmd}<退出/@doexit>'
    );
end;


procedure _talk;
begin
  This_Npc.NpcDialog(This_Player,
  '这些药水可以增加你的攻击，速度，生命值等等，\据说还有人能用它们换取一把魔剑！\这么好的东西当然不是轻易就可以得到的，\不过赤月峡谷好像经常会出现。\|{cmd}<返回/@main>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买点什么药品？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我看看你的东西。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('金创药(小量)',200,1);
  This_Npc.FillGoods('魔法药(小量)',200,1);
  This_Npc.FillGoods('金创药(中量)',100,1); 
  This_Npc.FillGoods('魔法药(中量)',100,1);
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