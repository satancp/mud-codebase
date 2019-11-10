{********************************************************************

*******************************************************************}
Program Mir2;

{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas}

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;



procedure domain;
begin
    
   This_NPC.NpcDialog(This_Player,
   '虽然早已证实从海路不能回家，但仍有许多人来此聆听家的呼唤。\'
   +'只要有勇气接受挑战，终有一天兽人、雪山都不能阻碍我们回家，\'
   +'你想去什么地方接受锤炼呢，我可以送你一程！\'
   +'|{cmd}<进入庄园/@baodian>\'
   +'|{cmd}<回盟重/@move3>\'
   +'|{cmd}<打听苍月岛的传说/@superamo>\'
   +'|{cmd}<打听天虹法师/@superman>          ^<洞穴传送/@goMonMap>\'
   +ActiveValidateStr
   +'|{cmd}<离开/@exit>\'
   );

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



procedure _baodian;
begin
  This_Npc.NpcDialog(This_Player,
  '通过庄园内的“元宝使者”，能与其他玩家进行元宝交易，\您现在要去庄园吗?\ \'
  +'|{cmd}<前往庄园/@zhuangyuan>'
  );
end;

procedure _zhuangyuan;
var temp: integer;
//随机5个点传送
begin
  temp := random(5)+1;
  if This_Player.Level >= 8 then
  begin
    if compareText(This_Player.MapName, '0') = 0 then
    begin
        if temp = 1 then
        begin
        This_Player.Flyto('GA0',71,72);
        end
        else if temp = 2 then
        begin
        This_Player.Flyto('GA0',71,72);
        end
        else if temp = 3 then
        begin
        This_Player.Flyto('GA0',71,72);
        end
        else if temp = 4 then
        begin
        This_Player.Flyto('GA0',71,72);
        end
        else
        begin
        This_Player.Flyto('GA0',71,72);
        end;
    end;  
  end
  else
    This_Npc.NpcDialog(This_Player,
    '你的能力不够，我还不能送你去那里，\当您达到8级的时候再来找我吧！\'
    );  
end;


Procedure _move3;
Begin
   if compareText(This_Player.MapName, '5') = 0 then
   begin
      This_Player.Flyto('3',330,330);
   end;
end;


procedure _superamo;
begin
   This_NPC.NpcDialog(This_Player,
   '告诉你，其实苍月岛不只是那么简单的岛屿哦，\'
   +'它还是一个拥有神秘力量的圣地，曾经在这里出现的\'
   +'拜月族有过一个传说，说是拜月族为了阻止魔物入\'
   +'侵制作过6件战袍给战斗着的勇士，但要穿上这些的\'
   +'战袍除了要有强大的力量，更要具备一颗无惧艰险的心\'
   +'去寻找这些战袍吧，它可以带来荣耀和力量！\'
   +'据说比奇的踏云尊者掌握着道士战袍的消息，去找找他吧\\'
   +'|{cmd}<返回/@main>'
   );

end;

procedure _superman;
begin
   This_NPC.NpcDialog(This_Player,
   '天虹法师？哦！听说过，最近他经常在苍月岛的\'
   +'海边出现哦，这老小子最喜欢看海了，去海边找他\'
   +'准没错的。\\'
   +'|{cmd}<返回/@main>'
   );

end;


begin
    domain; 
end.