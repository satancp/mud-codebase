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


Procedure _join;
begin
   This_Npc.NpcDialog(This_Player,
   '既然你已经有了挑战的觉悟，那么我就告诉你吧，前往比奇\'+
   '寻找一座木桥，站在桥的中央就会到达试练之地，去战胜魔\'+
   '物吧，挑战你自身的时候到了！\ \'+
   '|{cmd}<离开/@doexit>');
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '不停的战斗是那些没有心智的怪物才会做的事情，学会生存、\'+
   '尊重生命才是人类，身为勇者不单要追求强大的力量，更要\'+
   '有坚强的意志与忍耐力，来接受挑战，为成为最强的勇者努力！\ \'+
   '|{cmd}<好!我愿意挑战！/@join>\'+
   '|{cmd}<算了,我还是离开吧/@doexit>');
end.