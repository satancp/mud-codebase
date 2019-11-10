{******************************************************************** 

*******************************************************************} 
program mir2;  
  
{$I common.pas} 
{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas} 
  
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
    if This_Player.MapName = 'D2078' then  
    This_Player.RandomFlyTo('D2079');  
end;  

function getXYstr(Num:integer) : string; 
var temp_xy,temp_xy1,temp_xy2 : integer; 
begin 
    temp_xy1 := This_Player.GetActivePoint; 
    temp_xy2 := This_Player.GetTmpActivePoint;
    temp_xy :=temp_xy1+temp_xy2;
    case Num of
    0: result := inttostr(temp_xy);
    1: result := inttostr(temp_xy1);
    2: result := inttostr(temp_xy2);
    end;   
end;  
   
procedure domain;  
begin
    if AutoOpen(2) then
    begin
    This_NPC.NpcDialog(This_Player,  
    '目前玛法大陆魔物骚乱，魔王派出了手下的精英怪物占据了<牛魔寺庙/c=red>\'+
    '<大厅/c=red>，此地图现在异常凶险，如果没有足够的传奇信用分我是不会放\'+
    '你进去送死的。\'+
    '你当前的传奇信用分为<' + getXYstr(0) + '/c=red>分，其中临时信用分为<' + getXYstr(2) + '/c=red>分，\'+
    '进入此地图需要达到<30/c=red>分。\ \'+    
    '|{cmd}<进入牛魔寺庙大厅/@goToMonMap>\'  
    +ActiveValidateStr  
    );
    end else
    This_NPC.NpcDialog(This_Player,  
    '目前玛法大陆魔物骚乱，魔王派出了手下的精英怪物占据了<牛魔寺庙/c=red>\'+
    '<大厅/c=red>，此地图现在异常凶险，如果没有足够的传奇信用分我是不会放\'+
    '你进去送死的。\'+
    '你当前的传奇信用分为<' + getXYstr(0) + '/c=red>分，其中临时信用分为<' + getXYstr(2) + '/c=red>分，\'+
    '进入此地图需要达到<30/c=red>分。<（当前可直接进入，'+inttostr(AutoOpenDay(2))+'天后开启验证）/c=red>\ \'+    
    '|{cmd}<进入牛魔寺庙大厅/@goToMonMap>\'  
    +ActiveValidateStr  
    );  
end;  
 
  
begin  
 domain;  
end.  