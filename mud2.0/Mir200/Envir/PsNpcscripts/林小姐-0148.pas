{********************************************************************

*******************************************************************}
procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure Q315;
begin
   This_NPC.NpcDialog(This_Player,
   '快帮我找刘老头。\ \'
   +'|{cmd}<关闭/@exit>'
   +''
   );


end;

procedure Q314;
begin
   This_NPC.NpcDialog(This_Player,
   '我听最好的朋友蜀汉氏说，\ '
   +'你为蜀汉氏做了很多事情？\'
   +'作为好朋友，我谢谢你。 \'
   +'我要给你蜀汉氏拜托我的东西。\ \'
   +'|{cmd}<下一个/@Q314_1> \'
   +'|{cmd}<关闭/@exit>'
   );

end;

procedure domain;
begin
    case random(2) of
        0 :
        begin
            //if This_Player.GetV(9,8) = 1 then 
            IF (This_Player.GetV(11,1) = 13) then 
            Q315
            else 
            //IF This_Player.GetV(9,9) = 1 then
            IF (This_Player.GetV(11,1) = 12) then 
            Q314
            else
            This_NPC.NpcDialog(This_Player,
           '哦，我也要快一点赚钱，开这样的客栈。\'
           +'这样就得努力做事。\ \'
           +'|{cmd}<退出/@exit>'
           );
        end;
        1 : 
        This_NPC.NpcDialog(This_Player,
       '哦，我也要快一点赚钱，开这样的客栈。\'
       +'这样就得努力做事。\ \'
       +'|{cmd}<退出/@exit>'
       );
    end;
end;



procedure _normal;
begin
   This_NPC.NpcDialog(This_Player,
   '哦，我也要快一点赚钱，开这样的客栈。\'
   +'这样就得努力做事。\ \'
   +'|{cmd}<退出/@exit>'
   );

end;





procedure _Q314_1;
begin

   This_NPC.NpcDialog(This_Player,
   '那么对' + This_Player.Name + '的性格进行测验， \'
   +'给与其符合的物品，我想这一点蜀汉氏也会赞成。\'
   +'如果我不给你蜀汉氏给我的物品，\'
   +'那么' + This_Player.Name + '想怎么办？ \ \'
   +'|{cmd}<没有/@Q314_1_1>任何感觉\'
   +'|给也<没有/@Q314_1_2>关系\'
   +'|心情会<很不开心/@Q314_1_3>\'
   +''
   +''
   );

end;

procedure _Q314_1_1;
begin
    //IF This_Player.GetV(9,8) <= 0 then
    IF This_Player.GetV(11,1) = 12 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
            //This_Player.SetV(9,8,1);
            This_Player.SetV(11,1,13);
            This_Player.Give('祝福油',1);
        
           This_NPC.NpcDialog(This_Player,
           '' + This_Player.Name + '也真是的，\ '
           +'一点都不贪心。 \ '
           +'真不简单啊，蜀汉氏让我给你符合你这种性格的物品，\'
           +'给你，这是祝福油。\'
           +'好好用它，还有请你去找刘老头。\ \'
           +'|{cmd}<关闭/@exit>'
           );
        end else
        This_NPC.NpcDialog(This_Player,
       '你的包裹太满了！\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    Q315;
end;

procedure _Q314_1_2;
begin
   This_NPC.NpcDialog(This_Player,
   '' + This_Player.Name + '的献身精神真令人佩服。\ '
   +'别的不说，能把那个物品免费给别人，\'
   +'真是世上罕见的人，\'
   +'给你下一道题。\ \'
   +'|{cmd}<下一个/@Q314_1_2_1>'
   );

end;

procedure _Q314_1_3;
begin
    IF This_Player.GetV(11,1) = 12 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
            //This_Player.SetV(9,8,1);
            This_Player.SetV(11,1,13);
            This_Player.Give('幽灵手套',1);
            This_NPC.NpcDialog(This_Player,
            '' + This_Player.Name + '对物品的占有欲未免也太强了，\  '
            +'蜀汉氏叫我把这个给你。\'
            +'这是幽灵手套，好好用它。\ '
            +'还有请你去找刘老头。\ \'
            +'|{cmd}<关闭/@exit>'
            );
        end else
        This_NPC.NpcDialog(This_Player,
       '你的包裹太满了！\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    Q315;
end;

procedure _Q314_1_2_1;
begin
   This_NPC.NpcDialog(This_Player,
   '可能有点冒昧，您知道叫做盛大的地方吗？\'
   +'想知道你对盛大的想法。\ \'
   +'对盛大<没有/@Q314_1_2_1_1>任何感觉 \'
   +'|{cmd}<想/@Q314_1_2_1_2>爆炸盛大 \'
   +'|很<喜欢/@Q314_1_2_1_3>盛大'
   );

end;

procedure _Q314_1_2_1_1;
begin
    //IF This_Player.GetV(9,8) <= 0 then
    IF This_Player.GetV(11,1) = 12 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
            //This_Player.SetV(9,8,1);
            This_Player.SetV(11,1,13);
            This_Player.Give('幽灵手套',1);
        
           This_NPC.NpcDialog(This_Player,
           '没什么感觉？\'
           +'对这个世界多一点关心，怎么样呢？ \'
           +'去找一下刘老头。\ \'
           +'|{cmd}<关闭/@exit>'
           );
        end else
        This_NPC.NpcDialog(This_Player,
       '你的包裹太满了！\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    Q315;
end;


procedure _Q314_1_2_1_2;
begin
   This_NPC.NpcDialog(This_Player,
   '看来你对盛大有很大的不满，\'
   +'能把自己的想法直率地讲出来，' + This_Player.Name + '真潇洒，\'
   +'给你下一道题。\ \'
   +'|{cmd}<下一个/@Q314_1_2_1_2_1>'
   );

end;

procedure _Q314_1_2_1_3;
begin
    IF This_Player.GetV(11,1) = 12 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
            //This_Player.SetV(9,8,1);
            This_Player.SetV(11,1,13);
            This_Player.Give('祝福油',1);
        
           This_NPC.NpcDialog(This_Player,
           '很喜欢盛大?\'
           +'给你蜀汉氏为你准备的祝福油。\'
           +'还有去找一下刘老头。\ \'
           +'|{cmd}<关闭/@exit>'
   );
        end else
        This_NPC.NpcDialog(This_Player,
       '你的包裹太满了！\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    Q315;
end;

procedure _Q314_1_2_1_2_1;
begin
   This_NPC.NpcDialog(This_Player,
   '这是最后一个问题，请听好。\'
   +'你觉得进行这个指示的蜀汉氏是什么样的人？\'
   +'好好想想，再给我回答吧。\ \'
   +''
   +'|{cmd}<长得/@Q314_1_2_1_2_1_1>有趣\'
   +'|{cmd}<长得/@Q314_1_2_1_2_1_2>让人讨厌'
   );

end;


procedure _Q314_1_2_1_2_1_1;
begin
    IF This_Player.GetV(11,1) = 12 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
            //This_Player.SetV(9,8,1);
            This_Player.SetV(11,1,13);
            This_Player.Give('祝福油',1);
           This_NPC.NpcDialog(This_Player,
           '长得有趣的人？\'
           +'蜀汉氏听了会很不高兴的，\'
           +'不过还是辛苦了，给你蜀汉氏为你准备的礼物。\'
           +'辛苦了，还有去找一下刘老头。\ \'
           +'|{cmd}<关闭/@exit>'
           );
        end else
        This_NPC.NpcDialog(This_Player,
       '你的包裹太满了！\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end   
  else 
    Q315;

end;

procedure _Q314_1_2_1_2_1_2;
begin
    IF This_Player.GetV(11,1) = 12 then
    begin
        if This_Player.FreeBagNum > 1 then
        begin
            
            if random(5) = 0 then
            begin
            //This_Player.SetV(9,8,1);
                This_Player.SetV(11,1,13);
                This_Player.Give('祝福油',1); 
                This_Player.Give('幽灵手套',1);
            
               This_NPC.NpcDialog(This_Player,
               '真的吗？我也是这样认为。\'
               +'' + This_Player.Name + '和我想得一样。\'
               +'蜀汉氏准备的物品中，给你两个，\'
               +'可不要和蜀汉氏讲啊，还有去找一下刘老头。\ \'
               +'|{cmd}<关闭/@exit>'
               );
        
            end
            else
            begin
               // This_Player.SetV(9,8,1);
               // This_Player.Give('强效太阳水',1);
            
               This_NPC.NpcDialog(This_Player,
               '真的吗？我也是这样觉得，嘻嘻嘻.. \'
               +'' + This_Player.Name + '和我想得一样啊，\'
               +'蜀汉氏准备的物品中，给你一个，\'
               +'不要和蜀汉氏讲啊，还有去找一下刘老头。\ \'
               +'|{cmd}<关闭/@exit>'
               );
        
            end;
        end else
        This_NPC.NpcDialog(This_Player,
       '你的包裹太满了！\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end;
end;





begin
    domain;
end.