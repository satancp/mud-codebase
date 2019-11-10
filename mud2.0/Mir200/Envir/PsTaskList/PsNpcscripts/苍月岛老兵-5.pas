{
/************************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _goshop;
begin
   This_Npc.NpcDialog(This_Player,
   '你想去哪里？\ \'+
   '|{cmd}<服装店/@goshop3>\'+
   '|{cmd}<武器店/@goshop1>\'+
   '|{cmd}<首饰店/@goshop2>\'+
   '|{cmd}<返回/@main>');
end;

procedure _goshop1;
begin
   if compareText(This_Player.MapName, '5') = 0 then
   begin
      This_Player.RandomFlyTo('b351');
   end;
end;

procedure _goshop2;
begin
   if compareText(This_Player.MapName, '5') = 0 then
   begin
      This_Player.RandomFlyTo('b352');
   end;
end;

procedure _goshop3;
begin
   if compareText(This_Player.MapName, '5') = 0 then
   begin
      This_Player.RandomFlyTo('B353');
   end;
end;


procedure _move04;
begin
   if compareText(This_Player.MapName, '5') = 0 then
   begin
      This_Player.RandomFlyTo('b343');
   end;
end;



Procedure _tianting;
Begin
   if This_Player.Level >= 8  then
   begin
      if compareText(This_Player.MapName, '5') = 0 then
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
     if compareText(This_Player.MapName, '5') = 0 then
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



Procedure _back;
Begin
   if compareText(This_Player.MapName, '5') = 0 then
   begin
      This_Player.Flyto('3',330,330);
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

procedure _gobiqi;
var
  temp : integer;
begin
  if This_Player.GetS(11,10) = 888 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经在我这里传送回比奇一次，不能再次传送！'); 
  end
  else
  begin
    This_Player.SetS(11,10,888);
    temp := random(3) + 1;
    if temp = 1 then
    begin
      This_Player.Flyto('0',334,273);
    end
    else if temp = 2 then
    begin
      This_Player.Flyto('0',650,630);
    end
    else
    begin
      This_Player.Flyto('0',289,616);
    end;
  end;
end;


procedure _goMonMap;
begin
    This_NPC.NpcDialog(This_Player,
    '你想去哪里？我可以送你一程。\ \'
    +'|{cmd}<前往尸魔洞穴/@goToMonMap_1>              ^<前往骨魔洞穴/@goToMonMap_2>\'
    +'|{cmd}<前往牛魔洞穴/@goToMonMap_3>\'
    +'|{cmd}<返回/@main>\ '
    );
end;

procedure _goToMonMap_1; 
begin 
    if This_Player.MapName = '5' then 
    This_Player.Flyto('5',520 + random(3) - 1,617 + random(3) - 1); 
end;

procedure _goToMonMap_2; 
begin 
    if This_Player.MapName = '5' then 
    This_Player.Flyto('5',543 + random(3) - 1,133 + random(3) - 1); 
end;

procedure _goToMonMap_3; 
begin 
    if This_Player.MapName = '5' then 
    This_Player.Flyto('5',660 + random(3) - 1,465 + random(3) - 1); 
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '虽然早已证实从海路不能回家，但仍有许多人来此聆听家的呼唤。\'+
   '只要有勇气接受挑战，终有一天兽人、雪山都不能阻碍我们回家，\'+
   '你想去什么地方接受锤炼呢，我可以送你一程！\ \'+
   
   '|{cmd}<进入庄园/@baodian>                        ^<想去商店/@goshop>\'+
   '|{cmd}<洞穴传送/@goMonMap>\'+
   '|{cmd}<回盟重/@back>                          ^<返回比奇/@gobiqi>\' 
   );
end.