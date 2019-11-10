{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务
procedure _renwu20;
begin
 if (This_Player.GetV(103,1) = 2) then
 begin
 This_Npc.NpcDialog(This_Player,
 '从我旁边的入口处进入可以直接到达沃玛森林，\'+
 '你要找<拾荒者/c=red>吗？我知道他在哪里。\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
 end
 else if This_Player.FreeBagNum >3 then
 begin
 This_Player.SetV(103,1,2);        //任务标记
 This_Player.UpdateTaskDetail(103,1);
 This_Player.Give('双倍卷轴',1);
 This_Npc.CloseDialog(This_Player);
 //This_player.AutoGotoMap('1',557,540); // 自动寻路 拾荒者 
 end else
 begin 
 This_NPC.NpcDialog(This_Player,
 '请你先整理下你的背包再来找我！\ \'+
 '|{cmd}<好的/@doexit>\'
 );
 end; 
end; 

procedure dorenwu20;
begin
   This_Npc.NpcDialog(This_Player,
    '从我旁边的入口处进入可以直接到达沃玛森林，\'+
    '你要找<拾荒者/c=red>吗？我知道他在哪里。\ \'+
   '|{cmd}<好的,我这就去(任务)/@doexit>\');
end;

procedure _gointo;
var
  temp : integer;
begin
  if CompareText(This_Player.MapName,'0') = 0 then
  begin
    temp := random(8) + 1;
    if temp = 1 then
    begin
      This_Player.Flyto('1',537,507);
    end
    else if temp = 2 then
    begin
      This_Player.Flyto('1',530,507);
    end
    else if temp = 3 then
    begin
      This_Player.Flyto('1',528,505);
    end
    else if temp = 4 then
    begin
      This_Player.Flyto('1',520,497);
    end
    else if temp = 5 then
    begin
      This_Player.Flyto('1',524,493);
    end
    else if temp = 6 then
    begin
      This_Player.Flyto('1',520,501);
    end
    else if temp = 7 then
    begin
      This_Player.Flyto('1',510,503);
    end
    else
    begin
      This_Player.Flyto('1',504,497);
    end;
  end
  else
    exit;
end;

//==============================================================新手任务

var
  RW103 : integer;
begin
   RW103 := This_Player.GetV(103,1);
   if RW103 = 2 then 
   begin
      dorenwu20;
   end else if RW103 = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '我只知道沃玛森林最近不太平，从我旁边的入口处\'+
      '进入可以直接到达沃玛森林，\'+
      '你要找<拾荒者/c=red>吗？我知道他在哪里。\'+
      '他在比奇的洞穴，可那里非常危险，是骷髅的据点，\'+
      '去前可是要做好充足的准备，我送你一个双倍卷轴。\'+
      '希望可以帮助你快速成长，克服凶险！\ \'+
      '|{cmd}<我接受(任务)/@renwu20>          ^<前往沃玛森林/@gointo>\');
   end else
   begin 
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事情？\ \|{cmd}<前往沃玛森林/@gointo>');
   end;
end. 