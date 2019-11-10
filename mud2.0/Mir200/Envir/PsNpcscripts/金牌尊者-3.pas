{
*******************************************************************}

program Mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '本服会员功能需要商场购买<热血凭证/=red>，或者使用积分在我这里换取，会员可以进入热血战场，并拥有强大的随身功能，每日补给等·购买令牌后请购买GM宝典使用会员随身功能!\'+ 
  '<会员宝典为本服会员专用道具，双击宝典可以使用会员随身功能，超级实用，详细功能请购买会员后体验！！/=red>\' +
  +'|{cmd}<合成会员令牌/@goldrole>    <领取会员宝典/@ge> \'
  );
end;


procedure _ge;
begin
  if (This_Player.GetBagItemCount('热血凭证') > 0) then
   
    
  begin
     
     
        This_Player.Give('GM宝典',1); 
      
       
     ;
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你不是本服会员，无法领取，请将热血凭证放在包里!'
    );
end;




procedure _goldrole;
begin
  This_Npc.NpcDialog(This_Player,
  '如果你有30个热血积分，交给我，我会给你一个热血凭证。\热血凭证为绑定物品，不可丢弃，交易，死亡不爆，放在包里可以使用多种会员功能！\'
  +'|{cmd}<使用热血积分获得热血凭证/@goldjifen> \'
  +'|{cmd}<捆热血积分/@bindgold>\'               
  +'|{cmd}<返回/@main>                      <离开/@doexit>'
  );
end;

procedure _golditemreq;
begin
  This_Npc.ReqItemByGoldAct(This_Player);
end;

procedure _goldjifen;
begin
  if This_Player.GetBagItemCount('热血积分') >= 30 then
  begin
    This_Player.Take('热血积分',30);
    This_Player.Give('热血凭证',1);
    This_Npc.NpcDialog(This_Player,
    '热血凭证已经给你了，双击之后，你就是热血勇士了！');
    
    if This_Player.GetV(111,47) = 1 then
    begin
       if This_Player.SetV(111,47,10) then
       begin
          This_Player.Give('经验',10000);
          This_Player.PlayerNotice('你已经完成了成长之路：热血勇士任务。',2);
          //#This_Player.DeleteTaskFromUIList(1047);
       end;
    end; 
  end
  else if this_Player.GetBagItemCount('热血积分包') >= 5 then
  begin
    This_Player.Take('热血积分包',5);
    This_Player.Give('热血凭证',1);
    This_Npc.NpcDialog(This_Player,
    '热血凭证已经给你了，双击之后，你就是热血勇士了！');
    
    if This_Player.GetV(111,47) = 1 then
    begin
       if This_Player.SetV(111,47,10) then
       begin
          This_Player.Give('经验',10000);
          This_Player.PlayerNotice('你已经完成了成长之路：热血勇士任务。',2);
          //#This_Player.DeleteTaskFromUIList(1047);
       end;
    end; 
  end
  else if This_Player.GetBagItemCount('热血积分包') = 4 then
  begin
    if This_Player.GetBagItemCount('热血积分') >= 6 then
    begin
       This_Player.Take('热血积分包',4);
       This_Player.Take('热血积分',6);
       This_Player.Give('热血凭证',1);
       This_Npc.NpcDialog(This_Player,
       '热血凭证已经给你了，双击之后，你就是热血勇士了！');
    
       if This_Player.GetV(111,47) = 1 then
       begin
          if This_Player.SetV(111,47,10) then
          begin
             This_Player.Give('经验',10000);
             This_Player.PlayerNotice('你已经完成了成长之路：热血勇士任务。',2);
             //#This_Player.DeleteTaskFromUIList(1047);
          end;
       end; 
    end;
  end
  else if this_Player.GetBagItemCount('热血积分包') = 3 then
  begin
    if This_Player.GetBagItemCount('热血积分') >= 12 then
    begin
       This_Player.Take('热血积分包',3);
       This_Player.Take('热血积分',12);
       This_Player.Give('热血凭证',1);
       This_Npc.NpcDialog(This_Player,
       '热血凭证已经给你了，双击之后，你就是热血勇士了！');
    
       if This_Player.GetV(111,47) = 1 then
       begin
          if This_Player.SetV(111,47,10) then
          begin
             This_Player.Give('经验',10000);
             This_Player.PlayerNotice('你已经完成了成长之路：热血勇士任务。',2);
             //#This_Player.DeleteTaskFromUIList(1047);
          end;
       end; 
    end;
  end
  else if this_Player.GetBagItemCount('热血积分包') = 2 then
  begin
    if This_Player.GetBagItemCount('热血积分') >= 18 then
    begin
    This_Player.Take('热血积分包',2);
    This_Player.Take('热血积分',18);
    This_Player.Give('热血凭证',1);
    This_Npc.NpcDialog(This_Player,
    '热血凭证已经给你了，双击之后，你就是热血勇士了！');
    end;
  end
  else if this_Player.GetBagItemCount('热血积分包') = 1 then
  begin
    if This_Player.GetBagItemCount('热血积分') >= 24 then
    begin
       This_Player.Take('热血积分包',1);
       This_Player.Take('热血积分',24);
       This_Player.Give('热血凭证',1);
       This_Npc.NpcDialog(This_Player,
       '热血凭证已经给你了，双击之后，你就是热血勇士了！');
       
       if This_Player.GetV(111,47) = 1 then
       begin
          if This_Player.SetV(111,47,10) then
          begin
             This_Player.Give('经验',10000);
             This_Player.PlayerNotice('你已经完成了成长之路：热血勇士任务。',2);
             //#This_Player.DeleteTaskFromUIList(1047);
          end;
       end;
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你好像没有足够的热血积分啊，\这个热血凭证我暂时不能给你。\请你继续努力吧！\'
    );
  end;
end;

procedure _bindgold;
begin
  This_Npc.NpcDialog(This_Player,
  '我可以帮你把6个热血积分捆为一个热血积分包，\不过每捆一次收费5000金币。\你想让我帮你捆热血积分吗？\ \'
  +'|{cmd}<捆热血积分/@bindinggold>\ \'
  +'|{cmd}<返回/@goldrole>'
  );
end;

procedure _bindinggold;
begin
  if This_Player.GoldNum < 5000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你连5000金币都没有，我怎么帮你捆呢？\');
  end
  else if This_Player.GetBagItemCount('热血积分') >= 6 then
  begin
    This_Player.Take('热血积分',6);
    This_Player.DecGold(5000);
    This_Player.Give('热血积分包',1); 
    This_Npc.NpcDialog(This_Player,
    '已经帮你将6个积分捆成1个热血积分包，\如果你还有积分，我可以继续帮你捆成热血积分包。\ \'
    +'|{cmd}<继续捆/@bindinggold>\ \'
    +'|{cmd}<返回/@goldrole>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够的热血积分啊，没办法帮你捆成一包，\请继续努力吧。\ \|{cmd}<返回/@goldrole>');
  end;
end;



begin
  domain;
end. 