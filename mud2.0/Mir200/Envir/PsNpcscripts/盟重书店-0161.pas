
program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
   {$IFDEF Q136_hero}
   This_Npc.NpcDialog(This_Player,
      '感谢，你想买些修炼的书吗？\ \'
      +'|{cmd}<买书/@buy>  \'
      +'|{cmd}<卖书/@sell>   \'
      +'|{cmd}<询问各种武技的细节/@helpbooks> \ \'
      );
   {$ELSE}
   if This_Player.Level >= 40 then
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢，你想买些修炼的书吗？\ \'
      +'|{cmd}<买书/@buy>  \'
      +'|{cmd}<卖书/@sell>  ' + addSpace('', 24) //+ '|{cmd}<打听酒气护体/@drink>\'
      +'|{cmd}<询问各种武技的细节/@helpbooks> \ \'
    +'|{cmd}<有关英雄圣水/@shengshui>             ^<技能书兑换/@changebook>\'
      );
   end
   else
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢，你想买些修炼的书吗？\ \'
      +'|{cmd}<买书/@buy>  \'
      +'|{cmd}<卖书/@sell>   \'
      +'|{cmd}<询问各种武技的细节/@helpbooks> \ \'
    +'|{cmd}<有关英雄圣水/@shengshui>             ^<技能书兑换/@changebook>\'
      );
   end;
   {$ENDIF}
end;

Procedure _HeJiSLDu;
var
  ret : Integer;
begin
   {$IFDEF Q136_hero}
  exit;
  {$ELSE}
   ret := This_Player.ChkIfCanAddUSExp;
   if (ret = 0) then
   begin
      This_Npc.NpcDialog(This_Player,
      '看来你在修炼合击的过程中遇到了麻烦。\'+
      '我想我能够帮助你快速提升你的合击熟练度。\'+
      '只要你给我1灵符或限时灵符以及5000点怒气值，\'+
      '我能够立刻为你或你的提升50点合击熟练度，如何？\ \'+
      '|{cmd}<请帮助提升合击熟练度/@TiHeJii>\ \'+
      '|{cmd}<返回/@main>');
   end else if ret < 0 then
   begin
      case ret of
        -1:  This_NPC.NpcDialog(This_Player,
             '您没有招出英雄，请招出再提升合击熟练度。');
             
        -2:  This_NPC.NpcDialog(This_Player,
             '您的没有习得合击，无法提升合击熟练度。');
             
        -3:  This_NPC.NpcDialog(This_Player,
             '请为您的装备火龙之心，否则无法快速提升合击熟练度。'); 
      end;
   end;
   {$ENDIF}
end;

Procedure _TiHeJii;
var
  ret : Integer;
  error: string; 
begin
  {$IFDEF Q136_hero}
  exit;
  {$ELSE}
   ret := This_Player.AddUSExp(1, 5000, 50);
   if ret >= 0 then
   begin
     This_Npc.NpcDialog(This_Player,
      '您确定使用1灵符或限时灵符，并消耗5000怒气值，\提升合击熟练度吗？\ \'+
      '|{cmd}<继续提升熟练度/@TiHeJii>\ \'+
      '|{cmd}<返回/@main>');
   end else  
   begin
      case ret of
        -1: error := '您没有招出英雄，请招出再提升合击熟练度。';
        -2: error := '您的没有习得合击，无法提升合击熟练度。';
        -3: error := '请为您的装备火龙之心，否则无法快速提升合击熟练度。';
        -4: error := '您没有足够的灵符或限时灵符，无法快速提升合击熟练度。';
        -5: error := '您没有足够的怒气值，无法快速提升合击熟练度。';
        -6: error := '您的合击熟练度已到达当前合击等级的上限，无法继续提升。';
      end;
      error := error + '\|{cmd}<返回/@HeJiSLDu>';
      This_NPC.NpcDialog(This_Player,error);
   end;
   {$ENDIF}
end;

Procedure _LianJJDu;
begin
   This_Npc.NpcDialog(This_Player,
   '看来你在修炼连击的过程中遇到了麻烦。\'+
   '我想我能够帮助你快速提升你的连击熟练度。\'+
   '只要你给我1灵符或限时灵符，\'+
   //'我能够立刻为你或你的提升50点连击熟练度，如何？\ \'+
   '我能够立刻为你提升50点连击熟练度，如何？\ \'+
   //'|{cmd}<请帮助提升连击熟练度/@TiWoDe>         ^<请帮我的提升连击熟练度/@TiTaDe>\ \'+
   //'|{cmd}<请帮助提升连击熟练度/@TiWoDe>\ \'+
   '|{cmd}<返回/@main>');
end;



Procedure _LJHeroSK(skillName: string);
begin
   This_NPC.NpcDialog(This_Player,
   '您确定使用1灵符或限时灵符\提升连击招式' + skillName + '50点熟练度吗？\ \'+
   '|{cmd}<使用灵符提升熟练度/@QDLJHeroSK~' + skillName + '>\ \'+
   '|{cmd}<返回/@LianJJDu>'); 
end;

//主号连击技 
Procedure _TiWoDe;
var
  rLJTem : integer;
begin
   rLJTem := This_Player.Job;
   if rLJTem = 0 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您想使用灵符或限时灵符提升哪个连击招式的熟练度？\ \'+
      '1灵符=50点熟练度\ \'+
      '|{cmd}<三绝杀/@LJSkill~三绝杀>         ^<追心刺/@LJSkill~追心刺>         ^<断岳斩/@LJSkill~断岳斩>         ^<横扫千军/@LJSkill~横扫千军>\ \'+
      '|{cmd}<返回/@LianJJDu>');
   end else if rLJTem = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您想使用灵符或限时灵符提升哪个连击招式的熟练度？\ \'+
      '1灵符=50点熟练度\ \'+
      '|{cmd}<双龙破/@LJSkill~双龙破>         ^<凤舞祭/@LJSkill~凤舞祭>         ^<惊雷爆/@LJSkill~惊雷爆>         ^<冰天雪地/@LJSkill~冰天雪地>\ \'+
      '|{cmd}<返回/@LianJJDu>');
   end else if rLJTem = 2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您想使用灵符或限时灵符提升哪个连击招式的熟练度？\ \'+
      '1灵符=50点熟练度\ \'+
      '|{cmd}<虎啸诀/@LJSkill~虎啸诀>         ^<八卦掌/@LJSkill~八卦掌>         ^<三焰咒/@LJSkill~三焰咒>         ^<万剑归宗/@LJSkill~万剑归宗>\ \'+
      '|{cmd}<返回/@LianJJDu>');
   end;
end;

Procedure _QDLJSkill(skillName: string);
begin       
   {$IFDEF Q135_neigong}
   exit;
   {$ELSE}
 {  if This_Player.MyLFnum < 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '您的灵符数量不足，无法提升连击招式熟练度……\ \'+
      '|<返回/@main>');
   end else if This_Player.HaveStudySSKSkill(skillName, false) then
   begin                           
      if This_Player.AddSSKSkillExp(skillName, 50, false) then
      begin
         This_Player.DecLF(30002, 1, false);
         This_NPC.NpcDialog(This_Player,
         '您确定继续使用1灵符或限时灵符\提升连击招式' + skillName + '50点熟练度吗？\ \'+
         '|<继续使用灵符提升熟练度/@QDLJSkill~' + skillName + '>\ \'+
         '|<返回/@LianJJDu>');
      end else
         This_NPC.NpcDialog(This_Player,
         '该技能的熟练度已满，无法继续提升。');
   end    
   else
   begin
      This_NPC.NpcDialog(This_Player,
      '您还没有学会' + skillName + '，无法提升该技能的熟练度。' );
   end; 
    }
   {$ENDIF}
end;

Procedure _LJSkill(skillName: string);
begin
   This_NPC.NpcDialog(This_Player,
   '您确定使用1灵符或限时灵符提升连击招式' + skillName + '50点熟练度吗？\ \'+
   '|{cmd}<使用灵符提升熟练度/@QDLJSkill~' + skillName + '>\ \'+
   '|{cmd}<返回/@LianJJDu>'); 
end;

procedure _changebook;
begin
   This_Npc.NpcDialog(This_Player,
   '现在你可以使用你手中拥有的一本古战技秘籍，\来我这里交换任意一本其他的古战技秘籍。\你想使用哪本古技能秘籍来进行交换呢？\ \'
   +'|{cmd}<逐日剑法/@changebook1>             ^<噬血术/@changebook2>             ^<流星火雨/@changebook3>\ \'
   +'|{cmd}<白日门逐日/@changebook4>           ^<白日门噬血术/@changebook5>       ^<白日门火雨/@changebook6>\ \');
end;

procedure _changebook1;
begin
  if This_Player.GetBagItemCount('逐日剑法') >= 1 then
  begin 
    This_Npc.NpcDialog(This_Player,
    '你想把逐日剑法换成哪本古战技秘籍呢？\ \'
    +'|{cmd}<噬血术/@changebook1_1>             ^<流星火雨/@changebook1_2>\ \'
    +'|{cmd}<白日门逐日/@changebook1_3>         ^<白日门噬血术/@changebook1_4>       ^<白日门火雨/@changebook1_5>\ \'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你有逐日剑法，就赶快拿出来吧，\我可以换成其它古战技秘籍。');
  end;
end;

procedure _changebook2;
begin
  if This_Player.GetBagItemCount('噬血术') >= 1 then
  begin 
    This_Npc.NpcDialog(This_Player,
    '你想把噬血术换成哪本古战技秘籍呢？\ \'
    +'|{cmd}<逐日剑法/@changebook2_1>             ^<流星火雨/@changebook2_2>\ \'
    +'|{cmd}<白日门逐日/@changebook2_3>           ^<白日门噬血术/@changebook2_4>       ^<白日门火雨/@changebook2_5>\ \'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你有噬血术，就赶快拿出来吧，\我可以换成其它古战技秘籍。');
  end;
end;

procedure _changebook3;
begin
  if This_Player.GetBagItemCount('流星火雨') >= 1 then
  begin 
    This_Npc.NpcDialog(This_Player,
    '你想把流星火雨换成哪本古战技秘籍呢？\ \'
    +'|{cmd}<逐日剑法/@changebook3_1>             ^<噬血术/@changebook3_2>\ \'
    +'|{cmd}<白日门逐日/@changebook3_3>           ^<白日门噬血术/@changebook3_4>       ^<白日门火雨/@changebook3_5>\ \'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你有流星火雨，就赶快拿出来吧，\我可以换成其它古战技秘籍。');
  end;
end;

procedure _changebook4;
begin
  if This_Player.GetBagItemCount('白日门逐日') >= 1 then
  begin 
    This_Npc.NpcDialog(This_Player,
    '你想把白日门逐日换成哪本古战技秘籍呢？\ \'
    +'|{cmd}<逐日剑法/@changebook4_1>             ^<噬血术/@changebook4_2>             ^<流星火雨/@changebook4_3>\ \'
    +'|{cmd}<白日门噬血术/@changebook4_4>         ^<白日门火雨/@changebook4_5>\ \'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你有白日门逐日，就赶快拿出来吧，\我可以换成其它古战技秘籍。');
  end;
end;

procedure _changebook5;
begin
  if This_Player.GetBagItemCount('白日门噬血术') >= 1 then
  begin 
    This_Npc.NpcDialog(This_Player,
    '你想把白日门噬血术换成哪本古战技秘籍呢？\ \'
    +'|{cmd}<逐日剑法/@changebook5_1>             ^<噬血术/@changebook5_2>             ^<流星火雨/@changebook5_3>\ \'
    +'|{cmd}<白日门逐日/@changebook5_4>           ^<白日门火雨/@changebook5_5>\ \'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你有白日门噬血术，就赶快拿出来吧，\我可以换成其它古战技秘籍。');
  end;
end;

procedure _changebook6;
begin
  if This_Player.GetBagItemCount('白日门火雨') >= 1 then
  begin 
    This_Npc.NpcDialog(This_Player,
    '你想把白日门火雨换成哪本古战技秘籍呢？\ \'
    +'|{cmd}<逐日剑法/@changebook6_1>             ^<噬血术/@changebook6_2>             ^<流星火雨/@changebook6_3>\ \'
    +'|{cmd}<白日门逐日/@changebook6_4>           ^<白日门噬血术/@changebook6_5>\ \'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你有白日门火雨，就赶快拿出来吧，\我可以换成其它古战技秘籍。');
  end;
end;

procedure ExchangeBook(item_src: string; item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 1 then
  begin
    This_Player.Take(item_src,1);
    This_Player.BindGive(item_des,1);
    This_Npc.NpcDialog(This_Player,
    '技能书已经放入你的包裹，赶快打开看看吧！');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你带来了你所说的技能书，就赶快交给我吧！');
  end;
end;

procedure _changebook1_1;
begin
  ExchangeBook('逐日剑法','噬血术');
end;

procedure _changebook1_2;
begin
  ExchangeBook('逐日剑法','流星火雨');
end;

procedure _changebook1_3;
begin
  ExchangeBook('逐日剑法','白日门逐日');
end;

procedure _changebook1_4;
begin
  ExchangeBook('逐日剑法','白日门噬血术');
end; 

procedure _changebook1_5;
begin
  ExchangeBook('逐日剑法','白日门火雨');
end;

procedure _changebook2_1;
begin
  ExchangeBook('噬血术','逐日剑法');
end;

procedure _changebook2_2;
begin
  ExchangeBook('噬血术','流星火雨');
end;

procedure _changebook2_3;
begin
  ExchangeBook('噬血术','白日门逐日');
end;

procedure _changebook2_4;
begin
  ExchangeBook('噬血术','白日门噬血术');
end; 

procedure _changebook2_5;
begin
  ExchangeBook('噬血术','白日门火雨');
end;

procedure _changebook3_1;
begin
  ExchangeBook('流星火雨','逐日剑法');
end;

procedure _changebook3_2;
begin
  ExchangeBook('流星火雨','噬血术');
end;

procedure _changebook3_3;
begin
  ExchangeBook('流星火雨','白日门逐日');
end;

procedure _changebook3_4;
begin
  ExchangeBook('流星火雨','白日门噬血术');
end; 

procedure _changebook3_5;
begin
  ExchangeBook('流星火雨','白日门火雨');
end;

procedure _changebook4_1;
begin
  ExchangeBook('白日门逐日','逐日剑法');
end;

procedure _changebook4_2;
begin
  ExchangeBook('白日门逐日','噬血术');
end;

procedure _changebook4_3;
begin
  ExchangeBook('白日门逐日','流星火雨');
end;

procedure _changebook4_4;
begin
  ExchangeBook('白日门逐日','白日门噬血术');
end; 

procedure _changebook4_5;
begin
  ExchangeBook('白日门逐日','白日门火雨');
end;

procedure _changebook5_1;
begin
  ExchangeBook('白日门噬血术','逐日剑法');
end;

procedure _changebook5_2;
begin
  ExchangeBook('白日门噬血术','噬血术');
end;

procedure _changebook5_3;
begin
  ExchangeBook('白日门噬血术','流星火雨');
end;

procedure _changebook5_4;
begin
  ExchangeBook('白日门噬血术','白日门逐日');
end; 

procedure _changebook5_5;
begin
  ExchangeBook('白日门噬血术','白日门火雨');
end;

procedure _changebook6_1;
begin
  ExchangeBook('白日门火雨','逐日剑法');
end;

procedure _changebook6_2;
begin
  ExchangeBook('白日门火雨','噬血术');
end;

procedure _changebook6_3;
begin
  ExchangeBook('白日门火雨','流星火雨');
end;

procedure _changebook6_4;
begin
  ExchangeBook('白日门火雨','白日门逐日');
end; 

procedure _changebook6_5;
begin
  ExchangeBook('白日门火雨','白日门噬血术');
end;

procedure _lookfor1;
begin
   This_Npc.NpcDialog(This_Player,
   '国王想奖赏老兵这些年来为玛法所做的贡献。\'+
   '但老兵不愿意接受，你愿意帮忙收集大家的签字吗？\'+
   '有了大家的签字，老兵就可以安心领受国王的奖励。\ \'+
   '|{cmd}<好的，我这就去，请告诉我先去找谁吧/@lookfor>\'+
   '|{cmd}<找不到签名的人了，我不干了/@restart>\');
end;

Procedure _restart;
begin
   This_Npc.NpcDialog(This_Player,
   '年轻人，凡事有始有终才能获得上天眷顾\'+
   '哎……你确定要放弃吗？\ \'+
   '|{cmd}<是的/@restart1>                   ^<返回/@main>');  
end;

Procedure _restart1;
Var 
i : integer;
begin
   This_Player.Take('玛法见证',1);
   for i := 1 to 21 do
   begin      
      This_Player.SetV(13,i,0);
   end;
   This_Npc.NpcDialog(This_Player,
   '你已经放弃了一次让玛法人民感谢你的机会！\'+
   '如果你想通了，可以再回来找我！');  
end;

Procedure FindPeople;
var
r : integer;
begin
   r := random(3);
   if r = 2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着玛法见证，先去找一下白日门<天尊>，\'+
      '他就在白日门，通常他都在中间的空地上晒太阳。\');
      This_Player.SetV(13,1,1);
      This_Player.Give('玛法见证',1);
   end else if r = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着玛法见证，先去找一下<边界村小店老板>，\'+
      '不用我多说了，边界村你应该知道在哪儿吧。\');
      This_Player.SetV(13,1,2);
      This_Player.Give('玛法见证',1);
   end else if r = 0 then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着你玛法见证，去找一下比奇<海边老兵>，\'+
      '你知道他在哪儿吗？\'+ 
      '在比奇郊外西南方的一个小木屋那，你能找到他。\');
      This_Player.SetV(13,1,3);
      This_Player.Give('玛法见证',1);
   end;
end;


procedure _lookfor;
begin
   if (This_Player.GetV(13,1) = 12) or (This_Player.GetV(13,1) = 13) then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着你的玛法见证，去找一下\'+
      '|{cmd}<比奇或者盟重的老兵>，他们会给你英雄圣水的！\ \'+
      '|{cmd}<离开/@doexit>');
   end else if (This_Player.GetV(13,1) = 4) or (This_Player.GetV(13,1) = 6) or (This_Player.GetV(13,1) = 8)  then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着你的玛法见证，去找一下沙巴克的<屠夫>，\'+
      '不用我多说了，沙巴克你应该知道在哪儿吧？\ \'+
      '|{cmd}<离开/@doexit>');
   end else if (This_Player.GetV(13,1) = 5) or (This_Player.GetV(13,1) = 7) or (This_Player.GetV(13,1) = 9)  then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着你的玛法见证，去找一下苍月岛的<天虹法师>，\'+ 
      '不用我多说了，苍月岛你应该知道在哪儿吧？\ \'+
      '|{cmd}<离开/@doexit>');
   end else if This_Player.GetV(13,1) = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着玛法见证，先去找一下白日门<天尊>，\'+
      '他就在白日门，通常他都在中间的空地上晒太阳。\ \'+
      '|{cmd}<离开/@doexit>');
   end else if This_Player.GetV(13,1) = 2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着玛法见证，先去找一下<边界村小店老板>，\'+
      '不用我多说了，边界村你应该知道在哪里吧？\ \'+
      '|{cmd}<离开/@doexit>');
   end else if This_Player.GetV(13,1) = 3 then
   begin
      This_Npc.NpcDialog(This_Player,
      '拿着你的玛法见证，去找一下比奇<海边老兵>，\'+
      '你知道他在哪儿吗？\'+
      '在比奇郊外西南方的一个小木屋那，你能找到他。\ \'+
      '|{cmd}<离开/@doexit>');
   end else if (This_Player.GetV(13,2) >= 1) or (This_Player.GetV(13,6) >= 1) or (This_Player.GetV(13,10) >= 1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '我不是已经给了你一个<玛法见证>了吗？\'+ 
      '你再好好找找，找到了快去找人签名吧。\ \'+
      '|{cmd}<离开/@doexit>');
   end else
   begin
      FindPeople;
   end;  
end;


//英雄圣水任务开始； 
Procedure _shengshui;
begin
   This_Npc.NpcDialog(This_Player,
   '英雄圣水？你的意思是...？\ \'+
   '|{cmd}<领取玛法见证/@lookfor1>\'+
   '|{cmd}<使用英雄圣水/@xiyangtear1>\');
end;

Procedure _xiyangtear1;
begin
   This_Npc.NpcDialog(This_Player,
   '据说老兵有些神奇的药剂叫“英雄圣水”，\'+
   '如果你把签名过的“玛法见证”给老兵，他会送你些“英雄圣水”，\'+
   '这英雄圣水能够提升的技能经验，可是好东西哦。\'+
   '英雄圣水虽然能喝，但想必你不会奢侈得用来解渴吧，\'+
   '拿来给我，我会帮你用英雄圣水提升的技能经验。\ \'+
   '|{cmd}<我有英雄圣水，帮我提升技能经验吧/@xiyangtear>\'+
   '|{cmd}<返回/@shengshui>');
end;
  
procedure _UgHeroSkill(idStr: string);
var
  //= (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,35,36,37,39,43);           
  id : Integer;
begin
  {$IFDEF Q136_hero}
  exit;
  {$ELSE}
  if This_Player.HeroLevel = -1 then     //没有或者未召唤出来！ 
  begin
     This_Npc.NpcDialog(This_Player,
     '你没有带领英雄，不能增加技能经验！');
  end else if This_Player.HeroLevel >= 0 then
  begin
     id := StrToIntDef(idStr, -1); 
     if (id >= 1) and ((id <= 33) or (id = 35) or (id =36) or (id = 37) or (id = 39) or (id = 43)) then
     begin
        if This_Player.GetBagItemCount('英雄圣水') >= 1 then
        begin
           This_Player.Take('英雄圣水',1); 
           This_Player.UpGradeHeroSkill(id, 100);
        end else
        begin
           This_Npc.NpcDialog(This_Player,
           '你没有英雄圣水，怎么提升技能呢？');
        end;
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '不能使用英雄圣水提升该技能！');
     end;     
  end;
  {$ENDIF}
end;

Procedure _xiyangtear;
begin
  {$IFDEF Q136_hero}
  exit;
  {$ELSE}
   if This_Player.HaveValidHero then
   begin
      if This_Player.GetBagItemCount('英雄圣水') >= 1 then
      begin
         if This_Player.HeroLevel = -1 then
         begin
            This_Npc.NpcDialog(This_Player,
            '你必须召唤出你的才能使用英雄圣水增加技能经验！');
         end else if This_Player.HeroLevel >= 0 then
         begin
            This_NPC.NpcDialog(This_Player,
            '您的当前可以获得技能经验的技能为：\'+ 
            This_Player.GetHeroSkillStr);
         end;
      end else 
      begin
         This_Npc.NpcDialog(This_Player,
         '你没有英雄圣水，怎么提升技能呢？');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你要我帮你加技能经验，那你的呢？\'+
      '你的在哪啊？');
   end;
  {$ENDIF} 
end;

 
procedure _drink;
begin
  This_Npc.NpcDialog(This_Player,
  '当年为了抵抗半兽人的侵略，玛法人从遥远的东方请来了一名术士，\研制出一种特殊技能，这种特殊技能的作用在于修炼后将会在人体\本身产生一种隐性的能量，而它的神奇之处在于，当处于醉酒状态\时能够增强人体的体力，加强战斗力。随着历史的推延，玛法人早\就忘记了这个技能的真正作用，年轻的勇士，如果你能完成我的考\验，从现在开始提升2000万经验的话，就可以来我这里学习这套流\传多年的“酒气护体”！\'
  +'|{cmd}<好的，我现在就去/@drinkskill>'+ addSpace('', 18) + '|{cmd}<我已经完成了/@finishskill>\'
  +'|{cmd}<酒气护体介绍/@jieshao>'+ addSpace('', 22) + '|{cmd}<我很忙，下次再说吧！/@doexit>'
  );
end;


{
    //开始学习酒气护体技能
    //返回值：-1 表示 人物级别不足40                                 @drinkskill_level
    //        -2 表示 酒气护体已经学好                               @drinkskill_finish
    //         0 表示 成功学习酒气护体                               @drinkskill_OK
    //        >0 表示 当前酒气护体技能累计的经验值(使用时需要减1)    @drinkskill_accepted
    function StartWineExpQuest(Player: TPlayer): Integer;
}
Procedure _drinkskill;
var
S2 : integer;
S3 : string;
begin
   {$IFDEF Q136_hero}
  exit;
  {$ELSE}
 {  S2 :=  This_Npc.StartWineExpQuest(This_Player);
   if S2 = -1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '只有你的级别达到40级，才可以修习“酒气护体”，\'+
      '还是等你到了40级以后再来找我吧！');
   end else if S2 = -2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '嗯？我已经把“酒气护体”的诀窍传授给你了啊！');
   end else if S2 > 0 then
   begin
      S3 := IntToStr(This_Player.MyExpQuestValue-1);
      This_Npc.NpcDialog(This_Player,
      '你已经接受了我提出的考验了啊，已经累计了'+S3+'点经验\');
   end else if S2 = 0  then
   begin
      This_Npc.NpcDialog(This_Player,
      '你现在就可以去提升2000万经验了，\'+
      '只要你累积达到这些经验，再到我这里来，\'+
      '我就把“酒气护体”的诀窍交给你！');
   end; 
    }
   {$ENDIF}
end;

{
    //学成酒气护体技能
    //返回值：  -1 表示 已经炼成了酒气护体        @finishskill_learned
    //          -2 表示 还没学习酒气护体技能      @noskillquest
    //          -3 表示 累计经验还不够            @DrinkSkill_Fail
    //           1 表示 累计经验已满，可以成功学习酒气护体    @finishskill_OK
    function EndWineExpQuest(Player: TPlayer): Integer;
}
Procedure _finishskill;
var
S1 : integer;
S4 : string;
begin
   {$IFDEF Q136_hero}
  exit;
  {$ELSE}
  { S1 := This_Npc.EndWineExpQuest(This_Player);
   if S1 = -1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经修习了“酒气护体”！');
   end else if S1 = -2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你还没接受我提出的考验。');
   end else if S1 = -3 then
   begin
      S4 := IntToStr(This_Player.MyExpQuestValue-1);
      This_Npc.NpcDialog(This_Player,
      '嗯？好像你还没有完成我给你的考验啊，你只累计了'+S4+'点经验，\'+
      '你还没提升2000万经验，勇士，继续努力吧！ \');
   end else if S1 = 1  then
   begin
      This_Npc.NpcDialog(This_Player,
      '没想到你那么快就完成了我的考验，不愧是玛法大陆的杰出勇士，\'+
      '这套“酒气护体”蕴藏着无穷的力量，\'+
      '它将会在人体本身产生一种隐性的能量，而它的神奇之处在于，\'+
      '当处于醉酒状态时能够增强人体的体力，加强战斗力。\'+
      '请按F11打开技能栏查看，当技能等级超过1级之后，\'+
      '你将可以使用这个技能。\ \'+
      '|<好的，我自己参研一下/@doexit>');
   end; 
    }
   {$ENDIF}
end;

procedure _jieshao;
begin
  This_Npc.NpcDialog(This_Player,
  '当你学习完“酒气护体”后，技能的等级是0级，\必须通过经验累积让“酒气护体”获得升级。技能等级每提升1级，\你的生命值上限就会增加1点。另外不要忘记学习完后\设置快捷键F1-F8哦！不然你是没有办法使用这个技能的。\ \'
  +'|{cmd}<好的，我知道了/@doexit>\ \'
  +'|{cmd}<返回/@drink>'
  );
end;

procedure _newskill;
begin
  This_Npc.NpcDialog(This_Player,
  '新技能，你是指…？\ \'
  +'|{cmd}<快说吧，我想知道古战技的秘密/@newskill1>'+ addSpace('', 8) + '|{cmd}<我想请你解读古籍残片/@newskill2>\'
  +'|{cmd}<我想了解一下魔法师的四级魔法盾/@magicdef>\'
  +'|{cmd}<没事/@doexit>'
  );
end;

procedure _newskill1;
begin
  This_Npc.NpcDialog(This_Player,
  '嗯，看来在勇士们之间，任何事情都会传播得很快呀。\是这样的，前几天，酒神他老人家游历到酒馆，顺便来看了看我，\告诉我说他又见到了那种令人生畏的力量----三龙卫曾使用过的，\古武术中的战技。要知道...那些战技早就已经失传了，\我当时第一反应是问他：你确信没有看错吗？\ \'
  +'|{cmd}<酒神怎么说？/@newskill12>'
  );
end;

procedure _newskill12;
begin
  This_Npc.NpcDialog(This_Player,
  '“我是喜欢酒，可是也没到老眼昏花，连这个都看错的时候吧!”\他这样讲，那我只好认为他说的都是真的了。\“你不相信是吗？你看这个。”他还交给我一方碎布，上面...\上面真的是当年的古文字，而且，看来应该是与武术相关的东西，\由不得我不相信了。\ \'
  +'|{cmd}<那古武术是为何失传了呢？/@newskill13>'
  );
end;

procedure  _newskill13;
begin
  This_Npc.NpcDialog(This_Player,
  '那些技巧强大而纷繁，当年无数勇士醉心于其中无法自拔，\但是正因为其力量之猛，在未有熟练运用之前，有许多人都因为\错误地运用力量而导致自身元气大损。最初悟出这些战技的\三龙卫，也没有想到出现这样悲剧的结果。于是，他们觉得，\不应该再将之流传开去，而是有选择性地让最强大、\而又心志无比坚定的人来学习。\ \'
  +'|{cmd}<那么后来.../@newskill14>'
  );
end;

procedure _newskill14;
begin
  This_Npc.NpcDialog(This_Player,
  '由于掌握的难度确实非常之高，所以...当雪山之役后，\没有了三龙卫的亲传，掌握的人也越来越少了，\渐渐地就在武者们的追寻中淡去。但是有关古武术的传说，\一直传了下来，虽然，平时很少有人提及。\也许，这也正是一个契机，\当与半兽人的战争越来越不可避免的时候...\ \'
  +'|{cmd}<你的意思是...我也可以试着学习吗？/@newskill15>'
  );
end;

procedure _newskill15;
begin
  This_Npc.NpcDialog(This_Player,
  '嗯...我想应该是的，不仅是你，你的战斗伙伴也在可以\试着学习并掌握强大的古战技。\如果我猜得没错，酒神给我的那方布，可能就是前人们留下的古武术\技巧的残片了。\ \'
  +'|{cmd}<酒神有提到古籍残片的来历吗？/@newskill16>'
  );
end;

procedure _newskill16;
begin
  This_Npc.NpcDialog(This_Player,
  '他隐约地透露过，不过却没有说详细的内容。\据我所知，酒馆里的鉴宝散人见多识广，但是好像\需要有人帮一下他的忙，不过每人每天只有一次机会。\如果你肯帮他，应该有可能有一些收获。\还有一种方法就是找我边上这个怪人打听了，\他口口声声说通过他的考验就可以。\ \'
  +'|{cmd}<好的，我知道了/@doexit>'+ addSpace('', 16) + '|{cmd}<返回/@newskill>'
  );
end;

procedure _newskill2;
begin
  This_Npc.NpcDialog(This_Player,
  '你已经知道古武术的事情了吧，为了学习你对应职业的新技能，\我可以帮你解读你得到的古籍残片，以得到<古籍残片(大)/c=red>。\1个<古籍残片(大)/c=red>由5个<古籍残片(中)/c=red>拼接得到，\而1页<古籍残片(中)/c=red>则需要我解读10个<古籍残片(小)/c=red>才行。\ \'
  +'|{cmd}<解读古籍残片(小)/@newskill21>' + addSpace('', 16) + '|{cmd}<拼接古籍残片(中) /@newskill22>\'
  +'|{cmd}<去哪里可以得到古籍残片？/@newskill16>' + addSpace('', 8) + '|{cmd}<我有一些多余的古籍残片/@newskill23>\ \'
  +'|{cmd}<没事/@doexit>'
  );
end;

procedure _newskill21;
begin
  if This_Player.GetBagItemCount('古籍残片(小)') >= 10 then
  begin
    This_Player.Take('古籍残片(小)',10);
    This_Player.Give('古籍残片(中)',1);
    This_Npc.NpcDialog(This_Player,
    '你已经知道古武术的事情了吧，为了学习你对应职业的新技能，\我可以帮你解读你得到的古籍残片，以得到<古籍残片(大)/c=red>。\1个<古籍残片(大)/c=red>由5个<古籍残片(中)/c=red>拼接得到，\而1页<古籍残片(中)/c=red>则需要我解读10个<古籍残片(小)/c=red>才行。\ \'
    + '|{cmd}<解读古籍残片(小)/@newskill21>' + addSpace(' ', 16) + '|{cmd}<拼接古籍残片(中) /@newskill22>\'
    + '|{cmd}<去哪里可以得到古籍残片？/@newskill16>' + addSpace('', 8) + '|{cmd}<我有一些多余的古籍残片/@newskill23>\ \'
    +'|{cmd}<没事/@doexit>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够的残片啊！'
    );
  end;
end;

procedure _newskill22;
begin
  if This_Player.GetBagItemCount('古籍残片(中)') >= 5 then
  begin
    This_Player.Take('古籍残片(中)',5);
    This_Player.Give('古籍残片(大)',1);
    This_Npc.NpcDialog(This_Player,
    '你已经知道古武术的事情了吧，为了学习你对应职业的新技能，\我可以帮你解读你得到的古籍残片，以得到<古籍残片(大)/c=red>。\1个<古籍残片(大)/c=red>由5个<古籍残片(中)/c=red>拼接得到，\而1页<古籍残片(中)/c=red>则需要我解读10个<古籍残片(小)/c=red>才行。\ \'
    + '|{cmd}<解读古籍残片(小)/@newskill21>' + addSpace(' ', 16) + '|{cmd}<拼接古籍残片(中) /@newskill22>\'
    + '|{cmd}<去哪里可以得到古籍残片？/@newskill16>' + addSpace(' ', 8) + '|{cmd}<我有一些多余的古籍残片/@newskill23>\ \'
    +'|{cmd}<没事/@doexit>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够的残片啊！'
    );
  end;
end;

procedure _newskill23;
begin
  This_Npc.NpcDialog(This_Player,
  '如果你不想要你身上的古籍残片(小)，那就给我吧，\我对于这些散落的信息非常感兴趣，作为感谢，我给你1个火龙珠。\ \'
  +'|{cmd}<给你古籍残片(小)/@newskil231>\ \'
  +'|{cmd}<返回/@newskill2>'
  );
end;

procedure _newskil231;
begin
  if This_Player.GetBagItemCount('古籍残片(小)') >= 1 then
  begin
    This_Player.Take('古籍残片(小)',1);
    This_Player.Give('火龙珠',1);
    This_Npc.NpcDialog(This_Player,
    '如果你不想要你身上的古籍残片(小)，那就给我吧，\我对于这些散落的信息非常感兴趣，作为感谢，我给你1个火龙珠。\ \'
    +'|{cmd}<给你古籍残片(小)/@newskil231>\ \'
    +'|{cmd}<返回/@newskill2>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够的残片啊！'
    );
  end;
end;

procedure _magicdef;
begin
  This_Npc.NpcDialog(This_Player,
  '四级魔法盾？我是听说过这个传闻，不过，\这和古战技关系不大，我也不太清楚了。\印象中，比奇高家魔法师之家的高级魔法师提起过\他对魔法盾的研究心得，你如果真想知道的话，\去找他吧。\ \'
  +'|{cmd}<谢谢，我知道了/@newskill>'
  );
end; 


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请选择你想要买的书。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我看看你的书。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _helpbooks;
begin
  This_Npc.NpcDialog(This_Player, 
    '你对那种书感兴趣？\ \武士可以学<基本剑术/@help11>和<攻杀剑术/@help12>\魔法师可以学<火球术/@help21>和<大火球/@help22>\道士可以学<治愈术/@help31>,<精神力战法/@help32>和<施毒术/@help33>\ \|{cmd}<返回/@main>'
    );
end;

procedure _help11;
begin
  This_Npc.NpcDialog(This_Player, 
    '基本剑术你可以按如下步骤修炼：\Lv.1 : 你可以在第 7 级开始修炼\Lv.2 : 你可以在第 11 级开始修炼\Lv.3 : 你可以在第 16 级开始修炼\ \|{cmd}<返回/@helpbooks>'
    );
end;

procedure _help12;
begin
  This_Npc.NpcDialog(This_Player, 
    '攻杀剑术你可以按如下步骤修炼：\Lv.1 : 你可以在第 19 级开始修炼。\Lv.2 : 你可以在第 22 级开始修炼。\Lv.3 : 你可以在第 24 级开始修炼。\ \|{cmd}<返回/@helpbooks>'
    );
end;

procedure _help21;
begin
  This_Npc.NpcDialog(This_Player, 
    '火球术你可以按如下步骤修炼：\Lv.1: 你可以在第 7 级开始修炼。\Lv.2: 你可以在第 11 级开始修炼。\Lv.3: 你可以在第 16 级开始修炼。\ \|{cmd}<返回/@helpbooks>'
    );
end;

procedure _help22;
begin
  This_Npc.NpcDialog(This_Player, 
    '大火球你可以按如下步骤修炼：\Lv.1: 你可以在第 19 级开始修炼。\Lv.2: 你可以在第 23 级开始修炼。\Lv.3: 你可以在第 25 级开始修炼。\ \|{cmd}<返回/@helpbooks>'
    );
end; 

procedure _help31;
begin
  This_Npc.NpcDialog(This_Player, 
    '治愈术你可以按如下步骤修炼：\Lv.1 : 你可以在第 7 级开始修炼.\Lv.2 : 你可以在第 11 级开始修炼.\Lv.3 : 你可以在第 16 级开始修炼。\ \|{cmd}<返回/@helpbooks>'
    );
end;

procedure _help32;
begin
  This_Npc.NpcDialog(This_Player, 
    '精神力战法你可以按如下步骤修炼：\Lv.1 : 你可以在第 9 级开始修炼.\Lv.2 : 你可以在第 13 级开始修炼.\Lv.3 : 你可以在第 19 级开始修炼。\ \|{cmd}<返回/@helpbooks>'
    );
end;

procedure _help33;
begin
  This_Npc.NpcDialog(This_Player, 
    '施毒术你可以按如下步骤修炼：\Lv.1 : 你可以在第 14 级开始修炼.\Lv.2 : 你可以在第 17 级开始修炼.\Lv.3 : 你可以在第 20 级开始修炼。\ \|{cmd}<返回/@helpbooks>'
    );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(4);
 This_NPC.FillGoods('火球术', 100, 1);
  This_NPC.FillGoods('治愈术', 100, 1); 
  This_NPC.FillGoods('基本剑术', 100, 1);
  This_NPC.FillGoods('精神力战法', 100, 1);
  This_NPC.FillGoods('施毒术', 100, 1);
  This_NPC.FillGoods('大火球', 100, 1);
  This_NPC.FillGoods('抗拒火环', 100, 1);
  This_NPC.FillGoods('灵魂火符', 100, 1);
  This_NPC.FillGoods('雷电术', 100, 1);
  This_NPC.FillGoods('攻杀剑术', 100, 1);
  This_NPC.FillGoods('刺杀剑术', 100, 1); 
  This_NPC.FillGoods('半月弯刀', 100, 1);
  This_NPC.FillGoods('野蛮冲撞', 100, 1);
  
  This_NPC.FillGoods('召唤骷髅', 100, 1);
  This_NPC.FillGoods('隐身术', 100, 1);
  This_NPC.FillGoods('集体隐身术', 100, 1);
  This_NPC.FillGoods('幽灵盾', 100, 1);
  This_NPC.FillGoods('神圣战甲术', 100, 1);
  This_NPC.FillGoods('心灵启示', 100, 1);
  This_NPC.FillGoods('困魔咒', 100, 1); 
  This_NPC.FillGoods('群体治愈术', 100, 1);
 
  This_NPC.FillGoods('诱惑之光', 100, 1);
  This_NPC.FillGoods('地狱火', 100, 1);
  This_NPC.FillGoods('瞬息移动', 100, 1);
  This_NPC.FillGoods('爆裂火焰', 100, 1);
  This_NPC.FillGoods('火墙', 100, 1);
  This_NPC.FillGoods('疾光电影', 100, 1);
  This_NPC.FillGoods('地狱雷光', 100, 1);
  This_NPC.FillGoods('魔法盾', 100, 1);
  This_NPC.FillGoods('圣言术', 100, 1);
  
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.    