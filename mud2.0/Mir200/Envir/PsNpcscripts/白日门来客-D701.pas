{********************************************************************

*******************************************************************}


PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _goToMonMap;  
begin  
    if This_Player.MapName = 'D701' then  
    This_Player.Flyto('T1341',31 + random(3) - 1,10 + random(3) - 1);  
end;  

Procedure _talk;
begin
   This_Npc.NpcDialog(This_Player,
   '你真是个大好人，太感谢你了！\'+
   '通过前面的通道就可以到达白日门了，\'+ 
   '你可要小心，这是条不归路。\ \'+
   '|{cmd}<前往不归路/@goToMonMap>\'+ 
   '|{cmd}<知道了，再见/@doexit>');
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '听说这里高手云集，\不知道有没有人愿意去白日门帮助我们。\ \'+
   '|{cmd}<我想去白日门/@talk>\'+
   '|{cmd}<退出/@doexit>');
end.