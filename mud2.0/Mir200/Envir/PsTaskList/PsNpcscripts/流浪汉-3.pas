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

procedure _Normal;
begin
  This_Npc.NpcDialog(This_Player, 
  '欢迎，我可以为你做什么吗？\ \'
  +'|{cmd}<购买物品/@buy>' + addSpace('', 24) + '^<出售物品/@sell>\'
  +'|{cmd}<购买祝福油/@zhufu_Buy>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _zhufu_Buy;
begin
  This_Npc.NpcDialog(This_Player, 
  '我这里有很多的祝福油，你要购买么？\ \'
  +'|{cmd}<使用1500元宝兑换祝福油(50瓶)/@zhufu_BuyYB>\ \'
  //+'|{cmd}<使用88金锭兑换一罐祝福油(50瓶)/@zhufu_BuyJD>\ \'
  +'|{cmd}<返回/@Normal>'
  ); 
end;

procedure _zhufu_BuyYB;
begin
   if This_Player.FreeBagNum >= 1 then
    begin
      This_Player.PsYBConsum(This_NPC,'zhufu_YB',20154,1500,1);
    end
    else
    begin
      This_Npc.NpcDialog(This_Player, 
      '你的包裹空间不足，至少留有1个以上的空间再来找我吧！');
    end; 
end;

function zhufu_YB(price, num: Integer):boolean; 
begin  
  This_Player.Give('祝福油',50);
  This_Npc.NpcDialog(This_Player, 
  '恭喜你获得：祝福油x50。\ \'
  +'|{cmd}<继续使用1500元宝兑换祝福油(50瓶)/@zhufu_BuyYB>\ \'
 // +'|{cmd}<继续使用88金锭兑换一罐祝福油(50瓶)/@zhufu_BuyJD>\ \'
  +'|{cmd}<返回/@Normal>'
  ); 
  result:= true; 
end;
{
procedure _zhufu_BuyJD;
begin
  if This_Player.FreeBagNum >= 1 then
  begin
    if This_Player.GloryPoint >= 8800 then
    begin
      if This_Player.DecGloryPoint(30086,8800,1,false,'购买祝福油罐') then
      begin
      zhufu_YB(88,1);
      end; 
    end else
    begin
      This_Npc.NpcDialog(This_Player, 
      '你的金锭不够，不可兑换。'); 
    end; 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player, 
    '你的包裹空间不足，至少留有1个以上的空间再来找我吧！');
  end;
end;
       }

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你需要哪种物品呢?\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '我们出售蜡烛，护身符，卷轴，修复油等.\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '怎么样，修好了吧？看起来比新的还值钱！\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|{cmd}<返回/@main>'
  );
end;



//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(25);
  This_NPC.AddStdMode(30);
  This_Npc.FillGoods('地牢逃脱卷',1000,1);
  This_Npc.FillGoods('随机传送卷',100,1);
  This_Npc.FillGoods('行会回城卷',100,1);
  This_NPC.FillGoods('护身符', 10, 1);
  This_NPC.FillGoods('护身符(大)', 10, 1);
  This_NPC.FillGoods('超级护身符', 10, 1);
  This_NPC.FillGoods('灰色药粉(少量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 1, 1); 
  This_NPC.FillGoods('灰色药粉(中量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 1, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(大量)', 10, 1);
  This_NPC.FillGoods('超级灰色药粉', 10, 1);
  This_NPC.FillGoods('超级黄色药粉', 10, 1);
  This_Npc.FillGoods('修复油',50,1);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.FillGoods('随机传送卷包',100,1);
  This_Npc.FillGoods('行会回城卷包',100,1);
  This_Npc.SetRebate(100);
end;


//脚本执行的入口
begin
      _Normal;
end.