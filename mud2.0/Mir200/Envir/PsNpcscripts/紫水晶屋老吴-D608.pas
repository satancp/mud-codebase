{ 
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _mission928;
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
      '今天你已经领过礼物了，还是明天再来吧！');
   end else if (x2 = x4) and (x1 = 1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '尊敬的勇士，非常感谢你来帮助我，\'+
      '你只需要给我1000金币，就可以得到我的礼物：200000点经验\'+
      //'和1个精元丹，精元丹双击后可以获得50000内功经验。\ \'+
      '|{cmd}<好的，给你金币/@mission928_1>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没去找过盟重活动使者吗？\'+
      '他那里可能需要你的帮助！\'+
      '你每天还可以在盟重活动使者那里签一次名，\'+
      '获得丰厚经验奖励。\'); 
   end;
end;

procedure _mission928_1;
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
      '今天你已经领过礼物了，还是明天再来吧！');
   end else if (x2 = x4) and (x1 = 1) then
   begin
      if This_Player.GoldNum >= 1000 then
      begin
         if This_Player.FreeBagNum >= 1 then
         begin
            This_Npc.NpcDialog(This_Player,
            '太感谢了，这是给你的礼物！\'+
            '如果你明天也能来送一次金币给我的话，也可以获得一份礼物\ \');
            This_Player.DecGold(1000);
            This_Player.Give('经验',200000);
            //This_Player.Give('精元丹',1);
            This_Player.SetS(13,1,0);
            This_Player.SetS(13,3,x4);
         end else
         begin
            This_Npc.NpcDialog(This_Player,
            '你先清理一下包裹，至少留有1个以上的空间再来找我吧！');
         end;
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '只需要给我1000金币，如果你带来了，就赶快交给我吧！');
      end;
      

      
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没去找过盟重活动使者吗？\'+
      '他那里可能需要你的帮助！\'+
      '你每天还可以在盟重活动使者那里签一次名，\'+
      '获得丰厚经验奖励。\'); 
   end;
end;



Begin
   if This_Player.GetS(13,1) = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '哇...好漂亮的水晶啊，这块可是上品啊！\'+
      '嗯？小伙子你来找我什么事？\ \'+
      //'|{cmd}<我需要些水晶，你可卖我点？/@duihua>\ \'+
      '|{cmd}<是盟重活动使者让我来的/@mission928>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '哇...好漂亮的水晶啊，这块可是上品啊！\'+
      '嗯？小伙子你来找我什么事？\ \'
      );
   end;
end.