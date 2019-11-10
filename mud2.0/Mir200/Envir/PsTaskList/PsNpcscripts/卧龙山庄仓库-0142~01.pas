{
/************************************************************************}



PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _getback;
Begin
   This_Npc.NpcDialog(This_Player,
   '请看目录决定找什么东西。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_GetBack(This_Player);
end;


Procedure _storage;
begin
   This_Npc.NpcDialog(This_Player,
   '需要保管什么东西？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_GetBack(This_Player);
end;



Procedure _DoInputDialog1;
begin
   This_Npc.InputDialog(This_Player,'请输入：', 0 , 100);
end;


Procedure P100;
begin
   If This_Npc.InputOK then
   begin
      This_Player.ReqOpenStorage(This_Npc.InputStr);
   end;
end;


Procedure _mbind;
begin
  This_Npc.NpcDialog(This_Player,
  '你知道我是什么人吗？我做的是这样的事情... \' +
  '你要试一下吗？有什么要拜托的就说吧！ \ \' +
  '|{cmd}<金币换金条./@chgtobar>'+addspace(' ',18)+'|{cmd}<金条换金币./@bartogold>\' +
  '|{cmd}<捆药瓶和卷轴/@bind>\'+ 
  '|{cmd}<取消/@doexit>');
end;

Procedure _chgtobar;
begin
   This_Npc.Click_GoldChgBar(This_Player);
end;

Procedure _bartogold;
begin
   This_Npc.Click_BartoGold(This_Player);
end;


Procedure _bind;
begin
  This_Npc.NpcDialog(This_Player,
  '目前我能捆的只有卷书和药水。\'+
  '你要捆吗？ \'+ 
  '要捆东西需要100金币. \ \'+
  '|{cmd}<捆药水/@P_bind>'+addspace(' ',20)+'|{cmd}<捆卷书/@Z_bind> \ \'+
  '|{cmd}<返回/@main>');
end;

Procedure _P_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<强效金创药捆/@ch_bind1>  \'+
  '|{cmd}<捆强效魔法药/@ma_bind1> \'+ 
  '|{cmd}<捆金创药（中）/@ch_bind2> \'+
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
  '|{cmd}<捆地牢逃脱卷/@zum_bind1> \' +
  '|{cmd}<捆随机传送卷/@zum_bind2> \' +
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

Procedure _newskill2;
begin
   This_Npc.NpcDialog(This_Player,
   '虽然在卧龙山庄里一直没出去过，\'+
   '最近古战技重现玛法的消息我们还是有所耳闻。\'+
   '对于那些古文字我们曾经作过一段时间的研究，\'+
   '所以也能够辨识一些，你需要帮忙吗？\'+
   '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
   '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
   '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
   '|{cmd}<没事了/@doexit>');
end;

Procedure _newskill22;
begin
   if This_Player.GetBagItemCount('古籍残片(中)') >= 5 then
   begin
      This_Player.Take('古籍残片(中)',5);
      This_Player.Give('古籍残片(大)',1);
      This_Npc.NpcDialog(This_Player,
      '虽然在卧龙山庄里一直没出去过，\'+
      '最近古战技重现玛法的消息我们还是有所耳闻。\'+
      '对于那些古文字我们曾经作过一段时间的研究，\'+
      '所以也能够辨识一些，你还需要帮忙吗？\'+
      '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
      '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
      '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
      '|{cmd}<没事了/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有足够的古籍残片(中)啊！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;

Procedure _newskill21;
begin
   if This_Player.GetBagItemCount('古籍残片(小)') >= 10 then
   begin
      This_Player.Take('古籍残片(小)',10);
      This_Player.Give('古籍残片(中)',1);
      This_Npc.NpcDialog(This_Player,
      '虽然在卧龙山庄里一直没出去过，\'+
      '最近古战技重现玛法的消息我们还是有所耳闻。\'+
      '对于那些古文字我们曾经作过一段时间的研究，\'+
      '所以也能够辨识一些，你还需要帮忙吗？\'+
      '10个古籍残片(小)/可以解读成1个古籍残片(中)，\'+
      '5个古籍残片中可以拼接成1个古籍残片(大)\ \'+
      '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\'+
      '|{cmd}<没事了/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有足够的古籍残片(小)啊！\ \'+
      '|{cmd}<退出/@doexit>');
   end; 
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '需要帮什么忙吗？目前不收保管费，请多利用。\ \'+
   //'|{cmd}<开启仓库/@DoInputDialog1>\'+
   '|{cmd}<仓库管理/@storage>                          \'+//^<找回东西/@getback>\'+
   '|{cmd}<捆各种卷书和药水/@mbind>                  ^<我想请你解读古籍残片/@newskill2>\'+
   '|{cmd}<退出/@doexit>');
end.