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

procedure domain;
begin
   // IF (This_Player.GetV(8,17) = 1) and
    //(This_Player.GetV(8,14) <= 0)then
    if  (This_Player.GetV(11,4) = 6) then
    begin
       This_NPC.NpcDialog(This_Player,
       '哦，原来你就是卫家店所讲的那个人？\'
       +'看来他看人还有眼光啊。\'
       +'至于我，曾经可是很风光过。\'
       +'想听我的故事吗？\ \'
       +'|{cmd}<听/@okheard>\'
       +'|{cmd}<不听/@noheard>'
       );
    
    end else
   // if (This_Player.GetV(8,17) = 1) and
   // (This_Player.GetV(8,14) = 1) and
    //(This_Player.GetV(8,23) <= 0) and
    //(This_Player.GetV(8,25) <= 0) then
    if This_Player.GetV(11,4) = 7 then
    begin  
       This_NPC.NpcDialog(This_Player,
       '还没有去师傅那儿？\'
       +'快去找他替我传信。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    //IF (This_Player.GetV(8,23) = 1) then
    IF (This_Player.GetV(11,4) = 9) then
    begin
        IF (This_Player.Job = 0) and (This_Player.Level >= 35) then
        begin
        //This_Player.SetV(8,20,1);
        This_Player.SetV(11,4,10);
        //reset [203] 20
        This_Player.Give('修罗',1);
        end;
       This_NPC.NpcDialog(This_Player,
       '师傅说了什么？\'
       +'哎，师傅还是不能原谅我。\'
       +'如果是我，我也会这样做的，呜呜。。。\'
       +'不管怎么样你辛苦了，\'
       +'送你一把我曾经无聊的时候制造的凝爽，好好用它。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    //IF (This_Player.GetV(8,24) = 1) then
    IF (This_Player.GetV(11,4) = 14) then
    begin
        IF (This_Player.Job = 0) and (This_Player.Level >= 35) then
        begin
        //reset [210] 20
        //This_Player.SetV(8,16,1);
        This_Player.SetV(11,4,15);
        This_Player.Give('命运之刃',1);
           This_NPC.NpcDialog(This_Player,
           '看，是不是很厉害？好好用吧。\'
           +'是一把和你很相称的剑。\'
           +'不过我有一个请求，\'
           +'我从很早以前就开始找一个人，\'
           +'我只知道他叫刘老头，\'
           +'帮我找那个人吧。\ \'
           +'|{cmd}<关闭/@exit>'
           );
        end;
    end else
   // IF
   // (This_Player.GetV(9,7) = 1) and
   // (This_Player.GetV(8,25) = 1) and
   // (This_Player.GetV(8,21) <= 0) and
   if (This_Player.GetV(11,4) = 13) and (This_Player.GetBagItemCount('命运之书') >= 1) then
    begin
        //This_Player.SetV(8,24,1);
        This_Player.SetV(11,4,14);
        This_Player.Take('命运之书',1);
       This_NPC.NpcDialog(This_Player,
       '啊？这本书是？师傅的命运之书！\'
       +'师傅还是没有忘了我。\'
       +'呜呜呜....\'
       +'我不能就这样呆着, 我要重振师傅的绝世珍品“命运之刃”\'
       +'你还是以后再来找我吧。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    This_NPC.NpcDialog(This_Player,
       '欢迎光临，有什么事情需要我帮忙吗？\ \ '
       +'|{cmd}<修理/@repair>\'
       +'|{cmd}<特殊修理/@s_repair>\'
       +'|{cmd}<关闭/@exit>'
       
       );
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '别看我像喝醉了酒，我会好好给你磨的。\全包在我身上。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '修好了。\如果还有要修理的武器，就在这儿修理吧。\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|{cmd}<返回/@main>'
  );
end;



procedure _okheard;
begin
    IF (This_Player.Job = 0) and (This_Player.Level >= 35) then
    //reset [204]
    begin
       This_NPC.NpcDialog(This_Player,
       '还是很会看人啊。\'
       +'不知你有没有听说过命运之刃？\'
       +'那是我为了学铁匠技术到处找师傅的时候，\'
       +'当时我年轻，血气旺盛，没有落过一个村庄，\'
       +'为了学到最高的技术，我走遍了所有的地方。\ \'
       +'|{cmd}<下一个/@next>'
       );
    end else
    IF This_Player.GetV(8,16) = 1 then
    begin
       This_NPC.NpcDialog(This_Player,
       '我不是说过你还没有那个能力吗？\'
       +'以你的力量根本就不行，\'
       +'快去多练练再来吧。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    begin
       This_NPC.NpcDialog(This_Player,
       '嗯，看来你还不具备听我故事的资格。\'
       +'要想挑战我要讲的故事，凭你的能力是万万不行的。\'
       +'既然你已经找到这儿了，看在卫家店的面子上，\'
       +'我给你几张以前买的彩票。\'
       +'祝你好运。\\'
       
       +'|{cmd}<关闭/@exit>'
       );
    
    //reset [210] 10
    This_Player.SetV(8,16,1);
    This_Player.Give('彩票',5);
    end;
end;
procedure _noheard;
begin

//reset [210] 10
   This_NPC.NpcDialog(This_Player,
   '嗯，既然你不想听，那我也没办法。\'
   +'那走好。\ \'
   +'|{cmd}<关闭/@exit>'
   );

end;







procedure _next;
begin
   This_NPC.NpcDialog(This_Player,
   '我是江氏。生为男子汉，\'
   +'年轻时候立志要在自己的做事氛围成为第一。\'
   +'所以，过起了流浪生活。\'
   +'有一天到了一个小村庄，\'
   +'当时我只是想在这里填饱肚子，\'
   +'所以就先在附近找客栈。\ \'
   +'|{cmd}<下一个/@next_1>'
   
   
   
   );

end;

procedure _next_1;
begin
   This_NPC.NpcDialog(This_Player,
   '进入客栈，我叫老板，想点几个简单的菜，\'
   +'但是我发现他手里拿着的菜刀不是一般的刀，\'
   +'那把刀比我曾经见过的任何刀都要出色。\'
   +'那可是一把菜刀啊，你能相信吗？\'
   +'一把菜刀竟然比匠人制造的刀还要好。\\'
   
   +'|{cmd}<下一个/@next_2>'
   
   
   
   );
end;

 
procedure _next_2;
begin

   This_NPC.NpcDialog(This_Player,
   '我缠上客栈老板，要他一定告诉我制造那把刀的人。\'
   +'告诉我的人不是别人，\'
   +'他就是高级武士。\'
   +'他的剑术当时已经达到了神的境界。\'
   +'但是没有任何野心的先生，\'
   +'从世俗的观念醒悟过来，\'
   +'只是一个人在离村庄不很远的地方生活。\ \'
   
   +'|{cmd}<下一个/@next_3>'
   
   );
end;

 
procedure _next_3;
begin
   This_NPC.NpcDialog(This_Player,
   '我发疯似的寻找他，终于找到了他。\'
   +'我求他三天三夜，成了他的弟子。\'
   +'但是，自从感觉自己的实力有长进，\'
   +'我就开始很变得自傲。\'
   +'师傅叫我做的事情我理都不理，\'
   +'每天除了喝酒就是玩，\'
   +'到现在我还很后悔。\ \'
   
   +'|{cmd}<下一个/@next_4>'
   
   );

end;
 
procedure _next_4;
begin
   This_NPC.NpcDialog(This_Player,
   '到最后师傅也没有抛弃我。\'
   +'也就是这一点让我更不能忍受。\'
   +'对过着放荡生活的我，\'
   +'师傅没有说任何话。\'
   +'我实在是太对不起师傅，\'
   +'后来没有留任何话，我就离开了师傅。\'
   +'到如今还在这里做事。\ \'
   
   +'|{cmd}<关闭/@next_5>'
   
   );

end;

procedure _next_5;
begin
   This_NPC.NpcDialog(This_Player,
   '师傅过隐居生活之前，制造了一把剑。\'
   +'但是我在没有学到制造这把剑的技术之前，\'
   +'就过起了腐败的生活，所以我不知道此技术。\'
   +'现在没脸再去找师傅，\'
   +'不知你能不能替我找师傅？\ \'
   
   +'|{cmd}<接受/@accept>\'
   +'|{cmd}<拒绝/@refuse>'
   );

end;

procedure _accept;
begin
    if This_Player.GetV(11,4) = 6 then
    This_Player.SetV(11,4,7);
   // This_Player.SetV(8,14,1);
   This_NPC.NpcDialog(This_Player,
   '谢谢你，不过请稍等。\ \'
   +'|{cmd}<关闭/@exit>'
   );

end;

procedure _refuse;
begin
//reset [210] 10
   This_NPC.NpcDialog(This_Player,
   '不愿意？那我也没办法，那走好。\ \'
   +'|{cmd}<关闭/@exit>'
   );
end;



//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.