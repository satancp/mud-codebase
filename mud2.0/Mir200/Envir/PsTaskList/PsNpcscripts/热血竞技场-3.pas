                                                                                                                                       {********************************************************************


*******************************************************************}

program mir2;

procedure _jingji;
begin

 
   begin
       This_Player.RandomFlyto('FT001');
   end;  
    begin
     This_NPC.NpcNotice('玩家：'+This_Player.Name+'在竞技场大声喊道:拳打南山敬老院，脚踢北海幼儿园，不服来干！！');
     end;     
    

end;
begin

 This_Npc.NpcDialog(This_Player,
   '年轻人，你想要练习决斗技巧吗？\' +
   
  
   '|{cmd}<前往竞技场/@jingji>'      
    );  
end.