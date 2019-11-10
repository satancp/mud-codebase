{********************************************************************

*******************************************************************}

program mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

var
ck_name : array[1..66] of string;
ck_value : array[1..66] of integer; 

procedure OnInitialize;
begin

ck_name[1] :='战神项链';
ck_name[2] :='战神手镯';
ck_name[3] :='战神戒指';
ck_name[4] :='真魂戒指';
ck_name[5] :='真魂手镯';
ck_name[6] :='真魂项链';
ck_name[7] :='圣魔戒指';
ck_name[8] :='圣魔手镯';
ck_name[9] :='圣魔项链';
ck_name[10] :='恶魔铃铛';
ck_name[11] :='龙之手镯';
ck_name[12] :='紫碧螺';
ck_name[13] :='三眼手镯';
ck_name[14] :='泰坦戒指';
ck_name[15] :='灵魂项链';
ck_name[16] :='绿色项链';
ck_name[17] :='力量戒指';
ck_name[18] :='骑士手镯';
ck_name[19] :='黑铁头盔';
ck_name[20] :='法神头盔';
ck_name[21] :='法神戒指';
ck_name[22] :='法神手镯';
ck_name[23] :='法神项链';
ck_name[24] :='圣战项链';
ck_name[25] :='圣战手镯';
ck_name[26] :='圣战戒指';
ck_name[27] :='圣战头盔';
ck_name[28] :='天尊头盔';
ck_name[29] :='天尊项链';
ck_name[30] :='天尊戒指';
ck_name[31] :='雷霆项链';
ck_name[32] :='雷霆护腕';
ck_name[33] :='雷霆战戒';
ck_name[34] :='烈焰项链';
ck_name[35] :='烈焰护腕';
ck_name[36] :='烈焰魔戒';
ck_name[37] :='光芒项链';
ck_name[38] :='光芒护腕';
ck_name[39] :='光芒道戒';
ck_name[40] :='避魂靴';
ck_name[41] :='钢铁腰带';
ck_name[42] :='圣战宝甲';
ck_name[43] :='紫绸靴';
ck_name[44] :='青铜腰带';
ck_name[45] :='霓裳羽衣';
ck_name[46] :='天师长袍';
ck_name[47] :='天尊道袍';
ck_name[48] :='天魔神甲';
ck_name[49] :='法神披风';
ck_name[50] :='青铜腰带';
ck_name[51] :='霓裳羽衣';
ck_name[52] :='恶魔长袍(女)';
ck_name[53] :='恶魔长袍(男)';
ck_name[54] :='幽灵战衣(女)';
ck_name[55] :='幽灵战衣(男)';
ck_name[56] :='战神盔甲(男)';
ck_name[57] :='战神盔甲(女)';
ck_name[58] :='雷霆腰带';
ck_name[59] :='雷霆战靴';
ck_name[60] :='烈焰腰带';
ck_name[61] :='烈焰魔靴';
ck_name[62] :='光芒腰带';
ck_name[63] :='光芒道靴';
ck_name[64] :='灯笼项链';
ck_name[65] :='记忆项链';
ck_name[66] :='白色虎齿项链';




ck_value[1] :=88;
ck_value[2] :=88;
ck_value[3] :=88;
ck_value[4] :=88;
ck_value[5] :=88;
ck_value[6] :=88;
ck_value[7] :=88;
ck_value[8] :=88;
ck_value[9] :=88;
ck_value[10] :=88;
ck_value[11] :=88;
ck_value[12] :=88;
ck_value[13] :=88;
ck_value[14] :=88;
ck_value[15] :=88;
ck_value[16] :=88;
ck_value[17] :=88;
ck_value[18] :=88;
ck_value[19] :=88;
ck_value[20] :=88;
ck_value[21] :=88;
ck_value[22] :=88;
ck_value[23] :=88;
ck_value[24] :=88;
ck_value[25] :=88;
ck_value[26] :=88;
ck_value[27] :=88;
ck_value[28] :=88;
ck_value[29] :=88;
ck_value[30] :=88;
ck_value[31] :=88;
ck_value[32] :=88;
ck_value[33] :=88;
ck_value[34] :=88;
ck_value[35] :=88;
ck_value[36] :=88;
ck_value[37] :=88;
ck_value[38] :=88;
ck_value[39] :=88;
ck_value[40] :=88;
ck_value[41] :=88;
ck_value[42] :=88;
ck_value[43] :=88;
ck_value[44] :=88;
ck_value[45] :=88;
ck_value[46] :=88;
ck_value[47] :=88;
ck_value[48] :=88;
ck_value[49] :=88;
ck_value[50] :=88;
ck_value[51] :=88;
ck_value[52] :=88;
ck_value[53] :=88;
ck_value[54] :=88;
ck_value[55] :=88;
ck_value[56] :=88;
ck_value[57] :=88;
ck_value[58] :=88;
ck_value[59] :=88;
ck_value[60] :=88;
ck_value[61] :=88;
ck_value[62] :=88;
ck_value[63] :=88;
ck_value[64] :=88;
ck_value[65] :=88;
ck_value[66] :=88;



end; 

procedure _Checkup;
begin
  This_Npc.NpcDialog(This_Player,
  '可以鉴定的装备：\'
  +'<祖玛级以上首饰/c=red>\'
  +'鉴定成功有几率增加以下属性：\'
  +'<攻击、魔法、道术/c=red>\'
  +'<所有属性加起来最大值不超过6点/c=red>\'
  +'每次鉴定消耗88元宝，有几率失败！！：\'
  +'<失败不会损坏装备，但会收取元宝！！。/c=red>\'
  +'|{cmd}<开始鉴定/@Checkup_1>        ^<关闭/@doexit>' 
  );
  
end; 

procedure _Checkup_1;
begin
   This_NPC.Click_CommitItem(This_Player,1,'待鉴定装备：'); 
end; 

procedure CommitItem(AType:word);
var
i,ck_num,ck_kind,YBNum,ck_gold,ck_rand:integer;
 
ck_str,ck_red:string; 
begin
     ck_gold := 0;  //初始化 
     ck_str := '';  //初始化
     ck_red := '';  //初始化
     
     for ck_kind := 1 to 66 do
     begin
       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa1 + This_Item.AddPa2 + This_Item.AddPa3 + This_Item.AddPa4 + This_Item.AddPa5; 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 6) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold;
           end;
         end;  
       end;
     end;
     
     if ck_num > 5 then
     begin
     This_Player.NotifyClientCommitItem(0,'无法鉴定：你的'+This_Item.ItemName+'已激发出所有属性！');  
     end else
     if ck_gold > 0 then
     begin                                                                                             
      if This_Player.YBNum >= ck_gold then
       begin
         ck_rand := random(10000);
         if ck_rand < 6024 then
         begin
         This_Player.NotifyClientCommitItem(0,'升级失败，你的首饰属性未发生变化');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         
         end else
         if ck_rand < 7874 then
         begin 
         This_Item.AddPa3 := This_Item.AddPa3 + 1;   //攻击+1 
         ck_str :='攻击+1';
         ck_red :='红字公告'; 
         end else
         if ck_rand < 8724 then
         begin 
         This_Item.AddPa4 := This_Item.AddPa4 + 1;   //魔法+1 
         ck_str :='魔法+1';
         ck_red :='红字公告'; 
         end else
         if ck_rand < 9574 then
         begin 
         This_Item.AddPa5 := This_Item.AddPa5 + 1;   //道术+1 
         ck_str :='道术+1';
         ck_red :='红字公告'; 
         end else
         if ck_rand < 9742 then
         begin 
         This_Item.AddPa3 := This_Item.AddPa3 + 2;   //攻击+2 
         ck_str :='攻击+2'; 
         ck_red :='红字公告'; 
         end else
         if ck_rand < 9870 then
         begin 
         This_Item.AddPa4 := This_Item.AddPa4 + 2;   //魔法+2 
         ck_str :='魔法+2';
         ck_red :='红字公告'; 
         end else
         if ck_rand < 9998 then
         begin 
         This_Item.AddPa5 := This_Item.AddPa5 + 2;   //道术+2 
         ck_str :='道术+2'; 
         ck_red :='红字公告';
         end; 

         This_Player.PsYBConsum(This_NPC,'xin',20159,88,1);
         if ck_str <> '' then 
         begin
         This_Player.NotifyClientCommitItem(0,'鉴定成功：你的'+This_Item.ItemName+'提升了'+ck_str+'！');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         end;   
         if ck_red <> '' then This_NPC.NpcNotice('恭喜：'+This_Player.Name+'在庄园云游鉴定师鉴定'+This_Item.ItemName+'时提升了'+ck_str+'！');
         This_Player.AddLogRec(9, This_Item.ItemName, 811152, ck_gold, ck_str);
       end else
       begin
       This_Player.NotifyClientCommitItem(0,'无法鉴定：你的元宝不足不足，需要'+inttostr(ck_gold)+'元宝。'); 
       end;
     end else 
     begin
        This_Player.NotifyClientCommitItem(0,'该物品不可鉴定，请投入可鉴定的装备！');   
     end;   
end;
procedure _CheckupRule;
begin
  This_Npc.NpcDialog(This_Player,
  '可以鉴定的装备：\'
  +'<沃玛、祖玛、赤月等/c=red>\'
  +'鉴定成功有几率增加以下属性：\'
  +'<攻击、魔法、道术/c=red>\'
  +'每次鉴定消耗一定数量的元宝：\'
 
  +'|{cmd}<返回/@main>' 
  );
end;
function xin(price, num: Integer):boolean; 
begin
   result := true; 
 
end;

 

begin
  This_Npc.NpcDialog(This_Player,
  '我云游一生，见识过玛法大陆上的各种奇珍异宝\'
  +'学会了鉴定首饰的强大技能！，如果你有沃玛级\'
  +'以上的首饰，可以到我这里鉴定出极品属性，鉴定\'
  +'可以随机获得攻击，魔法，道术等属性，每次收取88\'
  +'元宝，当然会有失败的几率，失败不损坏装备，只收取元宝\ \'
  +'|{cmd}<开始鉴定/@Checkup>   |{cmd}<查看可以升级的防具/@CheckupRule>    \' 
  );
end.
   