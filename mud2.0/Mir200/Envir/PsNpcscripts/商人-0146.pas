{********************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


Procedure _chgtobar;
begin
   //This_Npc.Click_GoldChgBar(This_Player);
end;

Procedure _bartogold;
begin
   This_Npc.Click_BartoGold(This_Player);
end;


Procedure _bind;
begin
  This_Npc.NpcDialog(This_Player,
  '目目前我的技术不够，只能捆药水和卷轴。\'+
  '等我练好技术之后，再给你捆更多的东西。\'+
  '想看我捆东西的技术吗？捆东西需要100金币。\ \'+
  '|{cmd}<捆药水/@P_bind>' + addspace(' ',20) + '^<捆卷书/@Z_bind> \ \'+
  '|{cmd}<返回/@main>');
end;

Procedure _P_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<捆强效金创药/@ch_bind1>  \'+
  '|{cmd}<捆强效魔法药/@ma_bind1>  \'+ 
  '|{cmd}<捆金创药（中）/@ch_bind2>  \'+
  '|{cmd}<捆魔法药（中）/@ma_bind2> \'+
  '|{cmd}<捆金创药/@ch_bind3> \'+
  '|{cmd}<捆魔法药/@ma_bind3> \'+
  '|{cmd}<返回/@bind>');
end;

Procedure _ma_bind3;
begin
  if This_Player.GetBagItemCount('魔法药(小量)') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('魔法药(小量)') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('魔法药(小量)',6);
        This_Player.Give('魔法药(小)包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;


Procedure _ch_bind3;
begin
  if This_Player.GetBagItemCount('金创药(小量)') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('金创药(小量)') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('金创药(小量)',6);
        This_Player.Give('金创药(小)包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;


Procedure _ma_bind2;
begin
  if This_Player.GetBagItemCount('魔法药(中量)') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('魔法药(中量)') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('魔法药(中量)',6);
        This_Player.Give('魔法药(中)包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;



Procedure _ch_bind2;
begin
  if This_Player.GetBagItemCount('金创药(中量)') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('金创药(中量)') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('金创药(中量)',6);
        This_Player.Give('金创药(中)包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;



Procedure _ma_bind1;
begin
  if This_Player.GetBagItemCount('强效魔法药') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('强效魔法药') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('强效魔法药',6);
        This_Player.Give('超级魔法药',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;


Procedure _ch_bind1;
begin
  if This_Player.GetBagItemCount('强效金创药') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('强效金创药') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('强效金创药',6);
        This_Player.Give('超级金创药',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;



Procedure _Z_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<捆地牢逃脱卷/@zum_bind1>  \' +
  '|{cmd}<捆随机传送卷/@zum_bind2>  \' +
  '|{cmd}<捆回城卷/@zum_bind3>  \' +
  '|{cmd}<捆行会回城卷/@zum_bind4>  \' +
  '|{cmd}<返回/@bind>');
end;

Procedure _zum_bind4;
begin
  if This_Player.GetBagItemCount('行会回城卷') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('行会回城卷') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('行会回城卷',6);
        This_Player.Give('行会回城卷包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@Z_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有可以捆的卷书，还捆什么? \'+
     '等准备好之后，再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;

Procedure _zum_bind3;
begin
  if This_Player.GetBagItemCount('回城卷') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('回城卷') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('回城卷',6);
        This_Player.Give('回城卷包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@Z_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有可以捆的卷书，还捆什么? \'+
     '等准备好之后，再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;

Procedure _zum_bind2;
begin
  if This_Player.GetBagItemCount('随机传送卷') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('随机传送卷') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('随机传送卷',6);
        This_Player.Give('随机传送卷包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@Z_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有可以捆的卷书，还捆什么? \'+
     '等准备好之后，再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;

Procedure _zum_bind1;
begin
  if This_Player.GetBagItemCount('地牢逃脱卷') >= 6 then
  begin
     if (This_Player.GoldNum >=100) and  (This_Player.GetBagItemCount('地牢逃脱卷') >= 6) then
     begin
        This_Player.DecGold(100);
        This_Player.Take('地牢逃脱卷',6);
        This_Player.Give('地牢逃脱卷包',1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@Z_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有可以捆的卷书，还捆什么? \'+
     '等准备好之后，再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '你知道我是做什么的吗？ \'+ 
   '我做的事情可以说如下，想试一试吗？说说你的请求吧。\ \'+
   '|{cmd}<金条换金币./@bartogold>\' +//<金币换金条./@chgtobar>'addspace(' ',20) + '^<金条换金币./@bartogold>\'+
   '|{cmd}<捆/@bind> 其他物品\'+
   '|{cmd}<关闭/@doexit>');
end.