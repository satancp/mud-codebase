{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '听说虹魔教主的复活让他的领地封魔谷也重现大陆了，\封魔谷的入口在沃玛森林附近，\不过我还是劝你不要去会比较安全一点……\ \'
  +'|{cmd}<买彩票/@buy>\'
  +'奖金 <查询/@Bingo>\'
  +'|{cmd}<对话./@talkwith>\'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请挑选你想买的物品.\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _bingo;
begin
  This_Npc.NpcDialog(This_Player, 
    '不好意思，我正在研究新的彩票，\所以你现在买了彩票，可就不能抽奖了。\等我升级了新的彩票系统以后，你再来找我吧。\ \|{cmd}<返回/@main>'
    );
end;

procedure _talkwith;
begin
  This_Npc.NpcDialog(This_Player, 
  '有人挖了一条通道，\通过这个通道, 可以马上到达白日门.. \你想快速到达那里吗?? \ \'
  +'|{cmd}<向通道移动/@move1> \'
  +'|{cmd}<向毒蛇山谷移动/@move2> \'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _move1;
begin
  This_Npc.NpcDialog(This_Player, 
  '移动到通道需要金币  \不能让你免费使用 \你必须支付1000金币 \你想花这笔钱吗? \ \'
  +'|{cmd}<移动./@pay1> \' 
  +'|{cmd}<退出./@talkwith>'
  );
end;

procedure _pay1;
begin
  if This_Player.GoldNum >= 1000 then
  begin
    if compareText(This_Player.MapName, '3') = 0 then
    begin
       This_Player.DecGold(1000);
       This_Player.Flyto('D701',108,155);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player, 
    '你在开玩笑吧???这点钱也没有.. \还想移动?? 我不想再见到你.. \|{cmd}<返回/@main>'
    );
  end;
end;

procedure _move2;
begin
  This_Npc.NpcDialog(This_Player, 
  '移动到毒蛇山谷需要金币  \不能让你免费使用? \你必须支付1000金币 \你想花这笔钱吗? \ \ \ \'
  +'|{cmd}<移动./@pay2> \' 
  +'|{cmd}<退出./@talkwith>'
  );
end;

procedure _pay2;
begin
  if This_Player.GoldNum >= 1000 then
  begin
    if compareText(This_Player.MapName, '3') = 0 then
    begin
       This_Player.DecGold(1000);
       This_Player.Flyto('3',521,764);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player, 
    '你在开玩笑吧???这点钱也没有.. \还想移动?? 我不想再见到你.. \|{cmd}<返回/@main>'
    );
  end;
end; 
    
//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3); 
  This_Npc.FillGoods('彩票',100,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.