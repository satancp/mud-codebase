{********************************************************************

*******************************************************************}

PROGRAM Mir2;



Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


Procedure _rule;
Begin
   This_Npc.NpcDialog(This_Player,
   '本次活动目的只是提供给大家一个互相切磋的机会，胜负无关紧要。\'+
   '任何错误使用卷轴或其它行为导致脱离赛场的行为，请自行解决。\'+
   '比赛中不会累加PK值，玩家死亡不会掉落任何物品，包括祈祷系列。\'+
   '比赛场地限定120人同时竞技，一旦人数不足则会立刻补充。\'+
   '比赛中，凡是使用公共频道骂人的玩家，将受到禁言30分钟，逐出\'+
   '赛场的处罚。\ \'+
   '|{cmd}<下一页/@rule1>');
end;

Procedure _rule1;
Begin
   This_Npc.NpcDialog(This_Player,
   '凡是在比赛正式开始前，或者比赛结束后继续攻击他人的\'+
   '玩家，将受到处罚。我们将对得分最高的3个行会进行公告表扬。\'+
   '同时在这3个行会中选出得分最高的个人冠军，进行公告表扬！\'+
   '特别申明，在我们宣布比赛开始前，或比赛结束后，继续攻击的\'+
   '个人和行会将受到严肃处分，攻击一次扣除1000分，扣分累计\'+
   '超过5000的取消资格！\ \'+
   '|{cmd}<进入赛场/@enter>                      ^<离开/@doexit>');
end;


Procedure _Enter;
begin
   if (This_Player.GoldNum >= 1000) and (This_Player.Level >=10) then
   begin
      if CheckOtherMapHum('F003') < 120 then
      begin
         if (This_Player.GetBagItemCount('地牢逃脱卷')>=1) or (This_Player.GetBagItemCount('地牢逃脱卷包')>=1) 
             or (This_Player.GetBagItemCount('回城卷')>=1) or (This_Player.GetBagItemCount('行会回城卷包')>=1) 
             or (This_Player.GetBagItemCount('行会回城卷')>=1) or (This_Player.GetBagItemCount('回城卷包')>=1)  then
         begin
             This_Npc.NpcDialog(This_Player,
             '携带地牢逃脱卷，回城卷，行会回城卷，\'+
             '不能进入行会争霸赛地图。\'+
             '在行会争霸赛地图中，凡是使用这些卷轴离开赛场，\'+
             '将无法再次进入赛场，请遵守规则\ \'+
             '|{cmd}<确定/@doexit>');
         end  else
         begin
             This_Player.DecGold(1000);
             This_Player.RandomFlyTo('F003');
         end;   
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '抱歉，现在参赛人数已满请稍后再来。\ \'+
         '|{cmd}<确定/@doexit>');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你带的钱不够，或者级别太低了，\'+
      '请带好1000金币入场费，升到10级以上再来找我。\ \'+
      '|{cmd}<离开/@doexit>');
   end;
end;


Begin
      This_Npc.NpcDialog(This_Player,
      '你想参加无差别行会争霸赛吗？这里不加PK值，也不会掉\'+
      '落物品。你可以通过赛场内的NPC离开赛场。\'+
      '我将收取1000金币作为入场费，而且你要达到10级以上。\' +
      '官方也会组织正式的比赛，在正式比赛中就有规则限定了。\ \'+
      '|{cmd}<进入/@fenter>                       ^<查看正式比赛规则/@rule>\'+
      '|{cmd}<以后再来/@doexit>');
end.