{
*******************************************************************}

Program Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _helpmakedrug;
Begin
   This_Npc.NpcDialog(This_Player,
   '我可以帮你合成下面的东西：\ \'+
   '|{cmd}<赤血魔剑/@make1>\'+
   '|{cmd}<魔血套装/@make2>\'+
   '|{cmd}<虹魔套装/@make3>\'+
   '|{cmd}<返回/@main>');
end;

Procedure _make1;
Begin
   This_Npc.NpcDialog(This_Player,
   '想合成赤血魔剑？\'+
   '那你需要一把罗刹和六种特殊的药水，再交100元手工费就行了。\'+
   '能不能弄到这些东西就看你自己的本事了！\'+
   '不过，得到赤血魔剑可不一定是好事！ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _make2;
Begin
   This_Npc.NpcDialog(This_Player,
   '想要魔血套装？太简单了！\'+
   '只要你有相应的虹魔套装就行了。\'+
   '不过，除了原有的100元手工费，我要另收一根金条作为报酬。\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _make3;
Begin
   This_Npc.NpcDialog(This_Player,
   '想要虹魔套装？太简单了！\'+
   '只要你有相应的魔血套装就行了。\'+
   '不过，除了原有的100元手工费，我要另收一根金条作为报酬。\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _talkwith;
Begin
   This_Npc.NpcDialog(This_Player,
   '冒险者，这里有着一道通往另一个神秘世界的大门，\'+
   '但是如何穿过这道大门，我现在仍然没有参破，\'+
   '希望你能够代替我完成这个心愿。\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _makedrug;
Begin
   This_Npc.NpcDialog(This_Player,
   '请选择你想合成的物品。所需材料应该都带来了吧？\ \ |{cmd}<返回/@main>');
   This_Npc.Click_Makedrug(This_Player);
end;

//初始化操作
procedure OnInitialize;
begin
   This_Npc.AddStdMode(0);
   This_Npc.AddStdMode(3);
   This_Npc.AddStdMode(4);
   This_Npc.AddStdMode(20);
   This_Npc.AddStdMode(22);
   This_Npc.AddStdMode(26);
   This_Npc.AddStdMode(42); 
   This_Npc.AddStdMode(47);
   This_Npc.FillGoods('赤血魔剑',1,1);
   This_Npc.FillGoods('魔血戒指',1,1);
   This_Npc.FillGoods('魔血手镯',1,1);
   This_Npc.FillGoods('魔血项链',1,1);
   This_Npc.FillGoods('虹魔戒指',1,1);
   This_Npc.FillGoods('虹魔手镯',1,1);
   This_Npc.FillGoods('虹魔项链',1,1);
   This_Npc.SetRebate(100);
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '已经很多年没有人来过这里了，\'+
   '今天就破例让你见识见识我的手艺吧！\ \'+
   '|{cmd}<合成物品/@makedrug>\'+
   '|{cmd}<如何合成物品/@helpmakedrug>\'+
   '|{cmd}<进行对话/@talkwith>');
end.