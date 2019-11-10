{********************************************************************

*******************************************************************}
//指示的高级武士
//包含新手指示人
procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain;
begin
    IF This_Player.GetV(9,6) = 1 then
    begin
       This_NPC.NpcDialog(This_Player,
       '你不是已经收到书了吗？如果已收到书，\'
       +'请双击那本基本剑术书（双击鼠标的左键），\'
       +'书会消失，你也已经学到了这个功夫，\'
       +'它会使你的能力中增加命中率，\'
       +'你的功夫越深你的命中率也就越高。\'
       +'现在你可以去比奇省的书店， \'
       +'书店的主人会交你更加厉害。 \ '
       +'比奇书店的坐标是323，247，你去吧。\'
       +'|{cmd}<关闭/@exit>'
       );
    
    end else 
    IF This_Player.GetV(9,1) = 1 then
    begin
       IF This_Player.Level >= 7 then
       This_NPC.NpcDialog(This_Player,
       '我来测验一下你的能力，\'
       +'有很多绵羊，鹿，鸡等妖怪，限你在5分钟之内把它们抓完，再和我进行对话。\ \'
       +'|{cmd}<关闭/@Q706_1>'
       )
       else
       This_NPC.NpcDialog(This_Player,
       '我是高级武士，很高兴见到你，\'
       +'至于你的战士职业，我听向导听了解了很多，\'
       +'战士的第一个功夫就是基础剑术，\'
       +'练这个武功要求你的级别是7级，\'
       +'先练练你的能力再来吧。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    
    end else

    //////////////////////////
    //IF (This_Player.GetV(9,7) = 1) and   
    //(This_Player.GetV(8,25) <= 0) then
    IF (This_Player.GetV(11,4) = 12) then
    begin
        if (This_Player.Job = 0) and (This_Player.Level >= 35) then
        begin
            //reset [210] 10
           // This_Player.SetV(8,25,1);
            This_Player.SetV(11,4,13);
            This_Player.Give('命运之书',1);
            
            //set [221] 1
            This_NPC.NpcDialog(This_Player,
           '哦，你是真正的勇士，能把魔鬼消灭掉。\'
           +'真是太辛苦你了，没想到还有翻开此书的一天啊，\'
           +'来，我把这本书给你，你替我把它交给比奇省铁匠铺老板\'
           +'他会明白我的意思的。\ \'
           +'|{cmd}<关闭/@exit>'  );
        end;
    
       
      
    
    end else
    //IF This_Player.GetV(8,28) = 1 then
    if This_Player.GetV(11,4) = 8 then
   This_NPC.NpcDialog(This_Player,
   '你说你见过我的弟子-比奇省铁匠铺老板?\'
   +'他没死活得很好？\'
   +'天分不是很好，但是就凭他那个热情，\'
   +'我就把他带在身边交他，\'
   +'很懒，我也没说过他，\'
   +'他现在在哪儿做什么？\ \'
   +'|{cmd}<现在在比奇省铁匠铺做匠人/@next_1>\'
   +'|{cmd}<不要说那种话，先听我讲吧。/@next_2>'
   ) else
    IF This_Player.GetV(11,4) = 11 then
    begin
       This_NPC.NpcDialog(This_Player,
       '准备好了吗？那么开始吧。\ \'
       +'|{cmd}<下一个/@next_3>'
       );
    
    end else
    //IF (This_Player.GetV(8,14) = 1) and
    //(This_Player.GetV(9,7) <= 0) then
    if This_Player.GetV(11,4) = 7 then
    begin
       This_NPC.NpcDialog(This_Player,
       '找我什么事？比奇省铁匠铺老板？?\'
       +'你怎么知道我的弟子？\'
       +'你想和我讲话？\'
       +'那我们玩布，剪刀，锤游戏，\'
       +'你赢了我就听你讲。\ \'
       +'|{cmd}<剪刀/@gawi>   ^<锤/@bawi>   ^<布/@bo>'
       );
    
    end else
    IF This_Player.GetV(9,26) = 1 then
    begin
       This_NPC.NpcDialog(This_Player,
       '你不是已经收到书了吗？如果以收到书，\'
       +'请双击那本书（双击鼠标的左键），\'
       +'书会消失，你也已经学到了这个功夫，\'
       +'它会使你的能力中增加命中率，\'
       +'你的功夫越深你的命中率也就越高。\'
       +'现在你可以去比奇省的书店， \'
       +'书店的主人会交你更加厉害。 \ '
       +'比奇书店的坐标是323，247，你去吧。\'
       +'|{cmd}<关闭/@exit>'
       +''
       );
    
    end else
    IF This_Player.GetV(9,27) = 1 then
    begin
    IF This_Player.Level >= 7 then
    
       This_NPC.NpcDialog(This_Player,
       '你的级别到了7级 \'
       +'我来测验一下你的能力，\'
       +'有很多绵羊，鹿，鸡等妖怪，限你在10分钟之内把它们抓完，再和我进行对话。\ \'
       +'|{cmd}<关闭/@Q706_1>'
       +''
       )
       else
       This_NPC.NpcDialog(This_Player,
       '我是高级武士，很高兴见到你，\'
       +'至于你的战士职业，我听向导听了解了很多，\'
       +'战士的第一个功夫就是基础剑术，\'
       +'练这个武功要求你的级别是7级，\'
       +'先练练你的能力再来吧。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    
    end else
    begin
        if This_Player.Gender = 0 then
        This_NPC.NpcDialog(This_Player,
       '来这么偏僻的地方？\'
       +'你叫什么名字？' + This_Player.Name + '？怎么是这么个名字？\'
       +'我现在有事很忙，你走吧\ \'
       +'|{cmd}<关闭/@exit>'
       )
       else
       This_NPC.NpcDialog(This_Player,
       '|' + This_Player.Name + '，这个名字很好听。\'
       +'现在有时间吗？我们一起到比奇客栈喝一杯怎么样？\'
       +'好了，不要用那种眼神看我，\'
       +'我现在忙，\'
       +'你走吧。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end ;
end;

procedure call_back;
begin
    if This_Player.MapName = '01142' then
    This_Player.RandomFlyTo('0114');
end;

procedure _Q706_1;
begin
    IF CheckOtherMapHum('01142') > 0 then
    begin

       This_NPC.NpcDialog(This_Player,
       '现在有人在接受我的测验，\'
       +'请你等他测试完，很抱歉。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    begin
    This_NPC.ClearMon('01142');
    This_NPC.CreateMon('01142',19,19,10,'鹿',10);
    This_NPC.CreateMon('01142',19,19,10,'鸡',20);
    This_NPC.CreateMon('01142',19,19,10,'羊',10);
    This_Player.RandomFlyTo('01142');
    This_Player.CallOut(This_Npc, 300, 'call_back');
    
    end;

end;

procedure _gawi;
begin
    IF random(5) = 0 then
    begin
       //This_Player.SetV(8,28,1) ;
       This_Player.SetV(11,4,8);
       This_NPC.NpcDialog(This_Player,
       '我出了布，竟然赢我？\'
       +'厉害，让我听听你的话。\ \'
       +'|{cmd}<下一个/@next>'
       );
    end else
    begin
   This_NPC.NpcDialog(This_Player,
   '我出了锤，我赢了，你走吧\ \'
   +'|{cmd}<下一个/@exit>'
   );
   This_Player.SetV(11,3,-1);
   This_Player.SetV(11,4,-1);
   This_Player.SetV(11,5,-1);
    end;
end;

procedure _bawi;
begin
    IF random(5) = 0 then
    begin
       //This_Player.SetV(8,28,1) ;
       This_Player.SetV(11,4,8);
       This_NPC.NpcDialog(This_Player,
       '我出剪刀，你竟然能赢我？\'
       +'厉害，我来听你讲。\ \'
       +'|{cmd}<下一个/@next>'
       )
   end
   else
   begin
   This_NPC.NpcDialog(This_Player,
   '我是布，我赢了，你走吧。\ \'
   +'|{cmd}<关闭/@exit>'
   +''
   );
   This_Player.SetV(11,3,-1);
   This_Player.SetV(11,4,-1);
   This_Player.SetV(11,5,-1);
   end;
end;

procedure _bo;
begin
    IF random(5) = 0 then
    begin
       //This_Player.SetV(8,28,1) ;
       This_Player.SetV(11,4,8);
   This_NPC.NpcDialog(This_Player,
   '我出了锤，竟然能赢我？\'
   +'厉害，我来听你讲。\ \'
   +'|{cmd}<下一个/@next>'
   )
   end
   else
   begin
   This_NPC.NpcDialog(This_Player,
   '我出剪刀，我赢了，你走吧。\ \'
   +'|{cmd}<关闭/@exit>'
   );
   This_Player.SetV(11,3,-1);
   This_Player.SetV(11,4,-1);
   This_Player.SetV(11,5,-1);
   end;
end;
 
procedure _next;
begin
   if This_Player.GetV(11,4) = 8 then
   This_NPC.NpcDialog(This_Player,
   '你说你见过我的弟子-比奇省铁匠铺老板?\'
   +'他没死活得很好？\'
   +'天分不是很好，但是就凭他那个热情，\'
   +'我就把他带在身边交他，\'
   +'很懒，我也没说过他，\'
   +'他现在在哪儿做什么？\ \'
   +'|{cmd}<现在在比奇省铁匠铺做匠人/@next_1>\'
   +'|{cmd}<不要说那种话，先听我讲吧。/@next_2>'
   );

end;
 
procedure _next_1;
begin
   //reset [210] 10
   //This_Player.SetV(8,23,1);
   This_Player.SetV(11,4,9);
   This_NPC.NpcDialog(This_Player,
   '是吗？知道了，现在你可以回去了。\ \'
   +'|{cmd}<关闭/@exit>'
   );

end;

procedure _next_2;
begin
   This_NPC.NpcDialog(This_Player,
   '你想说什么？\ \'
   +'|{cmd}<其实比奇省铁匠铺老板也很想念师傅/@remember>\'
   +'|{cmd}<为什么把曾经是你的弟子的人说得那么难听？?/@criticize>'
   );

end;
 
procedure _remember;
begin
   This_NPC.NpcDialog(This_Player,
   '是吗？其实我也没有忘了他。\'
   +'我收他为弟子，是想传给他一个技术，\'
   +'这个技术单凭才能是不够的，\'
   +'需要经过无数次的失败，\'
   +'从失败中得到经验，才能完成，我以为他有热情应该可以做得到。\'
   +'但是我现在老了，想不起来了。\ \'
   +'|{cmd}<下一个/@remember_1>'
   +''
   );

end;
 
procedure _remember_1;
begin
   This_NPC.NpcDialog(This_Player,
   '再加上整理技术内容时，魔鬼进入了书中，\'
   +'曾有一次为了消灭它们，我翻开书，引诱它们出来，\'
   +'但是它们太强大了，我是不敢再那么做了。\'
   +'怎么样，你能帮我打败书里的魔鬼吗？ \'
   +'|{cmd}<接受/@accept>\'
   +'|{cmd}<拒绝/@noaccept>'
   );

end;

procedure _noaccept;
begin
   This_Player.SetV(11,3,-1);
   This_Player.SetV(11,4,-1);
   This_Player.SetV(11,5,-1);
   This_NPC.NpcDialog(This_Player,
   '那没什么事了，你回去吧!!\ \'
   +'|{cmd}<关闭/@exit>'
   );
end;

procedure _accept;
begin
   
   This_Player.SetV(8,28,1) ; 
   
   if This_Player.GetV(11,4) = 8 then
   This_Player.SetV(11,4,11);
   This_NPC.NpcDialog(This_Player,
   '好，不过书里的魔鬼很强大，\'
   +'做好心理准备就告诉我吧。若还没做好准备就请准备好装备再来。\'
   +'它们是很可怕的。\ \'
   +'|{cmd}<准备好了/@next_3>\'
   +'|{cmd}<做好准备再来/@exit>'
   );

end;


 
procedure _next_3;
begin
 // if (This_Player.GetV(9,7) <= 0) and (CheckOtherMapHum('01141') >= 1) then

   
   if This_Player.GetV(11,4) = 11 then
   begin
       if (CheckOtherMapHum('01141') >= 1) then
       This_NPC.NpcDialog(This_Player,
       '现在有人正在和魔鬼战斗。\'
       +'你还是等一会儿再来吧。\ \'
       +'|{cmd}<关闭/@exit>'
       )
       else
       begin
        This_NPC.ClearMon('01141');
        This_NPC.CreateMon('01141',10,10,10,'火焰沃玛2',30);
        This_Player.RandomFlyTo('01141');
       end;
   end;
end;

procedure _criticize;
begin
   //reset [210] 10
   This_Player.SetV(11,3,-1);
   This_Player.SetV(11,4,-1);
   This_Player.SetV(11,5,-1);
   This_NPC.NpcDialog(This_Player,
   '你说什么？你在和我计较吗？\'
   +'我想什么就说什么!!!\'
   +'不想再和你这种人说话。\'
   +'你回去吧!!\ \'
   +'|{cmd}<关闭/@exit>'
   );

end;

begin
    domain;
end.