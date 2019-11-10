// 魔王岭npc

program Mir2;

procedure OnInitialize;
begin
  This_Npc.AddNpcProp(12);

end;

procedure _EngageAch1;
begin
  This_Npc.EngageArcher(This_Player, 1);
end;

procedure _EngageAch2;
begin
  This_Npc.EngageArcher(This_Player, 2);
end;

procedure _EngageAch3;
begin
  This_Npc.EngageArcher(This_Player, 3);
end;

procedure _EngageAch4;
begin
  This_Npc.EngageArcher(This_Player, 4);
end;

procedure _EngageAch5;
begin
  This_Npc.EngageArcher(This_Player, 5);
end;

procedure _EngageAch6;
begin
  This_Npc.EngageArcher(This_Player, 6);
end;

procedure _EngageAch7;
begin
  This_Npc.EngageArcher(This_Player, 7);
end;

procedure _EngageAch8;
begin
  This_Npc.EngageArcher(This_Player, 8);
end;

procedure _EngageAch9;
begin
  This_Npc.EngageArcher(This_Player, 9);
end;

procedure _EngageAch10;
begin
  This_Npc.EngageArcher(This_Player, 10);
end;

procedure _EnAch;
begin
  This_Npc.NpcDialog(This_Player, '请选择放置弓箭手的位置\\' +
    '|{cmd}<◎1号/@EngageAch1>                                 ^<◎10号/@EngageAch10>\' +
    '                                            \' +
    '|{cmd}<◎2号/@EngageAch2>                                 ^<◎09号/@EngageAch9>\' +
    '                                            \' +
    '|{cmd}<◎3号/@EngageAch3> ^<◎4号/@EngageAch4> ^<◎5号/@EngageAch5> ^<◎6号/@EngageAch6> ^<◎7号/@EngageAch7> ^<◎08号/@EngageAch8>\'
    );
end;

procedure _GetMoving1;
begin
  This_Npc.GetMoveChance(This_Player, 1);
end;

procedure _GetMoving2;
begin
  This_Npc.GetMoveChance(This_Player, 2);
end;

procedure _GetMoving3;
begin
  This_Npc.GetMoveChance(This_Player, 3);
end;

procedure _GetMoving4;
begin
  This_Npc.GetMoveChance(This_Player, 4);
end;

procedure _GetMoving5;
begin
  This_Npc.GetMoveChance(This_Player, 5);
end;

procedure _GetMoving6;
begin
  This_Npc.GetMoveChance(This_Player, 6);
end;

procedure _GetMoving7;
begin
  This_Npc.GetMoveChance(This_Player, 7);
end;

procedure _GetMoving8;
begin
  This_Npc.GetMoveChance(This_Player, 8);
end;

procedure _GetMoving9;
begin
  This_Npc.GetMoveChance(This_Player, 9);
end;

procedure _GetMoving10;
begin
  This_Npc.GetMoveChance(This_Player, 10);
end;


procedure _MovAch;
begin
  This_Npc.NpcDialog(This_Player,
    '请选择要移动的弓箭手\\' +
    '|{cmd}<◎1号/@GetMoving1>                                 ^<◎10号/@GetMoving10>\' +
    '                \' +
    '|{cmd}<◎2号/@GetMoving2>                                 ^<◎09号/@GetMoving9>\' +
    '                \' +
    '|{cmd}<◎3号/@GetMoving3> ^<◎4号/@GetMoving4> ^<◎5号/@GetMoving5> ^<◎6号/@GetMoving6> ^<◎7号/@GetMoving7> ^<◎8号/@GetMoving8>\' +
    '\');
end;

procedure _OnStart;
begin
  //This_Npc.NewSkyStart(This_Player);

end;

procedure _GetEngage;
begin
  This_Npc.GetEngageChance(This_Player);

end;

begin
  This_Npc.NpcDialog(This_Player,
    '赶快召唤出弓箭手，盗走天关宝物的怪物就要出现了！\' +
    '拦截逃离的怪物，夺回被盗的宝物！\' +
    '每次摆放弓箭手，都需要付出一张灵符哦\' +
    '请<选择摆放弓箭手位置/@EnAch>摆放第一个弓箭手，\' +
    '如果移动弓箭手的位置错误，也可以在这里重新放置\ \' +
    '|{cmd}<使用5个弩牌换取弓箭手/@GetEngage>    |<使用1个弩牌移动弓箭手/@MovAch>\  \' +
    '|{cmd}<领取天关宝物/@lingqu>                        ^<查看规则/@rule>\');

//  This_Npc.NpcDialog(This_Player,
//    '|{cmd}<开始/@OnStart>'
//  );
end.
