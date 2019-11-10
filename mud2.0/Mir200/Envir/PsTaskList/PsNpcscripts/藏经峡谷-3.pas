procedure _cj;
begin
  This_Npc.NpcDialog(This_Player,          
   '活动将在<每天/c=red>的<16点/c=red>和<19点/c=red>开放！\'+
   '开放进入时间为<16点00分/c=red>和<19点00分/c=red>。\'+
   '每次开放时间60分钟，峡谷内隐藏大量携带经书的使者。\'+
   '击败他们！让他们现出原形，获得珍贵的书页！！\ \'+
   '|{cmd}<马上进入/@zou1>'); 
end;

procedure _zou1;
var
  temp1,temp2 : integer;
begin
  if (GetHour = 16) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<16点00分/c=red>和<19点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 19) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<16点00分/c=red>和<19点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 16) and (GetMin >= 00) and (GetMin < 60) then
  begin
    if temp1 = -1 then
    begin
      temp1 := 0;
    end
    if temp1 = GetDateNum(GetNow) then
    begin
      This_Player.RandomFlyTo('R001~21');
    end
    else
    begin
      temp1 := GetDateNum(GetNow);
      This_Player.RandomFlyTo('R001~21');
  
    end;
  end
  else if (GetHour = 19) and (GetMin >= 00) and (GetMin < 60) then
  begin
    if temp2 = -1 then
    begin
      temp2 := 0;
    end
    if temp2 = GetDateNum(GetNow) then
    begin
      This_Player.RandomFlyTo('R001~21');
    end
    else
    begin
      temp2 := GetDateNum(GetNow);
      This_Player.RandomFlyTo('R001~21');

    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '现在还不到时候，活动将在每天的16点00分和19点00分开放进入！\你过段时间再来吧。\ \');
  end;
end;

  begin
This_Npc.NpcDialog(This_Player,
   '每天<16:00--17:00/c=red>，晚上<19:00--20:00/c=red>，\'+
   '将开放藏经峡谷，可以爆出书页，记得准时来哦\ \'+
   
   '|{cmd}<藏经峡谷/@cj>\ \'
  // +mail_str
   );
end.