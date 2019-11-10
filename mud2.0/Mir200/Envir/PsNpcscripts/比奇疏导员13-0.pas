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
 
 
 
procedure _goToMonMap1; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',426 + random(3) - 1,160 + random(3) - 1); 
end; 

procedure _goToMonMap2; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',251 + random(3) - 1,172 + random(3) - 1); 
end; 

procedure _goToMonMap3; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',414 + random(3) - 1,348 + random(3) - 1); 
end; 

procedure _goToMonMap4; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('0',256 + random(3) - 1,341 + random(3) - 1); 
end; 
 
procedure domain; 
begin 
    This_NPC.NpcDialog(This_Player, 
    '看起来这儿的道路有些拥挤，要我帮忙拉你一把吗？\ \'  
    +'|{cmd}<我要去东北城门/@goToMonMap1>\' 
    +'|{cmd}<我要去西北城门/@goToMonMap2>\'
    +'|{cmd}<我要去东南城门/@goToMonMap3>\'
    +'|{cmd}<我要去西南城门/@goToMonMap4>\'
    ); 
end; 
 
procedure OnInitialize; 
begin 
end; 
 
begin 
 domain; 
end. 