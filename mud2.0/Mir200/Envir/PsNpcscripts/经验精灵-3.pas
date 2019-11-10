{
*******************************************************************}

program Mir2;

  
  
  
procedure _jy100;
begin
  if (This_Player.GetBagItemCount('100万经验卷') > 0) then
  begin
      This_Player.Give('经验',1000000);
      This_Player.Take('100万经验卷',1);
      ServerSay('玩家★★★【' + This_Player.Name + '】★★★成功兑换100万经验卷，等级飙升！！',3); 
  end
  else
    This_Npc.NpcDialog(This_Player,
      '小子你没有100万经验卷，不要乱点!'
    );
end;

procedure _jy1000;
begin
  if (This_Player.GetBagItemCount('1000万经验卷') > 0) then
  begin
      This_Player.Give('经验',10000000);
      This_Player.Take('1000万经验卷',1);
      ServerSay('玩家★★★【' + This_Player.Name + '】★★★成功兑换1000万经验卷，等级飙升！！',3); 
  end
  else
    This_Npc.NpcDialog(This_Player,
      '小子你没有1000万经验卷，不要乱点!'
    );
end;





begin

 This_Npc.NpcDialog(This_Player,
   '年轻人，你找我有什么事吗？\' +
   '如果你拥有传说中的经验卷轴，可以到我这里兑换成经验\' +
   '|{cmd}<我有100万经验卷，我要换经验/@jy100>\' +
   '|{cmd}<我有1000万经验卷，我要换经验/@jy1000>\'
    );  
end.