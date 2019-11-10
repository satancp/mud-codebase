{
/************************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _newskill22;
begin
   if This_Player.GetBagItemCount('古籍残片(中)') >= 5 then
   begin
      This_Player.Take('古籍残片(中)',5);
      This_Player.Give('古籍残片(大)',1);
      This_Npc.NpcDialog(This_Player,
      '虽然在卧龙山庄里一直没出去过，\'+
      '最近古战技重现玛法的消息我们还是有所耳闻。\'+
      '对于那些古文字我们曾经作过一段时间的研究，\'+
      '所以也能够辨识一些，你还需要帮忙吗？\'+
      '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
      '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
      '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
      '|{cmd}<没事了/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有足够的古籍残片(中)啊！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;

Procedure _newskill21;
begin
   if This_Player.GetBagItemCount('古籍残片(小)') >= 10 then
   begin
      This_Player.Take('古籍残片(小)',10);
      This_Player.Give('古籍残片(中)',1);
      This_Npc.NpcDialog(This_Player,
      '虽然在卧龙山庄里一直没出去过，\'+
      '最近古战技重现玛法的消息我们还是有所耳闻。\'+
      '对于那些古文字我们曾经作过一段时间的研究，\'+
      '所以也能够辨识一些，你还需要帮忙吗？\'+
      '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
      '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
      '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
      '|{cmd}<没事了/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有足够的古籍残片(小)啊！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '虽然在卧龙山庄里一直没出去过，\'+
   '最近古战技重现玛法的消息我们还是有所耳闻。\'+
   '对于那些古文字我们曾经作过一段时间的研究，\'+
   '所以也能够辨识一些，你需要帮忙吗？\'+
   '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
   '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
   '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
   '|{cmd}<没事了/@doexit>');
end.