procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;



procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '欢迎, 我可以为你做什么吗?\'
   +'不要想打折...\'
   +'我认为你别无选择...\ \'
   +'|{cmd}<购买物品/@buy> \'
   +'|{cmd}<出售物品/@sell> \ '
   +'|{cmd}<退出/@exit>'
   );

end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '虽然贵点，但是趁现在有的时候买吧.\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;


procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '要卖什么? 收购衣服,武器和药水.\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.FillGoods('强效金创药',100,1);
  This_Npc.FillGoods('强效魔法药',100,1);
  This_Npc.SetRebate(100);
end;

begin
    domain; 
end.
