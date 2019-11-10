{****************************************
模拟攻沙
作者：开心就好
内容：每天14:00-14:15，18:00-18:15可以进行模拟攻沙活动，
50级以上进入，杀死守城卫士可以获得一定的元宝，
最终杀死国王的玩家可以在皇宫管理处领取元宝奖励，并
有一定几率获得极品职业武器！
14:20-14:25，18:20-18:25为领奖时间，25以后清空活动地图怪物
！如果任务变量与此脚本有冲突，请自行修改
用到变量V(71，1-10)
**********************************************}


PROGRAM Mir2;
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇\|'
	+'每天14:00-15:00及18:00-19:00可以进行模拟攻沙活动，\|'
    +'45级以上进入，杀死守城卫士可以获得一定的元宝，\|'
    +'最终杀死国王者有一定几率获得极品职业武器！\|'
    +'|{cmd}<进入模拟攻沙/@mngs>\');
end;
procedure mngs2;
begin
This_Player.FlyTo('3~1',693+random(5),349+random(5));  //随机降落范围，防止堵门进不去 

end; 

procedure _mngs; 
begin
if  ((GetHour = 14) and (GetMin < 60)) or 
((GetHour = 18) and (GetMin < 60)) then begin 
    if This_Player.Level >= 45 then
  begin                 
   This_Player.CallOut(This_Npc,5, 'mngs2');
    This_Player.RandomFlyTo('Q002~2');
    This_Npc.NpcDialog(This_Player,
   '攻沙开始，5秒后进入攻沙区域！');
   This_Npc.NpcNotice('强大的'+This_Player.Name+
   '加入了模拟攻沙！');
   end else
    This_Npc.NpcDialog(This_Player,
   '您的等级不够！');   
end else
     This_Npc.NpcDialog(This_Player,
   '不在活动时间！');  
  end;
  

Begin
  domain;
end.