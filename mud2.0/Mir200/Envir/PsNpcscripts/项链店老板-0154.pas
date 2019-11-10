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
  '喔，呵呵~请爽快地购买项链. 有时我会卖一个很低的价\当我粗心时. 喔，呵呵~. 你是兄弟行会的成员，\我给你个特惠价怎么样? 不错吧?  喔，呵呵~ \ \'
  +'|{cmd}<购买项链/@buy>' + addSpace('', 24) + '^<出售项链/@sell>\'
  +'|{cmd}<修理项链/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;



procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '我们有各种项链. \除了不存在的项链，喔，呵呵. \ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '你把这个项链当礼物送我 ?喔，呵呵.你想卖... \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你想修理项链?为什么不买个新的....\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去全修好了.  \ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>\ \|{cmd}<返回/@main>'
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