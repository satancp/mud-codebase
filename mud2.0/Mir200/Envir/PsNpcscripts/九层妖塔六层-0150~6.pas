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
    '进入七层需要100灵符！\' 
    +'|{cmd}<进入九层妖塔七层/@qc> \');
end;

procedure _qc; 
begin
    if This_Npc.CheckCurrMapMon = 0 then
 begin
    if This_Player.MyLFnum > 99 then
  begin
    
    if (This_NPC.CheckMapMonByName('0150~7' , '重装使者') >= 1)  and
      (This_NPC.CheckMapMonByName('0150~7' , '双头金刚') >= 1)
      and (This_NPC.CheckMapMonByName('0150~7' , '双头血魔') >= 1) then
    begin  
         This_Player.RandomFlyto('0150~7');
         This_Player.DecLF(20251, 100, False)
        This_NPC.CreateMon('0150~7',11,16,8,'牛魔法师',8);
        

  
        end else
     if (This_NPC.CheckMapMonByName('0150~7' , '重装使者') = 0)  and
      (This_NPC.CheckMapMonByName('0150~7' , '双头金刚') = 0) 
      and (This_NPC.CheckMapMonByName('0150~7' , '双头血魔') = 0) then
    begin
        This_NPC.CreateMon('0150~7',11,16,8,'牛魔法师',8);
 
        This_NPC.CreateMon('0150~7',11,16,8,'重装使者',1);
        This_NPC.CreateMon('0150~7',11,16,8,'双头金刚',1);
         This_NPC.CreateMon('0150~7',11,16,8,'双头血魔',1);
     
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