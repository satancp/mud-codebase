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

procedure _normal;
begin
IF This_Player.GetV(9,21) = 1 then

   This_NPC.NpcDialog(This_Player,
   '我根本就不认识你..\ '
   +'快走开，一看到你的脸 我就感觉恶心...\'
   +'还不快走....\ \'
   +'|{cmd}<关闭/@exit>'
   )
else
   This_NPC.NpcDialog(This_Player,
   '是来卖肉吗?\ \'
   +'|{cmd}<卖/@sell>肉\'
   +'|{cmd}<关闭/@exit>'
   
   );

end;

procedure _QUEST;
var
num,duramax,duraav : integer;
num_1,duramax_1,duraav_1 : integer;
begin
    IF This_Player.GetV(9,21) = 1 then 
       This_NPC.NpcDialog(This_Player,
       '我根本就不认识你..\ '
       +'快走开，一看到你的脸，我就感到恶心...\'
       +'还不快走....\ \'
       )
    else 
   // IF This_Player.GetV(9,22) = 1 then
   IF (This_Player.GetV(11,1) = 11) or (This_Player.GetV(11,1) = 12) then 
    begin
    //This_Player.SetV(9,9,1);
    This_Player.SetV(11,1,12);
       This_NPC.NpcDialog(This_Player,
       '哦，你准备得很好，多亏了你，\'
       +'我可以好好招待我那位叫做石禹的朋友。 \'
       +'我拜托我的老朋友恰拉，为你准备了一样好东西， \'
       +'你去找一下恰拉吧。\'
       +'真的很感谢你。 \'
       +'(在如今社会，这些可是个问题。) \ \'
       +'|{cmd}<关闭/@exit>'
       );
    
    
    end else
    IF This_Player.GetV(9,23) = 1 then
    begin
    IF This_Player.GetV(9,23) = 1 then
       This_NPC.NpcDialog(This_Player,
       '快去找比奇省的屠夫! \ \'
       +'|{cmd}<关闭/@exit>'
       );
    
    end else
    if This_Player.GetV(9,24) = 1 then
    begin
       This_Player.CheckBagItemEx('鸡肉',num,duramax,duraav);
       This_Player.CheckBagItemEx('肉',num_1,duramax_1,duraav_1);
        //This_Player.PlayerNotice('鸡肉:' + inttostr(num) + '-' + inttostr(duramax),2);
        //This_Player.PlayerNotice('肉:' + inttostr(num_1) + '-' + inttostr(duramax_1),2);
        if (num >= 5) and (duramax > 4500) and  (num_1 >= 5) and (duramax_1 > 11500) then 
        begin
            This_Player.Take('鸡肉',5);
            This_Player.Take('肉',5);
            This_Player.AddGold(6000);
        
           This_Player.SetV(9,23,1);
           This_NPC.NpcDialog(This_Player,
           '谢谢你..如果我富有，就给你算得多一点，\'
           +'但是我也很穷，所以只能肉500金币/块，鸡肉200金币/块来算。 \'
           +'真不好意思\'
           +'你可以去找毒蛇山谷的铁匠吧！ \'
           +'其实，他说有话要和你讲。 \ '
           +'前几天把你们骗得够戗，哈哈\\'
           +'|{cmd}<关闭/@exit>'
           );
        
        end else
        begin
           This_NPC.NpcDialog(This_Player,
           '你都没有准备好，怎么还对我这样?\'
           +'请快一点救救我! \ \ '
           +'|{cmd}<关闭/@exit>'
           );
        
        end;
    end else
    IF This_Player.GetV(9,25) = 1 then
    begin
    IF random(5) = 0 then
       This_NPC.NpcDialog(This_Player,
       '你能理解我的心情吗？我实在是太急了所以才请求你。 \'
       +'但是你却拒绝我的请求，太过分了。\'
       +'再一次请求你，好吗?? \ \'
       +'|{cmd}<接受/@Q300_2_1>\'
       +'|{cmd}<拒绝/@Q301_1>'
       )
       else
       This_NPC.NpcDialog(This_Player,
       '不想和你这种人再见面，你走吧! \ \'
       +'|{cmd}<关闭/@exit>'
       );
    
    end else
    
   // IF (This_Player.GetV(9,24) <= 0) and (This_Player.GetV(9,25) <= 0) and (This_Player.GetV(9,21) <= 0) then
    if This_Player.GetV(11,1) < 0 then
    begin
    
       This_NPC.NpcDialog(This_Player,
       '你想和我说话吗?? 嗯... \'
       +'或许你会觉得这只是我个人的事情... \'
       +'但是可以听我讲一次吗?? \ \'
       +'|{cmd}<接受/@Q300_1>\'
       +'|{cmd}<拒绝/@exit>\'
       
       );
    
    end else
    _normal;
end;

procedure domain;
begin
    IF random(2) = 0 then
    _QUEST
    else
    _normal;
end;




   


procedure _Q300_1;
begin
   This_NPC.NpcDialog(This_Player,
   '我有一个老朋友。\'
   +'他就是住在比奇省的叫做石禹的人。\'
   +'据我所知，他现在正匆忙赶来找我。 \'
   +'这位朋友嘴很刁，一般的食物连看都不看。 \'
   +' '
   +'|{cmd}<返回/@Q300_2>\'
   
   );

end;


procedure _Q300_2;
begin
   This_NPC.NpcDialog(This_Player,
   '所以说你能替我找来肉吗？ \'
   +'我也想去找，但是我过日子也不容易，不能不做买卖。 \'
   +'所以想请你帮个忙。 \ \'
   
   +'|{cmd}<好的/@Q300_2_1>\'
   +'|{cmd}<拒绝/@Q300_2_2>\'
   
   
   
   
   );

end;


procedure _Q300_2_1;
begin
   // This_Player.SetV(9,24,1);
   // This_Player.SetV(9,25,0);
  //  This_Player.SetV(9,21,0);
   This_Player.SetV(11,1,1);
   This_NPC.NpcDialog(This_Player,
   '很感谢你答应我的请求。 \'
   +'如果可以的话，请尽快把肉拿来。\'
   +'哦，差一点忘了告诉你，\'
   +'我需要的是品质20以上的肉和品质5以上的鸡肉。 \'
   +'一共是10块肉和10块鸡肉。 \\'
   +'|{cmd}<关闭/@exit>'
   );

end;


//;; 第一次拒绝请求时
procedure _Q300_2_2;
begin
    This_Player.SetV(9,25,1);
   This_NPC.NpcDialog(This_Player,
   '我都跟你讲了我的难处，你还拒绝我。真过分。 \'
   +'我再也不想见到你，太让我失望了。 \'
   +'快在我面前消失。 \ \'
   +'|{cmd}<关闭/@exit>'   
   );

end;


procedure _Q301_1;
begin
   This_NPC.NpcDialog(This_Player,
   '我这样求你，你都不答应，好。 \ '
   +'你这种人我可是第一次见。 \ '
   +'你就自己去发大财吧。 \'
   +'我不想再见到你。\ '
   +'(在如今社会，这些可是个问题。) \ \'
   +'|{cmd}<关闭/@exit>'
   );

This_Player.SetV(9,21,1);
end;





procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '高价买入品质好的肉。\低价买入粘上土或被火烧的肉。\ \'
    +'|{cmd}<继续/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(40);
  This_Npc.AddStdMode(1);
  This_Npc.SetRebate(100);
end;  

//脚本执行的入口
begin
  domain;
end.