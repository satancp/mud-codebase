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
   '什么？您想知道什么？是谁告诉您我知道这些消息的。\哎，看来这个秘密是守不住了。\国王为了防止宝藏被盗，他将宝物分别交给了几大将领。\这些将领最近都在封魔谷一带活动，您可以去那里打探一下哦。\'
   //+'|{cmd}<打听天工神剪的故事/@gongdian>\' 
   +'|{cmd}<合成雷霆战甲、烈焰魔衣、光芒道袍/@hecheng>\' 
   +'|{cmd}<合成凤天魔甲、凰天魔衣/@hecheng3>\'
   +'|{cmd}<合成王者衣服/@hecheng5>\'
   +'|{cmd}<强化雷霆战甲、烈焰魔衣、光芒道袍/@@StrengthenCloth>\'  //@@StrengthenCloth   qianghua
   +'|{cmd}<买/@buy>衣服'+ addSpace('', 16) + '^<修复/@repair>衣服\'           
   +'|{cmd}<卖/@sell>衣服'+ addSpace('', 16) + '^<特殊修理/@s_repair>\'
   +'|{cmd}<退出/@doexit>'
   );

end;

procedure _hecheng5;
begin
  This_Npc.NpcDialog(This_Player,
  '合成需要的物品请放在包里，我会自己查看他们是否齐全\ \'+
  
  '|{cmd}<王者战甲(男)/@DsH1>           ^<王者战甲(女)/@DsH2>\'+
  '|{cmd}<王者道袍(男)/@DsH3>           ^<王者道袍(女)/@DsH4>\'+
  '|{cmd}<王者魔衣(男)/@DsH5>           ^<王者魔衣(女)/@DsH6>\ \'+
  '|{cmd}<返回/@main>');
end;

Procedure DuanZaoMB3(tu07:string; tu08:string; tu09:string; tu10:string; tu11:string; tu12:string; DZItem3:string);
begin
   if ( This_Player.GetBagItemCount(tu07) >= 1 ) and ( This_Player.GetBagItemCount(tu08) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu09) >= 1 ) and ( This_Player.GetBagItemCount(tu10) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu11) >= 1 ) and ( This_Player.GetBagItemCount(tu12) >= 1 ) 
         and  ( This_Player.GetBagItemCount('金刚石') >= 88888 ) then  
   begin
      This_Player.Take(tu07,1);
      This_Player.Take(tu08,1);
      This_Player.Take(tu09,1);
      This_Player.Take(tu10,1);
      This_Player.Take(tu11,1);
      This_Player.Take(tu12,1);
      This_Player.Take('金刚石',88888);
      This_Player.Give(DZItem3,1);
     
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
       ServerSay('玛法大陆忽然风云色变，超级玩家★★★'+ This_Player.Name+'★★★在盟重服装店成功锻造出★★★王者级战甲★★★，大家可以前往膜拜！',3);
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
 end;
 
  procedure _DsH6 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成王者魔衣(男)所需物品：\'+
   '金刚石：88888，\'+
   '3职业男女魔龙衣服共6件\ \'+
   '进行<锻造/@yi6>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi6;
Begin

      DuanZaoMB3('雷霆战甲(男)','光芒道袍(男)','烈焰魔衣(男)','雷霆战甲(女)','光芒道袍(女)','烈焰魔衣(女','王者魔衣(女)');
      
end; 

 procedure _DsH5 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成王者魔衣(男)所需物品：\'+
   '金刚石：88888，\'+
   '3职业男女魔龙衣服共6件\ \'+
   '进行<锻造/@yi5>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi5;
Begin

      DuanZaoMB3('雷霆战甲(男)','光芒道袍(男)','烈焰魔衣(男)','雷霆战甲(女)','光芒道袍(女)','烈焰魔衣(女','王者魔衣(男)');
      
end; 

 
 procedure _DsH4 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成王者道袍(女)所需物品：\'+
   '金刚石：88888，\'+
   '3职业男女魔龙衣服共6件\ \'+
   '进行<锻造/@yi4>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi4;
Begin

      DuanZaoMB3('雷霆战甲(男)','光芒道袍(男)','烈焰魔衣(男)','雷霆战甲(女)','光芒道袍(女)','烈焰魔衣(女','王者道袍(女)');
      
end; 

 
procedure _DsH3 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成王者道袍(男)所需物品：\'+
   '金刚石：88888，\'+
   '3职业男女魔龙衣服共6件\ \'+
   '进行<锻造/@yi3>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi3;
Begin

      DuanZaoMB3('雷霆战甲(男)','光芒道袍(男)','烈焰魔衣(男)','雷霆战甲(女)','光芒道袍(女)','烈焰魔衣(女','王者道袍(男)');
      
end; 




 
 
 
procedure _DsH2 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成王者战甲(女)所需物品：\'+
   '金刚石：88888，\'+
   '3职业男女魔龙衣服共6件\ \'+
   '进行<锻造/@yi2>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi2;
Begin

      DuanZaoMB3('雷霆战甲(男)','光芒道袍(男)','烈焰魔衣(男)','雷霆战甲(女)','光芒道袍(女)','烈焰魔衣(女','王者战甲(女)');
      
end; 

procedure _DsH1 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成王者战甲(男)所需物品：\'+
   '金刚石：88888，\'+
   '3职业男女魔龙衣服共6件\ \'+
   '进行<锻造/@yi1>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yi1;
Begin

      DuanZaoMB3('雷霆战甲(男)','光芒道袍(男)','烈焰魔衣(男)','雷霆战甲(女)','光芒道袍(女)','烈焰魔衣(女','王者战甲(男)');
      
end;






procedure _hecheng3;
begin
  This_Npc.NpcDialog(This_Player,
  '合成需要的物品请放在包里，我会自己查看他们是否齐全\ \'+
  
  '|{cmd}<凤天魔甲/@ft>           ^<凰天魔衣/@ht>\'+
  
  
  '|{cmd}<返回/@main>');

end;

 Procedure DuanZaoMB1(tu04:string; tu05:string; tu06:string;  DZItem1:string);
begin
   if ( This_Player.GetBagItemCount(tu04) >= 1 ) and ( This_Player.GetBagItemCount(tu05) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu06) >= 1 ) 
     and  ( This_Player.GetBagItemCount('金刚石') >=8888 ) then  
   begin
     
      This_Player.Take(tu04,1);    
      This_Player.Take(tu05,1);
      This_Player.Take(tu06,1);
      This_Player.Take('金刚石',8888);
      This_Player.Give(DZItem1,1);
     
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
       ServerSay('玛法大陆忽然风云色变，超级玩家★★★'+ This_Player.Name+'★★★在盟重服装店成功锻造出★★★魔龙级战甲★★★，大家可以前往膜拜！',3);
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
 end;
procedure _ft ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成凤天魔甲所需物品：\'+
   '金刚石：8888，\'+
   '3职业男魔龙衣服\ \'+
   '进行<锻造/@yif1>\'+
  
   '|{cmd}<关闭/@exit>');
end; 

Procedure _yif1;
Begin

      DuanZaoMB1('雷霆战甲(男)','光芒道袍(男)','烈焰魔衣(男)','凤天魔甲');
      
end;

procedure _ht ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成凰天魔衣所需物品：\'+
   '金刚石：8888，\'+
   '3职业女魔龙衣服\ \'+
   '进行<锻造/@yif2>\'+
  
   '|{cmd}<关闭/@exit>');
end; 

Procedure _yif2;
begin

      DuanZaoMB1('雷霆战甲(女)','光芒道袍(女)','烈焰魔衣(女)','凰天魔衣');
      
end;




procedure _hecheng;

begin
  
  This_Npc.NpcDialog(This_Player,
  '合成雷霆战甲、烈焰魔衣、光芒道袍，需要一些原料，\除了相应的40级重装，还需要金刚石888颗，\'
  +'|{cmd}<合成雷霆战甲、烈焰魔衣、光芒道袍/@hecheng1>\'
  
  
  +'|{cmd}<返回/@main>'
  );
end;





procedure _hecheng1;
begin
  This_Npc.NpcDialog(This_Player,
  '合成需要的物品请放在包里，我会自己查看他们是否齐全\ \'+
  
  '|{cmd}<雷霆战甲(男)/@DsHecheng1>           ^<雷霆战甲(女)/@DsHecheng2>\'+
  '|{cmd}<烈焰魔衣(男)/@DsHecheng3>           ^<烈焰魔衣(女)/@DsHecheng4>\'+
  '|{cmd}<光芒道袍(男)/@DsHecheng5>           ^<光芒道袍(女)/@DsHecheng6>\ \'+
  '|{cmd}<返回/@main>');
end;

Procedure DuanZaoMB(tu01:string; tu02:string; tu03:string; tu04:string; tu05:string; tu06:string; DZItem:string);
begin
   if ( This_Player.GetBagItemCount(tu01) >= 1 ) and ( This_Player.GetBagItemCount(tu02) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu03) >= 1 ) and ( This_Player.GetBagItemCount(tu04) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu05) >= 1 ) and ( This_Player.GetBagItemCount(tu06) >= 1 ) 
         and  ( This_Player.GetBagItemCount('金刚石') >= 888 ) then  
   begin
      This_Player.Take(tu01,1);
      This_Player.Take(tu02,1);
      This_Player.Take(tu03,1);
      This_Player.Take(tu04,1);
      This_Player.Take(tu05,1);
      This_Player.Take(tu06,1);
      This_Player.Take('金刚石',888);
      This_Player.Give(DZItem,1);
     
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
       ServerSay('玛法大陆忽然风云色变，超级玩家★★★'+ This_Player.Name+'★★★在盟重服装店成功锻造出★★★魔龙级战甲★★★，大家可以前往膜拜！',3);
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
 end;
 

procedure _DsHecheng1 ;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成雷霆战甲(男)所需物品：\'+
   '金刚石：888，\'+
   '3职业男女40重装共6件\ \'+
   '进行<锻造/@yifu1>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yifu1;
Begin

      DuanZaoMB('天魔神甲','圣战宝甲','法神披风','霓裳羽衣','天尊道袍','天师长袍','雷霆战甲(男)');
      
end;


procedure _DsHecheng2;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成雷霆战甲(女)所需物品：\'+
   '金刚石：888，\'+
   '3职业男女40重装共6件\ \'+
   '进行<锻造/@yifu2>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yifu2;
Begin

      DuanZaoMB('天魔神甲','圣战宝甲','法神披风','霓裳羽衣','天尊道袍','天师长袍','雷霆战甲(女)');
      
end;

procedure _DsHecheng3;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成烈焰魔衣(男)所需物品：\'+
   '金刚石：888，\'+
   '3职业男女40重装共6件\ \'+
   '进行<锻造/@yifu3>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yifu3;
Begin
    
      DuanZaoMB('天魔神甲','圣战宝甲','法神披风','霓裳羽衣','天尊道袍','天师长袍','烈焰魔衣(男)');
      
end;


procedure _DsHecheng4;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成烈焰魔衣(女)所需物品：\'+
   '金刚石：888，\'+
   '3职业男女40重装共6件\ \'+
   '进行<锻造/@yifu4>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yifu4;
Begin
    
      
      DuanZaoMB('天魔神甲','圣战宝甲','法神披风','霓裳羽衣','天尊道袍','天师长袍','烈焰魔衣(女)');
       
end;

procedure _DsHecheng5;                     
begin
   This_Npc.NpcDialog(This_Player,
   '合成光芒道袍(男)所需物品：\'+
   '金刚石：888，\'+
   '3职业男女40重装共6件\ \'+
   '进行<锻造/@yifu5>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yifu5;
Begin
   
     
      DuanZaoMB('天魔神甲','圣战宝甲','法神披风','霓裳羽衣','天尊道袍','天师长袍','光芒道袍(男)');
  end;   


procedure _DsHecheng6;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成光芒道袍(女)所需物品：\'+
   '金刚石：888，\'+
   '3职业男女40重装共6件\ \'+
   '进行<锻造/@yifu6>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _yifu6;
Begin

      DuanZaoMB('天魔神甲','圣战宝甲','法神披风','霓裳羽衣','天尊道袍','天师长袍','光芒道袍(女)');
     
end;



//强化
procedure _qianghua;
begin
  This_Npc.NpcDialog(This_Player,
  '强化雷霆战甲、烈焰魔衣、光芒道袍，必须把这些衣服放在包里，而且\'
  +'需要一些材料，除了188颗金刚石，同时还需要相应的3件圣战、天\'
  +'尊、法神系列物品。我会扣除你包裹中3件这些物品。强化时成败由\'
  +'天，如果失败，金刚石和圣战等物品将会消失，只有你的衣服\'
  +'能还给您。另外，每件衣服最多只能成功强化3次，每次强化成功，除\'
  +'了增加1点对应的攻击、魔法、道术外，还会增加魔御和防御各1点。\ \'
  +'|{cmd}<强化雷霆战甲、烈焰魔衣、光芒道袍/@@StrengthenCloth>\'
  +'|{cmd}<返回/@main>'
  );
end;


 
Procedure _StrengthenGo(str:String);
var
temp:integer; 
str_not,str_att:string; 
begin
   temp := strtointdef(str,-1);
   if (temp < 1) or (temp > 6) then exit;
   case temp of
     1:
     begin
     str:='雷霆战甲(男)';
     str_att:='攻击';
     end;
     2:
     begin
     str:='雷霆战甲(女)';
     str_att:='攻击';
     end;
     3:
     begin
     str:='烈焰魔衣(男)';
     str_att:='魔法';
     end;
     4:
     begin
     str:='烈焰魔衣(女)';
     str_att:='魔法';
     end;
     5:
     begin
     str:='光芒道袍(男)';
     str_att:='道术';
     end;
     6:
     begin
     str:='光芒道袍(女)';
     str_att:='道术';
     end;
   end;
   //temp := This_NPC.ClickStrengthenClothes(This_Player,str);
   case temp of
     0,2:str_not:='未穿戴对应衣服，不可强化。'; 
     1:
     begin 
     str_not:='恭喜你，强化成功。';
     This_NPC.NpcNotice('恭喜'+ This_Player.Name+'在盟重服装店成功强化了'+str+'！');
     end;
     -1,3,7:str_not:='该装备不可强化。';
     4:str_not:='金刚石不足，不可强化。';
     5:str_not:='缺乏必要首饰，不可强化。';
     6:str_not:='很遗憾，强化失败，除衣服外其他材料均已消耗。';
     8:str_not:='你穿戴的衣服已经强化过3次了，不可再次强化。';
   end;
   This_NPC.NpcDialog(This_Player,str_not);
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买什么样的衣服？\ \ \<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '把你要卖的衣服给我看看，我会给你个估价。\ \<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '请放上去要修补的衣服。\ \ \<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看来修补得很不错。\ \ \ <返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.AddStdMode(27);
  This_Npc.AddStdMode(28);
  This_Npc.FillGoods('布衣(男)',50,1);
  This_Npc.FillGoods('布衣(女)',50,1);
  This_Npc.FillGoods('轻型盔甲(男)',50,1); 
  This_Npc.FillGoods('轻型盔甲(女)',50,1);
  This_Npc.FillGoods('中型盔甲(男)',50,1);
  This_Npc.FillGoods('中型盔甲(女)',50,1);
  This_Npc.FillGoods('幽灵战衣(男)',50,1);
  This_Npc.FillGoods('幽灵战衣(女)',50,1);
  This_Npc.FillGoods('恶魔长袍(男)',30,1);
  This_Npc.FillGoods('恶魔长袍(女)',30,1);
  This_Npc.FillGoods('战神盔甲(男)',30,1);
  This_Npc.FillGoods('战神盔甲(女)',30,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  //domain;
  NormalDialog;
end.