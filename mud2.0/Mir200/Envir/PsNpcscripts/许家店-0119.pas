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
    This_Npc.NpcDialog(This_Player,
    '欢迎光临，有什么事情需要我帮忙吗？\ \'
    +'|{cmd}<买药/@buy>\'
    +'|{cmd}<卖药/@sell>\'
   +'|{cmd}<进行对话/@talkwith>\'
   +'|{cmd}<关闭/@exit>'
   );
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '需要什么东西吗？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '请给我要卖的东西，我会给好价钱的。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;



procedure _talkwith;
begin
    if This_Player.GetS(80,12) <= 1 then
    begin
       This_NPC.NpcDialog(This_Player,
       '...就是说你带着我父亲的信件，\'
       +'因为什么事情给我写信的呢？\'
       +'快把信交给我。\ \'
       +'|{cmd}<传达信件/@give_letter>\'
       +'|{cmd}<信件丢了/@no_give_letter>\' 
       );  
    end else
    if This_Player.GetS(80,12) = 2 then
    begin
    This_NPC.NpcDialog(This_Player,
       '谢谢，让你辛苦了。\'
       +'真太谢谢了，能告诉名字吗？\'
       +'我是许中医。\'
       +'你叫什么？\ \'
       +'|{cmd}<告诉名字/@say_my_name>\'
       ) 
    end else
    if This_Player.GetS(80,12) = 3 then
    begin
       This_NPC.NpcDialog(This_Player,
       '啊 ' + This_Player.Name + ', 欢迎光临 \'
       +'你过的还好吗？\'
       +'现在我需要食人树的果实\'
       +'如果你帮我弄到几个，我会给你好价钱的。\'
       +'请你一定帮我。\'
       +'那我就等你的好消息了。\'
       );
       This_Player.SetS(80,12,4);
    end else
    if This_Player.GetS(80,12) = 4 then
    begin
        IF This_Player.GetBagItemCount('食人树的果实') >= 1 then
        begin
           This_NPC.NpcDialog(This_Player,
           '还是你好，没有忘记。\'
           +'拿来的话，就一个一个给吧。\ \'
           +'|{cmd}<给/@give_sg_1>\'
           );
        
        end else
        begin
           This_NPC.NpcDialog(This_Player,
           '啊 ' + This_Player.Name + ', 欢迎光临 \'
           +'你过的还好吗？\'
           +'现在我需要食人树的果实\'
           +'如果你帮我弄到几个，我会给你好价钱的。\'
           +'请你一定帮我。\'
           +'那我就等你的好消息了。\'
           );
        end;
    end else
    if This_Player.GetS(80,12) = 5 then
    begin
       This_NPC.NpcDialog(This_Player,
       '' + This_Player.Name + ', 药是已经炼成了,\'
       +'但是还没有没有解决的部分，\'
       +'需要向师傅请教。\'
       +'有件事情想求你帮忙，你答应吗？\ \'
       +'|{cmd}<接受请求/@ok_h_order>\'
       );
    
    end else
    if This_Player.GetS(80,12) = 13 then
    begin
       This_NPC.NpcDialog(This_Player,
       '你回来了？没找到师傅也没关系，毕竟我已经很久没见过他了。\'
       +'不知道他现在过的怎么样。\ \'
       +'|{cmd}<把药交给他/@DoDrug_4>\'
       +'|{cmd}<离开/@doexit>\' 
       );  
    end else
    if This_Player.GetS(80,12) = 14 then
    begin
     This_NPC.NpcDialog(This_Player,
     '这是？没想到你真的找到师傅了，他过得还好吗？这味药剂终于研\'
     +'制成功了，真不知道怎么感谢你，这里有我们药店的几个秘制药剂\'
     +'配方，有<强效太阳水秘方/c=red>，<万年雪霜秘方/c=red>和<疗伤药秘方/c=red>，其中一样\'
     +'送给你，你可以找我在白日门的老朋友帮你炼制这些珍奇的药物，\'
     +'他也是开药店的，你只需要提供他一些材料手续费就好。希望我们\'
     +'有机会再见！\ \'
     +'|{cmd}<恩，我会继续帮助更多人的(获得秘方)/@DoDrug_5>\'
     +'|{cmd}<退出/@doexit>' 
     );
    end else
    This_NPC.NpcDialog(This_Player,
    '对不起，我现在太忙。\'
    +'可不可以下次再来?\'
    +'很抱歉。\'
    );
end;

procedure _DoDrug_4;
begin
   IF (This_Player.GetS(80,12) = 13) and (This_Player.GetBagItemCount('许中医的药1') >= 1) then
   begin 
   This_Player.SetS(80,12,14);
   This_Player.Take('许中医的药1',1); 
   This_NPC.NpcDialog(This_Player,
   '这是？没想到你真的找到师傅了，他过得还好吗？这味药剂终于研\'
   +'制成功了，真不知道怎么感谢你，这里有我们药店的几个秘制药剂\'
   +'配方，有<强效太阳水秘方/c=red>，<万年雪霜秘方/c=red>和<疗伤药秘方/c=red>，其中一样\'
   +'送给你，你可以找我在白日门的老朋友帮你炼制这些珍奇的药物，\'
   +'他也是开药店的，你只需要提供他一些材料手续费就好。希望我们\'
   +'有机会再见！\ \'
   +'|{cmd}<恩，我会继续帮助更多人的(获得秘方)/@DoDrug_5>\'
   +'|{cmd}<退出/@doexit>' 
   );
   end else
   This_NPC.NpcDialog(This_Player,
   '药呢？我就知道你是不会找到他的！\ \'+
   +'|{cmd}<我把药弄丢了（放弃任务重新开始）/@DoDrug_4_1>'
   );
end;

procedure _DoDrug_4_1;
begin
   IF (This_Player.GetS(80,12) = 13) then
   begin 
   This_Player.SetS(80,12,0);
   This_NPC.NpcDialog(This_Player,
   '任务已经重置，请前往比奇省药店重新开始任务（沓水店老板）。\'
   );
   end;
end;

procedure _DoDrug_5;
begin
   IF (This_Player.GetS(80,12) = 14) and (This_Player.FreeBagNum > 0) then
   begin 
       if (This_Player.GetS(80,14) <> 1) and (This_Player.GetBagItemCount('强效太阳水秘方') < 1) and (This_Player.GetS(80,37) < 1) then
       begin
       This_Player.SetS(80,12,0);
       This_Player.SetS(80,37,1);
       This_Player.Give('强效太阳水秘方',1);
       This_NPC.NpcDialog(This_Player,
       '这是炼制<强效太阳水/c=red>的秘方，请收好。\'
       +'你可以找我在白日门的老朋友帮你炼制此药。' 
       );
       end else
       if (This_Player.GetS(80,20) <> 1) and (This_Player.GetBagItemCount('万年雪霜秘方') < 1) and (This_Player.GetS(80,37) < 2) then
       begin
       This_Player.SetS(80,12,0);
       This_Player.SetS(80,37,2);
       This_Player.Give('万年雪霜秘方',1);
       This_NPC.NpcDialog(This_Player,
       '这是炼制<万年雪霜/c=red>的秘方，请收好。\'
       +'你可以找我在白日门的老朋友帮你炼制此药。' 
       );
       end else 
       if (This_Player.GetS(80,26) <> 1) and (This_Player.GetBagItemCount('疗伤药秘方') < 1) and (This_Player.GetS(80,37) < 3) then
       begin
       This_Player.SetS(80,12,0);
       This_Player.SetS(80,37,3);
       This_Player.Give('疗伤药秘方',1); 
       This_NPC.NpcDialog(This_Player,
       '这是炼制<疗伤药/c=red>的秘方，请收好。\'
       +'你可以找我在白日门的老朋友帮你炼制此药。' 
       );
       end else 
       This_NPC.NpcDialog(This_Player,
       '没想到你又来了，我已经没有什么可以报答你了，\'
       +'这些秘方你随便选一个吧！\ \'
       +'|{cmd}<强效太阳水秘方/@DoDrug_5_1~1>\' 
       +'|{cmd}<万年雪霜秘方/@DoDrug_5_1~2>\'
       +'|{cmd}<疗伤药秘方/@DoDrug_5_1~3>\'
       );
   end else
   This_NPC.NpcDialog(This_Player,
   '你的包裹太满了。\'
   );
end;

procedure _DoDrug_5_1(str:string);
var
Drug_kind:integer;
begin
   Drug_kind := strtointdef(str,-1);
   if (Drug_kind < 1) or (Drug_kind > 3) then exit;
   IF (This_Player.GetS(80,12) = 14) and (This_Player.FreeBagNum > 0) then
   begin   
       This_Player.SetS(80,12,0);
       case Drug_kind of
       1:str:='强效太阳水';
       2:str:='万年雪霜';
       3:str:='疗伤药';
       end;   
       This_Player.Give(str+'秘方',1);
       This_NPC.NpcDialog(This_Player,
       '这是炼制<'+str+'/c=red>的秘方，请收好。\'
       +'你可以找我在白日门的老朋友帮你炼制此药。' 
       );
   end else
   This_NPC.NpcDialog(This_Player,
   '你的包裹太满了。\'
   );
end;



//;-------------------------------------------------------
//;为传达信件而来
//;-------------------------------------------------------



procedure _give_letter;
begin
    IF (This_Player.GetBagItemCount('药剂师的信') >= 1) and (This_Player.GetS(80,12) <= 1) then
    begin
       This_Player.Take('药剂师的信',1);
       This_Player.SetS(80,12,2);
       This_NPC.NpcDialog(This_Player,
       '谢谢，让你辛苦了。\'
       +'真太谢谢了，能告诉名字吗？\'
       +'我是许中医。\'
       +'你叫什么？\ \'
       +'|{cmd}<告诉名字/@say_my_name>\'
       );

    end else
   This_NPC.NpcDialog(This_Player,
   '现在没有信?\'
   +'你是说在路上丢了？找到之后马上给我。\'
   
   );

end;

procedure _no_give_letter;
begin
   This_NPC.NpcDialog(This_Player,
   '什么？把信丢了？\'
   +'呵呵，好了，那也用不着这么客气，\'
   +'这样一来我就变得不好意思了，\'
   +'好了，没事了，你回去吧\'
   );

end;

procedure _say_my_name;
begin
   This_NPC.NpcDialog(This_Player,
   '' + This_Player.Name + ' 嗨, 见到你很高兴。\'
   +'这也是缘分，我们友好相处吧。\'
   +'这是我的一点心意，收下吧。\'
   +'是叫做太阳神水的药水，很管用的。\ \'
   +'|{cmd}<收下/@ok_take_drug>'
   );

end;

procedure _ok_take_drug;
begin
    if This_Player.GetS(80,12) = 2 then
    begin
    This_Player.SetS(80,12,3);
        This_Player.Give('强效太阳水',1);
       This_NPC.NpcDialog(This_Player,
       '对了，下次一定再来。\'
       +'再见\'
       
   );
    end;

end;

//;-------------------------------------------------------
//; 传达信之后来。给食人树的果实之前
//;-------------------------------------------------------



//;-------------------------------------------------------
//; 为交给食人树的果实而来
//;-------------------------------------------------------



procedure _give_sg_1;
begin

    IF (This_Player.GetBagItemCount('食人树的果实') >= 1) and (This_Player.GetS(80,12) = 4) then
    begin
        This_Player.Take('食人树的果实',1);
        This_Player.AddGold(600);

        IF random(3) = 0 then
        begin
           This_Player.SetS(80,12,5);
           This_NPC.NpcDialog(This_Player,
           '谢谢你 ' + This_Player.Name + ' 现在食人树的果实已经够了。\'
           +'这都是你的功劳。\'
           +'现在我要开始炼药了，\'
           +'请你为我祈祷吧。\'
           +'再见\'
           );
        end else
        IF This_Player.GetBagItemCount('食人树的果实') >= 1 then
        begin
    
            IF This_Player.GetBagItemCount('食人树的果实') >= 1 then
            begin
               This_NPC.NpcDialog(This_Player,
               '还是你好，没有忘记。\'
               +'拿来的话，就一个一个给吧。\ \'
               +'|{cmd}<给/@give_sg_1>\'
               );
            
            end else
            begin
               This_NPC.NpcDialog(This_Player,
               '啊 ' + This_Player.Name + ', 欢迎光临 \'
               +'你过的还好吗？\'
               +'现在我需要食人树的果实\'
               +'如果你帮我弄到几个，我会给你好价钱的。\'
               +'请你一定帮我。\'
               +'那我就等你的好消息了。\'
               );
            end;
     
        end else
        This_NPC.CloseDialog(This_Player);
    end
end;

//;检查是否充分收到食人树的果实



//;-------------------------------------------------------
//;许中医正在炼第一个药
//;-------------------------------------------------------


procedure _ok_h_order;
begin
   This_NPC.NpcDialog(This_Player,
   '谢谢你，你把这个药送给我师傅刘中医，\'
   +'请教师傅这剂药缺少什么东西。\'
   +'我不能空着药房，\'
   +'所以就请你辛苦一次了。\'
   +'但是我师傅好久都没有音信，\'
   +'很对不起，请你一定帮我这个忙。\'
   +'|{cmd}<接受请求/@ok_h_order_now>\' 
   );
end;

procedure _ok_h_order_now;
begin
    if This_Player.GetS(80,12) = 5 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
        This_Player.SetS(80,12,6);
        This_Player.Give('许中医的药1',1);
        This_NPC.NpcDialog(This_Player,
         '我果然没有看错人，\'
         +'虽然我不知道师傅到底在哪里，\'
         +'但是我听说比奇服装店的安老板曾经见过我的师傅。\'
         +'你可以去找她问问。\'
         );
        end;
    end;
end;


procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_NPC.FillGoods('金创药(小量)', 100, 1);
  This_NPC.FillGoods('魔法药(小量)', 100, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  This_NPC.FillGoods('金创药(小)包', 100, 1);
  This_NPC.FillGoods('魔法药(小)包', 100, 1);
  This_NPC.FillGoods('金创药(中)包', 100, 1);
  This_NPC.FillGoods('魔法药(中)包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);  
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.