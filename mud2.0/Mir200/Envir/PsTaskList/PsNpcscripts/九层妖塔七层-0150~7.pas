PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇,通天塔一共九层，每层清空当前怪物才能进入下一层，请具备一定实力再考虑进入，装备爆率高，曝终极！\'+
     '进入九层妖塔八层需要200灵符！\' 
    +'|{cmd}<进入九层妖塔八层/@bc> \');
end;

procedure _bc; 
begin
    if This_Npc.CheckCurrMapMon = 0 then
 begin
    if This_Player.MyLFnum > 199 then
  begin
   
    if (This_NPC.CheckMapMonByName('0150~8' , '魔龙教主') >= 1)  and
      (This_NPC.CheckMapMonByName('0150~8' , '魔龙巨蛾') >= 1) then
     
    begin  
         This_Player.RandomFlyto('0150~8');
         This_Player.DecLF(20251, 200, False)
        This_NPC.CreateMon('0150~8',11,16,8,'魔龙血蛙',8);
        

  
        end else
     if (This_NPC.CheckMapMonByName('0150~8' , '魔龙教主') = 1)  and
      (This_NPC.CheckMapMonByName('0150~8' , '魔龙巨蛾') = 1) then
      
    begin
        This_NPC.CreateMon('0150~8',11,16,8,'魔龙血蛙',8);
 
        This_NPC.CreateMon('0150~8',11,16,8,'魔龙教主',1);
        This_NPC.CreateMon('0150~8',11,16,8,'火龙1',1);
        
     
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