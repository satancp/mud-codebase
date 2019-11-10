{****************************************
激情派对 及 天降财宝 
作者：开心就好
内容：激情派对：在一定的时间，在该npc附近会获取经验和元宝，越靠近npc，获得元宝和经验越多 。
天降财宝 :在一定时间，土城地面会刷出物品，大家可以抢夺！ 
 
**********************************************}

PROGRAM Mir2;
 var

px, py :Integer;
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇,<激情派对/c=red>在<21点/c=red>在土城举行，\|'
	+'<激情派对：/c=red>在一定的时间，\|'
	+'在该npc附近会获取经验和物品，\|'
	+'越靠近npc，获得物品和经验越多。\|'
	+'激情派对持续<10分钟/c=red>。\|'
	+'<天降财宝: /c=red>在派对结束之后，\|'
	+'土城地面会刷出物品，大家可以抢夺！\|' 
	+'越靠近NPC，获得奖励越多。\|'
    +'|{cmd}<参加激情派对/@jqpd>\');
end;

procedure _jqpd; 
   begin
if This_Player.Level >1 then
  begin                 
    This_Player.CallOut(This_Npc, 1, 'jqpd');
    This_Player.FlyTo('3',355+random(6),335+random(6));
    This_Npc.NpcDialog(This_Player,
   '请好好把握这幸福的时光。'
   ); 
   
   end;
    end;

procedure jqpd; 
begin
px:= This_player.My_X;
py:= This_Player.My_Y;
       
     if  (GetHour = 21) and (GetMin < 10) then   
    begin
        if (This_Player.MapName = '3') and (( px > 353) and (px < 357))  and ((py < 337) and (py >333))  then
        begin
       This_Player.Give('经验',10000);
       This_Player.CallOut(This_Npc, 1, 'jqpd');
	     end else
	     if (This_Player.MapName = '3') and (( px > 352) and (px < 358))  and ((py < 338) and (py >332))   then
        begin
       This_Player.Give('经验',10000);
       This_Player.CallOut(This_Npc, 1, 'jqpd');
        end else 
        if (This_Player.MapName = '3') and (( px > 351) and (px < 359))  and ((py < 339) and (py >331))  then
        begin
       This_Player.Give('经验',10000);
       This_Player.CallOut(This_Npc, 1, 'jqpd');
       end else
        This_Player.CallOut(This_Npc, 1, 'jqpd');
       
    end else 
         This_Npc.NpcDialog(This_Player,
       '目前不在开放时间,请21点准时到场!');
end;



procedure Execute;
var   
gmin : integer;
begin
  if  (GetHour = 21) and (GetMin = 10)    then  
  begin
  This_NPC.NPCSay('点击我这里开始激情派对，10分钟后结束！'); 
  This_NPC.NpcNotice('激情派对已经开始，请到土城药店旁边点击开始！') ; 
  end; 
   if  (GetHour = 21) and (GetMin = 10)  then
  begin
  This_NPC.NPCDropItem('疗伤药',150,40);
  This_NPC.NPCDropItem('中秋礼包',150,15);
  This_NPC.NPCDropItem('1灵符礼包',100,15);
  This_NPC.NPCDropItem('修复神水 ',100,10);
  This_NPC.NPCDropItem('地穴组队卷轴',100,10);
  This_NPC.NPCDropItem('万年雪霜',100,10);
  end;       
end; 

Begin
  domain;  
end.