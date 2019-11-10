{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _SongDD109;
begin
   if This_Player.GetV(109,1) = 4 then
   begin
      This_Player.Give('经验',600000);
      This_Player.SetV(109,1,5);
      This_Player.UpdateTaskDetail(109,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

procedure domain;
var
  MWQ106, MWQ109 : integer;
begin
  MWQ109 := This_Player.GetV(109,1);
  MWQ106 := This_Player.GetV(106,1);
  if MWQ109 = 5 then
  begin
     This_Npc.NpcDialog(This_Player,
     '你已经把货物送到沙巴克铁匠铺了么？\ \'+
     '|{cmd}<好的，没有问题/@doexit>\ \'+
     '|{cmd}<我有武器的事情找你/@Normal>');
  end else if MWQ109 = 4 then
  begin
     This_Npc.NpcDialog(This_Player,
     This_Player.Name + '，好久没有看见你了，对了，\'+
     '还记得你以前送到我这里一批钳虫的外壳么？我已经把材料都\'+
     '打造成武器了。能不能再麻烦你帮我送到<沙巴克铁匠铺/c=red>？\'+
     '（任务目标：把武器送到沙巴克铁匠铺）\ \'+
     '|{cmd}<好的，没有问题/@SongDD109>\ \'+
     '|{cmd}<我有武器的事情找你/@Normal>');
  end else if MWQ106 = 15 then
  begin
    This_Npc.NpcDialog(This_Player,
    '真是太感谢了，我就不招呼你了。我的时间很紧的……\'
    +'这人身上还是那么臭……你去找安家铺子老板吧。\ \'
    +'怎么每次都是这样，一见面就下逐客令……\ \'
    +'|{cmd}<好的，我这就去/@doexit>\ \'
    +'|{cmd}<我有武器的事情找你/@Normal>');
  end
  else if MWQ106 = 14 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经收集到恶蛆粉末了么？\'
    +'（任务目标：杀死黑色恶蛆5个，收集恶蛆粉末5份，\'
    +'然后交给沃玛森林的合家药店老板）\ \'
    +'|{cmd}<好的，我就去/@doexit>\ \'
    +'|{cmd}<我有武器的事情找你/@normal>'
    );
  end
  else if MWQ106= 13 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经收集到5个钳虫的外壳了么？\'
    +'（任务目标：杀死5个蜈蚣洞的钳虫，收集5个钳虫壳）\ \'
    +'|{cmd}<我已经收集好了5个钳虫的外壳/@mission_106_1_12_fns>\ \'
    +'|{cmd}<我有武器的事情找你/@normal>'
    );
  end
  else if MWQ106 = 12 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经收集到5个钳虫的外壳了么？\'
    +'（任务目标：杀死5个蜈蚣洞的钳虫，收集5个钳虫壳）\ \'
    +'|{cmd}<我这就去收集5个钳虫的外壳/@doexit>\'
    +'|{cmd}<我有武器的事情找你/@normal>'
    );
  end
  else if MWQ106 = 11 then
  begin
    This_Npc.NpcDialog(This_Player,
    '以子之矛，攻子之盾。从怪物身上取得的材料，也可用来打造武器。\'
    +'钳虫壳你知道么？很坚硬的那种。\'
    +'只要融入了这些，武器才能变得更锋利，我们的战士就能更好的\'
    +'在战场上和本兽人军团战斗，\'
    +'如果你能帮我去弄5个来的话，我会很感激的。\'
    +'（任务目标：杀死5个蜈蚣洞的钳虫）\ \'
    +'|{cmd}<我这就去收集5个钳虫的外壳/@doexit>\'
    +'|{cmd}<我有武器的事情找你/@normal>'
    );
    This_Player.SetV(106,1,12);
    This_Player.SetV(106,5,0);
    This_Player.Give('经验',300000);
    This_Player.UpdateTaskDetail(106,1); 
  end
  else
  begin
  This_Npc.NpcDialog(This_Player,
  '感谢你到铁匠铺，有什么可以帮忙么？\ \'
  +'|{cmd}<买武器/@buy>\'
  +'|{cmd}<卖武器/@sell>\'
  +'|{cmd}<修理武器/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
  end;
end;

//------------------------------------------------------------------------------
//成长任务

procedure _mission_106_1_12_fns;
begin
   This_Npc.NpcDialog(This_Player,
   '非常感谢你。有了这些钳虫的外壳，我就能制造出大量有具有杀伤力\'
   +'的武器了，国王下达的战备筹集任务我也能如期完成，\'
   +'这回看半兽人还敢不敢再来。安家铺子老板希望你还能帮帮他，\'
   +'他发现了一种新的材料在对抗尸变的效果上比粪虫还好使。\ \'
   +'|{cmd}<啊？不会又是什么恶心的生物吧？/@mission_106_1_1222_fns>');
end;

procedure _mission_106_1_1222_fns;
begin
  if This_Player.GetV(106,1) = 14 then
  begin
    This_Npc.NpcDialog(This_Player,
    '这个……他说，是蜈蚣洞的黑色恶蛆……\'
    +'（任务目标：杀死黑色恶蛆5个然后找到沃玛森林的安家铺子老板）\'
    +'安家铺子老板就不能研究点干净的生物么？\ \'
    +'|{cmd}<好吧，好吧，我就再跑一趟好了。/@doexit>'
    );
  end else if This_Player.GetV(106,1) = 13 then
  begin
    This_Player.Give('经验',300000);
    This_Player.SetV(106,1,14);
    This_Player.SetV(106,6,0);
    This_Player.UpdateTaskDetail(106,1);
  end;
end;

procedure _mission106_1_12_1;
begin
  if This_Player.GetV(106,1) = 14 then
  begin
    This_Npc.NpcDialog(This_Player,
    '这个……他说，是蜈蚣洞的黑色恶蛆……\'
    +'（任务目标：杀死黑色恶蛆5个然后找到沃玛森林的合家药店老板）\'
    +'合家药店老板就不能研究点干净的生物么？\ \'
    +'|{cmd}<好吧，好吧，我就再跑一趟好了。/@doexit>'
    );
  end
  else
  exit;
end;

//------------------------------------------------------------------------------ 

procedure _normal;
begin
  This_Npc.NpcDialog(This_Player,
  '感谢你到铁匠铺，有什么可以帮忙么？\ \'
  +'|{cmd}<买武器/@buy>\'
  +'|{cmd}<卖武器/@sell>\'
  +'|{cmd}<修理武器/@repair>\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '你想买些什么武器？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我你要卖的武器。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你要修理武器吗？\给我你要修理的武器。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看起来修好了，感谢下次再来。\ \' +
    '|{cmd}<返回/@main>'
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
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.