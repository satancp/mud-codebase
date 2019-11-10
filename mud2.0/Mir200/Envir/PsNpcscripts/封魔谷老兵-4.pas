{
/************************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _move0;
begin
   This_Npc.NpcDialog(This_Player,
   '你想到哪个商店？这可是免费体验服务啊！\ \'+
   '|{cmd}<服装店/@move01>\'+
   '|{cmd}<武器店/@move02>\'+
   '|{cmd}<首饰店/@move03>\'+
   '|{cmd}<药书店/@move04>\ \'+
   '|{cmd}<返回/@main>');
end;

procedure _move01;
begin
   if compareText(This_Player.MapName, '4') = 0 then
   begin
      This_Player.RandomFlyTo('b345');
   end;
end;

procedure _move02;
begin
   if compareText(This_Player.MapName, '4') = 0 then
   begin
      This_Player.RandomFlyTo('b342');
   end;
end;

procedure _move03;
begin
   if compareText(This_Player.MapName, '4') = 0 then
   begin
      This_Player.RandomFlyTo('b344');
   end;
end;


procedure _move04;
begin
   if compareText(This_Player.MapName, '4') = 0 then
   begin
      This_Player.RandomFlyTo('b343');
   end;
end;



Procedure _tianting;
Begin
   if This_Player.Level >= 8  then
   begin
      if compareText(This_Player.MapName, '4') = 0 then
      begin
         This_Player.RandomFlyTo('0122~1');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '天关虽然是个蕴藏宝物的地方，但同样充满了危险。\'+
      '您的等级尚未达到8级以上，您现在的实力看来还不\'+
      '够在天关中寻找宝藏\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;




Procedure _gomo;
Begin
   This_Npc.NpcDialog(This_Player,
   '想去闯天关或去魔王岭射杀天关盗贼吗？\'+
   '天庭里的“天庭守卫”知道怎么过去，你去问他吧。\ \'+
   '|{cmd}<前往天庭/@tianting>\ \'+
   '|{cmd}<返回/@main>                  ^<关闭/@doexit>');
end;

Procedure _zhuangyuan;
var
f : integer;
Begin
   if This_Player.Level >= 8  then
   begin
     if compareText(This_Player.MapName, '4') = 0 then
     begin
      f := random(5);
      if  f = 4 then
      begin
      This_Player.Flyto('GA0',70,71);
      end;
      if  f = 3 then
      begin
      This_Player.Flyto('GA0',73,64);
      end;
      if  f = 2 then
      begin
      This_Player.Flyto('GA0',73,69);
      end;
      if  f = 1 then
      begin
      This_Player.Flyto('GA0',62,72);
      end;  
      if  f = 0 then
      begin
      This_Player.Flyto('GA0',61,64);
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
   '在庄园内找灵符仙子，可以使用元宝兑换灵符去闯天关和魔王岭\'+
   '并且通过庄园内的“元宝使者”，还能与其他玩家进行元宝交易，\'+
   '同时在传奇“商铺”中也已经开通使用元宝快速兑换灵符功能，\'+
   '您现在要去庄园吗?\ \'+
   '|{cmd}<前往庄园/@zhuangyuan>');
end;




Procedure _leave;
Begin
   This_Npc.NpcDialog(This_Player,
   '移动到比奇需要金币，不能让你免费使用 \'+
   '你必须支付2000金币，你想花这笔钱吗? \ \'+  
   '|{cmd}<移动/@pay1> \'+ 
   '|{cmd}<退出/@doexit>');
end;

Procedure _pay1;
Begin
   if compareText(This_Player.MapName, '4') = 0 then
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

Procedure _swz;
begin
   This_Npc.NpcDialog(This_Player,
   '我可以帮你使用声望值来消减PK值，\'+
   '每一点声望值可以帮你消减100点PK值。\ \'+
   '|{cmd}<消减100点PK值/@decpkdecsw>\'+
   '|{cmd}<返回/@main>');
end;

Procedure _decpkdecsw;
begin
   if This_Player.MyPkpoint >=100 then
   begin
      if This_Player.MyShengwan >= 1 then
      begin
         This_Player.MyShengwan := This_Player.MyShengwan-1;
         This_Player.DecPkPoint(100);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你没有足够的声望消除PK值。\ \'+
         '|{cmd}<退出/@doexit>');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你的PK值低于100，还不能使用声望消除。\ \'+
      '|{cmd}<退出/@doexit>');
   end;
end;


procedure _goMonMap;
begin
    if This_Player.MapName = '4' then 
    This_Player.Flyto('4',60 + random(3) - 1,70 + random(3) - 1); 
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '年轻人，你也和我一样坚信我们终有一天能回家吗？\'+
   '只要有勇气接受挑战，不论兽人还是雪山，都能征服！\'+
   '你想去什么地方接受锤炼呢，我可以送你一程！\ \'+
  
   '|{cmd}<进入庄园/@baodian>                        ^<想去商店/@move0>\'+
   '|{cmd}<去比奇/@leave>                     ^<去封魔矿区/@goMonMap>\');
end.