                                                                                                                                       {********************************************************************


*******************************************************************}

program mir2;

procedure _leiyan1;

 var
 GoldNum:integer;
begin
   if This_Player.GoldNum >= 500000 then 
   begin
       This_Player.RandomFlyto('R001~101');
   end;  
       
    begin
     
     This_Player.DecGold(500000);
    end ;
      if This_Player.GoldNum >= 500000 then
    begin
     ServerSay('玩家<' + This_Player.Name + '>使用50万金币,前往散人之家！', 2);
    
    end else          
     begin
       This_Player.NotifyClientCommitItem(0,'无法传送：你的金币不足，需要50万金币。'); 
     end;
   

end;
begin

 This_Npc.NpcDialog(This_Player,
'<★★★★★★散人之家★★★★★★/c=red>\'+
   '|爆率：祖玛级装备，赤月首饰，屠龙级武器\'+
   '|进入条件：需要50W金币\' +
   '|BOSS：千年树妖，黄泉教主，暗之触龙神，虹魔教主，祖玛教主\'+
  
   '|{cmd}<使用50万金币前往散人之家/@leiyan1>'      
    );  
end.