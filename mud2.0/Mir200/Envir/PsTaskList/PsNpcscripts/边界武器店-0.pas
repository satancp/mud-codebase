{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务 

procedure dorenwu7;
begin
 This_Npc.NpcDialog(This_Player,
 '需要一些针？ 没问题！可是我的伙计在锻造武器时受伤了，\'+
 '你能不能帮我去找一下<药店老板/c=red>，让他来我这里给我的伙计看看伤。\'+
 '这把刚锻造出来的武器算是给你的报答了吧！\ \'+ 
 '|{cmd}<好的 我这就去(任务)/@renwu8>'
 );
end;

procedure dorenwu8;
begin
 This_Npc.NpcDialog(This_Player,
 '你能不能帮我去找一下药店老板，让他来我这里给我的伙计看看伤。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure _renwu8;
begin
if (This_Player.GetV(102,1)=4) then
 begin
  This_Npc.NpcDialog(This_Player,
 '你能不能帮我去找一下药店老板，让他来我这里给我的伙计看看伤。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
 end
 else if This_Player.FreeBagNum >3 then
 begin
  This_Player.SetV(102,1,4);        //任务标记
  This_Player.UpdateTaskDetail(102,1);
  This_Player.Give('经验',800);
  This_Npc.CloseDialog(This_Player);
  //This_player.AutoGotoMap('0108',7,6);//自动寻路药店
  if This_Player.Job =0 then
   begin
   This_Player.Give('新手铁剑',1);
   end else
    if This_Player.Job =1 then
    begin
    This_Player.Give('新手海魂',1);
    end else
    begin
    This_Player.Give('新手半月',1);
   end; 
 end else
 begin 
 This_NPC.NpcDialog(This_Player,
 '请你先整理下你的背包再来找我！\ \'+
 '|{cmd}<好的/@doexit>\'
 );
 end;  
end; 
//==============================================================新手任务 

procedure domain;
var 
  BWRW102 : integer;
begin
   BWRW102 := This_Player.GetV(102,1);
   if (BWRW102 = 4) or (BWRW102 = 3) then
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢你来这里。\ \'
      +'|{cmd}<买武器/@buy>  \'
      +'|{cmd}<卖武器/@sell>  \'
      +'|{cmd}<修理武器/@repair> \'
      +'|{cmd}<询问武器/@qweapon>\'
      +'|{cmd}<特殊修理/@s_repair>                  \'//^<成长任务：如何成为玛法勇士/@ExtraBQSD>\'
      +'|{cmd}<退出/@doexit>');
   end
   else
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢你来这里。\ \'
      +'|{cmd}<买武器/@buy>  \'
      +'|{cmd}<卖武器/@sell>  \'
      +'|{cmd}<修理武器/@repair> \'
      +'|{cmd}<询问武器/@qweapon>\'
      +'|{cmd}<特殊修理/@s_repair>\'
      +'|{cmd}<退出/@doexit>');
   end;
end;

procedure _ExtraBQSD;
var 
  BWRW102 : integer;
begin
   BWRW102 := This_Player.GetV(102,1);
   if BWRW102 = 4 then
   begin
      dorenwu8;
   end
   else if BWRW102 = 3 then
   begin
      dorenwu7;
   end;
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '您想买些什么武器？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我您要卖的武器。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '您要修理武器吗？\给我您要修理的武器。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看起来修好了，感谢下次再来。\ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _qweapon;
begin
  This_Npc.NpcDialog(This_Player,
  '店里卖的武器其能力值是定值。\但是妖魔身上的武器，有时根据不同情况，\具有特殊功能。\这种武器拿到店里来，会卖好价钱。\对了，武器的价格按种类不同，其价格也不同，\但是大体上，耐力越高越昂贵\ \'
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
  This_Npc.FillGoods('短剑',50,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.