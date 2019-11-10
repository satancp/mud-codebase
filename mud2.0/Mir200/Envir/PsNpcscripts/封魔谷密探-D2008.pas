{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _killpig;
var
x1 , x2 , x3 , x4 :integer;
td : double;
begin
   x1 := This_Player.GetS(13,1);
   x2 := This_Player.GetS(13,2);
   x3 := This_Player.GetS(13,3);
   td := GetNow;
   x4 := GetDateNum(td);
   if x3 = x4 then
   begin
      This_Npc.NpcDialog(This_Player,
      '如果你明天也能来帮我一次的话，也可以获得一份礼物。');
   end else if (This_Player.Level >= 40) and (x1 = 5) and (x2 = x4) then
   begin
      This_Npc.NpcDialog(This_Player,
      '太感谢了，这是给你的奖励！\ \'+
      '|{cmd}<领取奖励/@finishpig>');
   end else if (This_Player.Level >= 40) and (x1 = 4) and (x2 = x4) then
   begin
      This_Npc.NpcDialog(This_Player,
      '赶快去杀死5个白野猪吧！');    
   end else if (This_Player.Level >= 40) and (x1 = 2) and (x2 = x4) then
   begin
      This_Npc.NpcDialog(This_Player,
      '赶快去杀死5个白野猪吧！'); 
      This_Player.SetS(13,1,4);
      //由于只能使用任务号而不能使用活动号对打怪进行计数，这里使用16号任务的99号字段 
      This_Player.SetV(16,99,0); 
   end;
end;

procedure _finishpig;
var
x1 , x2 , x3 , x4 , temp :integer;
td : double;
begin
   x1 := This_Player.GetS(13,1);
   x2 := This_Player.GetS(13,2);
   x3 := This_Player.GetS(13,3);
   td := GetNow;
   x4 := GetDateNum(td);
   if x3 = x4 then
   begin
      This_Npc.NpcDialog(This_Player,
      '如果你明天也能来帮我一次的话，也可以获得一份礼物。');
   end else if (This_Player.Level >= 40) and (x1 = 5) and (x2 = x4) then
   begin
      if This_Player.FreeBagNum >= 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '太感谢你了，这是你的礼物，5000000点经验，\'+
         //'精元丹双击后可以获得50000内功经验！\'+
         '如果你明天也能来帮我一次的话，也可以获得一份礼物。');
         //This_Player.Give('精元丹',1);
         This_Player.Give('经验',5000000);
         This_Player.SetS(13,3,x4);
         This_Player.SetS(13,1,0);
         This_Npc.CreateMon('D2008',52,51,50,'白野猪08',1);
         This_Npc.CreateMon('D2008',52,51,50,'红野猪08',5);
         This_Npc.CreateMon('D2008',52,51,50,'黑野猪08',5);
         This_Npc.CreateMon('D2009',41,44,50,'白野猪08',1);
         This_Npc.CreateMon('D2009',41,44,50,'红野猪08',5);
         This_Npc.CreateMon('D2009',41,44,50,'黑野猪08',5);
         This_Npc.CreateMon('D2010',155,231,50,'白野猪08',1);
         This_Npc.CreateMon('D2010',155,231,50,'红野猪08',5);
         This_Npc.CreateMon('D2010',155,231,50,'黑野猪08',5);
         This_Npc.CreateMon('D2011',32,31,50,'白野猪08',1);
         This_Npc.CreateMon('D2011',32,31,50,'红野猪08',5);
         This_Npc.CreateMon('D2011',32,31,50,'黑野猪08',5);
         This_Npc.CreateMon('D2012',48,47,50,'白野猪08',1);
         This_Npc.CreateMon('D2012',48,47,50,'红野猪08',5);
         This_Npc.CreateMon('D2012',48,47,50,'黑野猪08',5);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '先清理一下包裹，至少留有一个以上的包裹空间再来找我吧！');
      end;
   end else if (This_Player.Level >= 40) and (x1 = 4) and (x2 = x4) then
   begin
      temp := This_Player.GetV(16,99);
      if (temp <= 4) then
      begin
         This_Npc.NpcDialog(This_Player,
         '你现在已经杀死了'+IntToStr(temp)+'只白野猪，继续努力吧，\'+
         '等你杀死5只白野猪以后来找我。');
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你还没有杀死5只白野猪，继续努力吧！');
      end;   
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没有接受任务，不能领取奖励！'); 
   end;
end;


var
temp ,temp2 : integer;
td : double;
Begin
   td := GetNow;
   temp := GetDateNum(td);
   temp2 := This_Player.GetS(13,1);
   if (This_Player.Level >= 40) and (temp = This_Player.GetS(13,2)) and ( (temp2 = 2) or (temp2 = 4) or (temp2 = 5) ) then
   begin
      This_Npc.NpcDialog(This_Player,
      '尊敬的勇士，非常感谢你来帮助我，最近霸者大厅、幽冥回廊、\'+
      '纵横道、魔魂殿和炼狱回廊附近的怪物军团有很大的异动，希\'+
      '望你能帮我去这些地方消灭<5只白野猪/c=red>。\'+
      '完成之后，我就会送你一份礼物！\ \'+
      '|{cmd}<好的，我这就去/@killpig>                  ^<我已经杀完了白野猪了/@finishpig>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '听说每天只要在盟重活动使者那里签一次名，\'+
      '就能获得丰厚的奖励，不知道是不是真的。\');
   end;
end.