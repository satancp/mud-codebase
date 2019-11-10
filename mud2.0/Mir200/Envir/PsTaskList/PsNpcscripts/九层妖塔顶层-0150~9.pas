PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇,九层妖塔一共九层，每层清空当前怪物才能进入下一层，请具备一定实力再考虑进入，装备爆率高，曝终极！\'
    +'|{cmd}<返回盟重/@dc>\');
end;

procedure _dc; 
begin
if This_Npc.CheckCurrMapMon = 0 then
    begin  
    This_Player.Flyto('3',333,333);
	
  
  
    end else
 begin 
	   This_Npc.NpcDialog(This_Player,
        '您好像没有消灭所有的怪物!');
		end;
end;

Begin
  domain;
end.