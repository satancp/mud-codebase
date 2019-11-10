{******************************************************************** 

*******************************************************************} 
program mir2; 
 
{$I common.pas} 
 
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
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',290 + random(3) - 1,618 + random(3) - 1); 
end; 
 
procedure domain; 
begin 
    This_NPC.NpcDialog(This_Player, 
    '看起来这儿的道路有些拥挤，要我帮忙拉你一把吗？\ \'  
    +'|{cmd}<我要进城/@goToMonMap>\' 
    ); 
end; 
 
procedure OnInitialize; 
begin 
end; 
 
begin 
 domain; 
end. 