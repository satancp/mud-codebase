{
*******************************************************************}

program Mir2;

var
  time1,time2,time3,time4,time5 : integer;  //用来定义每个时间段是否已经爆出过奖励 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure GiveServerPrize();
var
  temp1, temp2, temp3, temp4, temp5, temp6 : integer;
begin
  temp1 := random(100)+1;
  temp2 := random(100)+1;
  temp3 := random(100)+1;
  temp4 := random(60)+1;
  temp5 := random(60)+1;

  This_NPC.NpcDropItem('地下组队卷轴', 8, 3);
  This_NPC.NpcDropItem('祝福油', 8, 3);
  This_NPC.NpcDropItem('魔族指令书', 8, 3);
  This_NPC.NpcDropItem('金条', 8, 1);
  This_NPC.NpcDropItem('5声望包', 8, 1);
  This_NPC.NpcDropItem('50金刚石', 8, 1);
  
  
    

  
  if temp1 <= 90 then
  begin
    This_NPC.NpcDropItem('热血积分', 8, 1);
  end
  else 
  begin
    This_NPC.NpcDropItem('热血积分', 8, 1);
  end;
   if random(100) <= 50 then
  if temp1 <= 80 then    This_NPC.NpcDropItem('绿色项链', 8, 1)
  else if temp1 <= 79 then    This_NPC.NpcDropItem('骑士手镯', 8, 1)
  else if temp1 <= 81 then    This_NPC.NpcDropItem('力量戒指', 8, 1)
  else if temp1 <=84 then    This_NPC.NpcDropItem('灵魂项链', 8, 1)
  else if temp1 <=78 then    This_NPC.NpcDropItem('三眼手镯', 8, 1)
  else if temp1 <=77 then    This_NPC.NpcDropItem('泰坦戒指', 8, 1)
  else if temp1 <=85 then    This_NPC.NpcDropItem('黑铁头盔', 8, 1)
  else if temp1 <=83 then    This_NPC.NpcDropItem('恶魔铃铛', 8, 1)
  else if temp1 <=76 then    This_NPC.NpcDropItem('紫碧螺', 8, 1)
  else if temp1 <=75 then    This_NPC.NpcDropItem('龙之手镯', 8, 1)

  
  


  
  if random(100) <= 10 then
  begin  
      if temp2 <= 10 then
      begin
        This_NPC.NpcDropItem('天魔神甲', 8, 1);
      end
      else if temp2 <= 10 then 
      begin
        This_NPC.NpcDropItem('圣战宝甲', 8, 1);
      end
      else if temp2 <= 15 then 
      begin
        This_NPC.NpcDropItem('天尊道袍', 8, 1);
      end
      else if temp2 <= 10 then 
      begin
        This_NPC.NpcDropItem('天师长袍', 8, 1);
      end
      else if temp2 <= 15 then 
      begin
        This_NPC.NpcDropItem('法神披风', 8, 1);
      end
      else 
      begin
        This_NPC.NpcDropItem('霓裳羽衣', 8, 1);
      end;
     end;
   end;   
//个人经验奖励函数
procedure GivePersonPrize();
begin
  This_Npc.NpcDialog(This_Player,
  '已经有人开启过宝藏了，如果你在我身边没有发现\'
  +'散落的宝藏，说明宝藏已经被人拿走了，请明天再来吧！\ \'
  +'|{cmd}<领取个人经验奖励/@GERENJIANLI>\'
  +'|{cmd}<返回盟重/@gtobiqi>'
  );
end;

Procedure _gtobiqi;
begin
   if compareText(This_Player.MapName,'D2004~01') = 0 then
   begin
      This_Player.Flyto('3',334,326);
      This_NPC.CloseDialog(This_Player);
   end;
end;

procedure _GERENJIANLI;
begin
  This_Npc.NpcDialog(This_Player,
  '恭喜你，为了奖励你的英勇表现特赠送你<经验:300000/c=red>\'
  +'你现在要领取吗？\ \'
  +'|{cmd}<领取奖励/@OKGERENJIANLI>'
  );
end;

//定时刷新爆物和领取奖励的统一函数
procedure CheckTimeNPC(time_need: integer);
begin
  if (GetMin() >= 55) and (GetMin() <= 59) then
  begin
    if time_need = 10 then
    begin
      if time1 = GetDateNum(GetNow()) then   //判断该时间段是否已经爆出过服务器奖励 
      begin
        GivePersonPrize;           //服务器奖励已经爆出，只能领取个人奖励 
      end
      else
      begin
        time1 := GetDateNum(GetNow());
        GiveServerPrize;          //开放服务器奖励 
      end; 
    end
    else if time_need = 13 then
    begin
      if time2 = GetDateNum(GetNow()) then   //判断该时间段是否已经爆出过服务器奖励 
      begin
        GivePersonPrize;           //服务器奖励已经爆出，只能领取个人奖励 
      end
      else
      begin
        time2 := GetDateNum(GetNow());
        GiveServerPrize;          //开放服务器奖励 
      end; 
    end
    else if time_need = 15 then
    begin
      if time3 = GetDateNum(GetNow()) then   //判断该时间段是否已经爆出过服务器奖励 
      begin
        GivePersonPrize;           //服务器奖励已经爆出，只能领取个人奖励 
      end
      else
      begin
        time3 := GetDateNum(GetNow());
        GiveServerPrize;          //开放服务器奖励 
      end; 
    end
    else if time_need = 20 then
    begin
      if time4 = GetDateNum(GetNow()) then   //判断该时间段是否已经爆出过服务器奖励 
      begin
        GivePersonPrize;           //服务器奖励已经爆出，只能领取个人奖励 
      end
      else
      begin
        time4 := GetDateNum(GetNow());
        GiveServerPrize;          //开放服务器奖励 
      end; 
    end
    else
    exit; 
  end
  else if (GetMin() >= 25) and (GetMin() <= 29) and (time_need = 23) then
  begin
    if time5 = GetDateNum(GetNow()) then   //判断该时间段是否已经爆出过服务器奖励 
    begin
        GivePersonPrize;           //服务器奖励已经爆出，只能领取个人奖励 
    end
    else
    begin
       time5 := GetDateNum(GetNow());
       GiveServerPrize;          //开放服务器奖励 
    end;  
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '每天特定时间，我将开放我守护的宝藏。\'
    +'宝藏将会自动散落在我的周围，这些散落的宝藏\'
    +'将有2分钟的锁定，2分钟后才能进行拣取\'
    +'所以你一定要眼明手快，目前开放的时间还没到，\'
    +'你再耐心的等待下！\'
    +'|{cmd}<领取个人经验奖励/@GERENJIANLI>\ \'
    +'|{cmd}<返回盟重/@gtobiqi>'
    );
  end;
end;

procedure _OKGERENJIANLI;
begin
  if compareText(This_Player.MapName,'D2004~01')= 0 then
  begin
    if (GetHour() = 10) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      if This_Player.GetS(19,2)= GetDateNum(GetNow()) then
      begin
        This_Npc.NpcDialog(This_Player,
        '这个时间段的经验奖励你已经领取过了，不能再次领取！'
        );
      end
      else
      begin
        This_Player.Give('经验',300000);
        This_Player.SetS(19,2,GetDateNum(GetNow()));          //设置20号活动任务的2号变量记录每日10：30-11：00的个人奖励领取 
        This_Npc.NpcDialog(This_Player,
        '恭喜你，这个时间段的经验奖励已经发放给你了！'
        ); 
      end;
    end
    else if (GetHour() = 13) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      if This_Player.GetS(19,3)= GetDateNum(GetNow()) then
      begin
        This_Npc.NpcDialog(This_Player,
        '这个时间段的经验奖励你已经领取过了，不能再次领取！'
        );
      end
      else
      begin
        This_Player.Give('经验',300000);
        This_Player.SetS(19,3,GetDateNum(GetNow()));          //设置20号活动任务的3号变量记录每日13：30-14：00的个人奖励领取 
        This_Npc.NpcDialog(This_Player,
        '恭喜你，这个时间段的经验奖励已经发放给你了！'
        ); 
      end;
    end
    else if (GetHour() = 15) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      if This_Player.GetS(19,4)= GetDateNum(GetNow()) then
      begin
        This_Npc.NpcDialog(This_Player,
        '这个时间段的经验奖励你已经领取过了，不能再次领取！'
        );
      end
      else
      begin
        This_Player.Give('经验',300000);
        This_Player.SetS(19,4,GetDateNum(GetNow()));          //设置20号活动任务的4号变量记录每日15：30-16：00的个人奖励领取 
        This_Npc.NpcDialog(This_Player,
        '恭喜你，这个时间段的经验奖励已经发放给你了！'
        ); 
      end;
    end
    else if (GetHour() = 20) and (GetMin() >= 30) and (GetMin() <= 59) then
    begin
      if This_Player.GetS(19,5)= GetDateNum(GetNow()) then
      begin
        This_Npc.NpcDialog(This_Player,
        '这个时间段的经验奖励你已经领取过了，不能再次领取！'
        );
      end
      else
      begin
        This_Player.Give('经验',300000);
        This_Player.SetS(19,5,GetDateNum(GetNow()));          //设置20号活动任务的5号变量记录每日20：30-21：00的个人奖励领取 
        This_Npc.NpcDialog(This_Player,
        '恭喜你，这个时间段的经验奖励已经发放给你了！'
        ); 
      end;
    end
    else if (GetHour() = 23) and (GetMin() >= 0) and (GetMin() <= 29) then
    begin
      if This_Player.GetS(19,6)= GetDateNum(GetNow()) then
      begin
        This_Npc.NpcDialog(This_Player,
        '这个时间段的经验奖励你已经领取过了，不能再次领取！'
        );
      end
      else
      begin
        This_Player.Give('经验',300000);
        This_Player.SetS(19,6,GetDateNum(GetNow()));          //设置19号活动任务的6号变量记录每日23：00-23：30的个人奖励领取 
        This_Npc.NpcDialog(This_Player,
        '恭喜你，这个时间段的经验奖励已经发放给你了！'
        ); 
      end;
    end
    else
      exit;
  end;
end;  

begin
  if (GetHour() = 10) and (GetMin() >= 30) and (GetMin() <= 59) then
  begin
      CheckTimeNPC(10);
  end
  else if (GetHour() = 13) and (GetMin() >= 30) and (GetMin() <= 59) then
  begin
      CheckTimeNPC(13);
  end
  else if (GetHour() = 15) and (GetMin() >= 30) and (GetMin() <= 59) then
  begin
      CheckTimeNPC(15);
  end
  else if (GetHour() = 20) and (GetMin() >= 30) and (GetMin() <= 59) then
  begin
      CheckTimeNPC(20);
  end
  else if (GetHour() = 23) and (GetMin() >= 0) and (GetMin() <= 29) then
  begin
      CheckTimeNPC(23);
  end
  else 
  begin
      This_Npc.NpcDialog(This_Player,
      '现在不是活动时间，不能领取奖励！'
      );
  end;
end. 