{
/***********************************************************************
 
/************************************************************************}

PROGRAM Mir2;

{$I WarehouseAndMbind.pas}
{$I ActiveValidateCom.pas}
{$I GoToMonMap.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;                         
begin
  This_Npc.CloseDialog(This_Player);
end;


Procedure _askmen;
begin
   This_Npc.NpcDialog(This_Player,
   '盟重的镇魔守将好像知道一些有关于魔兽的事情，\'+
   '要么您去找他问问看吧。\ \'+
   '|{cmd}<关闭/@doexit>');
end;

Procedure _askbi1;
begin
   This_Npc.NpcDialog(This_Player,
   '比奇老兵好像知道一些有关于魔兽的事情，\'+
   '要么您去找他问问看吧。\ \'+
   '|{cmd}<关闭/@doexit>');
end;


Procedure _qita;
begin
   This_Npc.NpcDialog(This_Player,
   '您还想查询哪里的恶魔信息，\'+
   '虽然我能力有限，但我知道谁可以告诉你其中的秘密，\'+
   '只要你告诉我你想知道的恶魔巢穴就可以了。\ \'+
   '|{cmd}<困惑殿堂/@askmen>      ^<死亡神殿/@askbi1>      ^<地狱烈焰/@askbi1>\'+
   '|{cmd}<堕落坟场/@askbi1>      ^<深渊魔域/@askbi1>^\ \'+
   '|{cmd}<返回/@main>');
end;


Procedure _qianch;
begin
   if This_Player.GoldNum >=50000 then
   begin
      This_Player.DecGold(50000);
      if CheckOtherMapMon('T132') >= 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '让我掐指算算，\'+
         '好像魔兽就守候在前方，此时不去，更待何时？\ \'+
         '|{cmd}<付5颗金刚石，前往除魔/@paydiamond>');
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '让我掐指算算，可惜，魔兽还没有出现。');
      end;
   end else
   begin
   This_Npc.NpcDialog(This_Player,
   '您好像没有50000金币啊，我也帮不了你了！\');
   end;
end;



Procedure _paymoney;
begin
   This_Npc.NpcDialog(This_Player,
   '您想查询哪个魔域的恶魔信息呢？\ \'+
   '|{cmd}<钳虫巢穴/@qianch>                ^<查询其它的恶魔信息/@qita>\'+
   '|{cmd}<返回/@main>');
end;


Procedure _paydiamond;
begin
   if compareText(This_Player.MapName, '11') = 0  then
   begin
      if This_Player.GetBagItemCount('金刚石') >= 5 then
      begin
         This_Player.Take('金刚石',5);
         This_Player.Flyto('11', 320,350);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '您怎么连5颗金刚石也没有啊！\ \'+
         '|{cmd}<退出/@doexit>');
      end;   
   end;   
end;

Procedure _paydia;
begin
   This_Npc.NpcDialog(This_Player,
   '我只能送您去钳虫巢穴大概的方位，不过要给我5颗金刚石。\'+
   '能不能找到前往魔穴的路径，要靠您自己的能力了。\ \'+
   '|{cmd}<付5颗金刚石，前往除魔/@paydiamond>\ \'+
   '|{cmd}<返回/@main>');
end;


Procedure _dongcha;
begin
  if AutoClothersMapOpen then
  begin
   This_Npc.NpcDialog(This_Player,
   '相传在玛法大陆的某些角落，有一批恶魔镇守着六件重装，\'+
   '想要获得这些宝物，就必须首先要杀死这些恶魔，无数的英\'+
   '雄为了获得这些宝物，不惜以自己的生命作为代价，有些人\'+
   '成功了，更多的勇士则倒在了恶魔的脚下，这位，您是\'+
   '否也想去发现这些魔兽的踪迹，给我5万金币，我就能帮您去\'+
   '查看它们的踪影，给我5颗金刚石，我就能送您去独闯魔穴。\'+
   '|{cmd}<花5万金币，探查魔兽踪影/@paymoney>\'+
   '|{cmd}<付5颗金刚石，前往除魔/@paydia>\'+
   '|{cmd}<返回/@main>');
  end ;  
end;


Procedure _tianting;
Begin
   if This_Player.Level >= 8  then
   begin
      if compareText(This_Player.MapName, '11') = 0 then
      begin
         This_Player.RandomFlyTo('0122~1');
      end;
   end else
   begin
       This_Npc.NpcDialog(This_Player,
      '您的等级尚未达到8级以上\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;




Procedure _gomo;
Begin
   This_Npc.NpcDialog(This_Player,
   '想去天庭吗？\ \'+
   '|{cmd}<前往天庭/@tianting>\ \'+
   '|{cmd}<返回/@main>                  ^<关闭/@doexit>');
end;

Procedure _zhuangyuan;
var
f : integer;
Begin
   if This_Player.Level >= 8  then
   begin
     if compareText(This_Player.MapName, '11') = 0 then
     begin
      f := random(5);
      if  f = 4 then
      begin
      This_Player.Flyto('SLDG',323,401);
      end;
      if  f = 3 then
      begin
      This_Player.Flyto('SLDG',319,399);
      end;
      if  f = 2 then
      begin
      This_Player.Flyto('SLDG',321,393);
      end;
      if  f = 1 then
      begin
      This_Player.Flyto('SLDG',325,405);
      end;  
      if  f = 0 then
      begin
      This_Player.Flyto('SLDG',328,404);
      end;
     end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你的能力不够，我还不能送你去那里，\'+
      '当您达到8级的时候再来找我吧！\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;



Procedure _baodian;
Begin
   This_Npc.NpcDialog(This_Player,
   '在边界城内找“元宝使者”，能与其他玩家进行元宝交易。\ \'+
   '您现在要去边界城吗?\ \'+
   '|{cmd}<前往边界城/@zhuangyuan>');
end;


Procedure _talkwith;
Begin
   This_Npc.NpcDialog(This_Player,
   '白日门附近很危险，如果你想回到安全的地方，\'+
   '我可以帮你。\ \'+
   '|{cmd}<回到比奇/@move1>\'+
   '|{cmd}<返回/@main>');
end;


Procedure _move1;
Begin
   This_Npc.NpcDialog(This_Player,
   '移动到比奇需要金币，不能让你免费使用 \'+
   '你必须支付2000金币，你想花这笔钱吗? \ \'+  
   '|{cmd}<移动/@pay1> \'+ 
   '|{cmd}<退出/@doexit>');
end;

Procedure _pay1;
Begin
   if compareText(This_Player.MapName, '11') = 0 then
   begin
      if This_Player.GoldNum >= 2000 then
      begin
         This_Player.DecGold(2000);
         This_Player.Flyto('0',333,274);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你在开玩笑吧???这点钱也没有...\'+
         '还想移动?? 我不想再见到你... \ \'+ 
         '|{cmd}<返回/@main>');
      end;
   end;
end;


procedure _GoldToMonMap_2;
begin
    This_Npc.NpcDialog(This_Player,  
    '这里通向恐怖的丛林迷宫，如果你想得到传说中的三圣装备，\那就去挑战<赤月恶魔、双头金刚、双头血魔/c=red>\ \'
    +'|{cmd}<前往丛林迷宫/@GoldToMonMap_2_1>\ \'
    +'|{cmd}<返回/@main>' 
  );
end;

procedure _GoldToMonMap_2_1;
begin
      if compareText(This_Player.MapName,'11') = 0 then
      begin
         This_Player.Flyto('11',360 + random(3) - 1,250 + random(3) - 1);
      end;
end; 

procedure _GoToDrug;
begin
  if This_Player.MapName = '11' then
  This_Player.RandomFlyTo('1006'); 
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '年轻人，你也和我一样坚信我们终有一天能回家吗？\'+
   '只要有勇气接受挑战，不论兽人还是雪山，都能征服！\'+
   '你想去什么地方接受锤炼呢，我可以送你一程！\ \'+
   '|{cmd}<洞察魔兽信息/@dongcha>\'+
   '|{cmd}<进入边界城/@baodian>                ^<前往丛林迷宫/@GoldToMonMap_2>\'+
   '|{cmd}<进入药店/@GoToDrug>                ^<到别处去/@talkwith>\');
end.