{
/************************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;



Procedure _tianting;
Begin
   if This_Player.Level >= 8  then
   begin
      if compareText(This_Player.MapName, '1') = 0 then
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
     if compareText(This_Player.MapName, '1') = 0 then
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



Procedure _move;
Begin
   if compareText(This_Player.MapName, '1') = 0 then
   begin
      This_Player.Flyto('4',440,190);
   end;
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '传说中的<火云石/c=red>终于被发现了，\'+
   '看来，<沃玛森林/c=red>的平静将被<火云石/c=red>的出现而彻底打破。\ \'+
   '|{cmd}<进入天关和魔王岭/@gomo>\'+
   '|{cmd}<进入庄园/@baodian>\'+
   '|{cmd}<去封魔谷/@move>\'+
   '|{cmd}<过几天再去/@doexit>');
end.