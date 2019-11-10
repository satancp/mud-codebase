{********************************************************************

*******************************************************************}
program mir2;


procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    
    This_NPC.NpcDialog(This_Player,
    '此路是比奇通往盟重的必经之路，\'
    +'但若实力不足，就会成为一条不归路\'
    +'|{cmd}<进入庄园/@baodian>\'
    +'|{cmd}<前往盟重/@MoveMZ>            ^<前往比奇/@MoveBQ>\'

    +'|{cmd}<确定/@exit>\ '
    );
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

procedure _MoveMZ; 
begin
This_Player.Flyto('3',333,333);
end;

procedure _moveBQ; 
begin
This_Player.Flyto('0',333,274);
end;


begin
 domain;
end.