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
ck_name : array[1..300] of string;
ck_value : array[1..300] of integer; 
procedure OnInitialize;
begin
ck_name[1] :='骨玉权杖'
ck_name[2] :='龙纹剑';
ck_name[3] :='裁决之杖';
ck_name[4] :='龙牙';
ck_name[5] :='怒斩';
ck_name[6] :='逍遥扇';
ck_name[7] :='霸者之刃';
ck_name[8] :='屠龙';
ck_name[9] :='嗜魂法杖';
ck_name[10] :='镇天';
ck_name[11] :='开天';
ck_name[12] :='玄天';
ck_name[13] :='星王圣剑(战)';
ck_name[14] :='星王圣剑(法)';
ck_name[15] :='星王圣剑(道)';
ck_name[16] :='紫金嗜魂法杖';
ck_name[17] :='赤金逍遥扇';
ck_name[18] :='黄金裁决';
ck_name[19] :='狂雷之刃';
ck_name[20] :='通云道剑';
ck_name[21] :='逆火法杖'
ck_name[22] :='王者之刃';
ck_name[23] :='王者之剑';
ck_name[24] :='王者之杖';;


ck_value[1] :=20;
ck_value[2] :=20;
ck_value[3] :=20;
ck_value[4] :=30;
ck_value[5] :=30;
ck_value[6] :=30;
ck_value[7] :=60;
ck_value[8] :=60;
ck_value[9] :=60;
ck_value[10] :=300;
ck_value[11] :=300;
ck_value[12] :=300;
ck_value[13] :=300;
ck_value[14] :=300;
ck_value[15] :=300;
ck_value[16] :=300;
ck_value[17] :=300;
ck_value[18] :=300;
ck_value[19] :=300;
ck_value[20] :=300;
ck_value[21] :=300;
ck_value[22] :=300;
ck_value[23] :=300;
ck_value[24] :=300;
end; 

procedure _Checkup_1;
begin
   This_Player.setv(88,1,1);
   This_Player.setv(88,2,0);
   This_Player.setv(88,3,0);
   This_Player.setv(88,4,0); 
   This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
end; 
procedure _Checkup_2;
begin
   This_Player.setv(88,1,0);
   This_Player.setv(88,2,1);
   This_Player.setv(88,3,0);
   This_Player.setv(88,4,0);
   This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
end; 
procedure _Checkup_3;
begin
   This_Player.setv(88,1,0);
   This_Player.setv(88,2,0);
   This_Player.setv(88,3,1);
   This_Player.setv(88,4,0);
   This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
end; 
procedure _Checkup_4;
begin
   This_Player.setv(88,1,0);
   This_Player.setv(88,2,0);
   This_Player.setv(88,3,0);
   This_Player.setv(88,4,1);
   This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
end; 

procedure CommitItem(AType:word);
var
i,ck_num,ck_kind,ck_gold,ck_rand:integer; 
ck_str,ck_red:string;

begin
     ck_gold := 0;  //初始化 
     ck_str := '';  //初始化
     ck_red := '';  //初始化
  
   if This_Player.getv(88,1)= 1 then 
   begin 
    
    for ck_kind := 1 to 300 do
     
     begin

       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa1; 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 7) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold*2;
           end;
         end;  
       end;
     end;
     
     if ck_num > 6 then

     begin
     This_Player.NotifyClientCommitItem(0,'无法升级：你的'+This_Item.ItemName+'已激发出所有属性！');  
     end else
     if ck_gold > 0 then
     begin                                                                                             
       if This_Player.YBNum >= ck_gold then
 
       begin
         ck_rand := random(100);
        
         if ck_rand < 19 then
         begin 
         This_Player.NotifyClientCommitItem(0,'升级失败，你的武器属性未发生变化');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         end else
         if ck_rand < 79 then
         begin 
         This_Item.AddPa1 := This_Item.AddPa1 + 1;   //攻击+1 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         ck_str :='攻击+1'; 
         ck_red :='红字公告';
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
     
        
         end;  

         if ck_str <> '' then 
         begin
         This_Player.NotifyClientCommitItem(0,'升级成功：你的'+This_Item.ItemName+'提升了'+ck_str+'！');
         This_NPC.NpcNotice('恭喜：'+This_Player.Name+'在武器升级'+This_Item.ItemName+'时提升了'+ck_str+'！');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         end;   
         
         
       end else
       begin
       This_Player.NotifyClientCommitItem(0,'无法升级：你的元宝不足，需要'+inttostr(ck_gold)+'元宝。'); 
       end;
     end else 
     begin
        This_Player.NotifyClientCommitItem(0,'该物品不可升级，请投入可升级的装备！');   
     end;
   end else  
   if This_Player.getv(88,2)= 1 then 
   begin 
    
    for ck_kind := 1 to 300 do
     
     begin

       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa2; 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 7) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold*2;
           end;
         end;  
       end;
     end;
     
     if ck_num > 6 then

     begin
     This_Player.NotifyClientCommitItem(0,'无法升级：你的'+This_Item.ItemName+'已激发出所有属性！');  
     end else
     if ck_gold > 0 then
     begin                                                                                             
       if This_Player.YBNum >= ck_gold then
 
       begin
         ck_rand := random(100);
        
         if ck_rand < 19 then
         begin 
         This_Player.NotifyClientCommitItem(0,'升级失败，你的武器属性未发生变化');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         end else
         if ck_rand < 79 then
         begin 
         This_Item.AddPa2 := This_Item.AddPa2 + 1;   //魔法+1 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         ck_str :='魔法+1'; 
         ck_red :='红字公告';
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
     
        
         end;  

         if ck_str <> '' then 
         begin
         This_Player.NotifyClientCommitItem(0,'升级成功：你的'+This_Item.ItemName+'提升了'+ck_str+'！');
         This_NPC.NpcNotice('恭喜：'+This_Player.Name+'在武器升级'+This_Item.ItemName+'时提升了'+ck_str+'！');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         end;   
         
         
       end else
       begin
       This_Player.NotifyClientCommitItem(0,'无法升级：你的元宝不足，需要'+inttostr(ck_gold)+'元宝。'); 
       end;
     end else 
     begin
        This_Player.NotifyClientCommitItem(0,'该物品不可升级，请投入可升级的装备！');   
     end; 
   end else  
   if This_Player.getv(88,3)= 1 then 
   begin 
    
    for ck_kind := 1 to 300 do
     
     begin

       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa3; //道术+1 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 7) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold*2;
           end;
         end;  
       end;
     end;
     
     if ck_num > 6 then

     begin
     This_Player.NotifyClientCommitItem(0,'无法升级：你的'+This_Item.ItemName+'已激发出所有属性！');  
     end else
     if ck_gold > 0 then
     begin                                                                                             
       if This_Player.YBNum >= ck_gold then
 
       begin
         ck_rand := random(100);
        
         if ck_rand < 19 then
         begin 
         This_Player.NotifyClientCommitItem(0,'升级失败，你的武器属性未发生变化');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         end else
         if ck_rand < 79 then
         begin 
         This_Item.AddPa3 := This_Item.AddPa3 + 1;   //道术+1 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         ck_str :='道术+1'; 
         ck_red :='红字公告';
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
     
        
         end;  

         if ck_str <> '' then 
         begin
         This_Player.NotifyClientCommitItem(0,'升级成功：你的'+This_Item.ItemName+'提升了'+ck_str+'！');
         This_NPC.NpcNotice('恭喜：'+This_Player.Name+'在武器升级'+This_Item.ItemName+'时提升了'+ck_str+'！');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         end;   
         
         
       end else
       begin
       This_Player.NotifyClientCommitItem(0,'无法升级：你的元宝不足，需要'+inttostr(ck_gold)+'元宝。'); 
       end;
     end else 
     begin
        This_Player.NotifyClientCommitItem(0,'该物品不可升级，请投入可升级的装备！');   
     end; 
   end else  
   if This_Player.getv(88,4)= 1 then 
   begin 
    
    for ck_kind := 1 to 300 do
     
     begin

       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa4; 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 7) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold*2;
           end;
         end;  
       end;
     end;
     
     if ck_num > 6 then

     begin
     This_Player.NotifyClientCommitItem(0,'无法升级：你的'+This_Item.ItemName+'已激发出所有属性！');  
     end else
     if ck_gold > 0 then
     begin                                                                                             
       if This_Player.YBNum >= ck_gold then
 
       begin
         ck_rand := random(100);
        
         if ck_rand < 19 then
         begin 
         This_Player.NotifyClientCommitItem(0,'升级失败，你的武器属性未发生变化');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         end else
         if ck_rand < 79 then
         begin 
         This_Item.AddPa4 := This_Item.AddPa4 + 1;   //幸运+1 
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1);
         ck_str :='幸运+1'; 
         ck_red :='红字公告';
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
     
        
         end;  

         if ck_str <> '' then 
         begin
         This_Player.NotifyClientCommitItem(0,'升级成功：你的'+This_Item.ItemName+'提升了'+ck_str+'！');
         This_NPC.NpcNotice('恭喜：'+This_Player.Name+'在武器升级'+This_Item.ItemName+'时提升了'+ck_str+'！');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
         end;   
         
         
       end else
       begin
       This_Player.NotifyClientCommitItem(0,'无法升级：你的元宝不足，需要'+inttostr(ck_gold)+'元宝。'); 
       end;
     end else 
     begin
        This_Player.NotifyClientCommitItem(0,'该物品不可升级，请投入可升级的装备！');   
     end;
   end;
end;

function xin(price, num: Integer):boolean; 
begin
   result := true; 
 
end;

begin
  This_Npc.NpcDialog(This_Player,
   '|可以升级的装备：<祖玛以上武器/c=red>\'
  +'|升级第一次需要<20元宝/c=red>,装备越高级花费越多\'
  +'|屠龙以上武器,升级第一次都需要<300元宝/c=red>,\'
  +'|每增加一点元宝数乘以2倍，成功率80%失败元宝扣除：\'
  +'|<可以升级武器幸运值、攻、魔、道，最高+7/c=red>\'
  +'|<注意：每次升级间隔时间请大于5秒，否则会出现点击多次没反映！！/c=red>\'
  +'|{cmd}<升级攻击/@Checkup_1>    ^<升级魔法/@Checkup_2>\'
  +'|{cmd}<升级道术/@Checkup_3>    ^<升级幸运/@Checkup_4>\'  
  );
end.
   