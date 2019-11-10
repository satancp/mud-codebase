{
*******************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _Exit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '把要卖的东西给我，我会给你好价钱的。\'+
   '我们还收购各种药。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '需要什么物品吗？\'+
   '我这里有地牢逃脱卷，买一些吧？\ \'+
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
      This_Npc.NpcDialog(This_Player,'恭喜您，九花玉露已经合成好了。');
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
      This_Npc.NpcDialog(This_Player,'恭喜您，九花雪露已经合成好了。');
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
      This_Npc.NpcDialog(This_Player,'恭喜您，元神丹已经合成好了。');
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
      This_Npc.NpcDialog(This_Player,'恭喜您，回气膏已经合成好了。');
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

Procedure _QUEST;
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
  This_NPC.FillGoods('金创药(小量)', 200, 1);
  This_NPC.FillGoods('魔法药(小量)', 200, 1); 
  This_NPC.FillGoods('地牢逃脱卷', 1000, 1);
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3);
  This_NPC.AddStdMode(42);
end;

procedure _normal;
begin
  {$IFDEF Q136_hero}
  This_Npc.NpcDialog(This_Player,
   '感谢，我能为你做点什么？\ \'+
   '|{cmd}<买物品/@buy>                         ^<卖物品/@sell> \'+
   '|{cmd}<对话/@QUEST>\'+
   '|{cmd}<退出/@exit>');
  {$ELSE}
  This_Npc.NpcDialog(This_Player,
   '感谢，我能为你做点什么？\ \'+
   '|{cmd}<合成火龙神品/@hecheng>                   ^<查看合成火龙神品配方/@lookfor>\'+
   '|{cmd}<打听“火龙之心”的秘密/@huolong>\'+
   '|{cmd}<买物品/@buy>                         ^<卖物品/@sell> \'+
   '|{cmd}<对话/@QUEST>\'+
   '|{cmd}<退出/@exit>');
   {$ENDIF}
end;

//------------------------------------------------------------------------------
//成长任务模块 
procedure _automove1;
begin
  if This_Player.GetV(104,1) = 1 then
  begin
    This_Player.SetV(104,1,2);
    This_Player.UpdateTaskDetail(104,1);
    This_Player.SetV(104,2,0);
    //This_Player.AutogotoMap('1',84,277);
    This_NPC.CloseDialog(This_Player);
  end
  else if This_Player.GetV(104,1) = 2 then
  begin
    //This_Player.AutogotoMap('1',84,277);
    This_NPC.CloseDialog(This_Player);
  end
  else
  begin
    This_NPC.CloseDialog(This_Player);
  end; 
end;

procedure _mission104;
begin
  if This_Player.GetV(104,1) = 4 then
  begin
    This_Npc.NpcDialog(This_Player,
    '回来见我前记得把身上洗干净！\'
    +'（任务目标：杀死3只粪虫，获取3份情报药水）\ \'
    +'|{cmd}<好的，我这就去/@mission104_1>\ \' 
    +'|{cmd}<我有别的事情找你/@normal>'
    );
  end
  else if This_Player.GetV(104,1) = 3 then
  begin
    This_Player.Give('经验', 100000);
    This_Player.SetV(104,1,4);
    This_Player.UpdateTaskDetail(104,1);
    This_Player.SetV(104,3,0);
    This_Npc.NpcDialog(This_Player,
    '你说这是情报？根本就是几张纸片，完全看不出来上面写了什么东西\'
    +'哦，我想起来了，这上面的情报都是需要特殊的物质调配后才能显现的\'
    +'这种物质在它们饲养的粪虫身上可以取得。\'
    +'你回来见我前记得把自己洗干净！\'
    +'（任务目标：杀死3只粪虫，获取3份情报药水）\ \'
    +'|{cmd}<粪虫，好恶心的东西。/@mission104_1>\ \'
    +'|{cmd}<我有别的事情找你/@normal>' 
    ); 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你有收集完3份情报了吗？'); 
  end;
end;

procedure _mission104_1;
begin
  if This_Player.GetV(104,1) = 4 then
  begin
    //This_Player.AutogotoMap('D022',338,356);
    This_NPC.CloseDialog(This_Player);
  end;
end;

procedure _mission104_1_fns;
begin
  if This_Player.GetV(104,1) = 6 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你见到安家铺子老板了么？\ \'
    +'|{cmd}<我这就去/@doexit>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    ); 
  end
  else if This_Player.GetV(104,1) = 5 then
  begin
    This_Player.SetV(104,1,6);
    This_Player.UpdateTaskDetail(104,1);
    This_Player.Give('经验',100000);
    This_Npc.NpcDialog(This_Player,
    '怎么你身上还是那么难闻！你去见见安家铺子老板吧，他就在旁边。\'
    +'我要研究下情报。我说，你别傻站在这里，赶紧去，赶紧去！\ \'
    +'|{cmd}<嫌我臭就明说嘛。/@doexit>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    ); 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '怎么样，收集齐了3份情报药水了吗？'); 
  end;
end;

procedure _mission104_3;
begin
  if This_Player.GetV(104,1) = 9 then
  begin
    //This_Player.AutogotoMap('D022',338,356);
    This_NPC.CloseDialog(This_Player);
  end
  else if This_Player.GetV(104,1) = 8 then
  begin
    This_Player.SetV(104,1,9);
    This_Player.UpdateTaskDetail(104,1);
    This_Player.SetV(104,4,0);
    //This_Player.AutogotoMap('D022',338,356);
    This_NPC.CloseDialog(This_Player);
  end
  else
  exit;
end;

procedure _mission104_3_fns;
begin
  if This_Player.GetV(104,1) = 100 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你见到沃玛寺庙深处的白日门门徒了么？\ \'
    +'|{cmd}<我这就去/@doexit>'
    );
  end
  else if This_Player.GetV(104,1) = 10 then
  begin
    This_Player.SetV(104,1,100);
    This_Player.UpdateTaskDetail(104,1);
    This_Player.SetV(105,1,1);
    //#This_Player.DeleteTaskFromUIList(104);          //先删除上一个任务号的内容，再添加下一个任务号的内容，顺序不能错！
    //#This_Player.AddTaskToUIList(105);
    This_Player.UpdateTaskDetail(105,1);
    This_Player.Give('经验',150000);
    This_Npc.NpcDialog(This_Player,
    '不错，不错，这样至少能够延缓它们的计划实施。\'
    +'现在我需要你深入寺庙内部去找白日门门徒。\'
    +'他在沃玛寺庙的最深处。\'
    +'他会告诉你下一步该怎么做的！\ \'
    +'|{cmd}<白日门门徒？/@mission105>'
    ); 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你收集完3根木料了吗？'); 
  end;
end;

procedure _mission105;
begin
  if This_Player.GetV(105,1) = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '不该问的就别问，赶紧去找他，他现在情况危急。\ \'
    +'|{cmd}<知道了，知道了，我这就去。他不会又是什么所谓的军方机密吧！/@mission105_1>'
    );
  end
  else
  exit;
end;

procedure _mission105_1;
begin
  if This_Player.GetV(105,1) = 1 then
  begin
    //This_Player.AutogotoMap('D024',49,49);
    This_NPC.CloseDialog(This_Player);
  end
  else
  exit;
end;
//------------------------------------------------------------------------------

var
  CZTem2: integer;
Begin
  CZTem2 := This_Player.GetV(104,1);
  if This_Player.GetV(105,1) = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你见到沃玛寺庙深处的白日门门徒了么？\ \'
    +'|{cmd}<我这就去/@doexit>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    );
  end
  else if ( CZTem2 = 9 ) or ( CZTem2 = 10 ) then
  begin
    This_Npc.NpcDialog(This_Player,
    '一定要对它们的行动进行破坏！\'
    +'（任务目标：杀死沃玛战士，收集3根木料）\ \'
    +'|{cmd}<我已经完成了/@mission104_3_fns>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    );
  end 
  else if CZTem2 = 8 then
  begin
    This_Npc.NpcDialog(This_Player,
    '情报上写的很晦涩，只说了它们正在寺庙里面筹建一个什么祭坛，\'
    +'要进行什么仪式。为了筹建这个祭坛，他们正在大量的收集木料。\'
    +'你去杀死他们，把它们收集的木料全部销毁。\'
    +'（任务目标：杀死沃玛战士，收集3根木料）\ \'
    +'|{cmd}<好的，我会尽力破坏它们的行动的。/@mission104_3>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    );
  end
  else if CZTem2 = 6 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你见到安家铺子老板了么？\ \'
    +'|{cmd}<我这就去/@doexit>\ \'
    +'|{cmd}<我有别的事情找你/@normal>'
    );
  end
  else if ( CZTem2 = 4 ) or ( CZTem2 = 5 ) then
  begin
    This_Npc.NpcDialog(This_Player,
    '回来见我前记得把身上洗干净！\'
    +'（任务目标：杀死3只粪虫，获取3份情报药水）\ \'
    +'|{cmd}<我已经收集齐了/@mission104_1_fns>\ \' 
    +'|{cmd}<我有别的事情找你/@normal>'
    ); 
  end
  else if ( CZTem2 = 2 ) or ( CZTem2 = 3 ) then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经窃取到情报了么？\'
    +'（任务目标：杀死2只山洞蝙蝠，获取2份破烂的情报）\ \'
    +'|{cmd}<我已经找到了情报/@mission104>\ \'
    +'|{cmd}<我有别的事情找你/@normal>' 
    );
  end 
  else if CZTem2 = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '我们又见面了。没啥好说的，你应该知道山洞蝙蝠的重要性吧！\'
    +'所以先去沃玛寺庙消灭他们，最好能从它们身上窃取到情报。\'
    +'（任务目标：杀死2只山洞蝙蝠，获取2份破烂的情报）\'
    +'怎么还是老样子，一点废话都没有……\ \'
    +'|{cmd}<我这就去，这就去。/@automove1>\ \'
    +'|{cmd}<我有别的事情找你/@normal>' 
    );
  end
  else 
  begin
    {$IFDEF Q136_hero}
    This_Npc.NpcDialog(This_Player,
    '感谢，我能为你做点什么？\ \'+
    '|{cmd}<买物品/@buy>                         ^<卖物品/@sell> \'+
    '|{cmd}<对话/@QUEST>\'+
    '|{cmd}<退出/@exit>');
    {$ELSE}
    This_Npc.NpcDialog(This_Player,
    '感谢，我能为你做点什么？\ \'+
    '|{cmd}<合成火龙神品/@hecheng>                   ^<查看合成火龙神品配方/@lookfor>\'+
    '|{cmd}<打听“火龙之心”的秘密/@huolong>\'+
    '|{cmd}<买物品/@buy>                         ^<卖物品/@sell> \'+
    '|{cmd}<对话/@QUEST>\'+
    '|{cmd}<退出/@exit>');
    {$ENDIF}
  end;
end.           