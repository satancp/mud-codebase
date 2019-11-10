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
   if This_Player.IsTeamMember then
   begin 
      This_Npc.NpcDialog(This_Player,
      '看来你带朋友来了，你已经了解了此处名胜，\可以考虑去一线天看看了。\难得你有兴趣听了我这么多唠叨，这点东西算是一点心意了。\ \'
      +'|{cmd}<获得馈赠物品/@give_present>\ \'
      //+'|{cmd}<前往下一位旅行者处/@give_pretNo4>\ \'
      +'|{cmd}<关闭/@doexit>'); 
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '（玛法旅行家看了看你，又看了看你空荡荡的身边，\眼神里闪出一丝不屑，并不理会你的询问。）'); 
   end;
end;

procedure _give_pretNo4;
var
  data1, iRan, iTemnum, iTemn02, iTemExp, iRan2: integer;
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
  end else if not (This_Player.IsTeamMember) then
  begin
     This_Npc.NpcDialog(This_Player,
     '（玛法旅行家看了看你，又看了看你空荡荡的身边，\眼神里闪出一丝不屑，并不理会你的询问。）'); 
  end else
  begin
    if This_Player.GetS(17,6) = 6 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去一线天看看了。');
       Exit;
    end else if This_Player.GetS(17,6) <> 5 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去其他地方看看了。');
    end else 
    begin
       if This_Player.FreeBagNum < 2 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你的包裹太满了，还是先整理一下再来找我吧。');
       end else
       begin
          This_Player.SetS(17,6,6);
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
             iTemExp := iTemnum * 24000;
             iTemExp := iTemExp + 240000;
             
             //{$IFDEF Q106_tehui}
             //iTemExp := iTemExp div 5;
             //{$ELSE}
             iTemExp := Round(iTemExp * 0.05);
             //{$ENDIF}
             
             This_Player.Give('经验',iTemExp);
             This_Npc.NpcDialog(This_Player,
             '你已经了解了此处名胜，可以考虑去一线天看看了。');
          end else
          begin
             This_Player.Give('巡游手记第六章',1);
             This_Npc.NpcDialog(This_Player,
             '你已经了解了此处名胜，可以考虑去一线天看看了。');
          end;
          
          iRan2 := Random(2) + 1;
          if iRan2 = 1 then
          begin
             This_Player.Give('祝福油',1);
          end else
          begin
             This_Player.Give('魔族指令书',1);
          end; 
          
          This_Player.CallOut(This_NPC,1,'RightFly06');
          //This_Player.Flyto('YXSD',46,53);
          //This_Npc.CloseDialog(This_Player);
       end;
    end;
  end;
end;

//一秒后自动传送 
procedure RightFly06; 
begin
  if CompareText(This_Player.MapName, 'R001') = 0 then
  begin
     This_Player.RandomFlyTo('D618');
  end;
end;

procedure _give_present;
var
  data1, iRan, iTemnum, iTemn02, iTemExp, iRan2: integer;
begin
  data1 := GetDateNum(GetNow);
  if This_Player.GetS(17,5) <> data1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '欢迎来到玛法大陆！');
  end else if not (This_Player.IsTeamMember) then
  begin
     This_Npc.NpcDialog(This_Player,
     '（玛法旅行家看了看你，又看了看你空荡荡的身边，\眼神里闪出一丝不屑，并不理会你的询问。）'); 
  end else
  begin
    if This_Player.GetS(17,6) = 6 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去一线天看看了。');
       Exit;
    end else if This_Player.GetS(17,6) <> 5 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经了解了此处名胜，可以考虑去其他地方看看了。');
    end else 
    begin
       if This_Player.FreeBagNum < 2 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你的包裹太满了，还是先整理一下再来找我吧。');
       end else
       begin
          This_Player.SetS(17,6,6);
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
             iTemExp := iTemnum * 24000;
             iTemExp := iTemExp + 240000;
             
             //{$IFDEF Q106_tehui}
             //iTemExp := iTemExp div 5;
             //{$ELSE}
             iTemExp := Round(iTemExp * 0.05);
             //{$ENDIF}
             
             This_Player.Give('经验',iTemExp);
          end else
          begin
             This_Player.Give('巡游手记第六章',1);
          end;
          
          iRan2 := Random(2) + 1;
          if iRan2 = 1 then
          begin
             This_Player.Give('魔族指令书',1);
          end else
          begin
             This_Player.Give('礼花(小)',1);
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
   if (iTod = This_Player.GetS(17,5)) and ((This_Player.GetS(17,6) = 5) or (This_Player.GetS(17,6) = 6)) then
   begin
      This_Npc.NpcDialog(This_Player,
      '传说中，桃园之门是通向桃园的入口。\桃园是一个无忧无虑，没有争斗，没有仇恨的美好的地方。\'
      +'只是没有人知道，如何到达。没有人知道前往桃园的方法。\桃园之门的特殊，更在于，只有这里能够看到自由的神兽。\'
      +'他们就像秘密的守护者，守护着桃园之门。\也许通往桃园的秘密就在他们身上。当然，也仅仅是我个人的猜测。\ \'
      +'|{cmd}<谢谢你的故事，继续玛法名胜巡游/@next_step>\'
      +'|{cmd}<玛法巡游手记（任务规则）/@RuleXY>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '欢迎来到玛法大陆！');  
   end;
end. 