{******************************************************************
* 项目名称：
* 单元名称：击杀冰眼巨魔【PsMapQuest】 
* 单元作者：
* 摘    要：
* 备    注：
*******************************************************************}
Program Mir2;

Begin
   if ( This_Player.GetV(22,2) <> 10 ) or ( This_Player.GetV(22,3) >= 50 ) then
     Exit;
   else if This_Player.GetV(22,10) = 100 then
   begin
      if ( This_Player.IsGroupOwner ) or ( This_Player.IsTeamMember ) then
      begin
         //全服喊话：ServerSay(neir ：string; ziti : integer); 
         //其中第一个参数为喊话内容，第二个参数为字体颜色(0=红，1=绿，2=蓝色，3=紫色，4=黄色，5=黑字亮绿地);
         This_Player.GroupSetV(22,3,50);
         This_Player.GroupSetV(22,2,0);
         This_Player.PlayerNotice('恭喜你，你终于成功地击杀了冰眼巨魔！',2);
         ServerSay('有了队友的支持，' + This_Player.Name + '在巨魔之巢成功地击杀了冰眼巨魔！',0); 
      end else
      begin
         This_Player.SetV(22,3,50);
         This_Player.SetV(22,2,0);
         This_Player.PlayerNotice('恭喜你，你终于成功地击杀了冰眼巨魔！',2);
         ServerSay(This_Player.Name + '在巨魔之巢成功地击杀了冰眼巨魔！',0);         
      end;
   end else
   begin
      if ( This_Player.IsGroupOwner ) or ( This_Player.IsTeamMember ) then
      begin
         This_Player.GroupSetV(22,3,50);
         This_Player.GroupSetV(22,10,100);
         This_Player.GroupSetV(22,2,0);
         This_Player.PlayerNotice('恭喜你，你终于成功地击杀了冰眼巨魔！',2);
         ServerSay('有了队友的支持，' + This_Player.Name + '在巨魔之巢成功地击杀了冰眼巨魔！',0); 
      end else
      begin
         This_Player.SetV(22,3,50);
         This_Player.SetV(22,10,100);
         This_Player.SetV(22,2,0);
         This_Player.PlayerNotice('恭喜你，你终于成功地击杀了冰眼巨魔！',2);
         ServerSay(This_Player.Name + '在巨魔之巢成功地击杀了冰眼巨魔！',0);         
      end; 
   end;
end. 