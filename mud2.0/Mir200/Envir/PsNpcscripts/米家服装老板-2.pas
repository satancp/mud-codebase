{********************************************************************

*******************************************************************}
Program Mir2;


{$I common.pas}


Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '可以修复衣服，头盔，帽子。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '看来修补得很不错。\ \ \' +
  '|{cmd}<返回/@main>');
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。，\'+
   '但费用是普通的三倍！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_SRepair(This_Player);
end;


procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   '修得还算不错。\ \ \' +
   '|{cmd}<返回/@main>');
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '请放上去要卖的衣服，我给估价。\'+
   '头盔和帽子也收购，最好在这儿一起卖吧。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '你想买什么样的衣服？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('布衣(男)', 50, 1);
  This_NPC.FillGoods('布衣(女)', 50, 1); 
  This_NPC.FillGoods('轻型盔甲(男)', 50, 1);
  This_NPC.FillGoods('轻型盔甲(女)', 50, 1);
  This_NPC.FillGoods('中型盔甲(男)', 50, 1);
  This_NPC.FillGoods('中型盔甲(女)', 50, 1);
  //加载stdmode
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
end;


Begin
    //IF (random(10) = 0) and (This_Player.GetV(9,20) = 1) then
    IF (random(10) = 0) and ((This_Player.GetV(11,1) = 4) or (This_Player.GetV(11,1) = 5))then
    begin
    //This_Player.SetV(9,12,1);
    This_Player.SetV(11,1,5);
    This_Npc.NpcDialog(This_Player,
          '在讲我父亲的事情吗？ \'
          +'我父亲原来在比奇省客栈做生意，\'
          +'被一群暴徒受欺负。为了散散心，\'
          +'到沃玛森林去旅游，之后就没有音信。 \'
          +'你可以到那边去找。\ \'
          +'|{cmd}<关闭/@exit>'
          );
    
    end else
   This_Npc.NpcDialog(This_Player,
   '欢迎光临，有什么事情需要我帮忙吗？\ \'+
   '|{cmd}<买衣服/@buy>  ' + addspace(' ',20) + '^<卖衣服/@sell>  \'+
   '|{cmd}<修补衣服/@repair>  ' + addspace(' ',18) + '^<特殊修理/@s_repair>\' +
   '|{cmd}<退出/@doexit>');
end.