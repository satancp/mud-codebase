{
*******************************************************************}


program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务
procedure dorenwu5;
begin
   This_Npc.NpcDialog(This_Player,
   '你就是新来的年轻人吧！'+ This_Player.Name + '，出门在外，\'+
   '自己可要多注意安全。为了帮助你更快的熟悉这里的环境\'+
   '我想让你认识认识这个城里的人们，先去隔壁<服装店/c=red>打个招呼吧\'+
   '这些装备是我作为酬劳送给你的！\ \ \'+
   '|{cmd}<我接受(任务)/@renwu6>');
end;

procedure dorenwu6;
begin
   This_Npc.NpcDialog(This_Player,
   '先去隔壁服装店打个招呼吧！\ \ \'+
   '|{cmd}<我这就去(任务)/@doexit>\');
end;


procedure _renwu6;
begin
   if This_Player.GetV(102,1) = 2 then
   begin
     This_Npc.NpcDialog(This_Player,
    '先去隔壁服装店打个招呼吧！\ \ \'+
    '|{cmd}<我这就去(任务)/@doexit>\');
   end else
   begin
      if This_Player.FreeBagNum < 5 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你的包裹太满，请至少整理出5个包裹位之后再来找我。');
      end else
      begin
         This_Player.SetV(102,1,2);        //任务标记
         This_Player.UpdateTaskDetail(102,1);
         This_Player.Give('经验',800);
         //This_Player.Give('线团',1);
         This_Player.Give('新手项链',1);
         This_Player.Give('新手手镯',2);
         This_Player.Give('新手戒指',2);
         This_Player.PlayerNotice('快去找服装店老板！', 2);
         This_Npc.CloseDialog(This_Player);
      end;
   end;  
end;

//==============================================================新手任务
procedure domain;
var
  ZHRW102 : integer;
begin
   ZHRW102 := This_Player.GetV(102,1);
   if (ZHRW102 = 2) or (ZHRW102 = 1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我可以为你做什么吗？\ \'
      +'|{cmd}<购买物品/@buy>  \'
      +'|{cmd}<出售物品/@sell>  \'
      +'|{cmd}<询问物品详细情况/@questionprize>            \'//^<成长任务：如何成为玛法勇士/@RWZHExtra>\'
      +'|{cmd}<退出/@doexit>');
   end else 
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢， 我可以为你做什么吗？\ \'
      +'|{cmd}<购买物品/@buy>  \'
      +'|{cmd}<出售物品/@sell>  \'
      +'|{cmd}<询问物品详细情况/@questionprize>  \'
      +'|{cmd}<退出/@doexit>');
   end;
end;

procedure _RWZHExtra;
var
  ZHRW102 : integer;
begin
   ZHRW102 := This_Player.GetV(102,1);
   if ZHRW102 = 2 then
   begin
      dorenwu6;
   end else if ZHRW102 = 1 then
   begin
      dorenwu5;
   end;
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买什么？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想卖什么东西？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _questionprize;
begin
  This_Npc.NpcDialog(This_Player,
  '我们店有<地牢逃脱卷/@teleport>，\|{cmd}<随机传送卷/@teleport2>，<修复油/@repairoil> 等等。\据说还有从妖怪身上拿到的<回城卷/@steleport>。\ \|{cmd}<返回/@main>'
  );
end;

procedure _steleport;
begin
  This_Npc.NpcDialog(This_Player,
  '回城卷据说来自远古的一种神奇卷轴。\'+
  '但不幸的是，现在已经丢失了。\'+
  '但我们听说有些怪物还有这种卷轴，\'+
  '如果使用它你可以立刻返回村庄。\ \'+
  '|{cmd}<返回/@questionprize>'
  );
end;

procedure _teleport;
begin
  This_Npc.NpcDialog(This_Player,
  '地牢逃脱卷是将自己瞬间移动到最后经过的村庄的咒文书，\当然和相比，它的威力还算弱，\但是救自己一条命，已经足够了。\ \ |{cmd}<返回/@main>'
  );
end;

procedure _teleport2;
begin
  This_Npc.NpcDialog(This_Player,
  '随机传送卷是自己目前所在的地图，也就是在或在店里面，\可以移动到任何地方的咒文书。\尽管比较危险，但是还剩很多药的话，\使用这个，会对你打猎有帮助的。\ \ |{cmd}<返回/@main>'
  );
end;

procedure _repairoil;
begin
  This_Npc.NpcDialog(This_Player,
  '修复油是提高自己拿着的武器的耐久力的油。\但是因为没有特殊修理的效果，\用修理油修理的武器的耐久力会越来越�  如果不是很贵的武器，带着一个用来做修理，\会对你长久时间打猎有帮助。\ \ |{cmd}<返回/@main>'
  );
end; 

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(25);
  This_Npc.AddStdMode(30);
  This_Npc.FillGoods('地牢逃脱卷',100,1);
  This_Npc.FillGoods('随机传送卷',100,1);
  This_Npc.FillGoods('护身符',100,1); 
  This_Npc.FillGoods('修复油',50,17);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.FillGoods('随机传送卷包',100,1);
  This_Npc.FillGoods('护身符(大)',50,1);
  This_Npc.FillGoods('超级护身符',10,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.