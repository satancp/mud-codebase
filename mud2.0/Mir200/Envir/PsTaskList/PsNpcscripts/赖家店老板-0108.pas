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
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<退出/@doexit>');
   
end;
   

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '需要什么东西吗？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '请给我要卖的东西，我会给好价钱的。\ \ \|{cmd}<返回/@main>'
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