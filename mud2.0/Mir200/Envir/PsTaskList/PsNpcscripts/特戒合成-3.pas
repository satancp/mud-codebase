{********************************************************************

*******************************************************************}


program mir2;

{$I common.pas}
{$I ActiveValidateCom.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure NormalDialog;
begin

   This_Npc.NpcDialog(This_Player,
   '什么？您想知道什么？是谁告诉您我在这里的？\|'
   +'哎，肯定是铁匠铺我那该死的弟弟说的! \|'
   +'看来这个秘密是守不住了。\|'
   +'既然你发现了我，那我就帮你一把。\|'
   +'只要你准备了以下材料，我可以帮你合成特殊的物品。\|'
   +'特戒价格昂贵,有能力者得!\|'
   +'<材料不够不要点兑换，扣了金刚石，概不负责!/c=red> \|'
   +'让你，可以更强大！\|'
   //+'|{cmd}<打听天工神剪的故事/@gongdian>\' 
   
   +'|{cmd}<合成特戒/@hecheng5>\'
   +'|{cmd}<退出/@doexit>'
   );

end;

procedure _hecheng5;
begin
  This_Npc.NpcDialog(This_Player,
  '合成需要的物品请放在包里，我会自己查看他们是否齐全\ \'+
  
  '|{cmd}<隐身戒指/@DsH1>           ^<复活戒指/@DsH2>\'+
  '|{cmd}<麻痹戒指/@DsH3>           ^<护身戒指/@DsH4>\'+
  '|{cmd}<返回/@main>');
end;

Procedure DuanZaoMB3(tu07:string; tu08:string; tu09:string; tu10:string; tu11:string; tu12:string; DZItem3:string);
begin
   if ( This_Player.GetBagItemCount(tu07) >= 1 ) and ( This_Player.GetBagItemCount(tu08) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu09) >= 1 ) and ( This_Player.GetBagItemCount(tu10) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu11) >= 1 ) and ( This_Player.GetBagItemCount(tu12) >= 1 ) 
         and  ( This_Player.GetBagItemCount('金刚石') >= 66666 ) then  
   begin
      This_Player.Take(tu07,1);
      This_Player.Take(tu08,1);
      This_Player.Take(tu09,1);
      This_Player.Take(tu10,1);
      This_Player.Take(tu11,1);
      This_Player.Take(tu12,1);
      This_Player.Take('金刚石',66666);
      This_Player.Give(DZItem3,1);
     
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
       ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在盟重成功锻造出传说中的★★★特殊戒指★★★，大家可以前往膜拜！',3);
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
 end;
 
 
procedure _DsH1 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成<隐身戒指/c=red>所需物品：\'+
   '金刚石：66666，\'+
   '3职业武器共6件 \ \'+
   '★嗜魂★屠龙★逍遥扇★开天★镇天★玄天★ \ \'+
   '进行<锻造/@yi1>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi1;
Begin

      DuanZaoMB3('逍遥扇','屠龙','嗜魂法杖','玄天','开天','镇天','隐身戒指');
      
end; 




 
 
 
procedure _DsH2 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成<复活戒指/c=red>所需物品：\'+
   '金刚石：66666，\'+
   '3把逍遥扇+3把玄天\ \'+
   '进行<锻造/@yi2>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi2;
Begin

      DuanZaoMB3('逍遥扇','逍遥扇','逍遥扇','玄天','玄天','玄天','复活戒指');
      
end; 

procedure _DsH3 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成<麻痹戒指/c=red>所需物品：\'+
   '金刚石：66666，\'+
   '3把屠龙+3把开天\ \'+
   '进行<锻造/@yi3>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi3;
Begin

      DuanZaoMB3('屠龙','屠龙','屠龙','开天','开天','开天','麻痹戒指');
      
end;
procedure _DsH4 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成<护身戒指/c=red>所需物品：\'+
   '金刚石：66666，\'+
   '3把嗜魂法杖+3把镇天\ \'+
   '进行<锻造/@yi4>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi4;
Begin

      DuanZaoMB3('嗜魂法杖','嗜魂法杖','嗜魂法杖','镇天','镇天','镇天','护身戒指');
      
end;

//脚本执行的入口
begin
  //domain;
  NormalDialog;
end.