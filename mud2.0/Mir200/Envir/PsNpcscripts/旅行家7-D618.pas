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
      //This_Player.Give('经验',5000000);
      This_Player.Give('经验',500000);
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
   '看来你带朋友来了，你已经了解了此处名胜，\可以考虑去丛林迷宫看看了。\难得你有兴趣听了我这么多唠叨，这点东西算是一点心意了。\ \'
   +'|{cmd}<获得馈赠物品/@give_present>\ \'
   //+'|{cmd}<前往下一位旅行者处/@give_pretNo4>\ \'
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
    This_Npc.NpcDialog(This_Player,
    '欢迎来到玛法大陆！');
  end else
  begin
    if This_Player.GetS(17,6) = 7 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去丛林迷宫看看了。');
       Exit;
    end else if This_Player.GetS(17,6) <> 6 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去其他地方看看了。');
    end else 
    begin
       if This_Player.FreeBagNum < 1 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你的包裹已经满了，还是先整理一下再来找我吧。');
       end else
       begin
          This_Player.SetS(17,6,7);
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
             iTemExp := iTemnum * 28000;
             iTemExp := iTemExp + 280000;
             
             //{$IFDEF Q106_tehui}
             //iTemExp := iTemExp div 5;
             //{$ELSE}
             iTemExp := Round(iTemExp * 0.05);
             //{$ENDIF}
             
             This_Player.Give('经验',iTemExp);
             This_Npc.NpcDialog(This_Player,
             '你已经了解了此处名胜，可以考虑去丛林迷宫看看了。');
          end else
          begin
             This_Player.Give('巡游手记第七章',1);
             This_Npc.NpcDialog(This_Player,
             '你已经了解了此处名胜，可以考虑去丛林迷宫看看了。');
          end;
          
          This_Player.CallOut(This_NPC,1,'RightFly07');
          //This_Player.Flyto('11',360,245);
          //This_Npc.CloseDialog(This_Player);
       end;
    end;
  end;
end;

//一秒后自动传送 
procedure RightFly07; 
begin
  if CompareText(This_Player.MapName, 'D618') = 0 then
  begin
     This_Player.Flyto('11',360,245);
  end;
end; 

procedure _give_present;
var
  data1, iRan, iTemnum, iTemn02, iTemExp: integer;
begin
  data1 := GetDateNum(GetNow);
  if This_Player.GetS(17,5) <> data1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '欢迎来到玛法大陆！');
  end else
  begin
    if This_Player.GetS(17,6) = 7 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去丛林迷宫看看了。');
       Exit;
    end else if This_Player.GetS(17,6) <> 6 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去其他地方看看了。');
    end else 
    begin
      if This_Player.FreeBagNum < 1 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你的包裹已经满了，还是先整理一下再来找我吧。');
       end else
       begin
          This_Player.SetS(17,6,7);
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
             iTemExp := iTemnum * 28000;
             iTemExp := iTemExp + 280000;
             
             //{$IFDEF Q106_tehui}
             //iTemExp := iTemExp div 5;
             //{$ELSE}
             iTemExp := Round(iTemExp * 0.05);
             //{$ENDIF}
             
             This_Player.Give('经验',iTemExp);
          end else
          begin
             This_Player.Give('巡游手记第七章',1);
          end;
          This_Npc.CloseDialog(This_Player);
       end;
    end;
  end;
end; 

var
  iTod : integer;
begin
   iTod := GetDateNum(GetNow());
   if (iTod = This_Player.GetS(17,5)) and ((This_Player.GetS(17,6) = 6) or (This_Player.GetS(17,6) = 7)) then
   begin
      This_Npc.NpcDialog(This_Player,
      '魔龙教主，恐怕是现在玛法大陆上已知的最强怪物了。\自从魔龙城被发现，整个玛法大陆每天都能够听到它的咆哮和怒吼。\'
      +'勇敢的人们不断的向这个威胁我们的巨魔发起着挑战。\这是一场艰苦卓绝的战斗。来吧，勇士，\'
      +'看看这里怪物们狰狞的面孔，举起你手中的武器，\去挑战它，去挑战你自己。\ \'
      +'|{cmd}<谢谢你的故事，继续玛法名胜巡游/@next_step>\'
      +'|{cmd}<玛法巡游手记（任务规则）/@RuleXY>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '欢迎来到玛法大陆！');  
   end;
end. 