
{********************************************************************

  
*******************************************************************}
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
   '欢迎? 你想购买什么?\'
   +'不要想打折...\'
   +'我认为你别无选择...\'
   +'|{cmd}<购买物品/@buy> \'
   +'|{cmd}<出售物品/@sell> \'
   +'|{cmd}<修理物品/@repair> \'
   +'|{cmd}<取消/@exit>'
   );

end;
 
procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '是有点昂贵,但如果你有能力最好是买下.\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;


procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想把什么卖给我?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '这里只修补衣服和武器\\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.FillGoods('金创药(小量)',1000,1);
  This_Npc.FillGoods('魔法药(小量)',1000,1);
  This_Npc.FillGoods('地牢逃脱卷',1000,1);
  This_Npc.FillGoods('骰子',5,1);
  This_Npc.SetRebate(180);
end;

begin
    domain; 
end.