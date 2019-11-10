{********************************************************************
* 单元名称：卧龙笔记 
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program mir2;

procedure _gowolong;
begin
   if This_Player.Level >= 52 then
   
   
  begin
      if This_Player.MyLFnum >= 300 then
     begin
         if (This_Player.GetBagItemCount('魔族指令书') > 0) then
          begin
           This_Player.Flyto('hero1', 220, 212);
           This_Player.Take('魔族指令书', 1);
           This_Player.DecLF(0, 300, false);
		   ServerSay('玩家<' + This_Player.Name + '>进入了卧龙山庄', 2);
         end else
          begin
          This_Npc.NpcDialog(This_Player,
          '没有魔族指令书! '  );
           end ;
     end else  
     begin
            This_Npc.NpcDialog(This_Player,
            '灵符不足300!'   );
     end ; 
  end else

     begin
         
         This_Npc.NpcDialog(This_Player,
        '等级不到52，请升级!  ');

     end; 
end;

  
begin
 // This_Npc.showbook(This_Player, 1, 0, '@gowolong'); 
  This_Npc.NpcDialog(This_Player,
   +'<★★★★★★卧龙笔记★★★★★★/c=red>\|'
   +'年轻人，你想要终极装备吗？\|'
   +'如果你拥有一支精诚团结而且拥有强大力量的队伍，\|'
   +'可以前往挑战大陆强者-卧龙庄主-，听闻他身上穿着\|'
   +'由大陆最强铁匠打造的终极战甲和终极神兵，你确定\|'
   +'要前去挑战吗？挑战需要<52级/c=red>，<魔族指令书/c=red>，<300灵符/c=red>\|'
   +'|{cmd}<我有52级，前往挑战卧龙山庄/@gowolong>'
    );  
end.