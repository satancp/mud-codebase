{********************************************************************

*******************************************************************}
procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '嗯，消息挺灵的嘛，这么快就找到我这。\'
   +'你想去挑战强大的怪物吗？不过你只有60分钟时间，\'
   +'60分钟后你还会回来。而且这是要花费声望的，\'
   +'毕竟抓来他们也不容易，而且我也不能保证你们的安全。\'
   +'那么还想试试吗？每进去一次收你一点声望值。\ \'
   +'|{cmd}<打听圣域的消息/@sabout>\'
   +'|{cmd}<去/@jump>\'
   +'|{cmd}<不去/@exit>'
   
   
   );

end;

procedure _sabout;
begin
   This_NPC.NpcDialog(This_Player,
   '荣誉勋章乃圣域至宝，\'
   +'不过你会首先到达一个叫“圣域之门”的地方。\'
   +'可别在这个空旷的房间里滞留太长时间哦，\'
   +'迈出你的第一步，传说中的圣域异兽就会出现。\'
   +'你可要小心应付啊！\\'
   +'|{cmd}<关闭/@exit>'
   );

end;

procedure _noway;
begin
   This_NPC.NpcDialog(This_Player,
   '很遗憾，你的声望不够，无法进入。\'
   +'在比奇武馆教头那里可以查询自己的声望。\\'
   +'|{cmd}<离开/@exit>'
   );

end;

procedure call_back;
begin
    if (This_Player.MapName = 'B101') or (This_Player.MapName = 'B102') then
    This_Player.Flyto('0',108,417);
end;

procedure _jump;
begin
    if This_Player.MyShengwan >= 1 then
    begin
         This_Player.MyShengwan := This_Player.MyShengwan-1;
         case random(2) of
             0 : This_Player.RandomFlyTo('B101');
             1 : This_Player.RandomFlyTo('B102');
         end;
         This_Player.CallOut(This_NPC,3600,'call_back');
    end else
    This_NPC.NpcDialog(This_Player,
   '很遗憾，你的声望不够，无法进入。\'
   +'在比奇武馆教头那里可以查询自己的声望。\\'
   +'|{cmd}<离开/@exit>'
   ); 
end;

begin
   domain;
end.   