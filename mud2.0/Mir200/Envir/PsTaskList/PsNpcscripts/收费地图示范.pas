                                     {********************************************************************
* 单元名称：卧龙笔记 
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program mir2;

procedure _gowolong;
begin
   if This_Player.Level >= 55 then    //这里大于多少级 
   if This_Player.MyLFnum >= 300 then //这里收费多少灵符才可以进入   这是元宝的 if This_Player.YBNum >= 300 then 替换前面的 
   
  begin
     if compareText(This_Player.MapName, '3') = 0 then    //这里是检查出发地图，NPC放在哪jiu写哪个地图 
     begin
        This_Player.Flyto('hero1', 220, 212);    //这里前往的地图   hero1 是地图号 
        This_Npc.CloseDialog(This_Player);
     end ; 
      This_Player.DecLF(0, 300, false);        //这里收费多少，我这里写的灵符  元宝 是这个 This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20150,100,1);      这里面的100是扣多少元宝 
    
      end else
     begin
      This_Npc.NpcDialog(This_Player,
      '等级不到52，灵符不足300或者缺少魔族指令书请检查是否齐全!'   );
      
      
     end else   
     begin
         
         This_Npc.NpcDialog(This_Player,
      '等级不到55，灵符不足300或者缺少魔族指令书请检查是否齐全!'   );
      
      
       
 
   end; 
end;
begin
 // This_Npc.showbook(This_Player, 1, 0, '@gowolong'); 
  This_Npc.NpcDialog(This_Player,
   '年轻人，你想要终极装备吗？\' +
   '如果你拥有一支精诚团结而且拥有强大力量的队伍，\' +          //这里de话自己改
   '可以前往挑战大陆强者-卧龙庄主-，听闻他身上穿着\' +
   '由大陆最强铁匠打造的终极战甲和终极神兵，你确定\' +
   '要前去挑战吗？挑战需要55级，魔族指令书，300灵符\' +     //自己改话   
   
   '|{cmd}<我有55级，前往挑战终极卧龙山庄/@gowolong>'
    );  
end.