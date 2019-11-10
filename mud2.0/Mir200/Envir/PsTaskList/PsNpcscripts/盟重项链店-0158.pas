{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '感谢. 我可以帮你什么吗?\'

  +'|{cmd}<买项链/@buy>'+ addSpace('', 24) + '|{cmd}<卖项链/@sell>\'
  +'|{cmd}<修理项链/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
 
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _shengji;
begin
  This_Npc.NpcDialog(This_Player,
  '由于我本领有限，升级成强化物品，需要3个原有的首饰才可以，\也就是说你想要升级成强化雷霆战戒，就必须给我3个雷霆战戒，\除了3个首饰，还需要提供给我一些配方，否则，我也无能为力，\首先，升级需要888颗金刚石，可以保证升级后物品的纯度，\升级除了相应的绒丝，还需要魔龙颚骨、魔龙骨、魔龙牙各一件，\如果你有上述物品，你就交给我吧，我保证给您一个强化的首饰，\'
  +'|{cmd}<升级雷霆项链/@uplei3>'+ addSpace('', 8) + '|{cmd}<升级烈焰项链/@upmo3>'+ addSpace('', 8) + '|{cmd}<升级光芒项链/@upgua3>\ \'
  +'|{cmd}<返回/@main>'
  );
end; 

//升级装备模板
//item_src1是普通装备(需要3个)
//item_src2-item_src5是材料(都只需要1个)
//item_des是合成的强化装备 
procedure DoUpgrade(item_src1, item_src2, item_src3, item_src4, item_src5, item_des: string);
begin
  if (This_Player.MyDiamondnum < 888) or (This_Player.GetBagItemCount(item_src1) < 3)
     or (This_Player.GetBagItemCount(item_src2) < 1) 
     or (This_Player.GetBagItemCount(item_src3) < 1)
     or (This_Player.GetBagItemCount(item_src4) < 1)
     or (This_Player.GetBagItemCount(item_src5) < 1) then
  begin
    This_Npc.NpcDialog(This_Player, 
    '您没有升级需要的足够原料，我也无能为力了。'
    );
  end
  else
  begin
    This_Player.TakeDiamond(888,This_Npc);
    This_Player.Take(item_src1,3);
    This_Player.Take(item_src2,1);
    This_Player.Take(item_src3,1);
    This_Player.Take(item_src4,1);
    This_Player.Take(item_src5,1);
    This_Player.Give(item_des,1);
    This_Npc.NpcDialog(This_Player, 
    '恭喜您，升级已经成功，现在给您一个强化的首饰。'
    );
  end;
end;
  
procedure _uplei3;
begin
  DoUpgrade('雷霆项链', '雷霆绒丝', '魔龙颚骨', '魔龙骨', '魔龙牙', '强化雷霆项链');
end;

procedure _upmo3;
begin
  DoUpgrade('烈焰项链', '烈焰绒丝', '魔龙颚骨', '魔龙骨', '魔龙牙', '强化烈焰项链');
end;

procedure _upgua3;
begin
  DoUpgrade('光芒项链', '光芒绒丝', '魔龙颚骨', '魔龙骨', '魔龙牙', '强化光芒项链');
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你要购买项链?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '您出售哪种项链?\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '您要修理项链?\ \|{cmd}<返回/@main>'
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
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！'
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
  '神秘绒丝、魔龙颚骨、魔龙骨、魔龙牙都是旷世罕见的稀世珍宝，\仅靠一己之力是无法获得这些神奇的宝贝，必须拥有队友的协作！\在盟重镇魔守将处使用任意一种组队卷轴选择组队前往地下迷宫，\通过崎岖的地下迷宫和妖魔守卫的宫殿长廊，到达地下宫殿,\您必须拥有千年蛛丝,\地下宫殿中宫殿守卫才会透露这些神奇宝贝的获得方法。\|{cmd}<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(19);
  This_Npc.AddStdMode(20);
  This_Npc.AddStdMode(21);
  This_Npc.FillGoods('金项链',3,3);
  This_Npc.FillGoods('传统项链',3,3);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  