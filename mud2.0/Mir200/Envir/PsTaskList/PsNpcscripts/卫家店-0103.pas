{********************************************************************

*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _kang;
begin
      if This_Player.GetV(11,4) = 3 then
      This_Player.SetV(11,4,6);
       This_NPC.NpcDialog(This_Player,
       '我说的人就是在北门街道铁匠铺做事的铁匠铺老板，\'
       +'别看他现在在小店做事没什么出息，\'
       +'曾经可是很有名气的铁匠，\'
       +'用那时候学到的技术，现在给别人做特殊修理。\'
       +'你去找一下他吧，我会事先和他讲好的。\ \'
       +'|{cmd}<关闭/@exit>'
       );
end;

procedure _main_1;
begin
This_Npc.NpcDialog(This_Player,
      '欢迎光临。请问有什么事情帮忙吗？\ \'
      +'|{cmd}<买武器/@buy>' + addSpace('', 22) + '^<卖武器/@sell>\'
      +'|{cmd}<修理武器/@repair>\'
      +'|{cmd}<特殊修理/@s_repair>\'
      +'|{cmd}<打听/@qweapon>超级装备的消息\'
      +'|{cmd}<回比奇城/@moveout>\'
      +'|{cmd}<退出/@doexit>');
end;

procedure domain;
var
num,duramax,duraav : integer;
begin
    This_Player.CheckBagItemEx('金矿',num,duramax,duraav);
    
    
    //IF (This_Player.GetV(8,16) <= 0) and   
    //(This_Player.GetV(8,17) <= 0) and
    //(This_Player.GetV(8,18) <= 0) and
    //(This_Player.GetBagItemCount('金矿') >= 1) then
    
    if (This_Player.GetV(11,3) <= 0) and (This_Player.GetBagItemCount('金矿') >= 1) then
    begin
        //This_Player.SetV(8,18,1);   
        This_Player.SetV(11,3,1);
        This_NPC.NpcDialog(This_Player,
               '你包里发光的是什么？难道是金矿？\'
               +'是来卖金矿吗？我最近正在开始利用金矿研究新的武器。\'
               +'所以需要很多金矿，不知你能不能帮我找金矿？\'
               +'拿金矿来，我会给你好价钱。\ \'
               +'|{cmd}<返回/@main>'
               );
    end else
    {IF
    (random(10) = 1) and
    (This_Player.GetV(8,16) <= 0) and
    (This_Player.GetV(8,17) <= 0) and
    (This_Player.GetV(8,18) = 1) and
    (This_Player.GetBagItemCount('金矿') >= 1) then   }
    if (random(10) = 1) and (This_Player.GetV(11,3) = 1) and (This_Player.GetBagItemCount('金矿') >= 1) then
    begin
       //This_Player.SetV(8,18,1);   
        This_Player.SetV(11,3,1); 
    
        This_NPC.NpcDialog(This_Player,
               '你包里发光的是什么？难道是金矿？\'
               +'是来卖金矿吗？我最近正在开始利用金矿研究新的武器。\'
               +'所以需要很多金矿，不知你能不能帮我找金矿？\'
               +'拿金矿来，我会给你好价钱。\ \'
               +'|{cmd}<返回/@main>'
               );
    end else
    // IF (This_Player.GetV(8,20) <= 0) and
    //(This_Player.GetV(8,19) <= 0) and
    //(This_Player.GetV(8,21) = 1) then
    if This_Player.GetV(11,4) = 3 then
    _kang
    else
   // IF This_Player.GetV(8,19) = 1 then
    IF This_Player.GetV(11,5) = 3 then
    begin
    IF RANDOM(2) = 0 then
       This_NPC.NpcDialog(This_Player,
       '见过恼火的铁匠吗？那就是我。\'
       +'我脾气很坏，至于这一点你可以问戒指店老板，\'
       +'我的臭脾气是出了名的。\'
       )
       else
       This_NPC.NpcDialog(This_Player,
       '我不是说过不再和你这种人来往吗？\'
       +'没事了，你走吧。\'
       );
    end else
   
    //IF (This_Player.GetV(8,20) <= 0) and (num >= 3) and (duramax > 14500) then
    IF (This_Player.GetV(11,4) <= 0) and (num >= 3) and (duramax > 14500) then
    begin
            //This_Player.SetV(8,18,0);
            
           This_NPC.NpcDialog(This_Player,
           '哦, 你今天运气不错。\'
           +'那个金矿看上去品质不错。\'
           +'但是，今天我没有足够的钱来购买这些金矿，\'
           +'不知你能不能给我赊账？\ \'
           +'  <免费/@freegive>\'
           +'  <赊账/@creditgive>\'
           +'  <拒绝/@nogive>\'
           );
    end  else
    begin
         _main_1;
    end;
end;

procedure _moveout;
begin  
    if This_Player.MapName = '0103' then 
    This_Player.Flyto('0',341 + random(3) - 1,312 + random(3) - 1); 
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请挑选要购买的物品。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '请放上去要卖的武器。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '要修理武器吗？\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '已经修好了。\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\'+
    '但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了……\请好好的使用它。\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _qweapon;
begin
  This_Npc.NpcDialog(This_Player,
  '传说中3位留下了三套绝顶装备。\'
  +'无名战士的圣战套装据说遗落在赤月峡谷深处，\'
  +'由双头血魔亲自看管……\ \'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _freegive;
var
num,duramax,duraav : integer;
begin
   This_Player.CheckBagItemEx('金矿',num,duramax,duraav);
  // This_Player.PlayerNotice('金矿' + inttostr(num) + '-' + inttostr(duramax) ,2);
   if (num >= 3) and (duramax > 14500) then    //duramax > 14500
   begin
       IF (This_Player.GetV(11,4) <= 0) then
       begin
       //This_Player.SetV(8,17,1);
       This_Player.SetV(11,5,1);//免费 
       This_Player.SetV(11,4,6);
       This_Player.SetV(11,3,2);
       This_Player.Take('金矿',2);
       end;
       This_NPC.NpcDialog(This_Player,
       '啊？你真的把这些白给我？\'
       +'真没想到现如今还有你这样的人，看来还有人情啊。\'
       +'我不能白拿这么贵重的东西。\'
       +'你有没有听说过命运之刃？\'
       +'还有在北门街道小店修理武器之后，有没有仔细看过人？\ \'
       +'|{cmd}<返回/@kang>'
       );
   end;
end;

procedure _creditgive;
var
num,duramax,duraav : integer;
begin
   This_Player.CheckBagItemEx('金矿',num,duramax,duraav);
  // This_Player.PlayerNotice('金矿' + inttostr(num) + '-' + inttostr(duramax) ,2);
   if (num >= 3) and (duramax > 14500) then    //duramax > 14500
   begin

    //This_Player.SetV(8,22,1);
    //This_Player.Take('金矿',2);
       IF (This_Player.GetV(11,4) <= 0) then
       begin
       //This_Player.SetV(8,17,1);
       This_Player.SetV(11,5,2); //赊账 
       This_Player.SetV(11,4,2);
       This_Player.SetV(11,3,2);
       This_Player.Take('金矿',2);
       end;
       This_NPC.NpcDialog(This_Player,
       '嗯，给我赊账？年轻人未免小气了点。\'
       +'不过这也算是帮了我，\'
       +'我也得告诉你一个对你有用的事情。\'
       +'嗯，你听说过命运之刃吗？\'
       +'但是我现在比较忙，你去找戒指店老板吧。\ \'
       +'|{cmd}<关闭/@exit>'
       );
   end;
end;

procedure _nogive;
begin
   This_NPC.NpcDialog(This_Player,
   '什么？不能那样做？哦，看来年轻人常被人骗过啊。\'
   +'这么不相信人啊？呵呵。。。\'
   +'你如果还这样坚持，以后我也有可能不再和你做交易。\'
   +'你还坚持拒绝吗？\ \'
   +'|{cmd}<免费/@freegive>\'
   +'|{cmd}<赊账/@creditgive>\'
   +'|{cmd}<还是拒绝/@r_nogive>'
   );

end;

procedure _r_nogive;
begin
    //This_Player.SetV(8,19,1);
    
   IF (This_Player.GetV(11,4) <= 0) then
   begin
   //This_Player.SetV(8,17,1);
   This_Player.SetV(11,5,3); //拒绝 
   This_Player.SetV(11,4,2);
   This_Player.SetV(11,3,2);
   This_Player.Take('金矿',2);
   end; 
   This_NPC.NpcDialog(This_Player,
   '好，随你便吧。\'
   +'我也不会再见你第二次!!!\ \'
   +'|{cmd}<关闭/@exit>'
   
   );

end;



//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.AddStdMode(43);
  This_Npc.FillGoods('木剑',50,1);
  This_Npc.FillGoods('青铜剑',50,1);
  This_Npc.FillGoods('铁剑',50,1); 
  This_Npc.FillGoods('匕首',50,1);
  This_Npc.FillGoods('修罗',50,1);
  This_Npc.FillGoods('凝霜',50,1);
  This_Npc.FillGoods('鹤嘴锄',30,1);
  This_Npc.SetRebate(100);
end;



//脚本执行的入口
begin
  domain;
end.