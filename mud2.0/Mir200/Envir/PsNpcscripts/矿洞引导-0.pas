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

procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
    '玛法大陆上的矿产已被过度开采，大部分矿区已经无人问津。\'
    +'我知道有几处尚未开采的神秘矿洞，为了保护矿产资源，我每\'
    +'天只在特定的时间才能送你们前往。\'
    +'|<神秘矿洞开放时间：9:00~9:30，15:00~15:30，20:00~20:30/c=red>\'
    +'|注：矿洞内死亡有概率爆出矿石，每次进入需要5万金币。\ \' 
    +'|{cmd}<前往神秘矿洞/@gotomine>\'
    +'|{cmd}<关于神秘矿洞/@aboutmine>\'
    );

end;

procedure _aboutmine;
begin
    This_NPC.NpcDialog(This_Player,
    '1.神秘矿洞每天9:00~9:30,15:00~15:30,20:00~20:30期间开放。\'
    +'2.神秘矿洞关闭时，所有矿洞内的玩家将会被随机传送至盟重。\'
    +'3.神秘矿洞内有概率挖出铜矿、铁矿、银矿、金矿、黑铁矿石。\'
    +'4.在神秘矿洞内死亡有概率爆出包裹中的矿石。\'
    +'5.每次进入神秘矿洞需要5万金币。\ \' 
    +'|{cmd}<返回/@main>\'
    );

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

procedure _gotomine;
begin
   if AutoOpen(2) then
   begin
   This_NPC.NpcDialog(This_Player,
   '我可以送你前往神秘矿洞，不过必须首先给我5万金币。\'+
   '目前玛法大陆魔物骚乱，魔王派出了手下的精英怪物占据了<神秘矿洞/c=red>\'+
   '此地图现在异常凶险，如果没有足够的传奇信用分我是不会放你进去\'+
   '送死的。\'+
   '你当前的传奇信用分为<' + getXYstr(0) + '/c=red>分，其中临时信用分为<' + getXYstr(2) + '/c=red>分，\'+
   '进入此地图需要达到<30/c=red>分。\ \'+    
   '|{cmd}<前往神秘矿洞/@gotomine_1>\'
   +ActiveValidateStr
   );
   end else
   This_NPC.NpcDialog(This_Player,
   '我可以送你前往神秘矿洞，不过必须首先给我5万金币。\'+
   '目前玛法大陆魔物骚乱，魔王派出了手下的精英怪物占据了<神秘矿洞/c=red>\'+
   '此地图现在异常凶险，如果没有足够的传奇信用分我是不会放你进去\'+
   '送死的。\'+
   '你当前的传奇信用分为<' + getXYstr(0) + '/c=red>分，其中临时信用分为<' + getXYstr(2) + '/c=red>分，\'+
   '进入此地图需要达到<30/c=red>分。<（当前可直接进入，'+inttostr(AutoOpenDay(2))+'天后开启验证）/c=red>\ \'+    
   +'|{cmd}<前往神秘矿洞/@gotomine_1>\'
   +ActiveValidateStr
   );
end;

procedure gotomineGetBack;
begin
  if (This_Player.MapName = 'D411~01') or (This_Player.MapName = 'D415~01') or (This_Player.MapName = 'D416~01') then
  begin
  This_Player.RandomFlyTo('0');
  end else
  exit;
end;

procedure _gotomine_1;
var
mine_temp:integer; 
mine_str:string;
begin
  if This_Player.MapName = '0' then
  begin
     if ((GetHour = 9) or (GetHour = 15) or (GetHour = 20)) and (GetMin < 30) then
     begin
       if This_Player.GoldNum >= 50000 then
       begin 
         if This_Player.GetActivePoint + This_Player.GetTmpActivePoint >= 30 then
         This_Player.DecGold(50000);
         case GetHour of
         9:mine_str:='D416~01';
         15:mine_str:='D415~01';
         20:mine_str:='D411~01';
         end; 
         mine_temp:= (30 - GetMin)*60;
         This_Player.RandomFlyTo(mine_str);
         This_Player.CallOut(This_Npc, mine_temp,'gotomineGetBack');
       end else
       This_Npc.NpcDialog(This_Player,
       '进入神秘矿洞需要50000金币！'
       );  
     end else
     This_NPC.NpcDialog(This_Player,
     '神秘矿洞每天9:00~9:30，15:00~15:30，20:00~20:30期间开放！'
     ); 
  end else
  exit;   
end;

begin
 domain;
end.