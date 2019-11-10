{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '你竟然能来到这里, 真厉害\'
   +'我看你应该能理解我的意思.. 听好.. \'
   +'不好好听会迷路的, 里面的阵是由古代人伏义创造的八卦阵构成。。。 \'
   +'你想了解这个阵吗？但是不能白告诉你..  \ \'
   +'|{cmd}<给/@QUEST_1_1>3000金币 \'
   +'|{cmd}<不给/@QUEST_1_2>金币\'
   );

end;

procedure _QUEST_1_2;
begin
   This_NPC.NpcDialog(This_Player,
   '你不给钱，我也没办法..  \ '
   +'你回去吧.. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _QUEST_1_1;
begin
    if This_Player.GoldNum >= 3000 then
    begin
        This_Player.DecGold(3000);
   This_NPC.NpcDialog(This_Player,
   '听好了，里面大体上可以分为3个阵，\'
   +'这三阵的区分我也不清楚, 但是据说是根据震-巽-坎-坤-离-兌-乾-艮-震原理\'
   +'想知道下一个情报吗? \'
   +'如果想知道，\'
   +'那么请交金币5000.. \ \'
   +'|{cmd}<交/@QUEST_1_1_1> \'
   +'|{cmd}<不交/@QUEST_1_2>'
   );
    end else
   This_NPC.NpcDialog(This_Player,
   '你没钱，我也没办法 \'
   +'好了，再见.. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _QUEST_1_1_1;
begin
    if This_Player.GoldNum >= 5000 then
    begin
        This_Player.DecGold(5000);
   This_NPC.NpcDialog(This_Player,
   '想知道下一个阵，对吗? 都已经给钱了，就告诉你吧. \'
   +'以太极八卦阵为基础，按顺时针方向\'
   +'离->坤->兌->乾->坎->艮->震->巽->离，这个顺序. \'
   +'想知道最后一个阵吗?? \'
   +'你现在也知道我的性格了吧?再给我10000金币就告诉你. \ \'
   +'|{cmd}<交/@QUEST_1_1_1_1> \'
   +'|{cmd}<不交/@QUEST_1_2>'
   );
    end else
   This_NPC.NpcDialog(This_Player,
   '你没钱，我也没办法 \'
   +'好了，再见.. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _QUEST_1_1_1_1;
begin
    if This_Player.GoldNum >= 10000 then
    begin
        This_Player.DecGold(10000);
   This_NPC.NpcDialog(This_Player,
   '告诉你最后一个阵法..\ '
   +'按照伏义的原理，\'
   +'乾->兌->离->震->巽->坎->艮->坤->乾.. \'
   +'现在告诉你的情报很重要.. 一定要好好记住 \ '
   +'下面告诉你这个阵法的方向，当然这要交钱的\'
   +'想学，就交5000金币. \ \'
   +'|{cmd}<听/@QUEST_1_1_1_1_1>阵的方向 \'
   +'|{cmd}<不听/@QUEST_1_2>'
   );
    end else
   This_NPC.NpcDialog(This_Player,
   '你没钱，我也没办法 \'
   +'好了，再见.. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;


procedure _QUEST_1_1_1_1_1;
begin
    if This_Player.GoldNum >= 5000 then
    begin
        This_Player.DecGold(5000);
   This_NPC.NpcDialog(This_Player,
   '想知道阵的方向，对吗？好，告诉你\'
   +'记好了.. \ '
   +'离方向是12时, 坤方向是1时, \'
   +'震方向是9时, 巽方向是11时.. \'
   +'其他的我也记不请了.. \ '
   +'你去看看吧.. \ '
   +'记好我说的话，不要有差错小心点.. \ \'
   +'|{cmd}<继续/@QUEST2>'
   );
    end else
   This_NPC.NpcDialog(This_Player,
   '你没钱，我也没办法 \'
   +'好了，再见.. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _QUEST2;
begin

   This_NPC.NpcDialog(This_Player,
   '好，你先进入那个阵看看\'
   +'在那里可不能使用随机传送卷\'
   +'祝你好运... 再见 \ \'
   +'|{cmd}<取消/@exit>'
   +''
   );

This_Player.Flyto('Q014',54,54);

end;   

begin
  domain;
end. 