{********************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '挑好了你所需要的东西吗？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;

begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(200);

  //加载道具
  This_NPC.FillGoods('地牢逃脱卷', 200, 1);
  This_NPC.FillGoods('随机传送卷', 200, 1); 
  This_NPC.FillGoods('金创药(中量)', 200, 1);
  This_NPC.FillGoods('魔法药(中量)', 200, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  //加载stdmode 
  This_NPC.AddStdMode(0);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '你也和来这里的其他人一样追寻海市蜃楼。\'+
   '嗞嗞。。。 向目标前进也是件好事，但是记住，\'+
   '命只有一条。来，我延长你一点生命，需要什么吗？\ \'+
   '|{cmd}<买药/@buy> \'+
   '|{cmd}<退出/@doexit>');
end.