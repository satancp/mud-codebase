{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _start928;
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
      '还来找我做什么，你不是已经完成今天的任务了吗？');
   end else if (x2 = x4) and (x1 = 3) then
   begin
      if This_Player.Level >= 51 then
      begin
         if This_Player.FreeBagNum >= 1 then
         begin
            This_Npc.NpcDialog(This_Player,
            '这次多亏你了，不然我就麻烦了！\'+
            '这是给你的礼物，800000点经验，\'+
            //'精元丹双击后可以获得50000内功经验！\ \'+
            '|{cmd}<谢谢了！/@doexit>');
            //This_Player.Give('精元丹',1);
            This_Player.Give('经验',800000);
            This_Player.SetS(13,1,0);
            This_Player.SetS(13,3,x4);
         end else
         begin
            This_Npc.NpcDialog(This_Player,
            '先清理一下包裹，至少留有一个以上的包裹空间再来找我吧！');
         end;
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '尊敬的勇士，你的能力暂时还帮不到我，\'+
         '去盟重找活动使者吧，他那里可能需要你的帮助！\'+
         '你每天还可以在盟重活动使者那里签一次名，\'+
         '获得丰厚经验奖励。\');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没去找过盟重活动使者吗？\'+
      '他那里可能需要你的帮助！\'+
      '你每天还可以在活动使者那里签一次名，\'+
      '获得丰厚经验奖励。\'); 
   end;
end;



Begin
   if This_Player.Level >= 51 then
   begin
      This_Npc.NpcDialog(This_Player,
      '尊敬的勇士，你是来帮助我的吗？\ \'+
      '|{cmd}<是活动使者让我来找你的/@start928>\'+
      '|{cmd}<抱歉，我还有其他事/@doexit>\ \');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '尊敬的勇士，你的能力暂时还帮不到我，去盟重找<活动使者/c=red>吧\'+
      '他那里可能需要你的帮助！\'+
      '你每天还可以在盟重活动使者那里签一次名，获得丰厚经验奖励。\');
   end;
end.