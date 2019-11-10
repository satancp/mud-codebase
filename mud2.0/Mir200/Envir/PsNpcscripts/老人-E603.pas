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
   '嗯.. 你怎么会来到这么危险的地方？\'
   +'我不敢说你能不能从这儿走出去。\ \'
   
   +'|{cmd}<进行对话/@talkwith_1>\'
   +'|{cmd}<关闭./@exit>\'
   );

end;


procedure _QUEST; 
begin

      //IF This_Player.GetV(9,13) = 1 then
      IF This_Player.GetV(11,1) = 10 then 
      begin
         This_NPC.NpcDialog(This_Player,
         '快去找比奇省的屠夫吧。 \ \'
         +'|{cmd}<关闭/@exit>'   
         );
      
      end else
      //if This_Player.GetV(9,14) = 1 then
      if This_Player.GetV(11,1) = 9 then
      begin
      
          if (This_Player.GetBagItemCount('鹿茸') >= 1) and (This_Player.GetBagItemCount('鹿血') >= 1) then
          begin
           //This_Player.SetV(9,13,1);
           This_Player.SetV(11,1,10);
           This_Player.Take('鹿茸',1);
           This_Player.Take('鹿血',1);
             This_NPC.NpcDialog(This_Player,
             '你真棒，那么难找的材料都能够找到。\'
             +'我会把制造的油交给比奇肉店的屠夫，\'
             +'你去看看吧。\ \'
             +'去<等/@exit>'
             
             );
          
          end else
          begin
             This_NPC.NpcDialog(This_Player,
             '还没能找到啊，快去找吧。\'
             +'我不是好脾气，等不了那么长时间。\ \'
             +'|{cmd}<关闭/@exit>'
             );
          
          end;
      end else
      IF This_Player.GetV(9,15) = 1 then
      begin
          IF random(5) = 0 then
          begin
             This_NPC.NpcDialog(This_Player,
             '你就是那个出了名的臭脾气吗？\'
             +'你和我脾气差不多，好。哈哈哈.. \'
             +'你想不想赚一次大钱？ \ \'
             +'|{cmd}<想赚钱/@Q351_1_1> \'
             +'|{cmd}<不想赚钱/@Q351_1_2>'
             );
          
          end else
          _normal
      end else
      //IF (This_Player.GetV(9,16) = 1) and (random(5) = 0) then
      IF (This_Player.GetV(11,1) = 8) and (random(5) = 0) then
      begin
         This_NPC.NpcDialog(This_Player,
         '你有什么事情吗？要我制造特殊油给你，是吗？\ '
         +'要制造这种油，需要稀有材料。\'
         +'如果你能找到这些材料，我就给你制造。\ '
         +'这些材料包括鹿茸和鹿血。\'
         +'如果在别的地方找不到这些材料， \ \'
         +'|{cmd}<下一个/@Q310_1>'
         );
      
      end else
      _normal
end;



procedure domain; 
begin
    IF random(2) = 0 then 
    _QUEST
    else
    _normal
end;




procedure _Q310_1; 
begin
   IF (This_Player.GetV(11,1) = 8) then
   begin 
    //This_Player.SetV(9,14,1);
    This_Player.SetV(11,1,9);
   This_NPC.NpcDialog(This_Player,
   '我听说鹿茸只能在地下才能够找得到。\'
   +'你知道怎么去吗？如果不知道，那我也没办法。\ '
   +'至于鹿血我就不清楚在哪儿可以得到，\ '
   +'祝你好运。\ \'
   +'|{cmd}<关闭/@exit>'
   );
   end;
end;









procedure _talkwith_1; 
begin
    //IF GetDayOfWeek >= 6 then 
    IF GetDayOfWeek >= 0 then 
    begin
       This_NPC.NpcDialog(This_Player,
       '你跑这么老远和我搭话， \'
       +'我就告诉你一个好情报。\'
       +'这附近有一个无人知晓的洞穴，\'
       +'这个洞穴和传奇世界不一样，我也只是听说过一次。\'
       +'一次也没去过，但是我可以给你带路。\ \ '
       
       +'|{cmd}<挑战/@talkwith_3>\'
       +'|{cmd}<关闭/@exit>'
       );
    
    end else
    begin
    IF random(10) = 0 then
       This_NPC.NpcDialog(This_Player,
       '你有没有听说过地下？ \'
       +'我也不能向你仔细说明，\'
       +'但是可以告诉你进入的时间是周末的晚上， \'
       +'这个时间你再来找我的话， \'
       +'我可以带你到那个地方，\ '
       +'那到时候见吧。\ \'
       +'|{cmd}<返回/@main>'
       ) 
       else
       This_NPC.NpcDialog(This_Player,
       '和你说什么？\'
       +'快从这儿消失吧。\ \'
       +'|{cmd}<返回/@main>'
       );
    
    end;
end;
   


procedure _talkwith_3; 
begin
   This_NPC.NpcDialog(This_Player,
   '嗨，我可以让你进去，\'
   +'但是记住，过三个小时之后你会回到原来的地方，那你小心点。\ \'
   +'|{cmd}<进入/@talkwith_4>'
   
   );

end;

procedure call_back;
begin
    if This_Player.MapName = 'M001' then
    This_Player.Flyto('E603',32,192);
end;
   
procedure _talkwith_4; 
begin
     This_Player.RandomFlyTo('M001');
       This_Player.CallOut(This_Npc, 180 * 60, 'call_back');
end;






procedure _Q351_1_1; 
begin
   This_NPC.NpcDialog(This_Player,
   '哦，想赚是吧？ \'
   +'好，那你带着斩马刀去找地牢二层的奸商小李吧，\'
   +'他会告诉你答案的。\ \'
   +'|{cmd}<去找/@Q351_1_1_1>'
   );

end;

procedure _Q351_1_2; 
begin
   This_NPC.NpcDialog(This_Player,
   '听说你脾气不好，看来也不仅仅是这样啊。\'
   +'我都不好意思看你，\'
   +'回去练好修养吧。\ \'
   +'|{cmd}<关闭/@exit>'
   
   );

end;

procedure _Q351_1_1_1; 
begin
    This_Player.SetV(9,17,1);
   This_NPC.NpcDialog(This_Player,
   '祝你好运。\ \'
   +'|{cmd}<关闭/@exit>'
   );

end;







begin
    domain;
end.