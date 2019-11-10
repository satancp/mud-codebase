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
ck_name : array[1..15 ]of string;
ck_value : array[1..15] of integer; 

procedure OnInitialize;
begin
ck_name[1] :='圣战项链';
ck_name[2] :='法神项链';
ck_name[3] :='天尊项链';
ck_name[4] :='雷霆项链';
ck_name[5] :='烈焰项链';
ck_name[6] :='光芒项链';
ck_name[7] :='战神项链';
ck_name[8] :='圣魔项链';
ck_name[9] :='真魂项链';
ck_name[10] :='星王项链(战)' ;
ck_name[11] :='星王项链(法)';
ck_name[12] :='星王项链(道)';
ck_name[13] :='王者项链(战)';
ck_name[14] :='王者项链(法)';
ck_name[15] :='王者项链(道)';


ck_value[1] :=200;
ck_value[2] :=200;
ck_value[3] :=200;
ck_value[4] :=200;
ck_value[5] :=200;
ck_value[6] :=200;
ck_value[7] :=200;
ck_value[8] :=200;
ck_value[9] :=200;
ck_value[10] :=300;
ck_value[11] :=300;
ck_value[12] :=300;
ck_value[13] :=300;
ck_value[14] :=300;
ck_value[15] :=300;

end; 

procedure _Checkup;
begin
  This_Npc.NpcDialog(This_Player,
  '可以鉴定的装备：\'
  +'<赤月级以上项链/c=red>\|'
  +'鉴定成功有几率增加以下属性：\'
  +'<幸运/c=red>\|'
  +'每次鉴定消耗一定数量的元宝：\'
  +'第一鉴定消耗200元宝,每增加一点属性元宝数乘以2倍，最高4点属性：\'
  +'<待鉴定装备等级越高，鉴定消耗的元宝也越多。/c=red>\'
  +'|{cmd}<开始鉴定/@Checkup_1>        ^<关闭/@doexit>' 
  );
  
end; 

procedure _Checkup_1;
begin
   This_NPC.Click_CommitItem(This_Player,1,'待升级装备：'); 
end; 

procedure CommitItem(AType:word);
var
i,ck_num,ck_kind,ck_gold,ck_rand:integer;
ck_str,ck_red:string; 
begin
     ck_gold := 0;  //初始化 
     ck_str := '';  //初始化
     ck_red := '';  //初始化
     
     for ck_kind := 1 to 15 do
     begin
       if ck_name[ck_kind] = This_Item.ItemName then 
       begin                             
         ck_num := This_Item.AddPa1 + This_Item.AddPa2 + This_Item.AddPa3 + This_Item.AddPa4 + This_Item.AddPa5; 
         ck_gold := ck_value[ck_kind];
         if (ck_num > 0) and (ck_num < 4) then
         begin
           for i:= 1 to ck_num do
           begin
           ck_gold := ck_gold*2;
           end;
         end;  
       end;
     end;
     
     if ck_num > 3 then
     begin
     This_Player.NotifyClientCommitItem(0,'无法鉴定：你的'+This_Item.ItemName+'已激发出所有属性！');  
     end else
     if ck_gold > 0 then
     begin                                                                                             
       if This_Player.GoldNum>= ck_gold then
       begin
         ck_rand := random(100);
         if ck_rand < 29 then
         begin
         This_Player.PsYBConsum(This_NPC,'xin',20151,ck_gold,1);  
         This_Player.NotifyClientCommitItem(0,'升级失败，你的项链属性未发生变化');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         end else
         if ck_rand < 69 then
         begin 
         This_Item.AddPa2 := This_Item.AddPa2 + 1;   //幸运+1 
         ck_str :='幸运+1';
         This_Player.PsYBConsum(This_NPC,'xin',20150,ck_gold,1); 
         ck_red :='红字公告'; 
        
         end; 
         
     
         if ck_str <> '' then 
         begin
         This_Player.NotifyClientCommitItem(0,'鉴定成功：你的'+This_Item.ItemName+'提升了'+ck_str+'！');
         This_NPC.NotifyClientUPdBagItem(This_Player,This_Item);
         end;   
         if ck_red <> '' then This_NPC.NpcNotice('恭喜：'+This_Player.Name+'在庄园幸运项链鉴定'+This_Item.ItemName+'时提升了'+ck_str+'！');
         This_Player.AddLogRec(9, This_Item.ItemName, 811152, ck_gold, ck_str);
       end else
       begin
       This_Player.NotifyClientCommitItem(0,'无法鉴定：你的元宝不足，需要'+inttostr(ck_gold)+'元宝。'); 
       end;
     end else 
     begin
        This_Player.NotifyClientCommitItem(0,'该物品不可鉴定，请投入可鉴定的装备！');   
     end;   
end;
function xin(price, num: Integer):boolean; 
begin
   result := true; 
 
end;


begin
  This_Npc.NpcDialog(This_Player,
  '我是外面那个废物云游鉴定师的师傅，我这里可以升级魔龙以上项链的幸运\'
 
  +'当然，我会收取你一定远程的手续费，如果失败了也千万不要怪我。\ \'
  +'|{cmd}<开始鉴定/@Checkup>\' 
  );
end.
   