{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务
procedure dogivegirl;
begin
 if This_Player.Job =0 then
 begin
   //This_Player.Give('重盔甲(女)',1);
   This_Player.Give('魔鬼项链',1);
   This_Player.Give('黑色水晶戒指',1);
 end else
 begin
  if This_Player.Job =1 then
  begin
    //This_Player.Give('魔法长袍(女)',1);
    This_Player.Give('琥珀项链',1);
    This_Player.Give('蛇眼戒指',1);
  end else
  begin
    //This_Player.Give('灵魂战衣(女)',1);
    This_Player.Give('白色虎齿项链',1);
    This_Player.Give('道德戒指',1);
  end;
 end;      
end;

procedure dogiveman;
begin
 if This_Player.Job =0 then
 begin
   //This_Player.Give('重盔甲(男)',1);
   This_Player.Give('魔鬼项链',1);
   This_Player.Give('黑色水晶戒指',1);
 end else
 begin
  if This_Player.Job =1 then
  begin
    //This_Player.Give('魔法长袍(男)',1);
    This_Player.Give('琥珀项链',1);
    This_Player.Give('蛇眼戒指',1);
  end else
  begin
    //This_Player.Give('灵魂战衣(男)',1);
    This_Player.Give('白色虎齿项链',1);
    This_Player.Give('道德戒指',1);
  end;
 end;      
end;


procedure _renwu21;
begin
 if (This_Player.GetV(103,1)=3) then
 begin
 This_Npc.NpcDialog(This_Player,
 '快救救我！这里到处都是凶恶的骷髅。\'+
 '请你赶快帮我<杀死10个骷髅/c=red>！\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
 end
 else if This_Player.FreeBagNum >4 then
 begin
 This_Player.SetV(103,1,3);        //任务标记
 This_Player.UpdateTaskDetail(103,1);
 This_Player.SetV(103,2,0);
 This_Player.UpdateTaskDetail(103,1);
 This_Npc.CloseDialog(This_Player);
 // 自动寻路半兽人 
  if This_Player.Gender =0 then
  begin
  dogiveman;
  end else
  begin
  dogivegirl;
  end
 end else
 begin 
 This_NPC.NpcDialog(This_Player,
 '请你先整理下你的背包再来找我！\ \'+
 '|{cmd}<好的/@doexit>\'
 );
 end; 
end;  
   

procedure dorenwu22;
begin
 This_Npc.NpcDialog(This_Player,
 '快救救我！这里到处都是凶恶的骷髅。\'+
 '请你赶快帮我<杀死10个骷髅/c=red>！\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu23;
begin
 This_Npc.NpcDialog(This_Player,
 '太好了！谢谢你，这些装备作为我对你的报答！\'+
 '沃玛森林的怪物受到了黑暗势力的影响，都迷失了心智，\'+
 '才会变得那么凶残的！要找到制止他们发狂的方法，看来\'+
 '只有在沃玛森林深入的<安家铺子老板/c=red>才会比较清楚！\'+
 '你快去找他吧！\ \'+
 '|{cmd}<我接受(任务)/@renwu24>\'
 );
end;

procedure _renwu24;
begin
 if (This_Player.GetV(103,1)=5) then
 begin
 This_Npc.NpcDialog(This_Player,
 '要找到制止他们发狂的方法，看来只有在沃玛森林深入的\'+
 '<安家铺子老板/c=red>才会比较清楚，你快去找他吧！\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
 end
 else if This_Player.FreeBagNum >4 then
 begin
  This_Player.SetV(103,1,5);        //任务标记
  This_Player.UpdateTaskDetail(103,1);
  This_Npc.CloseDialog(This_Player);
  This_Player.Give('经验',100000);
  This_Player.Give('铁腰带',1);
  //This_player.AutoGotoMap('1',314,71); // 自动寻路 安家铺 
  if This_Player.Job =0 then
  begin
   //This_Player.Give('斩马刀',1);
   //This_Player.Give('骷髅头盔',1);
   This_Player.Give('魔力手镯',2);
   end else
   begin
    if This_Player.Job =1 then 
    begin
    //This_Player.Give('偃月',1);
    //This_Player.Give('道士头盔',1);
    This_Player.Give('魔法手镯',2);
    end else
    begin
    //This_Player.Give('降魔',1);
    //This_Player.Give('道士头盔',1);
    This_Player.Give('道士手镯',2);
    end;      
   end;  
 end else
 begin 
 This_NPC.NpcDialog(This_Player,
 '请你先整理下你的背包再来找我！\ \'+
 '|{cmd}<好的/@doexit>\'
 );
 end;
end;

procedure dorenwu24;
begin
 This_Npc.NpcDialog(This_Player,
 '要找到制止他们发狂的方法,看来只有在沃玛森林深入的\'+
 '<安家铺子老板/c=red>才会比较清楚,你快去找他吧！\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
end;

//==============================================================新手任务

procedure domain;
begin
 if (This_Player.GetV(103,1)=5) then
 begin
 dorenwu24;
 end
 else if (This_Player.GetV(103,1)=4) then
 begin
 dorenwu23;
 end
 else if (This_Player.GetV(103,1)=3) then 
 begin
 dorenwu22;
 end
 else if (This_Player.GetV(103,1)=2) then
 begin
 This_Npc.NpcDialog(This_Player,
 '快救救我！这里到处都是凶恶的骷髅.\'+
 '你要是能帮我杀死10个骷髅,我会报答你的！\ \'+
 '|{cmd}<我接受(任务)/@renwu21>\'
 );
 end
 else
 begin 
 This_Npc.NpcDialog(This_Player,
 '你找我有什么事情？\ \'
 );
 end;
end;

begin
  domain;
end. 