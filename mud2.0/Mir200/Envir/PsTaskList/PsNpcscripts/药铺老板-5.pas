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


Procedure _talk;
begin
   This_Npc.NpcDialog(This_Player,
   '这些药水可以增加你的攻击，速度，生命值等等，据说还有人能\'+
   '用它们换取一把魔剑！这么好的东西当然不是轻易就可以得到的，\'+
   '不过赤月峡谷好像经常会出现。\ \'+
   '|{cmd}<返回/@main>');
end;

procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 100, 1);
  This_NPC.FillGoods('魔法药(小量)', 100, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  This_NPC.FillGoods('金创药(小)包', 100, 1);
  This_NPC.FillGoods('魔法药(小)包', 100, 1);
  This_NPC.FillGoods('金创药(中)包', 100, 1);
  This_NPC.FillGoods('魔法药(中)包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(42);
end;





Begin
   This_Npc.NpcDialog(This_Player,
      '你想买什么药？\ \'+
      '|{cmd}<买药品/@buy> ' + addspace(' ',24) + '^<卖药品/@sell> \'+
      '|{cmd}<打听关于特殊药水的消息/@talk> \'+
      '|{cmd}<退出/@doexit>');
end.