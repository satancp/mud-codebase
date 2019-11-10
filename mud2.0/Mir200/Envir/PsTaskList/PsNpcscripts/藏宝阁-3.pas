  
  
   Procedure _changgui;
begin
   This_Npc.NpcDialog(This_Player,
   '玛法大陆，是一个神秘的国度，勇敢的玛法人一直以自己的聪明\'+
   '才智抵抗着半兽人的侵略，为了保卫自己的家园，提高作战意识。\'+
   '玛法国王听取智者的忠言建设了一个名为藏宝阁的地方，其作用\'+
   '是为了让年轻的勇士们在藏宝阁内磨练心智，提升自身的作战能\'+
   '力。若你也想去试一下的，我可以告诉你在哪儿。\ \'+
   '|{cmd}<能不能介绍一下玩这种游戏的规则/@gamegz>\'+
   '|{cmd}<好的，我现在就想试一下/@gogame>');
end;

Procedure _gogame;
begin
   if This_Player.Level <= 54 then
   begin
      if compareText(This_Player.MapName, '3') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你现在进入的是藏宝阁0号，加油吧！');
         This_Player.RandomFlyTo('EM002');
         
         if This_Player.GetV(111,35) = 1 then
         begin
            if This_Player.SetV(111,35,10) then
            begin
               This_Player.Give('经验',10000);
               This_Player.PlayerNotice('你已经完成了成长之路：探索藏宝阁任务。',2);
               //#This_Player.DeleteTaskFromUIList(1035);
            end;
         end;
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '必须55级以下，方可进入藏宝阁！');
   end;
end;

Procedure _gamegz;
begin
   This_Npc.NpcDialog(This_Player,
   '藏宝阁分为60个房间，而每个房间会有突发事件发生，每个房间\'+
   '里都会有一个守卫，他会要求你给他一定数量的乾坤令，乾坤令\'+
   '可以在商城购买，也可以用灵符在盟重杂货店兑换\'+
   '当你达到守卫的条件，他就会让你掷一个骰子\'+
   '根据1-6的数值使你前进数步到达下个房间。\ \'+
   '|{cmd}<还有呢？/@gamegzno1>');
end;

Procedure _gamegzno1;
begin
   This_Npc.NpcDialog(This_Player,
   '每个房间都将会带给你不同的感受！\'+
   '在“13、23、33、43、53”号房间，骰子的数值会决定你是\'+
   '前进还是后退。\'+
   '而在“10、20、30、40、50”号房间，机关会给一些惊喜。\ \'+
   '|{cmd}<谢谢 ，我明白了/@gamegzno2>');
end;

Procedure _gamegzno2;
begin
   This_Npc.NpcDialog(This_Player,
   '等等！我还没有说完呢，当你第一次进入房间时，你会从 0号房\'+
   '间开始，任何时候，你都可以离开房间或者停止游戏，也可以找\'+
   '我再送你到达上一次你离开的房间，你就可以继续了，当你通过\'+
   '你的才智来到终点60房间的时候，将会得到一次掷 3个骰子的机\'+
   '会，凭借你的运气，将有机会得到玛法大陆失传多年的<屠龙、/c=red>\'+
   '<嗜魂法杖/c=red>，不要小看这3把武器，他们可是当年玛法勇士\'+
   '所梦寐所求的宝贝啊！\ \'+
   '|{cmd}<乾坤令有什么用？/@gamegzno4>');
end;

Procedure _gamegzno4;
begin
   This_Npc.NpcDialog(This_Player,
   '乾坤令，自然是你通往下个房间的凭证，在每个房间的守护怪兽\'+
   '身上就有，你只要打败怪兽后用灵符搜索就会找到乾坤令，对了，\'+
   '乾坤令还能在看守人处直接兑换相应的奖励！\ \'+
   '|{cmd}<好吧！我去试下，看个究竟/@gogame>');
end;



Procedure _jieshaotouli;
begin
   This_Npc.NpcDialog(This_Player,
   '你的消息还挺灵通的，好吧，我就给你介绍下具体属性：\'+
   '斗笠51号：防御0-3        斗笠52号：魔防0-3\'+
   '斗笠53号：攻击0-3        斗笠54号：魔法0-3\'+
   '斗笠55号：道术0-3\ \'+
   '|{cmd}<我这就去试下，看个究竟/@gogame>');
end;
  
  
  
  
  
  
  
  
  
  
  
  
  
   begin
   This_Npc.NpcDialog(This_Player,
   '前方就是充满危险的恶魔之地，我镇守着这个唯一的入口。\' +
   '只要你交给我一个卷轴，我就能带你和你的队伍去斩妖除魔！\' +
   '前路将会异常凶险，如果没有团队的支持，还是不去为好……\ \' +
           
   '|{cmd}<藏宝阁/@changgui>     \ \');
end.