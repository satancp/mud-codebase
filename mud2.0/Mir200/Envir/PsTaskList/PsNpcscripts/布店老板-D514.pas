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
   '我只管衣服，\'+
   '有实力的匠人不会做这个做那个的，\'+
   '只有没有实力的人才什么都做。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '你看，是不是很出色？\ \ \' +
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
  This_Npc.SetRebate(100);

  //加载stdmode
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '你好，钱再好，我也不想再来这么危险的地方了，你知道上门\'+
   '修理其费用更高吗？价钱可是一般时候的两倍啊，我都这样说了，\'+
   '你还坚持的话，那么我就为你跑一趟，不过价贵所值是真的。\ \'+
   '|{cmd}<修补衣物/@repair>  ' + addspace(' ',26) + '^<特殊修理/@s_repair>\' +
   '|{cmd}<退出/@doexit>');
end.