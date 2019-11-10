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
  '欢迎光临，有什么事情吗？\ \'
  +'|{cmd}<购买戒指/@buy> \'
  +'|{cmd}<出售戒指/@sell> \'
  +'|{cmd}<修理戒指/@repair> \'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '您购买哪种戒指?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '您出售哪种戒指?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '您要修理戒指?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它是好的.\ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _molongqude;
begin
  This_Npc.NpcDialog(This_Player,
  '神秘绒丝、魔龙颚骨、魔龙骨、魔龙牙都是旷世罕见的稀世珍宝，\仅靠一己之力是无法获得这些神奇的宝贝，必须拥有队友的协作！\在盟重镇魔守将处使用任意一种组队卷轴选择组队前往地下迷宫，\通过崎岖的地下迷宫和妖魔守卫的宫殿长廊，到达地下宫殿,\您必须拥有千年蛛丝,\地下宫殿中宫殿守卫才会透露这些神奇宝贝的获得方法。|{cmd}<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(22);
  This_Npc.AddStdMode(23);
  This_Npc.FillGoods('古铜戒指',3,3);
  This_Npc.FillGoods('六角戒指',3,3);
  This_Npc.FillGoods('玻璃戒指',3,3);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  