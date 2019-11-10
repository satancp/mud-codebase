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
ck_name : array[1..22] of string;         //这里22 要跟下面装备[]里面最后一个数字一样 
ck_value : array[1..22] of integer; 
procedure OnInitialize;
begin
ck_name[1] :='镇天';
ck_name[2] :='开天';
ck_name[3] :='玄天';
ck_name[4] :='屠龙';
ck_name[5] :='龙牙';
ck_name[6] :='逍遥扇';
ck_name[7] :='怒斩';
ck_name[8] :='井中月';
ck_name[9] :='裁决之杖';
ck_name[10] :='骨玉权杖';
ck_name[11] :='霸者之刃';
ck_name[12] :='王者之刃';
ck_name[13] :='王者之剑';
ck_name[14] :='王者之杖';
ck_name[15] :='龙纹剑';
ck_name[16] :='血饮';
ck_name[17] :='无极棍';
ck_name[18] :='黄金裁决';
ck_name[19] :='天之骨玉权杖';
ck_name[20] :='天之逍遥扇';
ck_name[21] :='天之屠龙';
ck_name[22] :='天之嗜魂法杖';            //增加武器改这里[]里数字按顺序 


ck_value[1] :=10;
ck_value[2] :=10;
ck_value[3] :=10;
ck_value[4] :=10;             //这里设置检测需要多少元宝 
ck_value[5] :=10;
ck_value[6] :=10;
ck_value[7] :=10;
ck_value[8] :=10;
ck_value[9] :=10;
ck_value[10] :=10;
ck_value[11] :=10;
ck_value[12] :=10;
ck_value[13] :=10;
ck_value[14] :=10;
ck_value[15] :=10;
ck_value[16] :=10;
ck_value[17] :=10;
ck_value[18] :=10;
ck_value[19] :=10;              //上面加了装备这里也得加  ck_value[22] :=10;  括号里数字按顺序 
ck_value[20] :=10;
ck_value[21] :=10;
ck_value[22] :=10;




end; 

procedure _Checkup;
begin
  This_Npc.NpcDialog(This_Player,
  '可以升级的装备：\'
  +'<祖玛以上武器/c=red>\'
  +'升级每次需要5000元宝：\'
  +'<可以升级武器魔法，最高+7/c=red>\'

  +'|{cmd}<开始升级武器魔法/@Checkup_1> \'
  
        
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

     for ck_kind := 1 to 22 do   //这里22 数字跟上面最后一个一样 
     
     begin

       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa1+This_Item.AddPa2+This_Item.AddPa3 ; 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 7) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold;
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
         if ck_rand < 10 then       //失败几率 11 
         begin 
       
           
         This_Player.PlayerNotice('升级失败',2);
         end else
         if ck_rand < 99 then         //成功几率100 
         
         begin 
         This_Item.AddPa2 := This_Item.AddPa1 + 2;   //攻击+1 
         ck_str :='魔法+1'; 
         ck_red :='红字公告';
     
        
         end;  
       

         This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20150,10,1); 
       
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
  +'升级每次需要10元宝：\'
  +'<可以升级武器魔法，最高+7/c=red>\'

  +'|{cmd}<返回/@main>' 
  );
end; 

begin
  This_Npc.NpcDialog(This_Player,
  '我云游一生，见识过玛法大陆上的各种奇珍异宝，但是只对武器感兴趣\'
  +'可以升级的装备：\'
  +'<祖玛以上武器/c=red>\'
  +'升级每次需要10元宝：\'
  +'<我这里可以升级武器魔法，最高+7/c=red>\'

  +'|{cmd}<开始升级/@Checkup>          \' 
  );
end.
   