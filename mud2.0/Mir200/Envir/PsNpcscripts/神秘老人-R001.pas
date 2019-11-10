{********************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;



procedure _back;
Begin
   if compareText(This_Player.MapName, 'R001') = 0 then
   begin
      This_Player.RandomFlyTo('3');
   end;
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '前面是一个危险的未知世界，以你现在的实力还不能去那里，\'+
   '等以后再来吧！我可以把你送回你原来的世界。\ \'+
   '|{cmd}<回到盟重/@back>\'+
   '|{cmd}<继续留在这里/@doexit>');
end.