{
*******************************************************************}


PROGRAM Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _RuleXY;
begin
   This_Npc.NpcDialog(This_Player,
   '1、玛法巡游的起点在<庄园门外的玛法旅行家/c=red>处\'+
   '2、请务必依照旅行家的提醒<依次/c=red>进行旅行\'+
   '3、如果组队巡游，您将获得额外奖励——经验、巡游手记\'+
   '4、有些旅行家会有些特殊要求，完成要求，能够获得额外的奖励\'+
   '5、巡游结束后，可以到庄园的玛法旅行家处<重新开始/c=red>\'+
   '6、每位旅行家都撰写了自己的<巡游手记/c=red>，如果能够收集齐，\   可以到任意一个巡游者处兑换一份意外的奖励。\'+
   '7、每天的0点、12点、20点、22点，可以在我这里展开<巡游竞赛/@XunYouCP>。\'+
   '|{cmd}<我收集齐玛法巡游手记了/@RuleXY_01>                    ^<返回/@main>\'
   ); 
end;

procedure _RuleXY_01;
begin
   if (This_Player.GetBagItemCount('巡游手记第一章') > 0) and (This_Player.GetBagItemCount('巡游手记第二章') > 0) and (This_Player.GetBagItemCount('巡游手记第三章') > 0) 
      and (This_Player.GetBagItemCount('巡游手记第四章') > 0) and (This_Player.GetBagItemCount('巡游手记第五章') > 0) and (This_Player.GetBagItemCount('巡游手记第六章') > 0) 
      and (This_Player.GetBagItemCount('巡游手记第七章') > 0) and (This_Player.GetBagItemCount('巡游手记第八章') > 0) and (This_Player.GetBagItemCount('巡游手记第九章') > 0) then
   begin
      This_Player.Take('巡游手记第一章',1); 
      This_Player.Take('巡游手记第二章',1);
      This_Player.Take('巡游手记第三章',1);
      This_Player.Take('巡游手记第四章',1);
      This_Player.Take('巡游手记第五章',1);
      This_Player.Take('巡游手记第六章',1);
      This_Player.Take('巡游手记第七章',1);
      This_Player.Take('巡游手记第八章',1);
      This_Player.Take('巡游手记第九章',1);
      This_Player.Give('经验',500000);
      //This_Player.Give('经验',500000);
      This_Npc.NpcDialog(This_Player,
      '恭喜你收集齐所有的玛法巡游手记，为玛法的历史增添了亮丽的一笔。');
      This_NPC.NpcNotice('恭喜：' + This_Player.Name + '收集齐所有的玛法巡游手记，为玛法的历史增添了亮丽的一笔。')
      //This_Player.AddspMakedrugenergy(10000);  
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '您没有收集齐所有的玛法巡游手记，请继续努力。'); 
   end;
end;

procedure _next_step;
begin
   This_Npc.NpcDialog(This_Player,
   '你已经了解了此处名胜，可以考虑去苍海码头看看了。\难得你有兴趣听了我这么多唠叨，这点东西算是一点心意了。\ \'
   +'|{cmd}<获得馈赠物品/@give_present>\ \'
   //+'|{cmd}<前往下一位旅行家处/@give_pretNo4>\ \'
   +'|{cmd}<关闭/@doexit>'); 
end;

procedure _give_pretNo4;
var
  data1, iRan, iTemnum, iTemn02, iTemExp: integer;
begin
  data1 := GetDateNum(GetNow);
  if (GetHour = 12) and (GetMin <= 30) then
  begin
     if (data1 <> This_Player.GetS(17,16)) and (data1 = This_Player.GetS(17,10)) then
     begin
        This_Npc.NpcDialog(This_Player,
        '你正在参加巡游竞赛活动，不能使用直接传送到下一位旅行家处！\ \'
        +'|{cmd}<返回/@main>');
        Exit;
     end;
  end else if (GetHour = 20) and (GetMin <= 30) then
  begin
     if (data1 <> This_Player.GetS(17,17)) and (data1 = This_Player.GetS(17,11)) then
     begin
        This_Npc.NpcDialog(This_Player,
        '你正在参加巡游竞赛活动，不能使用直接传送到下一位旅行家处！\ \'
        +'|{cmd}<返回/@main>');
        Exit;
     end;
  end else if (GetHour = 22) and (GetMin <= 30) then
  begin
     if (data1 <> This_Player.GetS(17,18)) and (data1 = This_Player.GetS(17,12)) then
     begin
        This_Npc.NpcDialog(This_Player,
        '你正在参加巡游竞赛活动，不能使用直接传送到下一位旅行家处！\ \'
        +'|{cmd}<返回/@main>');
        Exit;
     end;
  end else if (GetHour = 0) and (GetMin <= 30) then
  begin
     if (data1 <> This_Player.GetS(17,19)) and (data1 = This_Player.GetS(17,13)) then
     begin
        This_Npc.NpcDialog(This_Player,
        '你正在参加巡游竞赛活动，不能使用直接传送到下一位旅行家处！\ \'
        +'|{cmd}<返回/@main>');
        Exit;
     end;
  end;
  

    if This_Player.GetS(17,5) <> data1 then
    begin                 
       if This_Player.FreeBagNum > 0 then
       begin   
          This_Player.SetS(17,5,data1);    //如果玩家是当天的第一次跑环开始，则记录当天的日期；
          This_Player.SetS(17,6,1);        //记录任务阶段——第一步； 
          This_Player.SetS(17,7,0);        //如果玩家是当天的第一次跑环开始，则将他的次数置为0； 
          iRan := Random(10000) + 1;
          iTemn02 := 0;
          iTemnum := 0;
          if This_Player.IsTeamMember then
          begin
             iTemnum := This_Player.MemberCount;                               //是否为-1或0
             iTemnum := iTemnum - 1;
             iTemn02 := iTemnum * 100; 
             if iTemnum >= 11 then
             begin
                iTemn02 := 900;
             end;
          end;
      
          if iRan <= 9999 then
          begin
             iTemExp := iTemnum * 4000;
             iTemExp := iTemExp + 40000;
             
             //{$IFDEF Q106_tehui}
             //iTemExp := iTemExp div 5;
             //{$ELSE}
             iTemExp := Round(iTemExp * 0.05);
             //{$ENDIF}
             
             This_Player.Give('经验',iTemExp);
          end else
          begin
             This_Player.Give('巡游手记第一章',1);
          end;
          This_Player.CallOut(This_NPC,1,'RightFly01');
          //This_Player.Flyto('5',106,342);
          This_Npc.CloseDialog(This_Player);
       end;
    end else if This_Player.GetS(17,6) = 1 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去苍海码头看看了。');
    end else
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去其他地方看看了。');
    end; 
end;

//一秒后自动传送 
procedure RightFly01; 
begin
  if CompareText(This_Player.MapName, 'GA0') = 0 then
  begin
     This_Player.Flyto('5',106,342);
  end;
end;

procedure _give_present;
var
  data1, iRan, iTemnum, iTemn02, iTemExp: integer;
begin
  data1 := GetDateNum(GetNow);
    if This_Player.GetS(17,5) <> data1 then
    begin
       if This_Player.FreeBagNum < 1 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你的包裹已经满了，还是先整理一下再来找我吧。');
       end else
       begin                
          This_Player.SetS(17,5,data1);    //如果玩家是当天的第一次跑环开始，则记录当天的日期；
          This_Player.SetS(17,6,1);        //记录任务阶段——第一步； 
          This_Player.SetS(17,7,0);        //如果玩家是当天的第一次跑环开始，则将他的次数置为0； 
          iRan := Random(10000) + 1;
          iTemn02 := 0;
          iTemnum := 0;
          if This_Player.IsTeamMember then
          begin
             iTemnum := This_Player.MemberCount;                               //是否为-1或0
             iTemnum := iTemnum - 1;
             iTemn02 := iTemnum * 100; 
             if iTemnum >= 11 then
             begin
                iTemn02 := 900;
             end;
          end;
      
          if iRan <= 9999 then
          begin
             iTemExp := iTemnum * 4000;
             iTemExp := iTemExp + 40000;
             
             //{$IFDEF Q106_tehui}
             //iTemExp := iTemExp div 5;
             //{$ELSE}
             iTemExp := Round(iTemExp * 0.05);
             //{$ENDIF}
             
             This_Player.Give('经验',iTemExp);
             This_Npc.NpcDialog(This_Player,
             '你已经了解了此处名胜，可以考虑去苍海码头看看了。');
          end else
          begin
             This_Player.Give('巡游手记第一章',1);
             This_Npc.NpcDialog(This_Player,
             '你已经了解了此处名胜，可以考虑去苍海码头看看了。');
          end;
          //This_Npc.CloseDialog(This_Player);
       end;
    end else if This_Player.GetS(17,6) = 1 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去苍海码头看看了。');
    end else
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去其他地方看看了。');
    end;
end; 


//重新领略玛法名胜的魅力，即重新接任务 
procedure _relooktm;
var
  iDiaNum, itemp01, itemp02, icount, iTod: integer;
  sDiaNum : string;
begin
   itemp01 := This_Player.GetS(17,7);
   iTod := GetDateNum(GetNow()); 
   if (itemp01 <= 0) or (iTod <> This_Player.GetS(17,5)) then                            //若还没有完成第一次，结束！ 
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天还没有看完玛法9大名胜.');
      Exit;
   end else if (iTod = This_Player.GetS(17,5)) and (This_Player.GetS(17,6) > 0) then     //若已经开始了任务，但还没有跑完一遍，结束！
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没有看完玛法9大名胜，怎么能重新开始呢？');
      Exit;
   end else if (itemp01 > 20) and (iTod = This_Player.GetS(17,5)) then                   //若重接的次数超过10次，结束！ 
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天已经浏览了很多次玛法名胜，请改日再来吧.');
      Exit;
   end else
   begin
      itemp02 := 1;
      if itemp01 > 1 then                                                             //设置临时变量itemp02的初始值=1； 
      begin 
         for icount := 2 to itemp01 do                                                //若已经是第二次或者第二次以上，须收取(次数-1)*2*100的金刚石； 
         begin
            itemp02 := itemp02*2;
         end;  
      end;
      
      iDiaNum := itemp02*100;
      sDiaNum := IntToStr(2);                                                   //得到金刚石数目，并转换为字符串； 
   end;
   
   This_Npc.NpcDialog(This_Player,
   '看来您对玛法名胜颇感兴趣。想必您也知道，工作了一天的人，\'+
   '通常是很累的。如果您能够给我<' + sDiaNum + '/c=red>颗金刚石去买点水喝，\'+
   '我想我愿意为您再讲述一遍这些名胜的魅力。\ \'+
   '|{cmd}<支付'+ sDiaNum +'金刚石，聆听玛法名胜的故事/@reloktnow~' + sDiaNum + '>\|{cmd}<对不起，我很忙/@doexit>'); 
end;

Procedure _reloktnow(sdianum : string);
var
  idianum ,iRan, iTemnum, iTod, iTemn02, iTemExp: integer;
begin
   iTod := GetDateNum(GetNow());
   idianum := StrToIntDef(sdianum, -1);
   if (idianum = -1) or (This_Player.GetS(17,7) > 20) or (iTod <> This_Player.GetS(17,5)) then
   begin
      Exit;
   end else if (iTod = This_Player.GetS(17,5)) and (This_Player.GetS(17,6) > 0) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没有看完玛法9大名胜，怎么能重新开始呢？');
      Exit;
   end else if This_Player.FreeBagNum < 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你的包裹已经满了，还是先整理一下再来找我吧。');
      Exit; 
   end else if This_Player.MyDiamondnum >= idianum then
   begin
      This_Player.TakeDiamond(idianum, This_NPC);
      This_Player.SetS(17,6,1);
      iRan := Random(10000) + 1;
      iTemn02 := 0;
      iTemnum := 0;
      if This_Player.IsTeamMember then
      begin
         iTemnum := This_Player.MemberCount;                               //在组队的情况下，得到该队伍的人数； 
         iTemnum := iTemnum - 1;
         iTemn02 := iTemnum * 100; 
         if iTemnum >= 11 then
         begin
            iTemn02 := 900;
         end; 
      end;
      
      if iRan <= 9999 then
      begin
         //给予经验，根据组队人数的多少给予奖励不同——奖励递增；
         iTemExp := iTemnum * 4000;
         iTemExp := iTemExp + 40000;
         
         //{$IFDEF Q106_tehui}
         //iTemExp := iTemExp div 5;
         //{$ELSE}
         iTemExp := Round(iTemExp * 0.05);
         //{$ENDIF}
         
         This_Player.Give('经验',iTemExp);
      end else
      begin
         This_Player.Give('巡游手记第一章',1);
      end;
      This_Npc.NpcDialog(This_Player,
      '你已经了解了此处名胜，可以考虑再去苍海码头看看了。\'+
      '难得你有兴趣听了我这么多唠叨，这点东西算是一点心意了。\ \');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有足够的金刚石，还是请改天再来吧.');
   end;
end;

//报名竞赛活动； 
procedure _XunYouCP;
begin
   This_Npc.NpcDialog(This_Player,
   '1、每天<0点、12点、20点、22点/c=red>开始一轮巡游竞赛\'+
   '2、巡游竞赛开始后，玩家可以到我这报名，并开始竞赛\'+
   '3、巡游的内容是巡游玛法的9个名胜，和<9个玛法旅行者/c=red>完成对话\'+
   '4、前十名将获得额外奖励\'+ 
   '5、在规定时间内完成的都将能够获得奖励\'+
   '6、规定时间为：<30分钟/c=red>\'+
   '7、每一轮竞赛任何时候都能报名，但是报名者必须从头开始，\'+
   '   即使之前已经巡游了不少名胜。\'+
   '|{cmd}<报名参赛/@next_step02>          ^<完成巡游，领取奖励/@give_present03>         ^<返回/@main>');
end;

procedure _next_step02;
begin
   This_Npc.NpcDialog(This_Player,
   '你已经了解了此处名胜，可以考虑去苍海码头看看了。\不过你要参加竞赛，就得交给我2颗金刚石，怎么样，你想好了吗？\ \'
   +'|{cmd}<给予2颗金刚石报名参赛/@relooktm02>                  ^<关闭/@doexit>'); 
end;

procedure _relooktm02;
var
  iDiaNum, itemp01, itemp02, icount, iTod, iRan, iTemn02, iTemnum, iTemExp, iHour, iSset01: integer;
  sDiaNum : string;
  dNow : double;
begin
   dNow := GetNow;
   itemp01 := This_Player.GetS(17,7);
   iTod := GetDateNum(dNow);
   if (itemp01 > 20) and (iTod = This_Player.GetS(17,5)) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天已经浏览了很多次玛法名胜，请改日再来吧.');
      Exit;
   end;
   
   if (This_Player.MyDiamondnum < 2) then
   begin
      This_Npc.NpcDialog(This_Player,
      '口真渴，要是能有2颗金刚石兑换一些泉水喝就好了.');
      Exit;
   end;
   
   if This_Player.FreeBagNum < 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你的包裹已经满了，还是先整理一下再来找我吧。');
   end;
    
   if (GetHour = 12) and (GetMin <= 30) then
   begin
      iHour := 12;
      iSset01 := 16;
      if iTod <> GetG(13,5) then
      begin 
         SetG(13,5,iTod);
         SetG(13,6,0);
      end;
   end else if (GetHour = 20) and (GetMin <= 30) then
   begin
      iHour := 20;
      iSset01 := 17;
      if iTod <> GetG(13,7) then
      begin 
         SetG(13,7,iTod);
         SetG(13,8,0);
      end;
   end else if (GetHour = 22) and (GetMin <= 30) then
   begin
      iHour := 22;
      iSset01 := 18;
      if iTod <> GetG(13,9) then
      begin 
         SetG(13,9,iTod);
         SetG(13,10,0);
      end;
   end else if (GetHour = 0) and (GetMin <= 30) then
   begin
      iHour := 0;
      iSset01 := 19;
      if iTod <> GetG(13,11) then
      begin 
         SetG(13,11,iTod);
         SetG(13,12,0);
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '非活动时间！');
      Exit;
   end;
   
   if (GetHour = iHour) and (GetMin <= 30) then
   begin
      if iTod = This_Player.GetS(17,iSset01) then
      begin
         This_Npc.NpcDialog(This_Player,
         '已经完成了该时段的任务！');
         Exit;
      end else
      begin
         iSset01 := iSset01 - 6;
         if iTod = This_Player.GetS(17,iSset01) then
         begin
            This_Npc.NpcDialog(This_Player,
            '已经报名参加了比赛，快去完成它吧！');
            Exit;
         end else
         begin
            This_Player.SetS(17,iSset01,iTod);                     //即XX点-XX点30之间报名标记，下同 
         end;
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '非活动时间！');
      Exit;
   end; 

      This_Player.TakeDiamond(2,This_Npc);  
      This_Player.SetS(17,6,1);
      if iTod <> This_Player.GetS(17,5) then       //如果玩家是当天的第一次跑环开始；
      begin 
         This_Player.SetS(17,7,0);    
         This_Player.SetS(17,5,iTod);
      end;
        
      iRan := Random(10000) + 1;
      iTemn02 := 0;
      iTemnum := 0;
      if This_Player.IsTeamMember then
      begin
         iTemnum := This_Player.MemberCount;                               //是否为-1或0 
         iTemnum := iTemnum - 1;
         iTemn02 := iTemnum * 100; 
         if iTemnum >= 11 then
         begin
            iTemn02 := 900;
         end;
      end;
      
     if iRan <= 9999 then
      begin
         iTemExp := iTemnum * 4000;
         iTemExp := iTemExp + 40000;
         
         //{$IFDEF Q106_tehui}
         //iTemExp := iTemExp div 5;
         //{$ELSE}
         iTemExp := Round(iTemExp * 0.05);
         //{$ENDIF}
         
         This_Player.Give('经验',iTemExp);
      end else
      begin
         This_Player.Give('巡游手记第一章',1);
      end;
      This_Npc.CloseDialog(This_Player); 
end;

Procedure TimePrize(Num2, iGSetg01, iGSetg02, time1: integer);
var
  iGTe ,iTod: integer;
  dNow : double;
begin
   dNow := GetNow; 
   iTod := GetDateNum(dNow);
  
   if (This_Player.GetS(17,6) <> 0) or (iTod <> This_Player.GetS(17,5)) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没有了解完所有的玛法名胜，不能领取奖励！');
      Exit; 
   end;
   
   if (GetHour = time1) and (GetMin <= 30) then
   begin
      iGTe := GetG(13,iGSetg02);
      if iGTe >= 10 then
      begin
         //This_Player.AddspMakedrugenergy(25);
         This_Player.SetS(17,Num2,iTod);
      end else
      begin         
         if iGTe = -1 then
         begin
            iGTe := 1;
         end else
         begin
            iGTe := iGTe + 1;
         end;
         
         if iTod = GetG(13,iGSetg01) then
         begin
            SetG(13,iGSetg02,iGTe);
         end;

         This_Player.SetS(17,Num2,iTod);
      end;
      This_Npc.NpcDialog(This_Player,
      '恭喜你获得额外奖励！');     
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '非活动时间！');
      Exit;
   end;
end;

Procedure _give_present03;
var
  iDiaNum, itemp01, itemp02, icount, iTod, iRan, iTemn02, iTemnum, iTemExp, istat: integer;
  sDiaNum : string;
  dNow : double;
begin
   dNow := GetNow;
   itemp01 := This_Player.GetS(17,7);
   iTod := GetDateNum(dNow);  
   if (GetHour = 12) and (GetMin <= 30) then
   begin
      if iTod = This_Player.GetS(17,16) then
      begin
         This_Npc.NpcDialog(This_Player,
         '你已经在今天的12点到12点30分的时间内完成了任务，\并已经领取过奖励了！');
         Exit; 
      end else if iTod = This_Player.GetS(17,10) then
      begin
         TimePrize(16,5,6,12);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '抱歉，你没有报名参加12点的竞赛活动，不能领取奖励。');
         Exit;
      end;
   end else if (GetHour = 20) and (GetMin <= 30) then
   begin
      if iTod = This_Player.GetS(17,17) then
      begin
         This_Npc.NpcDialog(This_Player,
         '你已经在今天的20点到20点30分的时间内完成了任务，\并已经领取过奖励了！');
         Exit; 
      end else if iTod = This_Player.GetS(17,11) then
      begin
         TimePrize(17,7,8,20);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '抱歉，你没有报名参加20点的竞赛活动，不能领取奖励。');
         Exit;
      end;
   end else if (GetHour = 22) and (GetMin <= 30) then
   begin
      if iTod = This_Player.GetS(17,18) then
      begin
         This_Npc.NpcDialog(This_Player,
         '你已经在今天的22点到22点30分的时间内完成了任务，\并已经领取过奖励了！');
         Exit;
      end else if iTod = This_Player.GetS(17,12) then
      begin
         TimePrize(18,9,10,22);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '抱歉，你没有报名参加22点的竞赛活动，不能领取奖励。');
         Exit;
      end;
   end else if (GetHour = 0) and (GetMin <= 30) then
   begin
      if iTod = This_Player.GetS(17,19) then
      begin
         This_Npc.NpcDialog(This_Player,
         '你已经在今天的0点到0点30分的时间内完成了任务，\并已经领取过奖励了！');
         Exit; 
      end else if iTod = This_Player.GetS(17,13) then
      begin
         TimePrize(19,11,12,0);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '抱歉，你没有报名参加0点的竞赛活动，不能领取奖励。');
         Exit;
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '非活动时间！');
      Exit;
   end;
end; 

begin
   This_Npc.NpcDialog(This_Player,
   '庄园主人是位很奇特的人，据说当年在建庄园时，特意选了这里。\原因就是门口的这个石塔。传说这个石塔原来仅仅是一个块飞来石。\'
   +'三龙卫之一路经此地，觉得灵气充盈。激发无穷气力。\于是对着飞来石击出一掌。顿时石崩土瓦。现出石塔。三龙卫大笑\'
   +'三声离去。因此得名三笑塔。庄主建庄园时，对此地进行了休整。\'
   +'只是自庄主离去，再无人照看，渐渐破落，再无人问津了。\ \'
   +'|{cmd}<谢谢你的故事，继续玛法名胜巡游/@next_step>      ^<玛法巡游手记（任务规则）/@RuleXY>\'
   +'|{cmd}<重新领略玛法名胜的魅力/@relooktm>              ^<巡游竞赛/@XunYouCP>'
   ); 
end. 