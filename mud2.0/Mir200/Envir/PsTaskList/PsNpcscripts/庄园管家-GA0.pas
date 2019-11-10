 {
*******************************************************************}
Program Mir2;

Procedure _Buy;
begin
   if This_Player.Level >= 45 then
   begin
     if compareText(This_Player.MapName, 'GA0') = 0 then
     begin
        This_Player.Flyto('0122~1', 13, 40);
        This_Npc.CloseDialog(This_Player);
     end; 
   end else
     begin
      This_Npc.NpcDialog(This_Player,
      '等级不到45，请45级以后再来!');
     end; 
   ;    
end;







Begin
   This_NPC.NpcDialog(This_Player,
   '你好，我是庄园管家，你需要些什么服务？\ \ \'+
    '等级45级以上的玩家可以从我这里前往天庭\ \ \'+

   '|{cmd}<我有45级，送我去天庭/@Buy>                      \');
end.