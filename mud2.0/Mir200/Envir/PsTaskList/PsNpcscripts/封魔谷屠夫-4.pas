{
/************************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '高价买入品质好的肉。低价买入粘上土或被火烧的肉。\ \'+
   '|{cmd}<继续/@main>');
   This_Npc.Click_Sell(This_Player);
end;




procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载stdmode  
  This_NPC.AddStdMode(1);
  This_NPC.AddStdMode(40);
end;




Begin
   This_Npc.NpcDialog(This_Player,
   '咦，我还是老样子？怎么会这样？不过，肉还是得要新鲜的。\ \ \'+
   '|{cmd}<卖肉/@sell>\'+
   '|{cmd}<退出/@doexit>');
end.