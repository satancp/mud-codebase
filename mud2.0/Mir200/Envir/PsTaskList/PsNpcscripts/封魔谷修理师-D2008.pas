{
/************************************************************************}

Program Mir2;


{$I common.pas}


Procedure _doexit;
Begin
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
  '你知道我是什么人吗？ \'+ 
  '我做的是这样的事情... \'+ 
  '你要试一下吗？有什么要拜托的就说吧 \ \' +
  '|{cmd}<金币换金条./@chgtobar>'+addspace(' ',20)+'|{cmd}<金条换金币./@bartogold>\' +
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

Procedure _cangku;
Begin
   This_Npc.NpcDialog(This_Player,
   '昨天，我请封魔谷的仓库管理员吃饭，他总算把不传的技术告\'+
   '诉了我。我现在也可以保存物品了，有什么要求就和我说吧。\ \'+
   //'|{cmd}<开启仓库/@DoInputDialog1>\'+
  // '|{cmd}<储存物品/@storage>   
   '|{cmd}<仓库管理/@storage>\'  +
   '|{cmd}<捆各种卷书和药水/@mbind>\'+
   '|{cmd}<退出/@doexit>');
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '您要修理吗?\'+
   '我可是个万能工匠哦！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  '怎么样，修好了吧？看起来比新的还值钱！\ \' +
  '|{cmd}<返回/@main>');
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   '你这家伙，你可太幸运了，我正好有材料做特殊修补，\'+
   '但费用是普通的三倍！\ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   '已经修理好了，看起来很不错嘛！\' +
   '|{cmd}<返回/@main>');
end;

procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我您要卖的物品.\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;

Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '您想买些什么?\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;

procedure OnInitialize;
var
i : integer;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 200, 1);
  This_NPC.FillGoods('魔法药(小量)', 200, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  This_NPC.FillGoods('金创药(小)包', 100, 1);
  This_NPC.FillGoods('魔法药(小)包', 100, 1);
  This_NPC.FillGoods('金创药(中)包', 100, 1);
  This_NPC.FillGoods('魔法药(中)包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);

  //加载stdmode
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(43);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(3);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;

Procedure _newskill;
Begin
   If This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事吗？\');
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 8 then
      Begin
         This_Npc.NpcDialog(This_Player,
         '白日门的书店老板是我的至交，\'+
         '你既然来了，就麻烦你去和他打一个招呼吧。\');
      end else if This_Player.GetV(10,1) = 7 then
      begin
         This_Npc.NpcDialog(This_Player,
         '噢...原来是那个年轻人�  '+
         '整天在这种怪物横行的地方帮助勇士们，\' +
         '能偶尔听到一些曾经的消息，也是很令人高兴。\'+
         '白日门的书店老板是我的至交，\' +
         '你既然来了，就麻烦你去和他打一个招呼吧。\');
         This_Player.SetV(10,1,8);      
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你得先去盟重酒馆找鉴宝散人领取鉴宝手信！\');
   end;      
end;


Begin
   if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '你竟然能跑到这里来？\'+
      '看在你这么卖命的份上，我就帮助你一下。\ \'+
      '|{cmd}<买/@buy>                    ^<卖/@sell>\'+
      '|{cmd}<修理/@repair>                  ^<特殊修理/@s_repair>\'+
      '|{cmd}<使用仓库/@cangku>\ \');
   end else if (This_Player.GetV(10,1) = 7) or (This_Player.GetV(10,1) = 8) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你竟然能跑到这里来？\'+
      '看在你这么卖命的份上，我就帮助你一下。\ \'+
      '|{cmd}<买/@buy>                    ^<卖/@sell>\'+
      '|{cmd}<修理/@repair>                  ^<特殊修理/@s_repair>\'+
      '|{cmd}<使用仓库/@cangku>\ \'+
      '|{cmd}<有一个你曾经指点过的白日门门徒，让我来问候你/@newskill>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你竟然能跑到这里来？\'+
      '看在你这么卖命的份上，我就帮助你一下。\ \'+
      '|{cmd}<买/@buy>                    ^<卖/@sell>\'+
      '|{cmd}<修理/@repair>                  ^<特殊修理/@s_repair>\'+
      '|{cmd}<使用仓库/@cangku>\ \');
   end;
end.