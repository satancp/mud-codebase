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
    IF random(2) = 0 then
    begin
        //IF This_Player.GetV(9,10) = 1 then 
        IF This_Player.GetV(11,1) = 7 then
        begin
           This_NPC.NpcDialog(This_Player,
           '你快点去找金氏! \ \'
           +'|{cmd}<退出/@exit>'
           );
        
        end else
        //IF This_Player.GetV(9,11) = 1 then
        IF This_Player.GetV(11,1) = 6 then
        begin
            IF This_Player.GetBagItemCount('头盔') > 0 then
            begin
                //This_Player.SetV(9,10,1); 
                This_Player.SetV(11,1,7);  
                This_Player.Take('头盔',1);
               This_NPC.NpcDialog(This_Player,
               '你真棒啊,那么厉害的怪物也被你打死了!!! \'
               +'你给带了头盔,,我可就欠你一个人情了. \'
               +'你真的厉害! \'
               +'既然你帮我做了一件事情,那我也帮你作一件事情... \ '
               +'你去找一下金氏..我已经跟她约好了\ \'
               +'|{cmd}<退出/@exit>'
               );
            
            end
            else
            begin
            IF random(5) = 0 then
               This_NPC.NpcDialog(This_Player,
               '你也打不过那个怪物?唉.. \'
               +'那个怪物的确很厉害吧.... \'
               +'你要不要再试一次啊?? \ \'
               +'|{cmd}<挑战./@Q308_2_1>\'
               +'等会儿<挑战./@exit>'
               )
               else
               This_NPC.NpcDialog(This_Player,
               '现在我很忙,无法帮助你了 \'
               +'等会儿再来.. \ \'
               +'|{cmd}<退出/@exit>'
               );
            
            end;
        end else
        //IF This_Player.GetV(9,12) = 1 then
        IF This_Player.GetV(11,1) = 5 then
        begin
           This_NPC.NpcDialog(This_Player,
           '竟然有人认识我.... \'
           +'嗨,你好啊...怪事.\ \'
           +'对助理<询问/@Q307_1> \'
           
           );
        
        end
        else
        begin
           This_NPC.NpcDialog(This_Player,
           '半兽勇士住在沃玛森林里面... \'
           +'这个怪物可不简单哦... \ \'
           +'|{cmd}<退出/@exit>'
           );
        
        end;
    end
    else
    begin
       This_NPC.NpcDialog(This_Player,
       '半兽勇士住在沃玛森林里面... \'
       +'这个怪物可不简单哦... \ \'
       +'|{cmd}<退出/@exit>'
       );
    
    end;
end;







procedure _Q307_1;
begin
   This_NPC.NpcDialog(This_Player,
   '你认识我么?我的故事已经是很久以前的了.. \'
   +'很久以前,我在比奇城当过厨师.. \'
   +'的确是很久以前的事情了,我想念当年的朋友啦.. \ \'
   
   +'对助理 <拜托/@Q307_2>.'
   );

end;

procedure _Q307_2;
begin
    IF random(2) = 0 then
    begin
       IF random(2) = 0 then
       This_NPC.NpcDialog(This_Player,
       '你真了不起,你的意志很强,那么,那么...\'
       +'为了我,我只拜托一件事情... \'
       +'这几天我去过好几个地方,到处看了看 \ '
       +'到了一些很希奇的地方...\ \'
       +'|{cmd}<下一步/@Q307_4>  '
       )
       else
       This_NPC.NpcDialog(This_Player,
       '你想让我给你炒菜,为了这个.... \'
       +'是不是我得去比奇城堡一次呀?? \ '
       +'我对比奇城堡早已经有一种厌倦了... \'
       +'对不起,我要走了... \ \'
       +'|{cmd}<退出/@exit>'
       );
    
    end else
   This_NPC.NpcDialog(This_Player,
   '拜托我?我凭什么接受你的请求啊? \'
   +'你走吧...... \ \'
   +'|{cmd}<退出/@exit>'
   );

end;



procedure _Q307_4;
begin
   This_NPC.NpcDialog(This_Player,
   '这个地方很古怪,有一种怪物 \'
   +'虽然我比较弱,但我还可以击退它啦\'
   +'也跟它打过,可是给他揍得不成样子... \'
   +'因为这个地方非常古怪,你进去后一分钟后就会回到现实 \'
   +'这是古怪的地方啊,你也去试试么? \ \'
   +'|{cmd}<下一步/@Q307_5>'
   );

end;

procedure _Q307_5;
begin
   This_NPC.NpcDialog(This_Player,
   '你要是能打死它,可别忘了把它的头盔带给我.. \'
   +'那样我就可以帮你... \'
   +'我可以把你带到那个地方,祝你好运啦.. \ \'
   +'|{cmd}<进去./@Q307_6>'
   );

end;

procedure call_back;
begin
    if (This_Player.MapName = 'Q001') or (This_Player.MapName = 'Q002') or (This_Player.MapName = 'Q003') then
    This_Player.FlyTo('1',236,306);
end;

procedure _Q307_6;
begin
   if This_Player.GetV(11,1) = 5 then
   begin
       IF CheckOtherMapHum('Q001') > 0 then
       This_NPC.NpcDialog(This_Player,
       '现在里面还有一个人,你要稍候一下啦! \ \'
       +'|{cmd}<退出/@exit>'
       ) 
        else
        begin
            IF This_Player.Job = 0 then
            begin
                This_NPC.ClearMon('Q001');
                This_NPC.CreateMon('Q001',10,10,10,'骷髅精灵2',1);
                This_Player.RandomFlyTo('Q001');
                This_Player.CallOut(This_Npc, 60, 'call_back');
                //This_Player.SetV(9,11,1); 
                This_Player.SetV(11,1,6);
            end else
            IF This_Player.Job = 1 then
            begin
                This_NPC.ClearMon('Q002');
                This_NPC.CreateMon('Q002',10,10,10,'半兽勇士2',1);
                This_Player.RandomFlyTo('Q002');
                This_Player.CallOut(This_Npc, 60, 'call_back');
                //This_Player.SetV(9,11,1); 
                This_Player.SetV(11,1,6); 
            end else
            IF This_Player.Job = 2 then
            begin
                This_NPC.ClearMon('Q003');
                This_NPC.CreateMon('Q003',10,10,10,'巨型多角虫2',1);
                This_Player.RandomFlyTo('Q003');
                This_Player.CallOut(This_Npc, 60, 'call_back');
                //This_Player.SetV(9,11,1); 
                This_Player.SetV(11,1,6);
            end;
        end;
   end;
end;


procedure _Q308_2_1;
begin
    IF CheckOtherMapHum('Q001') > 0 then
   This_NPC.NpcDialog(This_Player,
   '现在有人正在被怪物折磨,呵呵,恐怕你要等一下了! \ \'
   +'|{cmd}<退出/@exit>'
   )
    else
    begin
        IF This_Player.Job = 0 then
        begin
            This_NPC.ClearMon('Q001');
            This_NPC.CreateMon('Q001',10,10,10,'骷髅精灵2',1);
            This_Player.RandomFlyTo('Q001');
            This_Player.CallOut(This_Npc, 60, 'call_back');
        end else
        IF This_Player.Job = 1 then
        begin
            This_NPC.ClearMon('Q002');
            This_NPC.CreateMon('Q002',10,10,10,'半兽勇士2',1);
            This_Player.RandomFlyTo('Q002');
            This_Player.CallOut(This_Npc, 60, 'call_back');
        end else
        IF This_Player.Job = 2 then
        begin
            This_NPC.ClearMon('Q003');
            This_NPC.CreateMon('Q003',10,10,10,'巨型多角虫2',1);
            This_Player.RandomFlyTo('Q003');
            This_Player.CallOut(This_Npc, 60, 'call_back');
        end;
    end;
end;





begin
    domain;
end.