program mir2;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _EnterNewSky;
begin
  This_Npc.EnterNewGuan(This_Player);
end;

procedure _rule;
begin
  This_Npc.NpcDialog( This_Player,
    '调遣你的弓箭手，拦截逃离的怪物，获得怪物盗走的宝物\' +
    '逃离的怪物越少，您能获得的物品将更加丰富\' +
    '不放走1个怪物，更有机会获得<金天赐>\' +
    '拦截47-49个怪物，可获得银天赐；拦截41-46个怪物，可获得铜天赐\' +
    '拦截的怪物少于41个，还可以获得木天赐\' +
    '每次摆放弓箭手，都需要付出1张灵符\' +
    '|{cmd}<返回/@main>\'
   // +'|{cmd}<什么是弩牌？/@rule4>\' +
   // '|{cmd}<如何摆放弓箭手/@rule1>\' +
    //'|{cmd}<如何移动弓箭手/@rule2>\'
  );
end;

procedure _rule1;
begin
  This_Npc.NpcDialog( This_Player,
    '比赛开始，第一次摆放弓箭手时\' +
    '您可以点击<“选择摆放弓箭手位置”>选择摆放第一个弓箭手的位置\' +
    '第一个弓箭手位置一旦放置完毕，则怪物大军开始逃离！\' +
    '您的弓箭手杀死怪物，会在杀死怪物的弓箭手旁掉落<“弩牌”/@rule4>\' +
    '当您拥有5个弩牌时可以选择<“使用5个弩牌换取弓箭手”>\' +
    '同时您<“必须付出1张灵符”>，将获得再次选择摆放1个弓箭手的机会\' +
    '如果您再交出弩牌后没有立刻摆放弓箭手\' +
    '可以再次选择<“选择摆放弓箭手位置”>进行摆放\' +
    '|{cmd}<下一页/@next>'
  );
end;

procedure _next;
begin
  This_Npc.NpcDialog( This_Player,
    '每次阻击战中您只能摆放6个弓箭手\ \' +
    '|{cmd}<进入魔王岭拦截盗宝怪物/@EnterNewSky>\' +
    '|{cmd}<退出/@exit>'
  );
end;

procedure _rule2;
begin
  This_Npc.NpcDialog( This_Player,
    '当您的包裹里存在1个弩牌，并且拥有1个以上弓箭手时\' +
    '您可以选择<“使用1个弩牌移动弓箭手”>\' +
    '先选择要移动的弓箭手后，再选择要放置的位置，即可移动\' +
    '如果您已经选择了移动弓箭手，但是放置的位置错误\' +
    '可以再次选择<“选择摆放弓箭手位置”>摆放弓箭手\' +
    '移动弓箭手<“不需要付出灵符”>\ \' +
    '|{cmd}<进入魔王岭拦截盗宝怪物/@EnterNewSky>\' +
    '|{cmd}<退出/@exit>'
  );
end;

procedure _rule4;
begin
  This_Npc.NpcDialog( This_Player,
    '弩牌为召唤和移动弓箭手的凭证\' +
    '你可以使用5个弩牌和1张灵符换取1个弓箭手为你作战\' +
    '或者使用1个弩牌为你的1个弓箭手移位\' +
    '杀死逃离的怪物有机会获得弩牌\' +
    '弩牌只能在魔王岭中使用，一旦带离魔王岭，它将失去魔力\' +
    '再进入魔王岭时会被传送之力所粉碎\ \' +
    '|{cmd}<进入魔王岭拦截盗宝怪物/@EnterNewSky>\' +
    '|{cmd}<退出/@exit>'
  );
end;

begin
  This_Npc.NpcDialog(This_Player,
    '最近魔王派遣手下从天关盗走了大批的宝物\' +
    '它们在逃离的时候会经过魔王岭\' +
    '我们正在募集勇士前去拦截这些怪物\' +
    This_Player.Name+',若你能拦截下怪物替我们追回失窃的宝物\' +
    '我们会给予你们丰厚的酬谢的！\  \' +
    '|{cmd}<进入魔王岭拦截盗宝怪物/@EnterNewSky>\ \' +
    '|{cmd}<查看拦截细则/@rule>  ');

end.