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


Procedure _huolong;
begin
   This_Npc.NpcDialog(This_Player,
   '“火龙之心”是用来积蓄怒气的，蓄满方能使用合击，\'+
   '在“火龙之心”中放入火龙神品，怒气会大量增加，很多\'+
   '物品都可以增加怒气值，白日门技能书可大量增加怒气，\' +
   '鸡肉、食人树叶、地苦胆、书页等都可不同程度增加怒气，\'+
   '九花雪露、九花玉露、元神丹、回气膏、补气丹这些神品，\'+
   '可以从多至少不同数量增加怒气值。\ \'+
   '|{cmd}<合成火龙神品/@hecheng>                   ^<查看合成火龙神品配方/@lookfor>\'+
   '|{cmd}<退出/@doexit>');
end;


Procedure _yulu;
begin
   This_Npc.NpcDialog(This_Player,
   '合成九花玉露需要紫背天葵、铁树果、阴阳仙草各1个\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<开始合成/@yulu1>\ \'+ 
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
end;

Procedure _yulu1;
begin
   if (This_Player.GetBagItemCount('紫背天葵')>=1) and (This_Player.GetBagItemCount('铁树果')>=1) 
   and (This_Player.GetBagItemCount('阴阳仙草')>=1) then
   begin
      This_Player.Take('紫背天葵',1);
      This_Player.Take('铁树果',1);
      This_Player.Take('阴阳仙草',1);
      This_Player.Give('九花玉露',1);
      This_Npc.NpcDialog(This_Player,'恭喜您，九花玉露已经合成好了');
   end else
   begin
      This_Npc.NpcDialog(This_Player,'很可惜，你没有足够合成需要的材料。\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;


Procedure _xuelu;
begin
   This_Npc.NpcDialog(This_Player,
   '合成九花雪露需要黄色马枝花，罗布麻叶，地苦胆, \'+
   '四叶参这四种草药各1个。\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<开始合成/@xuelu1>\ \'+
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
end;


Procedure _xuelu1;
begin
   if (This_Player.GetBagItemCount('黄色马枝花')>=1) and (This_Player.GetBagItemCount('罗布麻叶')>=1) 
   and (This_Player.GetBagItemCount('地苦胆')>=1) and (This_Player.GetBagItemCount('四叶参')>=1) then
   begin
      This_Player.Take('黄色马枝花',1);
      This_Player.Take('罗布麻叶',1);
      This_Player.Take('地苦胆',1);
      This_Player.Take('四叶参',1);
      This_Player.Give('九花雪露',1);
      This_Npc.NpcDialog(This_Player,'恭喜您，九花雪露已经合成好了');
   end else
   begin
      This_Npc.NpcDialog(This_Player,'很可惜，你没有足够合成需要的材料。\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;



Procedure _qidan;
begin
   This_Npc.NpcDialog(This_Player,
   '合成元神丹需要毒蜘蛛牙齿、蛆卵、蝎子的尾巴各4个。\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<开始合成/@qidan1>\ \'+
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
end;

Procedure _qidan1;
begin
   if (This_Player.GetBagItemCount('毒蜘蛛牙齿')>=4) and (This_Player.GetBagItemCount('蛆卵')>=4) 
   and (This_Player.GetBagItemCount('蝎子的尾巴')>=4) then
   begin
      This_Player.Take('毒蜘蛛牙齿',4);
      This_Player.Take('蛆卵',4);
      This_Player.Take('蝎子的尾巴',4);
      This_Player.Give('元神丹',1);
      This_Npc.NpcDialog(This_Player,'恭喜您，元神丹已经合成好了');
   end else
   begin
      This_Npc.NpcDialog(This_Player,'很可惜，你没有足够合成需要的材料。\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;


Procedure _qigao;
begin
   This_Npc.NpcDialog(This_Player,
   '合成回气膏需要需要鸡肉、肉、食人树叶各4个，同\'+
   '时还需要食人树的果实1个。\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<开始合成/@qigao1>\ \'+
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
end;


Procedure _qigao1;
begin
   if (This_Player.GetBagItemCount('鸡肉')>=4) and (This_Player.GetBagItemCount('肉')>=4) 
   and (This_Player.GetBagItemCount('食人树叶')>=4) and (This_Player.GetBagItemCount('食人树的果实')>=1) then
   begin
      This_Player.Take('鸡肉',4);
      This_Player.Take('肉',4);
      This_Player.Take('食人树叶',4);
      This_Player.Take('食人树的果实',1);
      This_Player.Give('回气膏',1);
      This_Npc.NpcDialog(This_Player,'恭喜您，回气膏已经合成好了');
   end else
   begin
      This_Npc.NpcDialog(This_Player,'很可惜，你没有足够合成需要的材料。\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;



Procedure _hecheng;
begin
   This_Npc.NpcDialog(This_Player,
   '我还没有完全参透其中的秘密，可以合成的物品还很有限，\'+
   '你就告诉我你想合成什么药品吧。\ \'+
   '|{cmd}<九花玉露/@yulu>'+addspace(' ',18)+'|{cmd}<九花雪露/@xuelu>\'+
   '|{cmd}<元神丹/@qidan>'+addspace(' ',20)+'|{cmd}<回气膏/@qigao>\'+
   '|{cmd}<查看合成配方/@lookfor>\'+
   '|{cmd}<关闭/@doexit>');
end;


Procedure _lookfor;
begin
   This_Npc.NpcDialog(This_Player,
   '合击威力强大，但使用它必须先要拥有“火龙之心”，\'+
   '我知道你听说过“火龙之心”，但我断定你知其一不知其二\'+
   '“火龙之心”是用来积蓄怒气的，蓄满方能使用合击。\'+
   '在“火龙之心”中放入火龙神品，怒气会大量增加。神品其\'+
   '实有很多种，不同的配方能合成出不同的火龙神品，我会制\'+
   '作很多种“火龙之心”，现在来看看你想要哪种吧。\'+
   '|{cmd}<九花玉露/@yulu2>'+addspace(' ',20)+'|{cmd}<九花雪露/@xuelu2>\'+
   '|{cmd}<元神丹/@qidan2>'+addspace(' ',22)+'|{cmd}<回气膏/@qigao2>\'+
   '|{cmd}<返回/@main>');
end;

Procedure _yulu2;
begin
   This_Npc.NpcDialog(This_Player,
   '合成九花玉露需要紫背天葵、铁树果、阴阳仙草各1个\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
end;

Procedure _xuelu2;
begin
   This_Npc.NpcDialog(This_Player,
   '合成九花雪露需要黄色马枝花，罗布麻叶，地苦胆, \'+
   '四叶参这四种草药各1个。\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
end;

Procedure _qidan2;
begin
   This_Npc.NpcDialog(This_Player,
   '合成元神丹需要毒蜘蛛牙齿、蛆卵、蝎子的尾巴各4个。\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
end;

Procedure _qigao2;
begin
   This_Npc.NpcDialog(This_Player,
   '合成回气膏需要需要鸡肉、肉、食人树叶各4个，同\'+
   '时还需要食人树的果实1个。\'+
   '如果您已经有了这些物品，我就可以帮您进行合成。\ \'+
   '|{cmd}<返回/@main>'+addspace(' ',30)+'|{cmd}<退出/@doexit>');
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
  This_NPC.FillGoods('金创药(小)包', 100, 1);
  This_NPC.FillGoods('魔法药(小)包', 100, 1);
  This_NPC.FillGoods('金创药(中)包', 100, 1);
  This_NPC.FillGoods('魔法药(中)包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);
  This_NPC.FillGoods('灰色药粉(少量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 10, 1);
  This_NPC.FillGoods('灰色药粉(中量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 10, 1);
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(25);
  This_NPC.AddStdMode(42);
end;




Begin
   {$IFDEF Q136_hero}
   This_Npc.NpcDialog(This_Player,
   '感谢，在这里你可以买一些常见的药品。\ \'+
   '|{cmd}<买药品/@buy> '+addspace(' ',20)+'|{cmd}<卖药品/@sell> \'+
   '|{cmd}<退出/@doexit>');
   {$ELSE}
   This_Npc.NpcDialog(This_Player,
   '感谢，在这里你可以买一些常见的药品。\ \'+
   '|{cmd}<合成火龙神品/@hecheng>'+addspace(' ',15)+'|{cmd}<查看合成火龙神品配方/@lookfor>\'+
   '|{cmd}<打听“火龙之心”的秘密/@huolong>\ \'+
   '|{cmd}<买药品/@buy> '+addspace(' ',20)+'|{cmd}<卖药品/@sell> \'+
   '|{cmd}<退出/@doexit>');
   {$ENDIF}
end.