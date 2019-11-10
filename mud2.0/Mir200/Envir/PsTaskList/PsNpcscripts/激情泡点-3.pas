     {
*******************************************************************}

program Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

function Gaoji0LB(price, num: Integer):boolean;
begin                                               

  result := true;
end;


procedure _YBBG; 
 var
  temp1,temp2 : integer;
begin
  if (GetHour = 11) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<11点00分/c=red>和<19点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 19) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<11点00分/c=red>和<19点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放2！');
  end
  else if (GetHour = 11) and (GetMin >= 00) and (GetMin < 59) then
  begin
    if temp1 = -1 then
    begin
      temp1 := 0;
    end
    if temp1 = GetDateNum(GetNow) then
    begin
      This_Player.CallOut(This_Npc, 1, 'MFBG2');
        This_Player.RandomFlyTo('0139~2');
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
    end
    else
    begin
      temp1 := GetDateNum(GetNow);
      This_Player.CallOut(This_Npc, 1, 'MFBG2');
        This_Player.RandomFlyTo('0139~2');
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
  
    end;
  end
  else if (GetHour = 19) and (GetMin >= 00) and (GetMin < 59) then
  begin
    if temp2 = -1 then
    begin
      temp2 := 0;
    end
    if temp2 = GetDateNum(GetNow) then
    begin
      This_Player.CallOut(This_Npc, 1, 'MFBG2');
        This_Player.RandomFlyTo('0139~2');
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
    end
    else
    begin
      temp2 := GetDateNum(GetNow);
      This_Player.CallOut(This_Npc, 1, 'MFBG2');
        This_Player.RandomFlyTo('0139~2');
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 

    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '现在还不到时候，活动将在每天的11点00分和19点00分开放进入！\你过段时间再来吧。\ \');
  end;
end;


procedure MFBG2;

begin
  
      if (GetHour = 11)  or (GetHour = 19) and (GetMin < 59) then
         
      begin
         if CompareText(This_Player.MapName,'0139~2') = 0 then
         begin
            This_Player.CallOut(This_Npc, 1, 'MFBG2');
            This_Player.Give('经验',5000);
         end;
       end 
         else  
          begin
          
             This_Player.FlyTo('3', 333, 333);
          
             
            
         end ; 
        
end;





begin
   This_NPC.NpcDialog(This_Player,
   '活动将在<每天/c=red>的<11点/c=red>和<19点/c=red>开放！\|'
   +'开放进入时间为<11点00分/c=red>和<19点00分/c=red>。\|'
   +'每次开放时间60分钟，进入地图每秒获得<5000经验/c=red>。\|'
   +'更有几率刷新福利怪物.\|'
   +'免费泡点不限制等级.\|'
   +'|{cmd}<◆我要进入/@YBBG>');
end.    