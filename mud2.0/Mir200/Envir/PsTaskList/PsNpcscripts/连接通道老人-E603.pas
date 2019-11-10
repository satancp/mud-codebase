{
*******************************************************************}

Program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _talkwith_1;
begin
   This_NPC.NpcDialog(This_Player,
   '你既然来这里找我 那我就告诉你，\'+
   '这附近有一个无人知晓的山洞…… \'+
   '山洞里的世界跟传奇的世界是不同的，你想进去试一下吗？\ \'+
   '|{cmd}<挑战/@talkwith_3>\'+
   '|{cmd}<退出/@doexit>'); 
end;

Procedure _talkwith_3;
begin
   This_NPC.NpcDialog(This_Player,
   '我可以让你进去，但只能在里面待3个小时，\'+ 
   '自己小心……\ \'+
   '|{cmd}<进入山洞/@talkwith_4>'); 
end;

Procedure GunChuLai;
begin
   if compareText(This_Player.MapName,'M001') = 0 then
   begin
      This_Player.Flyto('E603',29,192);
   end;
end;

Procedure _talkwith_4;
begin
   if compareText(This_Player.MapName,'E603') = 0 then
   begin 
      if CheckOtherMapHum('M001') < 200 then
      begin
         This_Player.CallOut(This_NPC, 10800,'GunChuLai');
         This_Player.RandomFlyTo('M001');
      end else
      begin
         This_NPC.NpcDialog(This_Player,
         '我很想带你进去，但我现在已经筋疲力尽了，\'+ 
         '所以我不能把你带过去……稍微等一会吧…… \ \');
      end;
   end else
   begin
      Exit;
   end;
end;

Begin
   This_NPC.NpcDialog(This_Player,
   '嘿……这么危险的地方你来干吗？ \'+
   '不知道你能不能走出这个地方……\ \'+
   '|{cmd}<对话./@talkwith_1>\'+
   '|{cmd}<退出./@doexit>\');  
end.