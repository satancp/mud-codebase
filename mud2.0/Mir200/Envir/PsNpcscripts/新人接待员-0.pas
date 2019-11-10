    {
*******************************************************************}
Program Mir2;

Procedure _l1;
begin
   if This_Player.Level < 20 then
   begin
     if compareText(This_Player.MapName, '0') = 0 then
     begin
        This_Player.Flyto('G003', 43 + random(3) - 1, 36 + random(3) - 1);
        This_Npc.CloseDialog(This_Player);
     end; 
   end else
     begin
      This_Npc.NpcDialog(This_Player,
      '你等级大于20级，请前往更高级区域!');
     end; 
   ;    
end;







Begin
   This_NPC.NpcDialog(This_Player,
   '欢迎大家登陆本传奇，本服开发大量内容，请各位玩家慢慢体验？\ \ \'+
   '你要前往新手地图练级吗？？\ \ \'+

   '|{cmd}<前往新手练级地图一/@l1>                      \');
end.