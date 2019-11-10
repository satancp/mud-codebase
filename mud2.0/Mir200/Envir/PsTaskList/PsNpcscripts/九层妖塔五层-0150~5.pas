PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇,九层妖塔一共九层，每层清空当前怪物才能进入下一层，请具备一定实力再考虑进入，装备爆率高，曝终极！\'+
     '进入六层需要50灵符！\' 
    +'|{cmd}<进入九层妖塔六层/@lc> \');
end;

procedure _lc; 
begin
    if This_Npc.CheckCurrMapMon = 0 then
 begin
    if This_Player.MyLFnum > 49 then
  begin
    
    if (This_NPC.CheckMapMonByName('0150~6' , '牛魔王') >= 1)  and
      (This_NPC.CheckMapMonByName('0150~6' , '暗之虹魔教主') >= 1)
      and (This_NPC.CheckMapMonByName('0150~6' , '暗之沃玛教主') >= 1) then
    begin  
         This_Player.RandomFlyto('0150~6');
         This_Player.DecLF(20251, 50, False)
        This_NPC.CreateMon('0150~6',11,16,8,'牛魔祭司',8);
        

  
        end else
     if (This_NPC.CheckMapMonByName('0150~6' , '牛魔王') = 0)  and
      (This_NPC.CheckMapMonByName('0150~6' , '暗之虹魔教主') = 0) 
      and (This_NPC.CheckMapMonByName('0150~6' , '暗之沃玛教主') = 0) then
    begin
        This_NPC.CreateMon('0150~6',11,16,8,'牛魔祭司',8);
 
        This_NPC.CreateMon('0150~6',11,16,8,'暗之沃玛教主',1);
        This_NPC.CreateMon('0150~6',11,16,8,'牛魔王',1);
         This_NPC.CreateMon('0150~6',11,16,8,'暗之虹魔教主',1);
     
    end;
    end else
    begin 
	   This_Npc.NpcDialog(This_Player,
        '您好像没有足够的灵符!');
     end;
     end else
   begin 
	   This_Npc.NpcDialog(This_Player,
        '您好像没有消灭所有的怪物!');
   end;
end;
Begin
  domain;
end.