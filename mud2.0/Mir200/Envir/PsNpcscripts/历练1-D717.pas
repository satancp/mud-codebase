{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _giveqian;
begin
  if This_Player.GetS(22,23) = GetDateNum(GetNow) then
  begin
    if This_Player.GetS(22,22) = 2009 then
    begin
      exit;
    end
    else if (This_Player.GetS(22,24) = 420) or (This_Player.GetS(22,24) = 400) then
    begin
      if This_Player.GoldNum >= 15000 then
      begin
        if This_NPC.CheckMapMonByName('D717','恶魔楔蛾') > 80 then
        begin
          This_Npc.NpcDialog(This_Player,          
          '目前已经放出够多的恶魔楔蛾，请先消灭完，\如果你在我附近没有看到恶魔楔蛾 你可以试着跑远点看看\');
          This_Player.SetS(22,24,420);
          This_Player.DecGold(15000);
        end
        else
        begin
          This_NPC.CreateMon('D717',30,72,5,'恶魔楔蛾',10);
          This_Player.SetS(22,24,420);
          This_Player.DecGold(15000);
          This_NPC.CloseDialog(This_Player); 
        end;
      end
      else
        This_Npc.NpcDialog(This_Player,          
        '你身上好像没有这么多金币，我可不能让你进行历练！！');
    end
    else
      exit;                                                   
  end
  else
    exit;
end;


begin
  if This_Player.GetS(22,23) = GetDateNum(GetNow) then
  begin
    if This_Player.GetS(22,22) = 2009 then
    begin
      This_Npc.NpcDialog(This_Player,          
      '今天的历练已经结束,\请明天再到我这里领取任务吧！！');
      exit;
    end
    else if This_Player.GetS(22,24) = 450 then
    begin
      This_Npc.NpcDialog(This_Player,          
      '这位勇士，你果然厉害，已经杀满10只恶魔楔蛾，\'
      +'我这就给你超额的奖励。奖励内容为：<经验 1000000/c=red> \ \');
      This_Player.Give('经验',1000000);
      This_Player.SetS(22,22,2009);
      //This_Player.UpdateTaskDetail(10008,1); 
    end
    else if This_Player.GetS(22,24) = 420 then
    begin
      This_Npc.NpcDialog(This_Player,          
      '怎么样，有没有<打满10只怪/c=red>，\'
      +'如果还没打完没关系，你可以再付出<15000金币/c=red>，\'
      +'继续释放<10只恶魔楔蛾/c=red>\ \'
      +'|{cmd}<支付金币/@giveqian>'); 
    end
    else if This_Player.GetS(22,24) = 400 then
    begin
      This_Npc.NpcDialog(This_Player,          
      '历练的方法很简单，只要你给我<15000金币/c=red>，\'
      +'我将会在我所站的周围，释放<10只恶魔楔蛾/c=red>，当你打死他们后，\'
      +'我就会给你<超额的奖励/c=red>。但如果你没有<打满10只怪/c=red>，\'
      +'可再交付我<15000金币/c=red>。\'
      +'我将再释放<10只恶魔楔蛾/c=red>。直到你打满10只怪为止。\'
      +'奖励内容为：<经验 1000000/c=red>\'
      +'|{cmd}<支付金币/@giveqian>');
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '作为玛法大陆的勇士，\' 
    +'你每天可以去任务特使那里领取一个历练任务，\'
    +'有了这个历练机会，你就可以来我这边进行历练！\');
  end;
end. 