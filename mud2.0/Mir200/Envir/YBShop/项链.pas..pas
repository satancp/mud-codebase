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
ck_name : array[1..17] of string;
ck_value : array[1..17] of integer; 
procedure OnInitialize;
begin
ck_name[1] :='法神项链';
ck_name[2] :='法神手镯';
ck_name[3] :='法神戒指';
ck_name[4] :='法神头盔';
ck_name[5] :='圣战项链';
ck_name[6] :='圣战手镯';
ck_name[7] :='圣战戒指';
ck_name[8] :='圣战头盔';
ck_name[9] :='天尊项链';
ck_name[10] :='天尊手镯';
ck_name[11] :='天尊戒指';
ck_name[12] :='天尊头盔';
ck_name[13] :='天之法神项链';
ck_name[14] :='天之法神手镯';
ck_name[15] :='天之法神戒指';
ck_name[16] :='天之法神头盔';
ck_name[17] :='天之圣战项链';
ck_name[18] :='天之圣战手镯';
ck_name[19] :='天之圣战戒指';
ck_name[20] :='天之圣战头盔';
ck_name[21] :='天之天尊项链';
ck_name[22] :='天之天尊手镯';
ck_name[23] :='天之天尊戒指';
ck_name[24] :='天之天尊头盔';
ck_name[25] :='雷霆项链';
ck_name[26] :='雷霆护腕';
ck_name[27] :='雷霆战戒';
ck_name[28] :='烈焰项链';
ck_name[29] :='烈焰护腕';
ck_name[30] :='烈焰魔戒';
ck_name[31] :='光芒项链';
ck_name[32] :='光芒护腕';
ck_name[33] :='光芒道戒';
ck_name[34] :='战神戒指';   
ck_name[35] :='圣魔戒指';
ck_name[36] :='真魂戒指';
ck_name[37] :='战神手镯';   
ck_name[38] :='圣魔手镯';
ck_name[39] :='真魂手镯';
ck_name[40] :='战神项链';   
ck_name[41] :='圣魔项链';
ck_name[42] :='真魂项链';






ck_value[1] :=10000;
ck_value[2] :=10000;
ck_value[3] :=10000;
ck_value[4] :=10000;
ck_value[5] :=10000;
ck_value[6] :=10000;
ck_value[7] :=10000;
ck_value[8] :=100;
ck_value[9] :=100;
ck_value[10] :=100;
ck_value[11] :=100;
ck_value[12] :=100;
ck_value[13] :=100;
ck_value[14] :=100;
ck_value[15] :=100;
ck_value[16] :=100;
ck_value[17] :=100;


end; 

procedure _Checkup;
begin
  This_Npc.NpcDialog(This_Player,
  '可以升级的装备：\'
  +'<祖玛以上武器/c=red>\'
  +'升级每次需要100元宝：\'
  +'<可以升级武器幸运值，最高+9/c=red>\'

  +'|{cmd}<开始升级/@Checkup_1>        ^<关闭/@doexit>' 
  );
  
end; 

procedure _Checkup_1;
begin
   This_NPC.Click_CommitItem(This_Player,1,'待升级武器：'); 
end; 


procedure CommitItem(AType:word);
var
i,ck_num,ck_kind,ck_gold,ck_rand:integer; 
ck_str,ck_red:string;
ForgeDiaYB:string;
begin
     ck_gold := 0;  //初始化 
     ck_str := '';  //初始化
     ck_red := '';  //初始化

     for ck_kind := 1 to 17 do
     
     begin

       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa4 ; 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 8) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold;
           end;
         end;  
       end;
     end;
     
     if ck_num > 7 then

     begin
     This_Player.NotifyClientCommitItem(0,'无法升级：你的'+This_Item.ItemName+'已激发出所有属性！');  
     end else
     if ck_gold > 0 then
     begin                                                                                             
       if This_Player.YBNum >= ck_gold then
 
       begin
         ck_rand := random(100);
      
         if ck_rand < 99 then
         begin 
         This_Item.AddPa4 := This_Item.AddPa4 + 1;   //幸运+1 
         ck_str :='幸运+1'; 
         ck_red :='红字公告';
     
        
         end;  
       

         This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20150,30,1); 
       
         if ck_str <> '' then 
         begin
         This_Player.NotifyClientCommitItem(0,'升级成功：你的'+This_Item.ItemName+'提升了'+ck_str+'！');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         end;   
         if ck_red <> '' then This_NPC.NpcNotice('恭喜：'+This_Player.Name+'在武器升级'+This_Item.ItemName+'时提升了'+ck_str+'！');
         This_Player.AddLogRec(9, This_Item.ItemName, 811152, ck_gold, ck_str);
       end else
       begin
       This_Player.NotifyClientCommitItem(0,'无法升级：你的元宝不足，需要'+inttostr(ck_gold)+'元宝。'); 
       end;
     end else 
     begin
        This_Player.NotifyClientCommitItem(0,'该物品不可升级，请投入可升级的装备！');   
     end;   
end;
procedure _CheckupRule;
begin
  This_Npc.NpcDialog(This_Player,
  '可以升级的装备：\'
  +'<祖玛以上武器/c=red>\'
  +'升级每次需要100元宝：\'
  +'<可以升级武器幸运值，最高+7/c=red>\'

  +'|{cmd}<返回/@main>' 
  );
end; 

begin
  This_Npc.NpcDialog(This_Player,
  '我云游一生，见识过玛法大陆上的各种奇珍异宝，但是只对武器感兴趣\'
  +'可以升级的装备：\'
  +'<祖玛以上武器/c=red>\'
  +'升级每次需要100元宝：\'
  +'<可以升级武器幸运值，最高+7/c=red>\'

  +'|{cmd}<开始鉴定/@Checkup>          ^<查看鉴定规则/@CheckupRule>\' 
  );
end.
   