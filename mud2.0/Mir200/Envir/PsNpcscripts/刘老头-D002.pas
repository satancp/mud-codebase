{********************************************************************

*******************************************************************}
procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure _normal;
begin
   This_NPC.NpcDialog(This_Player,
   '兽人古墓有叫做骷髅战将的妖怪。\'
   +'这个妖怪很厉害。\ '
   +'你只要见到这个妖怪就逃命吧\ \'
   +'|{cmd}<关闭/@exit>              '
   );

end;

procedure _normal_Drug;
begin
   This_NPC.NpcDialog(This_Player,
   '兽人古墓有叫做骷髅战将的妖怪。\'
   +'这个妖怪很厉害。\ '
   +'你只要见到这个妖怪就逃命吧\ \'
   +'|{cmd}<关闭/@exit>              ^<你是刘中医吗？/@DoDrug>'
   );

end;

procedure _DoDrug;
begin
   IF This_Player.GetS(80,12) = 10 then
   begin 
   This_NPC.NpcDialog(This_Player,
   '不，年轻人你认错了，我是一个孤独的老头，这里非常危险，\'
   +'你还是快回去吧。\ \'
   +'|{cmd}<给你看看这个（交出许中医的药1）/@DoDrug_1>\'
   +'|{cmd}<哦，不好意思我认错了/@exit>\'
   );
   end else
   IF This_Player.GetS(80,12) = 11 then
   begin 
   This_NPC.NpcDialog(This_Player,
   '这么多年我没回去，就是想让小许能摆脱我的帮助，成为能独当\'
   +'一面的优秀医生，不错，我总算没有看错人，我这些年刚好对这\'
   +'味药剂有所研究，你去给我找5个蛆卵来。\ \' 
   +'|{cmd}<蛆卵带来了，给你/@DoDrug_2>\'
   +'|{cmd}<哦，我马上就去/@exit>\'
   );
   end else
   IF This_Player.GetS(80,12) = 12 then
   begin 
   This_NPC.NpcDialog(This_Player,
   '药已经练好了，你把这个还给小许吧，我累了要休息了，另外\'
   +'别告诉小许我在这里，谢谢了'+This_Player.Name+'。\ \'
   +'|{cmd}<我会遵守约定的，再见刘中医/@DoDrug_3>\'
   );
   end else
   This_NPC.NpcDialog(This_Player,
   '不，年轻人你认错了，我是一个孤独的老头，这里非常危险，\'
   +'你还是快回去吧。\ \'
   +'|{cmd}<哦，不好意思我认错了/@exit>\'
   );
end;

procedure _DoDrug_1;
begin
   IF (This_Player.GetS(80,12) = 10) and (This_Player.GetBagItemCount('许中医的药1') >= 1) then
   begin 
   This_Player.SetS(80,12,11);
   This_Player.Take('许中医的药1',1); 
   This_NPC.NpcDialog(This_Player,
   '这么多年我没回去，就是想让小许能摆脱我的帮助，成为能独当\'
   +'一面的优秀医生，不错，我总算没有看错人，我这些年刚好对这\'
   +'味药剂有所研究，你去给我找5个蛆卵来。\ \' 
   +'|{cmd}<蛆卵带来了，给你/@DoDrug_2>\'
   +'|{cmd}<哦，我马上就去/@exit>\'
   );
   end else
   This_NPC.NpcDialog(This_Player,
   '你没有带来许中医的药1啊，是不是弄丢了？\'
   +'你还是回去再找找吧。\ \'
   +'|{cmd}<我把药弄丢了（放弃任务重新开始）/@DoDrug_1_1>'
   );
end;

procedure _DoDrug_1_1;
begin
   IF (This_Player.GetS(80,12) = 10) then
   begin 
   This_Player.SetS(80,12,0);
   This_NPC.NpcDialog(This_Player,
   '任务已经重置，请前往比奇省药店重新开始任务（沓水店老板）。\'
   );
   end;
end;

procedure _DoDrug_2;
begin
   IF (This_Player.GetS(80,12) = 11) and (This_Player.GetBagItemCount('蛆卵') >= 5) then
   begin 
   This_Player.SetS(80,12,12);
   This_Player.Take('蛆卵',5); 
   This_NPC.NpcDialog(This_Player,
   '谢谢你'+This_Player.Name+'，现在蛆卵已经足够了。\'
   +'这都是你的功劳。\'
   +'现在我要开始炼药了，请你为我祈祷吧。\' 
   +'再见\'
   );
   end else
   This_NPC.NpcDialog(This_Player,
   '蛆卵不够是无法开始炼药的。\'
   );
end;

procedure _DoDrug_3;
begin
   IF (This_Player.GetS(80,12) = 12) and (This_Player.FreeBagNum > 0) then
   begin 
   This_Player.SetS(80,12,13);
   This_Player.Give('许中医的药1',1); 
   This_Npc.CloseDialog(This_Player);
   end else
   This_NPC.NpcDialog(This_Player,
   '你的包裹太满了。\'
   );
end;

procedure _QUEST;
begin
   This_NPC.NpcDialog(This_Player,
   '问我的名字? 你叫我刘老人就可以了\'
   +'我知道一个洞穴, 你想了解这个洞穴吗？\'
   +'如果想的话，\'
   +'给我5000金币, 我就告诉你... \ \'
   +'|{cmd}<听/@Q315_1> \'
   +'|{cmd}<不听/@Q315_2>  '
   );

end;

procedure _Q315_2;
begin
   This_NPC.NpcDialog(This_Player,
   '你不想听?\'
   +'好，我也怀疑告诉你之后你能不能解决问题\'
   +'再见吧...  \ \'  
   );
end;

procedure _Q315_1;
begin
   This_NPC.NpcDialog(This_Player,
   '既然你要听， \ '
   +'那就好好听我讲吧. \'
   +'我进入这个地方之后，发现有和传奇世界一样的怪物\'
   +'这些怪物是不会死的\'
   +'我曾经一时也是传奇世界有名的人啊.. \ \'
   +'|{cmd}<继续/@Q315_1_1> \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q315_1_1;
begin
   This_NPC.NpcDialog(This_Player,
   '我被这些怪物追赶着，继续我的旅程\'
   +'但是后来我很惊讶地发现里面有一位老人\'
   +'我跟那位老人搭话，但是不知道什么原因他总是嘴里念着八卦阵的原理\'
   +'我很好奇继续问他，\'
   +'他回问我要不要去那个地方看看.. \ \'
   +'|{cmd}<继续/@Q315_1_2> \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q315_1_2;
begin
   This_NPC.NpcDialog(This_Player,
   '我也是凭着年少气盛去找过那个地方\'
   +'可是总是会迷路\'
   +'但是后来知道那个地方符合老人讲的八卦阵的原理\'
   +'只要知道这个原理，\'
   +'我想不会太难的.. \ \'
   +'|{cmd}<继续/@Q315_1_3> \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q315_1_3;
begin
   This_NPC.NpcDialog(This_Player,
   '我见到那里的妖怪，妖怪的样子很像沃玛卫士\'
   +'我和这个妖怪打过一仗，但是受伤的是我，\'
   +'而那个妖怪却一点事情都没有. \'
   +'我就开始避开这些怪物，碰见了美丽的女子\'
   +'你不觉得很神奇吗？真不明白这位女子是怎么到那个地方的.. \'
   +'我常常想那位女子是不是武林高手.. \ \'
   +'|{cmd}<继续/@Q315_1_4> \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q315_1_4;
begin
   This_NPC.NpcDialog(This_Player,
   '我和这位神秘女子搭话..\'
   +'发现她出售很神奇的东西, 因为是神奇的东西，\'
   +'其名字和所需材料我记得很清楚.. \'
   +'入口我到现在还记得\'
   +'我可以带你去，你要去吗? \ \'
   +'|{cmd}<了解/@price>出售物品种类和价钱 \'
   +'|{cmd}<去寻找/@Q315_1_4_1> \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _price;
begin
   This_NPC.NpcDialog(This_Player,
   '那位女子出售的物品有 炼狱，银蛇，魔杖. \'
   +'炼狱 : 金条 1 + 纯度18以上的金矿 5 \'
   +'银蛇 : 金条 1 + 纯度18以上的金矿  4 \'
   +'魔杖 : 金条 1 + 纯度18以上的金矿 3 \'
   +'祝福油 : 金币 50万 + 太阳水(中) 5 \'
   +'以上材料准备好之后去找那位女子\'
   +'不然见到这位女子之后也不能制作物品. \ \'
   +'|{cmd}<继续/@price1>'
   );

end;

procedure _price1;
begin
   This_NPC.NpcDialog(This_Player,
   '炼狱，银蛇，魔杖每次只制作一根\'
   +'这一点一定要记住... \ '
   +'好了，你决定去那个地方吗? \ \'
   +'|{cmd}<去/@Q315_1_4_1> \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q315_1_4_1();
begin
    if This_Player.GetV(11,1) = 13 then
    This_Player.FlyTo('Q011',13,13);
end;

procedure _Q316;
begin
   This_NPC.NpcDialog(This_Player,
   '我不是曾经把你带到那个地方吗? \'
   +'我不会重复做两次同样事情的.. \'
   +'就算你再来找我 \'
   +'我也不会在把你带到那个地方的.. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure domain;
begin
    if This_Player.GetS(80,12) = 10 then
    _normal_Drug
    else 
    if (This_Player.GetS(80,12) = 11) or (This_Player.GetS(80,12) = 12) then
    _DoDrug
    else
    if This_Player.GetV(11,1) = 13 then 
    _QUEST
    else
    _normal;
end;

begin
    domain; 
end.