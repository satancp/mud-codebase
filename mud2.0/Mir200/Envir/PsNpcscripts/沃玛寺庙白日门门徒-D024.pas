{
*******************************************************************}

Program Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _newskill;
Begin
   If This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '这里是沃玛教主经常出没的危险之地，你还是早点离开吧！\');
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 8 then
      begin
         This_Npc.NpcDialog(This_Player,
         '对了，如果你在玛法大陆的游历经过白日门的话，\'+
         '麻烦前往白日门书店找我的师叔。嗯，就是那个书店老板，\'+
         '和他说一声，我现在很好，让他不用担心我。');
      end else if  This_Player.GetV(10,1) = 7 then
      begin
         This_Npc.NpcDialog(This_Player,
         '在封魔谷，霸者大厅中有一位从容出没于怪物群中的修理师，\'+
         '曾经指点我一些武术技巧，我因为修行一直没有再见过他，\'+
         '麻烦你带去我的问候，可以吗？');
      end else if  This_Player.GetV(10,1) = 6 then
      begin
          if This_Player.GetBagItemCount('超级金创药') >= 2 then
          begin
             if This_Player.IsCastle then
             begin
                This_Npc.NpcDialog(This_Player,
                '对了，如果你在玛法大陆的游历经过白日门的话，\'+
                '麻烦前往白日门书店找我的师叔。嗯，就是那个书店老板，\'+
                '和他说一声，我现在很好，让他不用担心我。');
                This_Player.SetV(10,1,8);
                This_Player.Take('超级金创药',2); 
             end else
             begin
                This_Npc.NpcDialog(This_Player,
                '谢谢！！我正在为成为一个真正的勇士而努力！\'+
                '在封魔谷，霸者大厅中有一位从容出没于怪物群中的修理师，\'+
                '曾经指点我一些武术技巧，我因为修行一直没有再见过他，\'+
                '麻烦你带去我的问候，可以吗？');
                This_Player.SetV(10,1,7);
                This_Player.Take('超级金创药',2); 
             end;
          end else
          begin
             This_Npc.NpcDialog(This_Player,
             '我正在这里历练，急需药品，\'+
             '如果你有超级金创药，赶紧交给我吧！');
          end;     
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '这里是沃玛教主经常出没的危险之地，你还是早点离开吧！\');
   end;   
end;

//------------------------------------------------------------------------------
//成长任务模块
procedure _mission105;
var 
   BMT105 : integer;
begin
  BMT105 := This_Player.GetV(105,1);
  if BMT105 = 2 then
  begin
    This_NPC.NpcDialog(This_Player,
    '你已经完成了驻守任务，快去向比奇老兵报告一下这里的情况吧。');
  end else if BMT105 = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '哦？你就是那位勇士？合家铺子老板可是向我极力推荐你，'
    +'难得他那样的脾气也会夸奖人！\'
    +'好吧，我现在遇上点棘手的事情，又脱不开身，的确需要勇士帮我！\ \'
    +'|{cmd}<义不容辞，你说吧！/@mission105_2>');
  end else
    This_NPC.CloseDialog(This_Player);
end;

procedure _mission105_2;
var 
   BMT105 : integer;
begin
  BMT105 := This_Player.GetV(105,1);
  if BMT105 >= 2 then
  begin
     Exit;
  end else if BMT105 = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '兽人们的计划你已经知道了吧！沃玛寺庙二层是它们出入的必经通道。\'
    +'我现在要你去那里<驻守10分钟/c=red>，你要尽力消灭他们，以引起骚乱，\'
    +'然后我才能在这里开展我的破坏工作。\'
    +'任务成功完成后，向比奇老兵报告。\'
    +'（任务目标：在沃玛寺庙二层驻守10分钟，时间到你会被送回比奇城）\ \'
    +'|{cmd}<好的，请送我过去吧/@mission105_start>');
  end
  else
    exit;
end;

procedure mission105_callout;
begin
  if (This_Player.GetV(105,1) = 1) and (CompareText(This_Player.MapName, 'D023') = 0) then
  begin
    This_Player.Flyto('0',333,273);
    This_Player.SetV(105,1,2);
    This_Player.UpdateTaskDetail(105,1);
    This_Player.PlayerDialog('你已经完成任务，赶快先向<比奇老兵/c=red>汇报吧！'); 
  end
  ELSE
  exit; 
end;

procedure _mission105_start;
begin
  if This_Player.GetV(105,1) = 1 then
  begin
    This_Player.RandomFlyTo('D023');
    This_Player.CallOut(This_NPC,600,'mission105_callout');
    This_Player.LeftTime('你在沃玛寺庙二层驻守的时间还剩余：',0,600);
  end
  else
  exit;
end;

procedure _mission105_3;
begin
  if This_Player.GetV(105,1) = 3 then
  begin
    This_Player.SetV(105,1,4);
    This_Player.UpdateTaskDetail(105,1);
    This_Player.SetV(105,2,0);
    This_Npc.NpcDialog(This_Player,
    '哎，让老兵费心了！可是我已经伤重了，勇士你快走吧！\'
    +'祭坛被破坏，这里的兽人们已经发狂了，再不走就迟了！\ \'
    +'|{cmd}<不行，我一定要带你出去！/@doexit>（任务目标：消灭沃玛勇士3只）');
  end
  else
  exit;
end;

procedure _mission105_1_5_fns;
begin
  if This_Player.GetV(105,1) = 5 then
  begin
    This_Player.Give('经验',200000);
    This_Player.SetV(105,1,6);
    This_Player.UpdateTaskDetail(105,1);
    This_Player.SetV(105,3,0);
    This_Npc.NpcDialog(This_Player,
    '沃玛战将冲上来了！勇士当心！\'
    +'（任务目标：消灭沃玛战将3只）\ \'
    +'|{cmd}<门徒你自己小心，它们我来对付！/@doexit>'
    ); 
  end
  else
  exit;
end;

procedure _mission105_1_6_fns;
begin
  if This_Player.GetV(105,1) = 7 then
  begin
    This_Player.Give('经验',200000);
    This_Player.SetV(105,1,8);
    This_Player.UpdateTaskDetail(105,1);
    This_Player.SetV(105,4,0);
    This_Npc.NpcDialog(This_Player,
    '是火焰沃玛，勇士小心！\'
    +'（任务目标：消灭火焰沃玛3只）\ \'
    +'|{cmd}<门徒你自己小心，它们我来对付！/@doexit>'
    ); 
  end
  else
  exit;
end;

procedure _mission105_1_7_fns;
begin
  if This_Player.GetV(105,1) = 9 then
  begin
    This_Player.Give('经验',200000);
    This_Player.SetV(105,1,10);
    This_Player.UpdateTaskDetail(105,1);
    This_Npc.NpcDialog(This_Player,
    '我已经不行了！勇士，你快走吧！\'
    +'这是白日门的信物，我恳请勇士帮我带回白日门\'
    +'……谢……谢……\ \'
    +'|{cmd}<门徒，门徒……我保证帮你把信物送还！/@mission106>\ \'
    +'（任务目标：将白日门信物交给白日门的天尊）\'
    +'（白日门的前往方法可询问彩虹精灵）'
    ); 
  end
  else
  exit;
end;

procedure _mission106;
begin
  if This_Player.GetV(105,1) = 10 then
  begin
    //This_Player.AutogotoMap('11',225,270);
    This_NPC.CloseDialog(This_Player);
  end
  else
  exit;
end;  
//------------------------------------------------------------------------------
var
  MT105 : integer;
Begin
  MT105 := This_Player.GetV(105,1);
  if MT105 = 10 then
  begin
    //This_Npc.NpcDialog(This_Player,
    //'这是白日门的信物，我恳请勇士帮我带回白日门\'
    //+'……谢……谢……\ \'
    //+'|{cmd}<门徒，门徒……我保证帮你把信物送还！/@mission106>\ \'
    //+'|{cmd}<听说你需要药品补给，这是两包超级金创药/@newskill>');
    This_Npc.NpcDialog(This_Player,
    '这是白日门的信物，我恳请勇士先将它收藏在身边。\'+
    '等<时机成熟/c=red>了请你再把信物送还……\'+ 
    '……谢……谢……\ \'
    //+'|{cmd}<成长任务：好的，我终于可以休息一下了！/@doexit>\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end else if ( MT105 = 8 ) or ( MT105 = 9 )then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经消灭了火焰沃玛了？\'
    +'（任务目标：消灭火焰沃玛3只）\ \'
    //+'|{cmd}<成长任务：我已经消灭了3只火焰沃玛/@mission105_1_7_fns>\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end else if ( MT105 = 6 ) or ( MT105 = 7 ) then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经消灭了沃玛战将了？\'
    +'（任务目标：消灭沃玛战将3只）\ \'
    //+'|{cmd}<成长任务：我已经消灭了3只沃玛战将/@mission105_1_6_fns>\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end else if ( MT105 = 4 ) or ( MT105 = 5 ) then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经消灭了沃玛勇士了？\'
    +'（任务目标：消灭沃玛勇士3只）\ \'
    //+'|{cmd}<成长任务：我已经消灭了3只沃玛勇士/@mission105_1_5_fns>\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end else if MT105 = 3 then
  begin
    This_Npc.NpcDialog(This_Player,
    '勇士，你怎么又回来了？\ \'
    //+'|{cmd}<成长任务：老兵和我都不放心你。他让我一定要保证你的安全！/@mission105_3>\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end else if MT105 = 2 then
  begin
    This_NPC.NpcDialog(This_Player,
    '你已经完成了驻守任务，快去向比奇老兵报告一下这里的情况吧。\ \'
    //+'|{cmd}<成长任务：好的，我这就去/@DoExit>\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end else if MT105 = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你是什么人？怎么会在这里？这里很危险，赶紧离开吧！\ \'
    //+'|{cmd}<成长任务：是合家铺子老板让我过来了。/@mission105>\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end else
  begin
    This_Npc.NpcDialog(This_Player,
    '你要干什么？\ \'
    //'|{cmd}<日常任务：听说你需要药品补给，这是两包超级金创药/@newskill>'
    );
  end;
end.