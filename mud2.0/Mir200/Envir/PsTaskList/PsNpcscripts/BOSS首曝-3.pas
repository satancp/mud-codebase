{****************************************
boss首曝
作者：开心就好
内容：全服首次杀死特定地图boss可以自动获得一定元宝的奖励，并且在土城榜单上显示，只要有玩家点击就会显示已击杀，
姓名更新需要击杀者本人点击npc更新。
变量 G（71，,1-18）  V(72,11-18)
**********************************************}
PROGRAM Mir2;
var 
sum,sum1:Integer;  

str1,str2,str3,str4,str5,str6,str7,str8,str9 :String;
name1,name2,name3,name4,name5,name6,name7,name8,name9 :String; 
 
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain; 

begin

	 This_NPC.NpcDialog(This_Player,
'特定地图全服首次击杀BOSS会得到一定元宝的奖励\|' 
 +'{cmd}<查看榜单/@sxbd>\');  
 end;
 Procedure _sxbd;
 begin                                  
 if GetG(71,11)= 1 then 
  begin 
  str1 := '已被击杀';
  end
  else   str1 := '未被击杀';
 if GetG(71,12)= 1 then 
   begin
   str2 := '已被击杀';
   end
   else str2 := '未被击杀';      
 if GetG(71,13)= 1 then 
  begin 
  str3 := '已被击杀';
    end
    else  str3 := '未被击杀';  
if GetG(71,14)= 1 then 
  begin  
  str4 := '已被击杀';
  end
  else   str4 := '未被击杀';
if GetG(71,15)= 1 then 
  begin 
  str5 := '已被击杀';
  end
  else   str5 := '未被击杀';    
if GetG(71,16)= 1 then 
  begin 
  str5 := '已被击杀';
  end
  else   str6 := '未被击杀';  
  if GetG(71,17)= 1 then 
  begin 
  str7 := '已被击杀';
  end
 else  str7 := '未被击杀'; 
 if GetG(71,18)= 1 then 
  begin 
  str8 := '已被击杀';
  end
  else   str8 := '未被击杀';
  if This_Player.GetV(72,11)= 10 then
     begin
     name1 := This_Player.name;
     end
     else name1 := '';
   if This_Player.GetV(72,12)= 10 then
     begin
     name2 := This_Player.name;
     end
     else name2 := '';
     if This_Player.GetV(72,13)= 10 then
     begin
     name3 := This_Player.name;
     end
     else name3 := '';
     if This_Player.GetV(72,14)= 10 then
     begin
     name4 := This_Player.name;
     end
     else name4 := '';
  if This_Player.GetV(72,15)= 10 then
     begin
     name5 := This_Player.name;
     end
     else name5 := '';   
  if This_Player.GetV(72,16)= 10 then
     begin
     name6 := This_Player.name;
     end
     else name6 := ''; 
     if This_Player.GetV(72,17)= 10 then
     begin
     name7 := This_Player.name;
     end
     else name7 := '';    
       if This_Player.GetV(72,18)= 10 then
     begin
     name8 := This_Player.name;
     end
     else name8 := '';    
      if This_Player.GetV(72,19)= 10 then
     begin
     name9 := This_Player.name;
     end
     else name9 := ''; 
      This_NPC.NpcDialog(This_Player,
  '<沃玛教主/c=red>'+ str1 +'<完成首杀的玩家是/c=red>'+name1+' \|'  
 +'<祖玛教主/c=red>'+ str2 +'<完成首杀的玩家是/c=red>'+name2+' \|'
 +'<牛魔王/c=red>'+ str3 +'<完成首杀的玩家是/c=red>'+name3+' \|'
 +'<暗之牛魔王/c=red>'+str4 +'<完成首杀的玩家是/c=red>'+name4+' \|'
 +'<双头血魔/c=red>'+ str5 +'<完成首杀的玩家是/c=red>'+name5 +' \|'
 +'<双头金刚/c=red>'+ str6 +'<完成首杀的玩家是/c=red>'+name6+' \|'
 +'<魔龙教主/c=red>'+ str7 +'<完成首杀的玩家是/c=red>'+name7+' \|'
 +'<黄泉教主/c=red>'+ str8 +'<完成首杀的玩家是/c=red>'+name8 +' \|'
 +'{cmd}<刷新榜单/@sxbd>\');                          
end;     
     
     
     
     
Begin
  domain;
  
end.  
   
   
   
   
   
   
   
   
   