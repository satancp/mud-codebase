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
   '要修理武器吗？修理什么武器？\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '还有要修理的吗？\ \' +
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
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
end;

Procedure _Normal;
begin
   This_Npc.NpcDialog(This_Player,
   '对你这样的武士来说，武器就跟生命一样。如果时刻不准备着，\'+
   '那么你也会成为地上的骷髅。要是你有好几条命，那么可以不\'+
   '修理武器，怎么样，把你的武器交给我来修理吧？\ \'+
   '|{cmd}<修理武器/@repair> '+AddSpace(' ',24)+'|{cmd}<特殊修理/@s_repair>\'+
   '|{cmd}<退出/@doexit>');
end;

Procedure _QianBeiZou108;
begin
   This_Npc.NpcDialog(This_Player,
   '是�  Ｋ灯鹄矗颐堑笔碧宥耍恍南胱盼骼撕罕ǔ稹'+
   '的确却忽略了他已是孤孤单单的。\'+
   '你去把这个消息告诉石墓阵衣服店老板吧！一切请他定夺！\'+
   '（任务目标：深入石墓阵，找到衣服店老板）\ \'+
   '|{cmd}<好的，我这就去！/@QianBeiZou108_01>');
end;

Procedure _QianBeiZou108_01;
begin
   if This_Player.GetV(108,1) = 11 then
   begin
      This_Player.Give('经验',320000);
      This_Player.SetV(108,1,12);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

var
  SM108 : integer; 
Begin
   SM108 := This_Player.GetV(108,1);
   if SM108 = 12 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你去把这个消息告诉石墓阵衣服店老板吧！一切请他定夺！\'+
      '（任务目标：深入石墓阵，找到衣服店老板）\ \'+
      '|{cmd}<好的，我这就去！/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if SM108 = 11 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你的意思是说，你已经帮流浪汉找回他亲人的骸骨了？\'+
      '我们弟兄几个在这里这么久都没有找到，你一个人就办到了？\'+
      '哎，惭愧�  璡 \'+
      '|{cmd}<还请前辈立即返回盟重吧/@QianBeiZou108>，流浪汉的亲人皆已故去，\'+
      '内心必定备受煎熬，正是需要你们这些弟兄的时候！\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else
   begin
      _Normal;
   end;
end.