{********************************************************************

*******************************************************************}
PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我看看你的东西。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '你想买点什么药品？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;

Procedure _news;
Begin
   This_Npc.NpcDialog(This_Player,
   '没什么特别的啦，如果你恶意PK的话，老天也会惩罚你的哦！\ \'+
   '|{cmd}<返回/@main>');
end;



procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 200, 1);
  This_NPC.FillGoods('魔法药(小量)', 200, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(25);
  This_NPC.AddStdMode(42);
end;




Begin
   This_Npc.NpcDialog(This_Player,
   '欢迎，你需要点什么？\ \'+
   '要挖矿的话，你还是多向我打听一些消息的好\ \'+
   '|{cmd}<买药品/@buy> ' + addspace(' ',20) + '^<卖药品/@sell> \'+
   '|{cmd}<打听消息/@news>\ \'+
   '|{cmd}<退出/@doexit>');
end.