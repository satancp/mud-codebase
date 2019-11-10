{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务 

procedure dorenwu8;
begin
   This_Npc.NpcDialog(This_Player,
   '受伤？那我一会就去看看。谢谢你来告诉我，\'+
   '哦，对了，新手引导员刚才在这边晃悠，不知道是不是在找你。\ \'+
   '|{cmd}<好的 我这就去/@renwu9>');
end;

procedure _renwu9;
begin
   if (This_Player.GetV(102,1)=5) then
   begin
      This_Npc.NpcDialog(This_Player,
      '对了，新手引导员刚才在这边晃悠，不知道是不是在找你。\ \ \'+
      '|{cmd}<我这就去问问(任务)/@doexit>\');
   end else
   begin
      This_Player.SetV(102,1,5);        //任务标记
      This_Player.UpdateTaskDetail(102,1);
      This_Player.Give('经验',1250);
      This_Npc.CloseDialog(This_Player);
      //This_player.AutoGotoMap('0',332,270);//自动寻路新手引到员 
   end;  
end; 

procedure dorenwu9;
begin
   if (This_Player.GetV(102,1)=5) then
   begin
     This_Npc.NpcDialog(This_Player,
     '对了，新手引导员刚才在这边晃悠，不知道是不是在找你。\ \ \'+
     '|{cmd}<我这就去问问(任务)/@doexit>\');
   end;
end; 
//==============================================================新手任务 

procedure domain;
var
  YXRW102 : integer; 
begin
   YXRW102 := This_Player.GetV(102,1);
   if (YXRW102 = 5) or (YXRW102 = 4) then
   begin
      {$IFDEF Q136_hero}
      This_Npc.NpcDialog(This_Player,
      '感谢光临，有什么事情需要我帮忙吗？\ \'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>                         \'//^<成长任务：如何成为玛法勇士/@YXDoMainExtra>\'
      +'|{cmd}<返回比奇安全区/@FanhuiBQ>                 ^<退出/@doexit>');
      {$ELSE}
      This_Npc.NpcDialog(This_Player,
      '感谢光临，有什么事情需要我帮忙吗？\ \'
      +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 16) + '|{cmd}<查看合成火龙神品配方/@lookfor>\'
      +'|{cmd}<打听“火龙之心”的秘密/@huolong>\'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>                         \'//^<成长任务：如何成为玛法勇士/@YXDoMainExtra>\'
      +'|{cmd}<返回比奇安全区/@FanhuiBQ>                 ^<退出/@doexit>');
      {$ENDIF}
   end else 
   begin
      {$IFDEF Q136_hero}
      This_Npc.NpcDialog(This_Player,
      '感谢光临，有什么事情需要我帮忙吗？\ \'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<退出/@doexit>                ^<返回比奇安全区/@FanhuiBQ>');
      {$ELSE}
      This_Npc.NpcDialog(This_Player,
      '感谢光临，有什么事情需要我帮忙吗？\ \'
      +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 16) + '|{cmd}<查看合成火龙神品配方/@lookfor>\'
      +'|{cmd}<打听“火龙之心”的秘密/@huolong>\'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<退出/@doexit>');
      {$ENDIF}
   end;
   
end;
   
procedure _FanhuiBQ;
begin
   if compareText(This_Player.MapName,'0108') = 0 then
   begin
      This_Player.Flyto('0',327,272);
   end;
end;

procedure _YXDoMainExtra;
var
  YXRW102 : integer; 
begin
   YXRW102 := This_Player.GetV(102,1);
   if YXRW102 = 5 then
   begin
      dorenwu9;
   end
   else if YXRW102 = 4 then
   begin
      dorenwu8;
   end; 
end;

procedure _hecheng;
begin
  This_Npc.NpcDialog(This_Player,
  '我还没有完全参透其中的秘密，可以合成的物品还很有限，\你就告诉我你想合成什么药品吧。\ \'
  +'|{cmd}<九花玉露/@yulu>'+ addSpace('', 16) + '|{cmd}<九花雪露/@xuelu>\'
  +'|{cmd}<元神丹/@qidan>'+ addSpace('', 16) + '|{cmd}<回气膏/@qigao>\'
  +'|{cmd}<查看合成配方/@lookfor>\'
  +'|{cmd}<关闭/@doexit>'
  );
end;

procedure _yulu;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花玉露需要紫背天葵、铁树果、阴阳仙草各1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@yulu1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _yulu1;
begin
  if This_Player.GetBagItemCount('紫背天葵') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('铁树果') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('阴阳仙草') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('紫背天葵',1);
    This_Player.Take('铁树果',1);
    This_Player.Take('阴阳仙草',1);
    This_Player.Give('九花玉露',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，九花玉露已经合成好了！'
     ); 
  end;
end;

procedure _xuelu;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花玉露需要黄色马枝花，罗布麻叶，\地苦胆, 四叶参这四种草药各1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@xuelu1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _xuelu1;
begin
  if This_Player.GetBagItemCount('黄色马枝花') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('罗布麻叶') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('地苦胆') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('四叶参') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('黄色马枝花',1);
    This_Player.Take('罗布麻叶',1);
    This_Player.Take('地苦胆',1);
    This_Player.Take('四叶参',1);
    This_Player.Give('九花雪露',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，九花雪露已经合成好了！'
     ); 
  end;
end;

procedure _qidan;
begin
  This_Npc.NpcDialog(This_Player,
  '合成元神丹需要毒蜘蛛牙齿、蛆卵、蝎子的尾巴各4个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@qidan1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _qidan1;
begin
  if This_Player.GetBagItemCount('毒蜘蛛牙齿') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('蛆卵') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('蝎子的尾巴') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('毒蜘蛛牙齿',4);
    This_Player.Take('蛆卵',4);
    This_Player.Take('蝎子的尾巴',4);
    This_Player.Give('元神丹',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，元神丹已经合成好了！'
     ); 
  end;
end;

procedure _qigao;
begin
  This_Npc.NpcDialog(This_Player,
  '合成回气膏需要需要鸡肉、肉、食人树叶各4个，\同时还需要食人树的果实1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@qigao1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _qigao1;
begin
  if This_Player.GetBagItemCount('鸡肉') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('肉') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('食人树叶') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('食人树的果实') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('鸡肉',4);
    This_Player.Take('肉',4);
    This_Player.Take('食人树叶',4);
    This_Player.Take('食人树的果实',1);
    This_Player.Give('回气膏',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，回气膏已经合成好了！'
     ); 
  end;
end;

procedure _lookfor;
begin
  This_Npc.NpcDialog(This_Player,
  '合击威力强大，但使用它必须先要拥有“火龙之心”\我知道你听说过“火龙之心”，但我断定你知其一不知其二\“火龙之心”是用来积蓄怒气的，蓄满方能使用合击\在“火龙之心”中放入火龙神品，怒气会大量增加\神品其实有很多种，不同的配方能合成出不同的火龙神品\我会制作很多种“火龙之心”，现在来看看你想要哪种吧。\'
  +'|{cmd}<九花玉露/@yulu2>'+ addSpace('', 16) + '|{cmd}<九花雪露/@xuelu2>\'
  +'|{cmd}<元神丹/@qidan2>'+ addSpace('', 18) + '|{cmd}<回气膏/@qigao2>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _yulu2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花玉露需要紫背天葵、铁树果、阴阳仙草各1个\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _xuelu2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花雪露需要黄色马枝花，罗布麻叶，\地苦胆, 四叶参这四种草药各1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _qidan2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成元神丹需要毒蜘蛛牙齿、蛆卵、蝎子的尾巴各4个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _qigao2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成回气膏需要需要鸡肉、肉、食人树叶各4个，\同时还需要食人树的果实1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _huolong;
begin
  This_Npc.NpcDialog(This_Player,
  '“火龙之心”是用来积蓄怒气的，蓄满方能使用合击，\在“火龙之心”中放入火龙神品，怒气会大量增加，\很多物品都可以增加怒气值，白日门技能书可大量增加怒气，\鸡肉、食人树叶、地苦胆、书页等都可不同程度增加怒气，\九花雪露、九花玉露、元神丹、回气膏、补气丹这些神品，\可以从多至少不同数量增加怒气值。\'
  +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 16) +'|{cmd}<查看合成火龙神品配方/@lookfor>\'
  +'|{cmd}<退出/@doexit>'
  );
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