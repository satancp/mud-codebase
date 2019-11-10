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
  '你是来炼什么药？\ \'
  +'|{cmd}<炼/@makedrug>药\'
  +'有关毒药<听说明./@helpmakedrug>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _makedrug;
begin
  This_Npc.Click_Makedrug(This_Player);
end;

procedure _helpmakedrug;
begin
  This_Npc.NpcDialog(This_Player,
  '这里可以炼的药只有两种。\ \'
  +'|{cmd}<灰色毒粉/@helpdrug1>的功能\'
  +'|{cmd}<黄色毒粉/@helpdrug2>的功能\'
  +'|{cmd}<灰色毒粉/@helpmakedrug1>的原料\'
  +'|{cmd}<黄色毒粉/@helpmakedrug2>的原料\'
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
  '灰色毒粉的原料有 <食人树的果实/@helpitem_1> 1个，\毒蜘蛛牙齿 2个,\食人树叶 4个。\ \ |{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpmakedrug2;
begin
  This_Npc.NpcDialog(This_Player,
  '黄色毒粉的原料有 <蛆卵/@helpitem_2> 1个, 蝎子的尾巴\1个, 食人树叶 4个。\ \ |{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpitem_1;
begin
  This_Npc.NpcDialog(This_Player,
  '割食人草可以得到食人树的果实，\但是5个食人草中可以得到果实的，\只有1个。\ \ |{cmd}<返回/@helpmakedrug1>'
  );
end;

procedure _helpitem_2;
begin
  This_Npc.NpcDialog(This_Player,
  '抓到洞穴里的洞蛆，就可以得到蛆卵。\长得像圆圆的茧。\ \ |{cmd}<返回/@helpmakedrug2>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('灰色药粉(少量)',1,1);
  This_Npc.FillGoods('黄色药粉(少量)',1,1);
  This_Npc.FillGoods('灰色药粉(中量)',1,1);
  This_Npc.FillGoods('黄色药粉(中量)',1,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.