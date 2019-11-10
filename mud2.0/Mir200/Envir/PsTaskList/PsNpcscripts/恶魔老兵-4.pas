{********************************************************************

*******************************************************************}
PROGRAM Mir2;

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
   '听封魔谷这个名字就知道是个危险的地方\'
   +'你有勇气去接受挑战吗？\ \'
   +'|{cmd}<进入庄园/@baodian>\'
   +'|{cmd}<去比奇/@leave>           ^<去封魔矿区/@goMonMap>\'
   +'|{cmd}<想去商店/@move0>\'
   +'|{cmd}<打听论武尊的消息/@supman>\'
   +ActiveValidateStr
   +'|{cmd}<确定/@exit>\ '
   );

end;

procedure _goMonMap;
begin
    if This_Player.MapName = '4' then 
    This_Player.Flyto('4',60 + random(3) - 1,70 + random(3) - 1); 
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

procedure _leave;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到比奇需要金币  \'
   +'不能让你免费使用 \'
   +'你必须支付2000金币 \ '
   +'你想花这笔钱吗? \ \'
   +'|{cmd}<移动/@pay1> \ '
   +'|{cmd}<返回/@main>  '
   );
 
end;

procedure _pay1;
begin
    IF This_Player.GoldNum >= 2000 then
    begin
    This_Player.DecGold(2000);
    This_Player.Flyto('0',333,274);
    end else
   This_NPC.NpcDialog(This_Player,
   '你在开玩笑吧???这点钱也没有.. \'
   +'还想移动?? 我不想再见到你.. \ \'
   +'|{cmd}<返回/@main>' 
   );



end;

procedure _move0;
begin
   This_NPC.NpcDialog(This_Player,
   '你想到哪个商店？这可是免费体验服务啊！\\'
   +'|{cmd}<服装店/@move01>\'
   +'|{cmd}<武器店/@move02>\'
   +'|{cmd}<首饰店/@move03>\'
   +'|{cmd}<药书店/@move04>\'
   +'|{cmd}<返回/@main>'   
   );

end;

procedure _move01;
begin
This_Player.RandomFlyTo('b345');
end;

procedure _move02;
begin
This_Player.RandomFlyTo('b342');
end;

procedure _move03;
begin
This_Player.RandomFlyTo('b344');
end;

procedure _move04;
begin
This_Player.RandomFlyTo('b343');
end;

procedure _supman;
begin
   This_NPC.NpcDialog(This_Player,
   '论武尊？这个传说中的武者最近好象在桃源之门出现\'
   +'他是一个很怪异的老头，回答他的问题前最好先考虑一下。\\'
   +'|{cmd}<返回/@main> '
   );

end;



begin
    domain; 
end.