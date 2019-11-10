{********************************************************************

*******************************************************************}


Program Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;



//原内容； 
Procedure _join;
Begin
   This_Npc.NpcDialog(This_Player,
   '既然你已经有了挑战的觉悟，那么我就告诉你吧！\'+
   '前往封魔谷寻找一口枯井，去战胜井底的魔物吧\ \'+
   '|{cmd}<离开/@doexit>');
end;



Begin
      This_Npc.NpcDialog(This_Player,
      '春望桃花 夏观海，人生短短数载，有如梦幻！年轻人，\'+
      '你难道不对海的对面充满着好奇吗？那一望无际的海，与天相接，\'+
      '真是无限广阔阿~\'+
      '一个法师的对于自身力量的追求就应该像大海一样无穷无尽，\'+
      '让法力犹如海一般深邃，犹如海一般宽广！\'+
      '来，愿不愿意去挑战自己？成为海一般的人？\ \'+
      '|{cmd}<哦！好的！让我试试！/@join>\'+
      '|{cmd}<算了，我还是离开吧/@doexit>\');
end.