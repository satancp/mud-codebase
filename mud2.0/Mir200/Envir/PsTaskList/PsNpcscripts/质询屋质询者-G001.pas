{
*******************************************************************}

PROGRAM Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _mengzhong;
begin
   if compareText(This_Player.MapName, 'G001') = 0 then
   begin
      This_Player.RandomFlyTo('3');
   end;
end;

Procedure _biqi;
begin
   if compareText(This_Player.MapName, 'G001') = 0 then
   begin
      This_Player.RandomFlyTo('0');
   end;
end;

procedure _jinpai;
begin
  This_Npc.NpcDialog(This_Player,
  '只要你是金牌帐号，这里的奖品就有你一份！\在转变为金牌账号之后，才能进行奖品的领取领取奖品之前，请保留足够的包裹空间，否则不能正常领取 \'
  +'|{cmd}<领取奖品/@liaojie>\ \'
  +'|{cmd}<返回/@main>                      <离开/@doexit>'
  );
end;

procedure _liaojie;
begin
  This_Npc.NpcDialog(This_Player,
  '领取奖品之前，请保留足够的包裹空间，否则不能正常领取对于高等级玩家，可领取小于当前等级的所有奖品。\每个金牌帐号仅一个角色可领取奖品，且每件奖品只能领取1次\我会根据你当前的等级，给你相应的奖品。\ \'
  +'|{cmd}<领取奖品/@lingqu>                      ^<查询奖品设置/@jiang>\'
  +'|{cmd}<离开/@doexit>'
  );
end;

procedure _lingqu;
begin
  This_Npc.NpcDialog(This_Player,
  '请确认有足够的包裹空间放置奖品，否则不能正常领取，\如因包裹空间不足，导致不能正常领取，责任由你承担。\你将不再可以重新领取因包裹空间不足没有正常领取的奖品。\ \'
  +'我有足够的空间，<确认领取/@goldidreq>\ \'
  +'|{cmd}<查询奖品设置/@jiang>              ^<离开/@doexit>'
  );
end;

procedure _goldidreq;
begin
  This_Npc.ReqItemByGoldID(This_Player);
end;

procedure _jiang;
begin
  This_Npc.NpcDialog(This_Player,
  '金牌帐号的奖品设置：在相应等级可领取相应的奖品：\28级：随机获得炼狱、银蛇、魔杖中的任意1件\35级：随机获得祝福油、矿洞组队卷轴、神殿组队卷轴、\      邪窟组队卷轴、地穴组队卷轴、石墓组队卷轴的任意1件\40级：随机获得裁决之杖、骨玉权杖、龙纹剑中的任意1件\42级：随机获得天魔神甲、圣战宝甲、天尊道袍、天师长袍、\      霓裳羽衣、法神披风，这六件40级重装中的任意1件\ \'
  +'|{cmd}<查看下一页/@next5>                   ^<返回/@main>'
  );
end;

procedure _next5;
begin
  This_Npc.NpcDialog(This_Player,
  '44级:随机获得三职业1.8版新技能：灭天火、寒冰掌、\气功波、无极真气、狮子吼中的任意1本\47、48、49级:均可在以下物品中随机领取一样物品\雷霆战戒、雷霆护腕、雷霆项链、雷霆腰带、雷霆战靴\光芒道戒、光芒护腕、光芒项链、光芒道靴、光芒腰带\烈焰腰带、烈焰护腕、烈焰项链、烈焰魔靴、烈焰魔戒\ \'
  +'|{cmd}<查看下一页/@next6>                  ^<返回/@main>'
  );
end;

procedure _next6;
begin
  This_Npc.NpcDialog(This_Player,
  '50级:可以在以下物品中随机领取一样物品：\战神手镯、战神戒指、战神项链\圣魔手镯、圣魔戒指、圣魔项链\真魂手镯、真魂戒指、真魂项链\ \|{cmd}<返回/@main>'
  );
end;

Procedure _HeroAct();
begin
   This_Npc.NpcDialog(This_Player,
   '你想要离开吗？\ \'+
   '|{cmd}<领取金牌帐号奖励/@jinpai>              ^<热血传奇全区全服排行榜/@QuanQuQuanFu>\ \'+
   '|{cmd}<回盟重/@mengzhong>                        ^<回比奇/@biqi>\'+
   '|{cmd}<不离开/@doexit>');
end;

Procedure _GHeroAct;
begin
   _HeroAct();
end;

Procedure _QuanQuQuanFu;
begin
   This_NPC.NpcDialog(This_Player,
   '\'+
   '|{cmd}<查看活动具体规则/@QuanQGuize>\ \'+
   '|{cmd}<查询本期排行榜/@GThisWeekOrder~1>\ \'+
   '|{cmd}<查询上期排行榜/@GLastWeekOrder~1>\');
end;

 //全区全服祝福点部分。 
procedure _GLastWeekOrder(sPage: string);
begin
  if sPage <> nil then
  begin
   // This_Npc.QueryGLastWeekPoints(This_Player, StrToInt(sPage));  
  end;
end;

procedure _GThisWeekOrder(sPage: string);
begin
  if sPage <> nil then
  begin
   // This_Npc.QueryGThisWeekPoints(This_Player, StrToInt(sPage));  
  end;
end;

Procedure _QuanQGuize;
begin
   This_NPC.NpcDialog(This_Player,
   '1. <活动时间内所有区服祝福点排名在前10位的玩家将被集合起来，/c=red>\'+
   '<并按祝福点数量进行排名/c=red>，只显示火种排名前100家。\'+
   '   祝福点数量相同的玩家，等级高的排位在前，等级相同情况下，\'+
   '   经验高的玩家排位在前。\ \'+
   '2. \ \'+   //第二条描述获得奖励规则，暂空 
   '|{cmd}<下一页/@QQNextPage>                                ^<返回/@main>');
end;

Procedure _QQNextPage;
begin
   This_NPC.NpcDialog(This_Player,
   '3. 奖励发放将在活动结束之后由GM手动发放。\ \'+
   '|{cmd}<返回/@main>');
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '你想要离开吗？\ \'+
   '|{cmd}<领取金牌帐号奖励/@jinpai>              ^<热血传奇全区全服排行榜/@QuanQuQuanFu>\ \'+
   '|{cmd}<回盟重/@mengzhong>                        ^<回比奇/@biqi>\'+
   '|{cmd}<不离开/@doexit>');
end.