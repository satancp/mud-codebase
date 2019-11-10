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

procedure _GoBJC;
begin
    This_Player.Flyto('SLDG',308 + random(6) - 3,423 + random(6) - 3);
end;

procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
    '边界村这儿不怎么热闹，但是啊…您附耳过来，我悄悄告诉您。\'
    +'边界村南面的荒地有片自由集市，所有人都能在那摆摊，\'
    +'什么稀奇古怪的东西都有！货走的快，钱来的也快，\'
    +'谁不爱黄澄澄的金子呐？您要是有兴趣，我可以送您一程。\ \'
   +'|{cmd}<我想去看看/@GoBJC>              ^<下次再说吧/@exit>'
   );

end;


//脚本执行的入口
begin
  domain;
end.