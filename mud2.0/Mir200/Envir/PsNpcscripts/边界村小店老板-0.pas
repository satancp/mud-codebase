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







//以下边界药店原有功能； 
procedure _questionprize;
begin
  This_Npc.NpcDialog(This_Player,
  '我们只经营 <地牢逃脱卷/@teleport>，\但我们听说有 <随机传送卷/@teleport2>，|{cmd}<回城卷/@steleport>和<修复油/@repairoil>之类的东西。\他们可以从妖怪那里弄到或从其他地方买到。\ \|{cmd}<返回/@main>'
  );
end;

procedure _teleport;
begin
  This_Npc.NpcDialog(This_Player,
  '地牢逃脱卷是一种可以\把你传到你最后去过的城镇附近的卷轴。\它的能力可能比回城卷要弱一些，\但总归能从危险中救你的命。\ \|{cmd}<返回/@questionprize>'
  );
end;

procedure _teleport2;
begin
  This_Npc.NpcDialog(This_Player,
  '随机传送卷是一种可以\把你传到当前地图随机位置的卷轴。\这很危险，但如果你还剩有很多药，并且想继续在远方狩猎，\这时候可是非常有用的。\ \|{cmd}<返回/@questionprize>'
  );
end;

procedure _steleport;
begin
  This_Npc.NpcDialog(This_Player,
  '回城卷据说来自远古\的一种神奇法术。但不幸的是，现在已经丢失了。\但我们听说有些怪物还有这种卷轴，\如果使用它你可以立刻返回村庄。\ \|{cmd}<返回/@questionprize>'
  ); 
end;

procedure _repairoil;
begin
  This_Npc.NpcDialog(This_Player,
  '修复油可以恢复手中兵器的耐久力。\这并不是特殊修复，所以如果你用的话\不要忘了武器的耐久力会渐渐的减少。\如果武器不是太贵的话，\在长时间狩猎的时候带一瓶还是有用的。\或者干脆带上两瓶。\ \|{cmd}<返回/@questionprize>'
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
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('金创药(小量)',200,1);
  This_Npc.FillGoods('魔法药(小量)',200,1);
  This_Npc.FillGoods('金创药(小)包',100,1); 
  This_Npc.FillGoods('魔法药(小)包',100,1);
  This_Npc.FillGoods('地牢逃脱卷',1000,1);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
      This_Npc.NpcDialog(This_Player,
      '欢迎，我能为你做点什么？\ \'
      +'|{cmd}<买物品/@buy> \'
      +'|{cmd}<卖物品/@sell> \'
      +'|{cmd}<询问/@questionprize> 物品详细情况\'
      +'|{cmd}<退出/@doexit>');
end.