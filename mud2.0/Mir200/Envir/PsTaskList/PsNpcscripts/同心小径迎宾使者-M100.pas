{
/************************************************************************}



PROGRAM Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _qingtie;
begin
   if This_Player.GetBagItemCount('请帖')>= 1 then
   begin
      This_Player.Take('请帖',1);
      This_Npc.CreateMon('M100',131,154,100,'虹魔猪卫15',5);
      This_Npc.NpcDialog(This_Player,
      '携带烟花的怪物已经出现在这里通道里，\'+
      '您可以马上去寻找它们了！要抓紧哦，别让别人抢去了。\ \'+
      '|{cmd}<关闭/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '您好像没有请帖啊！是不是新人没有邀请你呀？\ \'+
      '|{cmd}<关闭/@doexit>');
   end;
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '郎才女貌，才子佳人，多么美好的一对，你想进入姻缘神殿吗？\'+
   '你想看到美丽的烟花吗？交给我请帖，携带烟花的神秘怪物就\'+
   '会出现，在它身上，你可以得到漂亮的烟花。\ \'+
   '|{cmd}<交请帖/@qingtie>                        ^<离开/@doexit>');
end.