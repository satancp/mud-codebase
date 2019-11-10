{
/*******************************************************************************
}

program Mir2;

{$I common.pas}

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '您来这里卖肉吗？\ \'
  +'|{cmd}<卖肉/@sell>\'
  +'|{cmd}<询问/@meathelp>\' 
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '高价买入品质好的肉。\低价买入粘上土或被火烧的肉。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _meathelp;
begin
  This_Npc.NpcDialog(This_Player,
  '你可以从鸡，鹿，羊，狼等身上得到肉。 首先，杀死它们，因为它们\在你的攻击下会反击，然后你走到尸体旁边的地方按住ALT键\同时鼠标左键点击它的尸体然后你就会看见自己把肉切成肉块。\在那之后你的包裹里就会出现一个美味的肉块。别忘了逃跑的\动物有高质量的肉。可是， 使用魔法会使肉的质量下降到0。\ \|{cmd}<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(40);
  This_Npc.AddStdMode(1);
  This_Npc.SetRebate(100);
end;  

//脚本执行的入口
begin
  domain;
end.