{********************************************************************

*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
      This_Npc.NpcDialog(This_Player,
      '欢迎.我可以为你做什么吗？\ \'
      +'|{cmd}<购买物品/@buy>  \'
      +'|{cmd}<出售物品/@sell>  \'
      +'|{cmd}<询问/@questionprize> 物品详细情况 \'
      +'|{cmd}<退出/@doexit>');
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你需要哪种物品呢?\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '我们只收购地牢逃脱卷.\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _questionprize;
begin
  This_Npc.NpcDialog(This_Player,
  '我们只经营<地牢逃脱卷/@teleport>,\但我们听说有<随机传送卷/@teleport2>,|{cmd}<回城卷/@steleport>之类的东西\可以从妖怪那里弄到或从其他地方买到。\ \|{cmd}<返回/@main>'
  );
end;


procedure _teleport;
begin
  This_Npc.NpcDialog(This_Player,
  '地牢逃脱卷是一种可以把你传到你最后\'+
  '去过的城镇附近的卷轴。\ '+
  '它的能力可能比行会回城卷要弱一些，\'+
  '但总归能从危险中救你的命。\ \'+
   '|{cmd}<返回/@questionprize>'
  );
end;

procedure _teleport2;
begin
  This_Npc.NpcDialog(This_Player,
  '随机传送卷是一种可以把你传到当前\'+
  '地图随机位置的卷轴。\'+
  '这很危险，但如果你想继续在远方狩猎，\'+
  '这可是非常有用的。\ \'+
  '|{cmd}<返回/@questionprize>'
  );
end;

procedure _steleport;
begin
  This_Npc.NpcDialog(This_Player,
  '回城卷据说来自远古的一种神奇卷轴。\'+
  '但不幸的是，现在已经丢失了。\'+
  '但我们听说有些怪物还有这种卷轴，\'+
  '如果使用它你可以立刻返回村庄。\ \'+
  '|{cmd}<返回/@questionprize>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.FillGoods('地牢逃脱卷',1000,1);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.