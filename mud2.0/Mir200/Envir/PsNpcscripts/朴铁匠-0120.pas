{********************************************************************

*******************************************************************}
PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _QUEST;
begin
    //IF This_Player.GetV(9,13) = 1 then
    IF (This_Player.GetV(11,1) = 10) or (This_Player.GetV(11,1) = 11) then 
    begin
    
    //This_Player.SetV(9,22,1);
    This_Player.SetV(11,1,11);
    This_Npc.NpcDialog(This_Player,
          '从那位老人那里来了货。 \ '
          +'我把货拜托给厨师，叫他送给蜀汉氏了。 \'
          +'你去蜀汉氏那里看一下。 \ \'
          +'|{cmd}<关闭/@exit>'
          );
    
    end else
    IF This_Player.GetV(9,16) = 1 then
    begin
    
    This_Npc.NpcDialog(This_Player,
          '快去找那位神秘老人吧。 \ \'
          +'|{cmd}<关闭/@exit>'
          );
    
    end else
    //IF This_Player.GetV(9,10) = 1 then
    if (This_Player.GetV(11,1) = 7) or (This_Player.GetV(11,1) = 8) then
    begin
    This_Npc.NpcDialog(This_Player,
          '哇，你竟然连那位老人都找到了， \'
          +'再一次佩服和惊叹你的实力。 \'
          +'嗯，那位老人来了通知， \ '
          +'他说要做美味佳肴需要一种特殊的油， \ \'
          +'|{cmd}<关闭/@Q309_1>'
          
          );
    
    end else
   // IF This_Player.GetV(9,19) = 1 then
    IF This_Player.GetV(11,1) = 2 then
    begin
    This_Npc.NpcDialog(This_Player,
          '请快一点帮我找厨师。 \ \'
          +'|{cmd}<关闭/@exit>'
          );
    end else
    //IF This_Player.GetV(9,23) = 1 then
    IF This_Player.GetV(11,1) = 1 then
    begin
    This_Npc.NpcDialog(This_Player,
          '你是听盟重蜀汉氏的话来这儿吧 \'
          +'来得好... 我有件事情要请求你帮我 \'
          +'我听蜀汉氏讲你是一个很善良的人 \'
          +'请你一定答应我.. \ \'
          +'  <接受/@Q304_1>请求 \'
          +'  <拒绝/@exit>请求'
          
          );
    
    end else
       This_NPC.NpcDialog(This_Player,
       '欢迎. 谢谢光临.\ \'
       +'|{cmd}<买/@buy>  武器\'
       +'|{cmd}<卖/@sell>  武器\'
       +'|{cmd}<修理/@repair> 武器\'
       +'|{cmd}<取消/@exit>'
       );

end;

procedure _normal;
begin
   This_NPC.NpcDialog(This_Player,
   '欢迎光临毒蛇山谷铁匠铺。\ \'
   +'|{cmd}<买/@buy>  武器\'
   +'|{cmd}<卖/@sell>  武器\'
   +'|{cmd}<修理/@repair> 武器\'
   +'|{cmd}<特殊修理/@s_repair>\'
   +'|{cmd}<取消/@exit> '
   );

end;


procedure domain;
begin
    IF random(2) = 0 then 
    _QUEST
    else
    _normal;
end;






procedure _Q304_1;
begin
//This_Player.SetV(9,19,1);
This_Player.SetV(11,1,2);
This_Npc.NpcDialog(This_Player,
      '你接受我的请求，很感谢.. \ '
      +'不是别的，就是蜀汉氏给了我品质好的肉和鸡肉， \'
      +'要我帮他做料理。 \'
      +'但是做料理，需要有厨师， \ '
      +'请你帮忙找一位厨师吧。 \ \'
      +'|{cmd}<关闭/@exit>'
      );

end;

procedure _Q305;
begin
This_Npc.NpcDialog(This_Player,
      '请快一点帮我找厨师。 \ \'
      +'|{cmd}<关闭/@exit>'
      );

end;



procedure _Q309_1;
begin
    if (This_Player.GetV(11,1) = 7) or (This_Player.GetV(11,1) = 8) then
    begin
    //This_Player.SetV(9,16,1);
    This_Player.SetV(11,1,8);
    This_Npc.NpcDialog(This_Player,
      '关于这个油，据说是从毒蛇山谷废弃的矿区到死亡山谷的中间\'
      +'有一位神秘老人，他知道怎么制作这种油。 \'
      +'你去找他一下吧。 \'
      +'那位老人具体在哪里，我也不知道。 \\'
      
      +'|{cmd}<去/@exit>寻找'
      
      );
    end;
end;




procedure _buy;
begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么武器?\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;



Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您要修理武器吗?\'+
   '给我您要修理的武器.\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看起来修好了,感谢下次再来.\ \' +
    '|{cmd}<返回/@main>'
  );
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。，\'+
   '但费用是普通的三倍！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_SRepair(This_Player);
end;


procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   '已经修理好了，看起来很不错嘛！\' +
   '|{cmd}<返回/@main>');
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我您要卖的武器。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('木剑', 50, 1);
  This_NPC.FillGoods('青铜剑', 50, 1); 
  This_NPC.FillGoods('铁剑', 50, 1);
  This_NPC.FillGoods('短剑', 50, 1);
  This_NPC.FillGoods('匕首', 50, 1);
  This_NPC.FillGoods('鹤嘴锄', 50, 1);
  This_NPC.FillGoods('修罗', 50, 1);
  This_NPC.FillGoods('凝霜', 50, 1);
  //加载stdmode  
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(43);
end;




Begin

domain;
   
end.