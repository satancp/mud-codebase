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
   This_NPC.NpcDialog(This_Player,
   '您想卖肉吗?\ \'
   +'|{cmd}<卖/@sell>  肉\'
   +'|{cmd}<询问/@meathelp> 如何得到肉\'
   +'|{cmd}<取消/@exit>\'
   
   );

end;  


procedure domain;
begin
    if This_Player.GetV(11,7) = 1 then
    begin
        if (This_Player.GetBagItemCount('肉') >= 1) and (This_Player.GetBagItemCount('鸡肉') >= 1) then
       This_NPC.NpcDialog(This_Player,
       '让我看看....啊呀....那好吧\'
       +'把挖出肉来给我\'
       +'我会给你一瓶金创药作为报酬\'
       +'|{cmd}<给肉块/@newnew1_1>\'
       +'|{cmd}<不给/@new1_2>'
       )
       else
       This_NPC.NpcDialog(This_Player,
       '你是村里那位长相一般的女助理介绍来的吗?\'
       +'你以为只拿这封信来找我就可以有好处吗??\'
       +'我可不会因为一封信而给你任何好处的\'
       +'我现在不是很相信你的能力,按照我的要求去做件事情\'
       +'为了让我能相信你,去杀一头鹿和杀一只鸡，并挖出肉来给我\'
       +'我倒是可以考虑跟你做笔生意\\'
       +'|{cmd}<确定/@exit>'
       
       );
    
    end else
    if This_Player.GetV(11,7) = 4 then
    This_NPC.NpcDialog(This_Player,
     '合作愉快哦\'
     +'你还算有点能力.但这样还是不够的\'
     +'喏....我这里还有一份差事\'
     +'你要不要干吗?\\'
     +'|{cmd}<要啊,有的做为什么不呢?!/@new1_11_2>\'
     +'|{cmd}<我很忙,没有兴趣/@new1_12>'
     
     )
    else
    _normal
end;  

 

procedure _new1_2;
begin
    This_Player.Take('介绍信',1);
    This_Player.SetV(11,7,100);
   This_NPC.NpcDialog(This_Player,
   '我是看在助理小妞的面子上才跟你做生意的\'
   +'既然你不愿意\'
   +'那就算了\'
   +'这封信我也拿走了\'   
   );

end;  

procedure _newnew1_1;
begin
    if (This_Player.GetBagItemCount('肉') >= 1) and (This_Player.GetBagItemCount('鸡肉') >= 1) and (This_Player.GetV(11,7) = 1) then
    begin
        if This_Player.GetBagItemCount('介绍信') >= 1 then
        begin
            This_Player.Take('肉',1);
            This_Player.Take('鸡肉',1);
            This_Player.Take('介绍信',1);
            This_Player.Give('金创药(小量)',1);
            This_Player.SetV(11,7,4);
           This_NPC.NpcDialog(This_Player,
           '合作愉快哦\'
           +'你还算有点能力.但这样还是不够的\'
           +'喏....我这里还有一份差事\'
           +'你要不要干吗?\\'
           +'|{cmd}<要啊,有的做为什么不呢?!/@new1_11_2>\'
           +'|{cmd}<我很忙,没有兴趣/@new1_12>'
           
           );
        end else
        This_NPC.NpcDialog(This_Player,
           '你是不是把介绍信弄丢了？'
           );
    end
    else
   This_NPC.NpcDialog(This_Player,
   '你这个骗子！'
   );

end;  

  

procedure _new1_12;
begin
This_Player.SetV(11,7,100);
   This_NPC.NpcDialog(This_Player,
   '真是可惜\'
   +'算我我看错人了!\'
   +'不过还是欢迎你以后经常光顾我的小店吧\\'
   +'|{cmd}<确定/@exit>\'
   +'继续<卖肉/@normal>'
   
   );

end;  

procedure _new1_11_2;
begin
    if This_Player.GetV(11,7) = 4 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
             This_NPC.NpcDialog(This_Player,
             '村里书店的老者今天要开宴会\'
             +'他是我的老师,以前一直给他添麻烦\'
             +'由于我现在脱不开身\'
             +'如果你能帮我送给他一块佛牌的话\'
             +'我会很感激你的\'
             +'他的书店就是村子左边的那座大屋子\'
             +'谢谢你哦\\'
             +'|{cmd}<拿取佛牌/@exit>'
             
             
             );
        
            This_Player.Give('佛牌',1);
            This_Player.SetV(11,7,5);
        end
    end else
    begin
       This_NPC.NpcDialog(This_Player,
       '村里书店的老者今天要开宴会\'
       +'把佛牌送给他\'
       +'他会很高兴的\'
       +'他的书店就是村子左边的那座大屋子\'
       +'谢谢\\'
       +'|{cmd}<知道了/@exit>'
       
       );
    
    end;
end;  
  


procedure _Sell;
begin
   This_NPC.NpcDialog(This_Player,
   '我们出高价买进好肉,\'
   +'但是那些有污点或者是\'
   +'被火烧了的肉我们则出价很低.\ \'
   +'|{cmd}<返回/@normal>'
   
   );

 
  This_Npc.Click_Sell(This_Player);
end;

procedure _meathelp;
begin
   This_NPC.NpcDialog(This_Player,
   '你可以从鸡,鹿,羊,狼等身上得到肉. 首先,杀死它们,因为它们\'
   +'在你的攻击下会反击，然后你走到尸体旁边的地方按住ALT键\'
   +'同时鼠标左键点击它的尸体然后你就会看见自己把肉切成肉块.\'
   +'在那之后你的包裹里就会出现一个美味的肉块.别忘了逃跑的\'
   +'动物有高质量的肉.可是, 使用魔法会使肉的质量下降到0 \ \'
   +'|{cmd}<返回/@normal>'
   
   
   
   
   );

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