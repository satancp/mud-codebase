{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Normal;
begin
  This_Npc.NpcDialog(This_Player,
  '感谢，我们有各种各样的衣服 。请告诉我你想买哪一种，\对于'+This_npc.GetCastleGuildName+'的成员是要打20%的折扣的。\因为这个城堡属于'+This_npc.GetCastleGuildName+'。\' 
   +'|{cmd}<打听天工神剪的故事/@gongdian>\'  
   +'|{cmd}<买衣服/@buy>'+ addSpace('', 18) + '|{cmd}<卖衣服/@sell>\'
   +'|{cmd}<修复衣服/@repair>'+ addSpace('', 16) + '|{cmd}<特殊修理/@s_repair>\'
   +'|{cmd}<退出/@doexit>'
   );
end;
   
procedure _GongDian;
begin
  This_Npc.NpcDialog(This_Player,
  +'天工神剪可是我的师傅，教会了我很多手艺\'
  +'不过自从我学成出师之后，我也再也没有见过师傅了\'
  +'后来我才听师兄弟们说起好像师傅失踪了，可能是被魔神囚禁了\'
  +'我们都很焦急，不知道你能不能帮助我们找到我们的师傅\'
  +'听说他被囚禁在地下宫殿\'
  +'魔王为了不让人类前去营救，将魔兽都派去地下宫殿\'
  +'当然，它们也带去了为数壮观的宝藏。\'
  +'作为报答，我们决定把从没公开过的技艺公布\'
  +'|{cmd}<升级雷霆、光芒、烈焰套装的线索/@shengji>'+ addSpace('', 10) + '|{cmd}<返回/@main>'
  );
end;


procedure _Shengji;
begin
  This_Npc.NpcDialog(This_Player,
    '听说盟重土城的张家布店老板学会了一项技能，\' +
    '能够使用神秘配方对雷霆、光芒、烈焰系列进行升级和合成，\' +
    '不过我不知道具体的情况，要么您亲自去问一下她本人吧。\ \' +
    '|{cmd}<离开/@DoExit>'
  );
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想要什么？这件衣服怎么样？\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '把你要卖的给我看看，我会给你一个估价。\头盔或帽子在旁边商店， \您可以到那里去看看。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你的衣服看上去很旧了，在这里修补一下？\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '好了，这个看上去已经补好了。\ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！' +
    '\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \|{cmd}<返回/@main>'
  );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.AddStdMode(27);
  This_Npc.AddStdMode(28);
  This_Npc.FillGoods('布衣(男)',50,1);
  This_Npc.FillGoods('布衣(女)',50,1);
  This_Npc.FillGoods('轻型盔甲(男)',50,1); 
  This_Npc.FillGoods('轻型盔甲(女)',50,1);
  This_Npc.FillGoods('中型盔甲(男)',50,1);
  This_Npc.FillGoods('中型盔甲(女)',50,1);
  This_Npc.FillGoods('幽灵战衣(男)',50,1);
  This_Npc.FillGoods('幽灵战衣(女)',50,1);
  This_Npc.FillGoods('恶魔长袍(男)',30,1);
  This_Npc.FillGoods('恶魔长袍(女)',30,1);
  This_Npc.FillGoods('战神盔甲(男)',30,1);
  This_Npc.FillGoods('战神盔甲(女)',30,1);
  This_Npc.SetRebate(100);
end;

Procedure _XiaoXiCD109;
begin
   if This_Player.GetV(109,1) = 6 then
   begin
      This_Player.Give('经验',600000);
      This_Player.SetV(109,1,7);
      This_Player.UpdateTaskDetail(109,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

//脚本执行的入口
var
  SwQ109 : integer;
begin
   SwQ109 := This_Player.GetV(109,1);
   if SwQ109 = 7 then
   begin
      This_Npc.NpcDialog(This_Player,
      '矿石还没有送到沙巴克铁匠铺么？\ \'+
      '|{cmd}<我这就去/@doexit>\ \'+
      '|{cmd}<我有其他的事情找你/@Normal>');
   end else if SwQ109 = 6 then
   begin
      This_Npc.NpcDialog(This_Player,
      '单据放这里吧。你回去告诉沙巴克铁匠老板，就说单据我收到了。\'+
      '另外，这个是他托我运来的黑铁矿石。你把矿石\'+
      '搬到沙巴克铁匠皮老板那里去吧！干嘛这么瞪着我？告诉你，\'+
      '我只给沙巴克成员提供最好的服务，如果你想我态度好点，\'+
      '麻烦你先证明自己！\'+
      '（任务目标：把消息转达沙巴克铁匠铺）\ \'+
      '|{cmd}<送矿石去，不跟你计较/@XiaoXiCD109>\'+
      '|{cmd}<我有其他的事情找你/@Normal>');
   end else
   begin
     _Normal;
   end;
end.