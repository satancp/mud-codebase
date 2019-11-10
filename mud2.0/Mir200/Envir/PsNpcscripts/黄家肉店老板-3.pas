{********************************************************************

*******************************************************************}

program Mir2;

{$I common.pas}

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '是来卖肉吗？\ \'
  +'|{cmd}<卖肉/@sell>\ \'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '高价买入品质好的肉。\低价买入粘上土或被火烧的肉。\ \'
    +'|{cmd}<继续/@main>'
  );
  This_Npc.Click_Sell(This_Player);
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