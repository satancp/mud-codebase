{********************************************************************

*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;
procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_NPC.NpcDialog(This_Player,
   '欢迎光临，不想试一下你的运气吗？\'
   +'就算没有中奖，我也不负责。\'
   +'如果你同意，就请抽奖吧。到了一定的限度，你的钱会掉到地上，\'
   +'请注意啊!\ \'
   +'|{cmd}<买彩票/@buy>\'
   +'|{cmd}<了解/@Bingo>彩票\'
   +'|{cmd}<退出/@exit>'
   
   
   );
end;

   



procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请挑选要购买的物品。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;


procedure _Bingo;
begin
   This_NPC.NpcDialog(This_Player,
   '|  1等    1,000,000金币\'
   +'|  2等      200,000金币\'
   +'|  3等      100,000金币\'
   +'|  4等       10,000金币\'
   +'|  5等        1,000金币\'
   +'|  6等          500金币\ \'
   +'|{cmd}<返回/@main>'
   );

end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.FillGoods('彩票',10000,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.