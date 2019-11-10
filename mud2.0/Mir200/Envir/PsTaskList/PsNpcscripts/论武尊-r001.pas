{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '年轻人啊，告诉我你什么是最强？\\'
   +'|{cmd}<可以粉碎石头的拳/@Q1>\'
   +'|{cmd}<为了追求无上力量的意志/@Q2>\'
   +'|{cmd}<神秘的第六感小宇宙力量~/@Q3>\'
   +'|{cmd}<不懂你说什么，我要练功去了/@exit>\'
   );

end;

procedure _Q1;
begin
   This_NPC.NpcDialog(This_Player,
   '看来你还没有悟道，以后再来吧\'
   +'|{cmd}<离开/@exit>'
   );

end;

procedure _Q2;
begin
   This_NPC.NpcDialog(This_Player,
   '回答的不错~很合老夫的心意\'
   +'来，拜月族的秘宝等待着真正的主人\'
   +'迎接挑战去吧！！！\\'
   +'|{cmd}<恩!我愿意挑战！/@join>\'
   +'|{cmd}<算了,我还没准备好/@exit>\'
   );

end;

procedure _Q3;
begin
   This_NPC.NpcDialog(This_Player,
   '看来你还没有悟道，以后再来吧\'
   +'|{cmd}<离开/@exit>'
   );

end;


procedure _join;
begin
   This_NPC.NpcDialog(This_Player,
   '在绝情谷有一间破屋，那是进入试练之地的通道\'
   +'有信心的话就去挑战吧，记住只要有心谁都能成为最强\'
   +'|{cmd}<离开/@exit>'
   );

end;


begin
  domain;
end. 