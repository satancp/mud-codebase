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
  '这地方是做药品买卖的，你需要点什么？\对于'+This_npc.GetCastleGuildName+'成员我们有20%的折扣，\因为这座城堡是属于'+This_npc.GetCastleGuildName+'的。\ \'
  +'|{cmd}<制作/@makedrug> 药品\'
  +'|{cmd}<打听/@helpmakedrug> 药品的解释\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _makedrug;
begin
  This_Npc.NpcDialog(This_Player,
  '请选择你要制作的药品。\你肯定没忘了带做药的原料，对吗？\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Makedrug(This_Player);
end;

procedure _helpmakedrug;
begin
  This_Npc.NpcDialog(This_Player,
  '这里我们可以做2种药品。.\ \'
  +'|{cmd}<灰色药粉/@helpdrug1>的效果\'
  +'|{cmd}<黄色药粉/@helpdrug2>的效果\'
  +'|{cmd}<灰色药粉/@helpmakedrug1>的成分\'
  +'|{cmd}<黄色药粉/@helpmakedrug2>的成分\'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _helpdrug1;
begin
  This_Npc.NpcDialog(This_Player,
  '道士可以在使施毒术时，用灰色毒粉，\中毒会减掉体力。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpdrug2;
begin
  This_Npc.NpcDialog(This_Player,
  '道士可以在使施毒术时，用黄色毒粉，\中毒会减掉防御能力。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpmakedrug1;
begin
  This_Npc.NpcDialog(This_Player,
  '灰色毒粉的原料有 <食人树的果实/@helpitem_1> 1个，\毒蜘蛛牙齿 2个,\食人树叶 4个。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpmakedrug2;
begin
  This_Npc.NpcDialog(This_Player,
  '黄色毒粉的原料有 <蛆卵/@helpitem_2> 1个, 蝎子的尾巴\1个, 食人树叶 4个。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpitem_1;
begin
  This_Npc.NpcDialog(This_Player,
  '割食人草可以得到食人树的果实，\但是5个食人草中可以得到果实的，\只有1个。\ \|{cmd}<返回/@helpmakedrug1>'
  );
end;

procedure _helpitem_2;
begin
  This_Npc.NpcDialog(This_Player,
  '抓到洞穴里的洞蛆，就可以得到蛆卵。\长得像圆圆的茧。\ \|{cmd}<返回/@helpmakedrug2>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_NPC.FillGoods('灰色药粉(少量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 1, 1); 
  This_NPC.FillGoods('灰色药粉(中量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 1, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(大量)', 10, 1);
  This_NPC.FillGoods('超级灰色药粉', 10, 1);
  This_NPC.FillGoods('超级黄色药粉', 10, 1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.
   