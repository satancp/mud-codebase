{
/************************************************************************}



Program Mir2;


{$I common.pas}


PROCEDURE _shengji;
begin
   This_Npc.NpcDialog(This_Player,
   '听说盟重土城的张家布店老板学会了一项技能，能够使用\'+
   '神秘配方对雷霆、光芒、烈焰系列进行升级和合成，不过\'+
   '我不知道具体的情况，要么您亲自去问一下她本人吧。\ \'+
   '|{cmd}<离开/@doexit>\');
end;

PROCEDURE _qweapon;
begin
   This_Npc.NpcDialog(This_Player,
   '传说中3位留下了三套绝顶装备。法神套装听说就在赤月\'+ 
   '峡谷的双头金刚手里，得到它的魔法师将是最接近神的人……\ \'+
   '|{cmd}<返回/@main>\');
end;


Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _gongdian;
Begin
   This_Npc.NpcDialog(This_Player,
   '天工神剪可是我的师傅，教会了我很多手艺，不过自从我学成\'+
   '出师之后，我也再也没有见过师傅了后来我才听师兄弟们说起\'+
   '好像师傅失踪了，可能是被魔神囚禁了。我们都很焦急，不知\'+
   '道你能不能帮助我们找到我们的师傅，听说他被囚禁在地下宫\'+
   '殿，魔王为了不让人类前去营救，将魔兽都派去地下宫殿。当\'+
   '然，它们也带去了为数壮观的宝藏。作为报答，我们决定把从\'+
   '没公开过的技艺公布。\ \'+
   '|{cmd}<升级雷霆、光芒、烈焰套装的线索/@shengji>             ^<离开/@doexit>');
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '可以修复衣服，头盔，帽子。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '看来修补得很不错。\ \ \' +
  '|{cmd}<返回/@main>');
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
   '修得还算不错。\ \ \' +
   '|{cmd}<返回/@main>');
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '请放上去要卖的衣服，我给估价。\'+
   '头盔和帽子也收购，最好在这儿一起卖吧。\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '你想买什么样的衣服？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('布衣(男)', 50, 1);
  This_NPC.FillGoods('布衣(女)', 50, 1); 
  This_NPC.FillGoods('轻型盔甲(男)', 50, 1);
  This_NPC.FillGoods('轻型盔甲(女)', 50, 1);
  This_NPC.FillGoods('中型盔甲(男)', 50, 1);
  This_NPC.FillGoods('中型盔甲(女)', 50, 1);
  This_NPC.FillGoods('重盔甲(男)', 50, 3);
  This_NPC.FillGoods('重盔甲(女)', 50, 3);
  This_NPC.FillGoods('魔法长袍(男)', 50, 3);
  This_NPC.FillGoods('魔法长袍(女)', 50, 3);  
  This_NPC.FillGoods('灵魂战衣(男)', 50, 3);
  This_NPC.FillGoods('灵魂战衣(女)', 50, 3);
  This_NPC.FillGoods('幽灵战衣(男)', 50, 1);
  This_NPC.FillGoods('幽灵战衣(女)', 50, 1);
  This_NPC.FillGoods('恶魔长袍(男)', 50, 1);
  This_NPC.FillGoods('恶魔长袍(女)', 50, 1);
  This_NPC.FillGoods('战神盔甲(男)', 50, 1);
  This_NPC.FillGoods('战神盔甲(女)', 50, 1); 
  //加载stdmode
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(27);
  This_NPC.AddStdMode(28);
end;


var
j : integer;

Begin
   j := random(3);
   if (j = 1) or (j=2) then 
   begin
      This_Npc.NpcDialog(This_Player,
      '我的好朋友您来啦，我可跟您说，别以为铁匠给你打了柄好剑就可\'+
      '以横行玛法了，江湖上从来都不缺黑刀子。对了，现在有谣言说封\'+
      '魔谷有人在和妖魔暗中联系。下次去封魔谷的时候，您可要当心了！\ \'+
      '|{cmd}<买衣服/@buy>  '+addspace(' ',26)+'|{cmd}<卖衣服/@sell>  \'+
      '|{cmd}<修补衣服/@repair>  '+addspace(' ',24)+'|{cmd}<特殊修理/@s_repair>\' +
      '|{cmd}<打听天工神剪的故事/@gongdian>\ \'+
      '|{cmd}<退出/@doexit>');
   end;
   if j = 0 then 
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢光临，有什么事情需要我帮忙吗？\ \'+
      '|{cmd}<买衣服/@buy>  '+addspace(' ',26)+'|{cmd}<卖衣服/@sell>  \'+
      '|{cmd}<修补衣服/@repair>  '+addspace(' ',24)+'|{cmd}<特殊修理/@s_repair>\' +
      '|{cmd}<打听天工神剪的故事/@gongdian>\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end.