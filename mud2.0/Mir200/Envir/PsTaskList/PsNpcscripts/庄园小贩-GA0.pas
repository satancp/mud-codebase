{
/***********************************************************************

/************************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
   '看来你需要我的帮助，\'+
   '我这里可以修理物品，有什么需要修理的就交给我吧。\'+
   '如果你有不要的物品，我这里可以回收\ \'+
   '|{cmd}<买/@buy>                  ^<回收物品/@DestoryItem>\'+
   '|{cmd}<卖/@sell>                  \'+
   '|{cmd}<修理/@repair>                \'+
   '|{cmd}<特殊修理/@s_repair>            \'+
   '|{cmd}<退出/@doexit>                '
   );
end;

Procedure _DestoryItem;
begin
   This_NPC.NpcDialog(This_Player,
   '把需要销毁的东西放进去就行啦！\ \'+
   '|请注意，物品销毁后将<消失/c=red>，无法找回，请<谨慎操作/c=red>！\'+
   '|部分物品无法销毁。'+
   '|{cmd}<开始销毁/@DestoryItem_1>                '
   );
end; 

Procedure _DestoryItem_1;
begin
   This_NPC.Click_CommitItem(This_Player,1,'待销毁道具：'); 
end; 

//-------------删除道具-------------------- 

function NotDestroy(iName : string):boolean;
begin
    result := true;
    case iName of
        '屠龙' : result := false;
    end;
end;

procedure CommitItem(AType:word);
begin
    if NotDestroy(This_Item.ItemName) then 
    begin
    This_Player.TakeByClientID(This_Item.ClientItemID);
    This_Player.NotifyClientCommitItem(1,'');
    This_Player.PlayerNotice(''+This_Item.ItemName+'已销毁。',2);
    end else 
    This_Player.NotifyClientCommitItem(0,'该物品不可销毁，请投入可销毁的物品！'); ; 
         
end;
//----------------------------------------------------------- 


{procedure _xiaohui;
begin
This_NPC.NpcDialog(This_Player,
'把需要销毁的东西放进去就行啦！\ \'+
'请注意，物品销毁后将<消失/c=red>，无法找回，请<谨慎操作/c=red>！\'+
'部分物品无法销毁。'
);
This_NPC.Click_DestroyEquip(This_Player);
end;
} 

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您您要修理吗？我可是个万能工匠哦！\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '怎么样，修好了吧？看起来比新的还值钱！\ \' +
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

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我您要卖的物品。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;

Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;
var
  i : integer;
begin
  This_Npc.SetRebate(100);
  //加载道具
  This_NPC.FillGoods('金创药(小量)', 100, 1);
  This_NPC.FillGoods('魔法药(小量)', 100, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  This_NPC.FillGoods('金创药(小)包', 100, 1);
  This_NPC.FillGoods('魔法药(小)包', 100, 1);
  This_NPC.FillGoods('金创药(中)包', 100, 1);
  This_NPC.FillGoods('魔法药(中)包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);  
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符(大)', 10, 1);
  This_NPC.FillGoods('超级护身符', 10, 1);
  //加载stdmode 
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(3); 
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(16);
  This_NPC.AddStdMode(30);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(43);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;

Begin
  domain;
end.