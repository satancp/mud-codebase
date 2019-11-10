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
   '给我您要卖的物品。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;
var
  i : integer;
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
  This_NPC.FillGoods('地牢逃脱卷', 100, 1);  
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符(大)', 10, 1);
  This_NPC.FillGoods('超级护身符', 10, 1);
  This_NPC.FillGoods('灰色药粉(中量)', 10, 1);  
  This_NPC.FillGoods('黄色药粉(中量)', 10, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 10, 1);  
  This_NPC.FillGoods('黄色药粉(大量)', 10, 1);  
  This_NPC.FillGoods('超级灰色药粉', 10, 1);
  This_NPC.FillGoods('超级黄色药粉', 10, 1);
  //加载stdmode 
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3); 
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(16);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(43);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;

Procedure _newskill2;
begin
   This_Npc.NpcDialog(This_Player,
   '虽然在卧龙山庄里一直没出去过，\'+
   '最近古战技重现玛法的消息我们还是有所耳闻。\'+
   '对于那些古文字我们曾经作过一段时间的研究，\'+
   '所以也能够辨识一些，你需要帮忙吗？\'+
   '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
   '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
   '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
   '|{cmd}<没事了/@doexit>');
end;

Procedure _newskill22;
begin
   if This_Player.GetBagItemCount('古籍残片(中)') >= 5 then
   begin
      This_Player.Take('古籍残片(中)',5);
      This_Player.Give('古籍残片(大)',1);
      This_Npc.NpcDialog(This_Player,
      '虽然在卧龙山庄里一直没出去过，\'+
      '最近古战技重现玛法的消息我们还是有所耳闻。\'+
      '对于那些古文字我们曾经作过一段时间的研究，\'+
      '所以也能够辨识一些，你还需要帮忙吗？\'+
      '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
      '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
      '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
      '|{cmd}<没事了/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有足够的古籍残片(中)啊！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;

Procedure _newskill21;
begin
   if This_Player.GetBagItemCount('古籍残片(小)') >= 10 then
   begin
      This_Player.Take('古籍残片(小)',10);
      This_Player.Give('古籍残片(中)',1);
      This_Npc.NpcDialog(This_Player,
      '虽然在卧龙山庄里一直没出去过，\'+
      '最近古战技重现玛法的消息我们还是有所耳闻。\'+
      '对于那些古文字我们曾经作过一段时间的研究，\'+
      '所以也能够辨识一些，你还需要帮忙吗？\'+
      '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
      '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
      '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
      '|{cmd}<没事了/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有足够的古籍残片(小)啊！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '看来你需要我的帮助，有什么需要就和我说吧。\ \'+ 
   '|{cmd}<买/@buy>                                 ^<卖/@sell>\'+
   '|{cmd}<我想请你解读古籍残片/@newskill2>\'+
   '|{cmd}<退出/@doexit>');
end.