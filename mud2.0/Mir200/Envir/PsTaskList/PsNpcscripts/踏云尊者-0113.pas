
{********************************************************************

*******************************************************************}

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain; 
begin
   This_NPC.NpcDialog(This_Player,
   '成为道士中的高手不但要有一颗救世之心\'
   +'更要有为苍生牺牲自己的觉悟，这就是道士的宿命\'
   +'记住，有付出才有回报，为一己私利而活的人\'
   +'是无法成为真正的道士，来吧接受自身的挑战！\\'
   +'|{cmd}<好!我愿意挑战！/@join>\'
   +'|{cmd}<算了,我还是离开吧/@exit>\'
   );

end;
procedure _join;
begin
   This_NPC.NpcDialog(This_Player,
   '既然你已经有所觉悟，很好！\'
   +'在沃玛森林里住着一位刘老人，在他居住着的房子旁边\'
   +'有一间屋子，战胜里面的魔物，完成对自己的挑战吧！\\'
   +'|{cmd}<离开/@exit>\'
   );

end;

begin
   domain;
end.