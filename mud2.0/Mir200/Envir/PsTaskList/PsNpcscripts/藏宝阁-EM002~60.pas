{
/*******************************************************************************
}

program Mir2;

{$I common.pas}
const
  nextRoomIdxStr = '61';

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  if This_Player.GetS(12,4) = 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经获得了一次奖励，想要再获得，必须重新开始！\ \'
    +'|{cmd}<返回起点重新开始/@gostar>\'
    +'|{cmd}<离开藏宝阁/@leave>'
    );
  end
  else
  begin
  This_Npc.NpcDialog(This_Player,
    '这里是藏宝阁<60号/c=red>，我需要 5个乾坤令，在完成我的要求之后，\'
    +'你将得到一次掷骰子的机会，不要小瞧这次机会，它所给出的\'
    +'奖励将由你掷出的 3个骰子点数的总和来决定，请在包裹中留\'
    +'出至少 5个空格。\'
    +'|{cmd}<捆绑乾坤令/@newskill21>\ \'
    +'|{cmd}<给予乾坤令开始投骰子/@touzi>\ \'
    +'|{cmd}<离开藏宝阁/@leave>'
    );
  end;
end;

procedure _newskill21;
begin
  if This_Player.GetBagItemCount('乾坤令') >= 5 then
  begin
    This_Player.Take('乾坤令',5);
    This_Player.Give('乾坤令包',1);
    This_Npc.NpcDialog(This_Player,
    '这里是藏宝阁<60号/c=red>，我需要 5个乾坤令，在完成我的要求之后，\'
    +'你将得到一次掷骰子的机会，不要小瞧这次机会，它所给出的\'
    +'奖励将由你掷出的 3个骰子点数的总和来决定，请在包裹中留\'
    +'出至少 5个空格。\'
    +'|{cmd}<捆绑乾坤令/@newskill21>\ \'
    +'|{cmd}<给予乾坤令开始投骰子/@touzi>\ \'
    +'|{cmd}<离开藏宝阁/@leave>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '5个乾坤令可以捆绑成一个乾坤令包。\如果你已经带来了，就交给我吧！');
  end;
end;


procedure _touzi;
begin
  if (This_Player.Level >= 35) and (This_Player.FreeBagNum >= 4) and (This_Player.GetBagItemCount('乾坤令包') >= 1) then
  begin    
    This_Npc.NpcDialog(This_Player,
    '骰子点数之和不同，将会得到以下奖励：\'
    +'|3点:屠龙,嗜魂法杖随机1件\' 
    +'|4点:怒斩、龙牙、逍遥扇,有几率获得魔龙装备随机1件\'
    +'|5点:热血积分5个             ^6点:热血积分3个\'
    +'|7点:2000万经验            ^8点:1800万经验\'
    +'|9点:热血积分3个            ^10点:1600万经验\'
    +'|11点:1700万经验           ^12点:热血积分3个\'
    +'|13点:1800万经验           ^14点:1850万经验\'
    +'|{cmd}<下一页/@nextpage>'
    );
  end
  else if (This_Player.Level >= 35) and (This_Player.FreeBagNum >= 4) and (This_Player.GetBagItemCount('乾坤令') >= 5) then
  begin
    This_Npc.NpcDialog(This_Player,
    '骰子点数之和不同，将会得到以下奖励：\'
    +'|3点:屠龙,嗜魂法杖随机1件\' 
    +'|4点:怒斩、龙牙、逍遥扇,有几率获得魔龙装备随机1件\'
    +'|5点:热血积分5个             ^6点:热血积分3个\'
    +'|7点:2000万经验            ^8点:1800万经验\'
    +'|9点:热血积分3个            ^10点:1600万经验\'
    +'|11点:1700万经验           ^12点:热血积分3个\'
    +'|13点:1800万经验           ^14点:1850万经验\'
    +'|{cmd}<下一页/@nextpage>'
    );   
  end
  else if This_Player.Level < 35 then
  begin
    This_Npc.NpcDialog(This_Player,
    '必须达到35级以上，方可进入藏宝阁！');
  end
  else if This_Player.FreeBagNum < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
    '先清理一下包裹，至少留有5个以上的包裹空间再来找我吧！');
  end else if (This_Player.GetBagItemCount('乾坤令') < 5) or (This_Player.GetBagItemCount('乾坤令包') < 1 ) then
  begin
    This_Npc.NpcDialog(This_Player,
    '只有给我5个乾坤令才能进行掷骰子。\如果你已经带来了，就交给我吧！');
  end;
end;
  
procedure _nextpage;
begin
  if This_Player.GetS(12,4) = 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经获得了一次奖励，想要再获得，必须重新开始！\'
    +'|{cmd}<离开藏宝阁/@leave>'
    );
  end
  else if (This_Player.Level >= 35) and (This_Player.FreeBagNum >= 4) and (This_Player.GetBagItemCount('乾坤令包') >= 1) then
  begin
    This_Npc.NpcDialog(This_Player,
    '骰子点数之和不同，将会得到以下奖励：\'
    +'|15点：1900万经验\'
    +'|16点：热血积分3个\'
    +'|17点：热血积分5个\'
    +'|18点：魔龙装备随机1件\ \'
    +'|{cmd}<投骰子/@gotoprize488>'
    );
  end
  else if (This_Player.Level >= 35) and (This_Player.FreeBagNum >= 4) and (This_Player.GetBagItemCount('乾坤令') >= 5) then
  begin
    This_Npc.NpcDialog(This_Player,
    '骰子点数之和不同，将会得到以下奖励：\'
    +'|15点：1900万经验\'
    +'|16点：热血积分3个\'
    +'|17点：热血积分5个\'
    +'|18点：魔龙装备随机1件\ \'
    +'|{cmd}<投骰子/@gotoprize488>'
    );
  end
  else if This_Player.Level < 35 then
  begin
    This_Npc.NpcDialog(This_Player,
    '必须达到35级以上，方可进入藏宝阁！');
  end
  else if This_Player.FreeBagNum < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
    '先清理一下包裹，至少留有5个以上的包裹空间再来找我吧！！');
  end;
end;

//先直接根据配平，给出三个骰子扔出的总和 
function GetRandomDiceTotal() : Integer;
var temp1 : integer;
    temp2 : integer;    
begin
  temp1 := random(500)+1;
  Result := 0;
  if temp1 = 500 then    //设置1/500的概率出现三个1或者三个6 
  begin 
  temp2 := random(2);
    if temp2 = 1 then
    begin
      Result := 3;
    end
    else
    begin
      Result := 18;
    end;
  end
  else if temp1 <= 40 then   //设置8%的概率结果为4、5、16、17
  begin
    temp2 := random(4)+1;
    if temp2 = 1 then
    begin
      Result := 4;
    end
    else if temp2 = 2 then
    begin
      Result := 5;
    end
    else if temp2 = 3 then
    begin
      Result := 16;
    end
    else if temp2 = 4 then
    begin
      Result := 17;
    end;       
  end
  else if temp1 <= 155 then   //设置23%的概率结果为6、7、14、15
  begin
    temp2 := random(4)+1;
    if temp2 = 1 then
    begin
      Result := 6;      
    end
    else if temp2 = 2 then
    begin
      Result := 7;      
    end
    else if temp2 = 3 then
    begin
      Result := 14;      
    end
    else if temp2 = 4 then
    begin
      Result := 15;      
    end;       
  end
  else                       //设置余下69%的概率结果为8--13 
  begin
    Result := 8 + random(6);      
  end;
end; 

//设置所有三个骰子的点数
procedure SetAllDice();
var
  dice_num : Integer;
  dice1 : integer;
  dice2 : integer;
  dice3 : integer;
  temp1 : integer;         //临时记录后2个骰子的计算和 
  temp2 : integer;         //临时记录最后一个骰子的计算结果  
begin
  dice_num := GetRandomDiceTotal();       //取得三个骰子的和 
  dice1 := Random(6) + 1;
  dice2 := Random(6) + 1;
  temp1 := dice_num - dice1;
  temp2 := temp1 - dice2;
  
//处理第一个骰子随机值出来后，用三个骰子的和减去该值，如后2个骰子之和小于2，则证明第一个骰子取值过大，自减一继续计算直到符合条件退出循环   
  while (temp1 < 2) do       
  begin
    dice1 := dice1 - 1;
    temp1 := dice_num - dice1;
    temp2 := temp1 - dice2;
  end;
//处理第一个骰子随机值出来后，用三个骰子的和减去该值，如后2个骰子之和大于12，则证明第一个骰子取值过小，自加一继续计算直到符合条件退出循环
  while (temp1 > 12) do
  begin
    dice1 := dice1 + 1;
    temp1 := dice_num - dice1;
    temp2 := temp1 - dice2;
  end;
//第一个骰子已决定，计算处理第二个骰子的值
//用三个骰子之和减去前两个骰子的值，判断第三个骰子的值是否在1至6中间
//该值小于1，则说明第二个骰子取值过大，需要自减1
//该值大于6，则说明第二个骰子取值过小，需要自加1 
  while (temp2 < 1) do
  begin
    dice2 := dice2 - 1;
    temp2 := temp1 - dice2;
  end;
  while (temp2 > 6) do
  begin
    dice2 := dice2 + 1;
    temp2 := temp1 - dice2;
  end;
//循环退出，三个骰子值均计算得出，重新赋给骰子界面
//用11号活动的5、6、7变量分别记录1-3个骰子的结果 
  dice3 := temp2;         
  This_Player.SetV(0,1,dice1);
  This_Player.SetV(0,2,dice2);
  This_Player.SetV(0,3,dice3);
  
  This_Player.SetS(12,5,dice1);
  This_Player.SetS(12,6,dice2);
  This_Player.SetS(12,7,dice3);
  This_Player.SetS(12,3,0);
  This_Player.SetS(12,8,100);
end;

procedure GivePlayerPrize(prize_item:string);
begin
  This_Npc.NpcDialog(This_Player,
  '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ',' + inttostr(This_Player.GetS(12,7))+'，\'
  +'你获得了奖励为：' + prize_item + '，赶紧打开包裹查看一下吧！'
  );
  This_Player.Give(prize_item,1);
  This_Npc.NpcNotice('恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：' + prize_item + '！');
  This_Player.SetS(12,2,0);
  This_Player.SetS(12,4,1000); 
  This_Player.SetS(12,5,0);
  This_Player.SetS(12,6,0);
  This_Player.SetS(12,7,0); 
end; 

procedure _AfterPlayDice();
var dice1 : Integer;
    dice2 : Integer;
    dice3 : Integer;
    temp3 : integer;
    dice_num : Integer; 
begin
  if (CompareText(This_Player.MapName, 'em002~60') <> 0) or (This_Player.GetS(12, 2) < 60) then
  _DoExit;
     
  dice1 := This_Player.GetS(12, 5);
  dice2 := This_Player.GetS(12, 6);
  dice3 := This_Player.GetS(12, 7);
  dice_num := dice1 + dice2 + dice3;
  if (dice1 > 0) and (dice2 > 0) and (dice3 > 0) then
  begin
    //清空骰子的设值 
    This_Player.SetV(0, 1, 0);
    This_Player.SetV(0, 2, 0);
    This_Player.SetV(0, 3, 0);   
    //显示骰子值给予奖励的过程 
    case dice_num of
      3:
      begin
          temp3 := random(2) + 1;
          if temp3 = 1 then
          begin
            GivePlayerPrize('屠龙');
          end
          else
          begin
            GivePlayerPrize('嗜魂法杖');
          end ; 

      end;
      4:
      begin
          temp3 := random(5) + 1;
          if temp3 = 1 then
          begin
            GivePlayerPrize('怒斩');
          end
          else if temp3 = 2 then
          begin
            GivePlayerPrize('龙牙');
          end
          else if temp3 = 3 then
          begin
            GivePlayerPrize('逍遥扇');
          end
          else
          begin
            This_Npc.NpcDialog(This_Player,
            '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
            +'你获得了奖励为：怒斩级装备随机一件！'
            );
            This_Npc.GiveConfigPrize(This_Player,5,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
          end;
      end;
      5,17: 
      begin
         This_Player.Give('热血积分',5);
      end;
      6,9,12,16:
      begin
        This_Player.Give('热血积分',3);
      end;
      7:
      begin
        This_Npc.NpcDialog(This_Player,
        '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
        +'你获得了奖励为：2000万经验！'
          );
        This_Npc.GiveConfigPrize(This_Player,38,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
      end;
      8,13:
      begin
        This_Npc.NpcDialog(This_Player,
        '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
        +'你获得了奖励为：1800万经验！'
          );
        This_Npc.GiveConfigPrize(This_Player,39,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
      end;
      10:
      begin
        This_Npc.NpcDialog(This_Player,
        '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
        +'你获得了奖励为：1600万经验！'
          );
        This_Npc.GiveConfigPrize(This_Player,40,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
      end;
      11:
      begin
        This_Npc.NpcDialog(This_Player,
        '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
        +'你获得了奖励为：1700万经验！'
          );
        This_Npc.GiveConfigPrize(This_Player,41,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
      end;
      14:
      begin
        This_Npc.NpcDialog(This_Player,
        '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
        +'你获得了奖励为：1850万经验！'
          );
        This_Npc.GiveConfigPrize(This_Player,44,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
      end;
      15:
      begin
        This_Npc.NpcDialog(This_Player,
        '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
        +'你获得了奖励为：1900万经验！'
          );
        This_Npc.GiveConfigPrize(This_Player,45,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
      end;
      18:
      begin
        This_Npc.NpcDialog(This_Player,
        '骰子的点数为： ' + inttostr(This_Player.GetS(12,5)) + ',' + inttostr(This_Player.GetS(12,6)) + ','  + inttostr(This_Player.GetS(12,7))+'，\'
        +'你获得了奖励为：魔龙系列首饰，赶紧打开包裹查看一下吧！'
          );
        This_Npc.GiveConfigPrize(This_Player,17,'恭喜：'+ This_Player.Name + '在藏宝阁60号密室获得：<$GIFTITEM>！');
      end;
    end;
  end;
  This_Player.SetS(12,2,0);  
  This_Player.SetS(12,4,1000);   
  This_Player.SetS(12,5,0);
  This_Player.SetS(12,6,0);
  This_Player.SetS(12,7,0);
  This_Player.SetS(12,8,0);
end;

procedure _gotoprize488;
begin
  if This_Player.GetS(12, 2) < 60 then
  _DoExit;

  if This_Player.GetS(12,4) = 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经获得了一次奖励，想要再获得，必须重新开始！\'
    +'|{cmd}<离开藏宝阁/@leave>'
    );
  end
  else if compareText(This_Player.MapName,'em002~60') = 0 then
  begin
    if (This_Player.GetV(0, 1) > 0) or (This_Player.GetV(0, 2) > 0) or (This_Player.GetV(0, 3) > 0) then
    begin
    _DoExit;
    end;
    
    if (This_Player.Level >= 35) and (This_Player.FreeBagNum >= 4) and (This_Player.GetBagItemCount('乾坤令包') >= 1) then
    begin
      This_Player.Take('乾坤令包',1);
      //设置3个骰子的点数 
      if This_Player.GetS(12,8) < 100 then
      SetAllDice();
      This_Npc.PlayDice(This_Player, 3,'@AfterPlayDice');
    end
    else if (This_Player.Level >= 35) and (This_Player.FreeBagNum >= 4) and (This_Player.GetBagItemCount('乾坤令') >= 5) then
    begin
      This_Player.Take('乾坤令',5);
      //设置3个骰子的点数 
      if This_Player.GetS(12,8) < 100 then
      SetAllDice();       
      This_Npc.PlayDice(This_Player, 3,'@AfterPlayDice');
    end
    else if This_Player.Level < 35 then
    begin
      This_Npc.NpcDialog(This_Player,
      '必须达到35级以上，方可进入藏宝阁！');
    end
    else if This_Player.FreeBagNum < 4 then
    begin
      This_Npc.NpcDialog(This_Player,
      '先清理一下包裹，至少留有5个以上的包裹空间再来找我吧！！');
    end
    else if This_Player.GetBagItemCount('乾坤令') < 5 then
    begin
      This_Npc.NpcDialog(This_Player,
      '如果你有足够的乾坤令，就赶快交给我吧，不然我怎么让你投骰子呢！');
    end; 
  end
  else
  begin
    _DoExit;
  end; 
end;

procedure _gostar;
begin
  if compareText(This_Player.MapName,'em002~60') = 0 then
  begin
     This_Player.RandomFlyTo('em002');
  end;
end;

procedure _leave;
begin
  if compareText(This_Player.MapName,'em002~60') = 0 then
  begin
    This_Player.FlyTo('3',330,330);
  end;
end;

begin
  domain;
end.  