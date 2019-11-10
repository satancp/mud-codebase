{******************************************************************** 

*******************************************************************} 
program mir2; 
 
{$I common.pas} 
{$I ActiveValidateCom.pas} 
{$I GoToMonMap.pas}
 
procedure _DoExit; 
begin 
  This_Npc.CloseDialog(This_Player); 
end; 
 
procedure _Exit; 
begin 
  This_Npc.CloseDialog(This_Player); 
end; 
 
 
 
procedure _goToMonMap; 
begin 
    if This_Player.MapName = '1' then 
    This_Player.Flyto('T115',106,51); 
end; 
 
procedure domain; 
begin 
    if AutoClothersMapOpen then
    begin 
    This_NPC.NpcDialog(This_Player, 
    '这里通往堕落坟场，需要我帮帮你吗？\ \'  
    +'|{cmd}<送我去堕落坟场/@goToMonMap>\' 
    ); 
    end;
end; 
 
procedure OnInitialize; 
begin 
end; 
 
begin 
 domain; 
end. 