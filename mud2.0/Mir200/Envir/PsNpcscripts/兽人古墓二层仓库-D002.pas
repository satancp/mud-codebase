{
/************************************************************************}

Program Mir2;

Procedure _DoExit;
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



Procedure _check465;
Begin
   If This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事吗？\');
   end else if This_Player.GetV(10,1) = 4 then
   Begin
      This_Npc.NpcDialog(This_Player,
      '那……那个老家伙骗我！快把钱还来！\ \'+
      '|{cmd}<哈哈，你也有上当的时候啊，我去告诉老家伙去/@DoExit>');
   end else if This_Player.GetV(10,1) = 3 then
   begin
      if This_Player.GetBagItemCount('瓷碗') >= 1 then
      begin
      This_Npc.NpcDialog(This_Player,
      '……等下！\'+
      '这是什么？怎么会有饭粒沾在碗底？\'+
      '……那个老家伙骗我！快把钱还来！\ \'+
      '|{cmd}<哈哈，你也有上当的时候啊，我去告诉老家伙去/@DoExit>');
      This_Player.SetV(10,1,4);
      This_Player.Take('瓷碗',1);
      This_Player.AddGold(6000);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '唔...那个老家伙有不少好东西...\'+
         '他有什么要你带给我的啊？\');
      end;
   end else
   Begin
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事吗？\');
   end;
end;
   





Procedure _newskill;
Begin
   If This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事吗？\');
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 4 then
      Begin
         This_Npc.NpcDialog(This_Player,
         '那……那个老家伙骗我！快把钱还来！\ \'+
         '|{cmd}<哈哈，你也有上当的时候啊，我去告诉老家伙去/@DoExit>');
      end else if This_Player.GetV(10,1) = 3 then
      begin
         This_Npc.NpcDialog(This_Player,
         '好唔...那个老家伙有不少好东西...\'+
         '可是，我真的想要的他又不给...但是，这个听来也不错，\'+
         '我出6000金币，大侠您看行吗？\ \'+
         '|{cmd}<好吧，我贱卖了/@check465>');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你得先去盟重酒馆找鉴宝散人领取鉴宝手信！\');
   end;      
end;


Procedure Normal;
Begin
   if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '还有人竟然来到这里，你有什么事情吗？\'+
      '不知道今天能不能回到家。\ \'+
      //'|{cmd}<开启仓库/@DoInputDialog1>\'+
      '|{cmd}<仓库管理/@storage>                    ');//^<取回物品/@getback>');
   end else if (This_Player.GetV(10,1) = 3) or (This_Player.GetV(10,1) = 4) then
   begin
      This_Npc.NpcDialog(This_Player,
      '还有人竟然来到这里，你有什么事情吗？\'+
      '不知道今天能不能回到家。\ \'+
      //'|{cmd}<开启仓库/@DoInputDialog1>\'+
      '|{cmd}<仓库管理/@storage>                    \'+//^<取回物品/@getback>\ \'+
      '|{cmd}<这个你要吗？比奇书店老板珍藏的瓷碗.../@newskill>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '还有人竟然来到这里，你有什么事情吗？\'+
      '不知道今天能不能回到家。\ \'+
      //'|{cmd}<开启仓库/@DoInputDialog1>\'+
      '|{cmd}<仓库管理/@storage>                    ');//^<取回物品/@getback>');
   end;
end;


Procedure _qf2;
Begin
   This_Npc.NpcDialog(This_Player,
   '我可以制作祈福项链，\'+
   '不过需要你提供一瓶祝福油来增加项链的力量。\'+
   '咳，咳……\ \'+
   '|{cmd}<提供祝福油/@qf3>                     ^<离开/@doexit>');
end;

Procedure _qf3;
Begin
   if This_Player.GetBagItemCount('祝福油') >= 1 then
   begin
      This_Player.Take('祝福油',1);
      This_Player.Give('祈福项链',1);
      This_Npc.NpcDialog(This_Player,
      '呵呵，想不到你都带来了！\'+ 
      '这就是你需要的东西，请拿好！\ \'+
      '|{cmd}<继续提供/@qf3>祝福油                     ^<离开/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '就带了这么点东西吗？看来你还没准备好啊，不过\'+
      '没关系，我会一直在这里的，准备好了随时来找我好了！\');
   end;
end;


Procedure Abnormal;
begin
   This_Npc.NpcDialog(This_Player,
   '看来你已经是一位真正的高手了！\'+
   '而且……而且还带着我感兴趣的东西！\'+
   '不知你对祈福项链有没有兴趣？\ \'+
   '|{cmd}<有兴趣/@qf2>\'+
   //'|{cmd}<开启仓库/@DoInputDialog1>\'+
   '|{cmd}<仓库管理/@storage>                    \'+//^<取回物品/@getback>\ \'+
   '|{cmd}<这个你要吗？比奇书店老板珍藏的瓷碗.../@newskill>');
end;


begin
   if (This_Player.GetItemNameOnBody(0) = '法神披风') or (This_Player.GetItemNameOnBody(0) = '霓裳羽衣') or
      (This_Player.GetItemNameOnBody(0) = '圣战宝甲') or (This_Player.GetItemNameOnBody(0) = '天魔神甲') or
      (This_Player.GetItemNameOnBody(0) = '天师长袍') or (This_Player.GetItemNameOnBody(0) = '天尊道袍') then
   begin
      if This_Player.GetBagItemCount('祝福油') >= 1 then
      begin
         Abnormal;
      end else
      begin
         Normal;
      end; 
   end else
   begin
      Normal;
   end; 
end.