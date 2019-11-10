PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
    +'<★★★★★★九层妖塔★★★★★★/c=red>\|'
    +'欢迎来到笑傲武林传奇,九层妖塔一共九层，\|'
	+'<50/=red>级以上进入\|'
	+'每层清空当前怪物才能进入下一层，\|'
	+'请具备一定实力再考虑进入，装备爆率超高！\|'
    +'|{cmd}<进入九层妖塔一层/@yic>  ^<返回/@main>\');
end;

procedure _yic; 
begin
    if This_Player.Level >= 50 then
  begin                 
   This_Player.RandomFlyto('0150~1');
   ServerSay('玩家<' + This_Player.Name + '>进入了九层妖塔', 2);
   This_NPC.CreateMon('0150~1',11,16,8,'黑色恶蛆',9);
   This_NPC.CreateMon('0150~1',11,16,8,'钳虫',1);
   end
   else
   begin
       This_Player.FlyTo('3', 333, 333);
       This_Npc.NpcDialog(This_Player,
   '您的等级不够！'
   );   
   end;

  end;
Begin
  domain;
end.