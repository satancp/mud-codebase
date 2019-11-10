                                                                                                                                       {********************************************************************


*******************************************************************}

program mir2;

procedure _leiyan1;

 var
 GoldNum:integer;
begin
   if This_Player.GoldNum >= 500000 then 
   begin
       This_Player.Flyto('HL001',371,42);
   end;  
       
    begin
     
     This_Player.DecGold(500000);
    end ;
      if This_Player.GoldNum >= 500000 then
    begin
     This_NPC.NpcNotice('玩家：'+This_Player.Name+'使用50万金币前往散人之家！');
    
    end else          
     begin
       This_Player.NotifyClientCommitItem(0,'无法传送：你的金币不足，需要50万金币。'); 
     end;
   

end;
begin

 This_Npc.NpcDialog(This_Player,
   '年轻人，你想要终极装备吗？\' +
   '本服专为散人玩家打造散人之家打宝地图\' +
   '里面隐藏着大量未知生物，你想前往挑战吗？\' +
   '当然需要支付一点小小的费用！\' +
  
   '|{cmd}<使用50万金币前往散人之家/@leiyan1>'      
    );  
end.