{
*******************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '要修理装饰品吗？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '修理得还算可以。\ \ \' +
    '|{cmd}<返回/@main>'
  );
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙，你可太幸运了，我正好有材料做特殊修补，\'+
   '但费用是普通的三倍！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_SRepair(This_Player);
end;


procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   '已经修理好了，看起来很不错嘛！\' +
   '|{cmd}<返回/@main>');
end;



procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(200);

  //加载stdmode 
  This_NPC.AddStdMode(19);
  This_NPC.AddStdMode(20);
  This_NPC.AddStdMode(21);
  This_NPC.AddStdMode(22);
  This_NPC.AddStdMode(23);
  This_NPC.AddStdMode(24);
  This_NPC.AddStdMode(26);
  This_NPC.AddStdMode(27);
end;

Procedure _Normal;
begin
   This_Npc.NpcDialog(This_Player,
   '你也是为了寻找新的东西才来到这里的吗？\'+
   '你也应该知道这里很危险。我能够帮你的就是修理装饰品。\ \'+
   '|{cmd}<修理装饰品/@repair> '+AddSpace(' ',24)+'|{cmd}<特殊修理/@s_repair>\'+
   '|{cmd}<退出/@doexit>');
end;

Procedure _SMSSRW108;
begin
   if This_Player.GetV(108,1) = 15 then
   begin
      This_Player.Give('经验',360000);
      This_Player.SetV(108,1,16);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

var
  SMSS108 : integer;
Begin
   SMSS108 := This_Player.GetV(108,1);
   if SMSS108 = 16 then
   begin
      This_Npc.NpcDialog(This_Player,
      '我这就收拾收拾和他们一起回城。还麻烦勇士先行一步，\'+
      '把我们的消息带给流浪汉，让他安心。\'+
      '（任务目标：返回盟重，把消息带给流浪汉）\ \'+
      '|{cmd}<还请前辈们尽快返回。我这就回去告知流浪汉你们的消息。/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if SMSS108 = 15 then
   begin
      This_Npc.NpcDialog(This_Player,
      '人最大的悲哀莫过于心死。流浪汉的心愿已了，\'+
      '除了我们弟兄外，怕是已无牵挂。我现在真的很担心他。\'+
      '我这就收拾收拾和他们一起回城。还麻烦勇士先行一步，\'+
      '把我们的消息带给流浪汉，让他安心。\'+
      '（任务目标：返回盟重，把消息带给流浪汉）\ \'+
      '|{cmd}<还请前辈们尽快返回。我这就回去告知流浪汉你们的消息。/@SMSSRW108>\'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else
   begin
      _Normal;
   end;
end.