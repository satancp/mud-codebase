{********************************************************************

*******************************************************************}

Program Mir2;


{$I common.pas}



Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '我只处理衣物。\'+
   '真正的工匠是不会什么都做的，\'+
   '什么都会做的，那肯定是骗子。。。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '看！活干的多漂亮啊，对不对 ？\ \ \' +
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
   '已经修理好了，看起来很不错嘛！\ \' +
   '|{cmd}<返回/@main>');
end;

procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(200);

  //加载stdmode
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '嘿，不管我多么喜欢钱，这么危险的事情我也不想干了。\'+
   '你知道，我贩运的成本是非常高的。 \'+
   '你应该付给我双倍的价格。如果你信任我，\'+
   '没有任何异议的话，修补衣服我可是非常灵巧的啊.\ \'+
   '|{cmd}<修补衣物/@repair>  ' + addspace(' ',20) + '^<特殊修理/@s_repair>\' +
   '|{cmd}<退出/@doexit>');
end.