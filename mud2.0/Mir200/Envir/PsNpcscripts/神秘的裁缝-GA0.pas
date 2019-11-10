{********************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I ActiveValidateCom.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

var
tm_name : array[1..26] of string; 

procedure OnInitialize;
begin
tm_name[1] :='藏宝图301';
tm_name[2] :='藏宝图302';
tm_name[3] :='藏宝图303';
tm_name[4] :='藏宝图304';
tm_name[5] :='藏宝图305';
tm_name[6] :='藏宝图306';
tm_name[7] :='藏宝图307';
tm_name[8] :='藏宝图308';
tm_name[9] :='藏宝图309';
tm_name[10] :='藏宝图310';
tm_name[11] :='藏宝图311';
tm_name[12] :='藏宝图312';
tm_name[13] :='藏宝图313';
tm_name[14] :='藏宝图314';
tm_name[15] :='藏宝图315';
tm_name[16] :='藏宝图316';
tm_name[17] :='藏宝图317';
tm_name[18] :='藏宝图318';
tm_name[19] :='藏宝图319';
tm_name[20] :='藏宝图320';
tm_name[21] :='藏宝图321';
tm_name[22] :='藏宝图322';
tm_name[23] :='藏宝图323';
tm_name[24] :='藏宝图324';
tm_name[25] :='藏宝图325';
tm_name[26] :='藏宝图326';
end; 

procedure _TreasureMapFx;
begin
  This_Npc.NpcDialog(This_Player,
   '修复藏宝图需要耗费大量的金刚石和藏宝图碎片，勇士如果愿意\'
   +'提供一些帮助，我自然感激不尽。\'
   +'如果能成功修复，我愿以藏宝图相赠。\'
   +'如果修复失败可能会一无所获，还请勇士量力而为。\ \'
   +'|{cmd}<递交10颗金刚石/@TreasureMapFx1>\ \'
   +'|{cmd}<递交1张藏宝图碎片/@TreasureMapFx2>\'
   +'|{cmd}<返回/@main>'
   );
end; 

procedure TreasureMapFxGo;
var 
temp,temp_gold:integer;
str:string;
begin
   temp:= random(300);
   if temp < 1 then
   begin
     str:= tm_name[random(26)+1];
     This_Player.Give(str,1); 
     This_Npc.NpcDialog(This_Player,
     '你果然是有缘之人，藏宝图已经修复了，这张藏宝图就送你了！\'
     +'<获得：'+str+'/c=red>\ \ \'
     +'|{cmd}<继续递交10颗金刚石/@TreasureMapFx1>\ \'
     +'|{cmd}<继续递交1张藏宝图碎片/@TreasureMapFx2>\'
     +'|{cmd}<返回/@main>'
     );
     This_NPC.NpcNotice('恭喜'+This_Player.Name+'在苍月岛衣服店帮助神秘的裁缝时获得：'+str+'！'); 
     This_Player.AddLogRec(9, str, 811156, 1, '魔龙藏宝图');
   end else
   if temp < 76 then
   begin
   This_Player.MyShengwan := This_Player.MyShengwan + 1;
   This_Player.PlayerNotice('你获得了1点声望',2);
   This_Npc.NpcDialog(This_Player,
   '谢谢你的帮助，但还是失败了，藏宝图已经损坏，\'
   +'作为补偿，请收下我的一点心意。\' 
   +'<获得：1点声望/c=red>\ \'
   +'|{cmd}<继续递交10颗金刚石/@TreasureMapFx1>\ \'
   +'|{cmd}<继续递交1张藏宝图碎片/@TreasureMapFx2>\'
   +'|{cmd}<返回/@main>'
   );
   end else
   begin
   temp_gold := random(50000)+1;
   This_Player.AddGold(temp_gold);
   This_Player.PlayerNotice('你获得了'+inttostr(temp_gold)+'金币',2);
   This_Npc.NpcDialog(This_Player,
   '谢谢你的帮助，但还是失败了，藏宝图已经损坏，\'
   +'很遗憾我没有什么东西给你了，这些金币还请收下。\'
   +'<获得：'+inttostr(temp_gold)+'金币/c=red>\ \' 
   +'|{cmd}<继续递交10颗金刚石/@TreasureMapFx1>\ \'
   +'|{cmd}<继续递交1张藏宝图碎片/@TreasureMapFx2>\'
   +'|{cmd}<返回/@main>'
   );
   end;
   //This_Player.IncActivePoint(1);  //增加活跃度1
end;

procedure _TreasureMapFx1;
begin
  if not AutoOpen(4) then exit;
  if This_Player.GetBagItemCount('金刚石') >= 10 then
  begin
    if This_Player.GoldNum > 49950000 then
    begin
    This_Npc.NpcDialog(This_Player,
    '你携带的金币太多了。\'
    ); 
    exit;
    end;
    if (This_Player.CheckAuthen(1,100) = false) and (This_Player.GoldNum > 1950000) then
    begin
    This_Npc.NpcDialog(This_Player,
    '你携带的金币太多了。\'
    ); 
    exit;
    end;
    if This_Player.FreeBagNum > 0 then
    begin
    This_Player.Take('金刚石',10);
    TreasureMapFxGo; 
    This_Player.AddLogRec(9, '金刚石', 811156, 10, '魔龙藏宝图');
    end else
    This_Npc.NpcDialog(This_Player,
    '你的包裹太满了。\'
    ); 
  end else
  This_Npc.NpcDialog(This_Player,
  '你没有足够的金刚石。\'
  ); 
end; 

procedure _TreasureMapFx2;
begin
  if not AutoOpen(4) then exit;
  if This_Player.GetBagItemCount('藏宝图碎片') > 0 then
  begin
    if This_Player.GoldNum > 49950000 then
    begin
    This_Npc.NpcDialog(This_Player,
    '你携带的金币太多了。\'
    ); 
    exit;
    end;
    if (This_Player.CheckAuthen(1,100) = false) and (This_Player.GoldNum > 1950000) then
    begin
    This_Npc.NpcDialog(This_Player,
    '你携带的金币太多了。\'
    ); 
    exit;
    end;
    if This_Player.FreeBagNum > 0 then
    begin
    This_Player.Take('藏宝图碎片',1);
    TreasureMapFxGo; 
    end else
    This_Npc.NpcDialog(This_Player,
    '你的包裹太满了。\'
    ); 
  end else
  This_Npc.NpcDialog(This_Player,
  '你没有藏宝图碎片。\'
  ); 
end;

procedure _TreasureMapCt;
begin
   This_Npc.NpcDialog(This_Player,
   '如果你有多余的藏宝图，可以交给我。\ \'
   +'<每张藏宝图我会使用588颗金刚石与你交换。/c=red>\ \'
   +'请将要交给我的藏宝图放入框内，点击确定即可。\ \'
   +'|{cmd}<返回/@main>'
  );
  This_NPC.Click_CommitItem(This_Player,1,'请投入藏宝图：'); 
end; 

procedure CommitItem(AType:word);
var
tm_kind,dm_num:integer;
begin
   dm_num:=0;
   for tm_kind := 1 to 26 do
   begin
   if tm_name[tm_kind] = This_Item.ItemName then dm_num := 588;
   end;
   
   if dm_num > 0 then
   begin
   This_Player.TakeByClientID(This_Item.ClientItemID);
   This_Player.Give('金刚石',dm_num);   
   This_Player.NotifyClientCommitItem(1,'');
   end else 
   begin
   This_Player.NotifyClientCommitItem(0,'我不要这个物品，请投入藏宝图！');   
   end;   
end;

procedure _TreasureMapR1;
begin
   This_Npc.NpcDialog(This_Player,
   '|1.使用10颗金刚石可以帮助裁缝修复藏宝图。\'
   +'|2.使用1张藏宝图碎片可以帮助裁缝修复藏宝图。\'
   +'|3.修复成功即可获得魔龙衣服藏宝图。\'
   +'|4.修复失败有几率获得声望奖励。\'
   +'|5.多余的藏宝图可交予神秘的裁缝兑换588颗金刚石。\ \' 
   +'|{cmd}<返回/@main>'
   );
end; 

procedure _TreasureMapR2;
begin
   This_Npc.NpcDialog(This_Player,
   '关于魔龙神甲，我只听说过它的强大，具体如何获得，还得向\'
   +'盟重衣服店老板打听一番。\ \'
   +'|{cmd}<查看雷霆战甲/@TreasureMapR2_1>      ^<查看烈焰魔衣/@TreasureMapR2_2>\ \' 
   +'|{cmd}<查看光芒道袍/@TreasureMapR2_3>      ^<返回/@main>'
  );
end; 

procedure _TreasureMapR2_1;
begin
   This_Npc.NpcDialog(This_Player,
   '雷霆战甲(男)：防御5-12，魔御4-8，攻击1-3，需要42级\'
   +'据说拥有以下藏宝图就能合成雷霆战甲(男)：\'
   +'藏宝图301，藏宝图302，藏宝图303，藏宝图304，\' 
   +'藏宝图305，藏宝图306，藏宝图307，藏宝图308\'
   +'雷霆战甲(女)：防御5-12，魔御4-8，攻击1-3，需要42级\'
   +'据说拥有以下藏宝图就能合成雷霆战甲(女)：\'
   +'藏宝图301，藏宝图302，藏宝图309，藏宝图310，\'
   +'藏宝图311，藏宝图312，藏宝图313，藏宝图314\'
   +'|{cmd}<返回/@TreasureMapR2>'
  );
end; 

procedure _TreasureMapR2_2;
begin
   This_Npc.NpcDialog(This_Player,
   '烈焰魔衣(男)：防御5-12，魔御4-8，魔法3-5，需要42级\'
   +'据说拥有以下藏宝图就能合成烈焰魔衣(男)：\'
   +'藏宝图305，藏宝图306，藏宝图307，藏宝图308，\' 
   +'藏宝图315，藏宝图316，藏宝图317，藏宝图318\'
   +'烈焰魔衣(女)：防御5-12，魔御4-8，魔法3-5，需要42级\'
   +'据说拥有以下藏宝图就能合成烈焰魔衣(女)：\'
   +'藏宝图311，藏宝图312，藏宝图313，藏宝图314，\'
   +'藏宝图315，藏宝图316，藏宝图319，藏宝图320\'
   +'|{cmd}<返回/@TreasureMapR2>'
  );
end; 

procedure _TreasureMapR2_3;
begin
   This_Npc.NpcDialog(This_Player,
   '光芒道袍(男)：防御5-12，魔御4-8，道术3-5，需要42级\'
   +'据说拥有以下藏宝图就能合成光芒道袍(男)：\'
   +'藏宝图305，藏宝图306，藏宝图307，藏宝图308，\' 
   +'藏宝图321，藏宝图322，藏宝图323，藏宝图324 \'
   +'光芒道袍(女)：防御5-12，魔御4-8，道术3-5，需要42级\'
   +'据说拥有以下藏宝图就能合成光芒道袍(女)：\'
   +'藏宝图311，藏宝图312，藏宝图313，藏宝图314，\'
   +'藏宝图321，藏宝图322，藏宝图325，藏宝图326\'
   +'|{cmd}<返回/@TreasureMapR2>'
  );
end; 

Begin
   if AutoOpen(4) then
   begin 
   This_Npc.NpcDialog(This_Player,
   '魔龙神甲一直是玛法勇士梦寐以求的宝物，是力量的象征。\'
   +'但是玛法大陆连年征战，这些神甲也渐渐不知所踪。\'
   +'我倾尽毕生心血，只愿能复原这残存的藏宝图，寻找神甲的下落。\'
   +'只是这修复工作需要耗费大量的金刚石和藏宝图碎片，我云游四方\'
   +'也未能完成心愿，勇士能否助我一臂之力？\ \'
   +'|{cmd}<修复藏宝图/@TreasureMapFx>            ^<回收藏宝图/@TreasureMapCt>\ \'
   +'|{cmd}<查看详细信息/@TreasureMapR1>          ^<查看魔龙神甲/@TreasureMapR2>'
   );
   end else
   This_Npc.NpcDialog(This_Player,
   '魔龙神甲一直是玛法勇士梦寐以求的宝物，是力量的象征。\'
   +'但是玛法大陆连年征战，这些神甲也渐渐不知所踪。\'
   +'我倾尽毕生心血，只愿能复原这残存的藏宝图，寻找神甲的下落。\ \'
   +'|<（'+inttostr(AutoOpenDay(4))+'天后将开始修复藏宝图）/c=red>\ \'
   );
end.