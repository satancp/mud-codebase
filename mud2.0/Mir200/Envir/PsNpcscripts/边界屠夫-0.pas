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
  '肉可以从鸡，鹿，狼身上割的。 先打这些怪物\小心碰到比自己厉害的怪物被打死\打死怪物之后，按alt键，把鼠标放在怪物尸体上\您就会看到自己割肉的样子。\过一会儿，您的包里就会放着一个大肉块。\对了，差一点忘了告诉您，企图逃跑的怪物品质更好\为了方便，使用魔法打怪物，其品质会变成0，这一点千万记�   \|{cmd}<继续/@main>'
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