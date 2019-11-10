                                                                                                     {
*******************************************************************}

Program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;                         
begin
  This_Npc.CloseDialog(This_Player);
end;
                                                                                                                             
                     


procedure _golone;
                     
begin
  
         This_Player.Flyto('H301',22,36);
      
    
     
  
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '前方传来了怪物的咆哮声，各位大侠一定要小心。\ \'+
  
   '|{cmd}<前往未知洞穴/@golone>');
end.