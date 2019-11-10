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
   '请从列表中选择你要取回的物品.\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_GetBack(This_Player);
end;


Procedure _storage;
begin
   This_Npc.NpcDialog(This_Player,
   '你想储存哪种物品呢?\ \ \'+
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
  '你知道我是什么人吗？ \'+ 
  '我做的是这样的事情... \'+ 
  '你要试一下吗？有什么要拜托的就说吧 \ \' +
  '|{cmd}<金币换金条./@chgtobar>'+addspace(' ',20)+'|{cmd}<金条换金币./@bartogold>\' +
  '|{cmd}<捆/@bind>药瓶和卷轴\'+ 
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

//捆药模板
//item_src待捆绑的东西， item_des捆绑成的东西 
procedure DoBindDrug(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
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

procedure _ma_bind3;
begin
  DoBindDrug('魔法药(小量)', '魔法药(小)包');
end;

Procedure _ch_bind3;
begin
  DoBindDrug('金创药(小量)', '金创药(小)包');    
end;

Procedure _ma_bind2;
begin
  DoBindDrug('魔法药(中量)', '魔法药(中)包');  
end;

Procedure _ch_bind2;
begin
  DoBindDrug('金创药(中量)', '金创药(中)包');    
end;

Procedure _ma_bind1;
begin
  DoBindDrug('强效魔法药', '超级魔法药');     
end;

Procedure _ch_bind1;
begin
  DoBindDrug('强效金创药', '超级金创药');   
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

//捆书卷模板
//item_src待捆绑的东西， item_des捆绑成的东西 
procedure DoBindBook(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
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

procedure _zum_bind4;
begin
  DoBindBook('行会回城卷', '行会回城卷包');
end;

Procedure _zum_bind3;
begin
  DoBindBook('回城卷', '回城卷包');  
end;

Procedure _zum_bind2;
begin
  DoBindBook('随机传送卷', '随机传送卷包');  
end;

Procedure _zum_bind1;
begin
  DoBindBook('地牢逃脱卷', '地牢逃脱卷包');  
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '我可以帮你什么吗?\请放心保存物品,我们不收费\ \'+
   //'|{cmd}<开启仓库/@DoInputDialog1>\'+
   '|{cmd}<仓库管理/@storage>                          \'+//^<找回东西/@getback>\'+
   '|{cmd}<捆各种卷书和药水/@mbind>\'+
   '|{cmd}<退出/@doexit>');
end.