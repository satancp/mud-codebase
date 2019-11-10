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
   '你是谁？\|'
   +'.......... \|'
   +'<材料不够不要点的锻造，扣了声望，概不负责!/c=red> \'
   //+'|{cmd}<打听天工神剪的故事/@gongdian>\' 
   
   +'|{cmd}<合成武器/@hecheng5>\'
   +'|{cmd}<退出/@doexit>'
   );

end;

procedure _hecheng5;
begin
  This_Npc.NpcDialog(This_Player,
  '合成需要的物品请放在包里，我会自己查看他们是否齐全\ \'+
  
  '|{cmd}<开天/@DsH1>    ^<玄天/@DsH2>   ^<镇天/@DsH3> \'+

  '|{cmd}<返回/@main>');
end;

Procedure DuanZaoMB3(tu07:string; tu08:string; tu09:string; tu10:string; DZItem3:string);
begin
   if ( This_Player.GetBagItemCount(tu07) >= 1 ) and ( This_Player.GetBagItemCount(tu08) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu09) >= 1 ) and ( This_Player.GetBagItemCount(tu10) >= 1 ) 
         and  ( This_Player.GetBagItemCount('金刚石') >= 16666 ) then  
   begin
      This_Player.Take(tu07,1);
      This_Player.Take(tu08,1);
      This_Player.Take(tu09,1);
      This_Player.Take(tu10,1);
      This_Player.Take('金刚石',16666);
      This_Player.Give(DZItem3,1);
     
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
       ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在无名之地锻造出传说中的★★★开天级武器★★★，大家可以前往膜拜！',3);
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
 end;
 
 
procedure _DsH1 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成<开天/c=red>所需物品：\'+
   '金刚石：16666，\'+
   '★3把屠龙+凤天魔甲★ \ \'+
   '进行<锻造/@yi1>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi1;
Begin

      DuanZaoMB3('屠龙','屠龙','屠龙','凤天魔甲','开天');
      
end; 




 
 
 
procedure _DsH2 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成<玄天/c=red>所需物品：\'+
   '金刚石：16666，\'+
   '★3把逍遥扇+凤天魔甲★\ \'+
   '进行<锻造/@yi2>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi2;
Begin

      DuanZaoMB3('逍遥扇','逍遥扇','逍遥扇','凤天魔甲','玄天');
      
end; 

procedure _DsH3 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成<镇天/c=red>所需物品：\'+
   '金刚石：16666，\'+
   '★3把嗜魂法杖+凤天魔甲★\ \'+
   '进行<锻造/@yi3>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi3;
Begin

      DuanZaoMB3('嗜魂法杖','嗜魂法杖','嗜魂法杖','凤天魔甲','镇天');
      
end;


//脚本执行的入口
begin
  //domain;
  NormalDialog;
end.