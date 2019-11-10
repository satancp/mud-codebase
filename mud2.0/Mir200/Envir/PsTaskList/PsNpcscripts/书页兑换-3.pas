{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

  

procedure _shuye;
begin
  This_Npc.NpcDialog(This_Player,
  '若是你能寻访到足够的书页，集成卷轴，\'
  +'带来与我，我就以我珍藏的<逐日剑法、流星火雨、噬血术/c=red>三本秘籍中\'
  +'任意你指定的一种相赠。\'
  +'如果能找到让我惊喜的内容，我也会以上述武学秘笈相赠。\ \'
  +'|{cmd}<我有书页/@shuye_change>               ^<兑换说明/@shuye_explain>\'
  +'|{cmd}<了解高级技能/@shuye_about>           ^<返回/@main>'
  ); 
end;

procedure _shuye_change;
begin
  This_Npc.NpcDialog(This_Player,
  '按照我的预估，大概1张书页我就能解读出一点有用的资料，所以，\'
  +'如果你能带给我<1/c=red>张书页，我就给你记录<1/c=red>点贡献度。当然如果你能\'
  +'在给我1张书页的同时，能捐献<5元宝/c=red>研究经费的话，\'
  +'我能破例给你记录5点贡献度。\'
  +'当你在我这里的贡献度满1200的时候，我将以珍藏的秘籍相赠。\'
  +'勇士，你带来我需要的东西了么？\ \'
  +'|{cmd}<贡献度兑换/@NewSkill_1>             ^<贡献度兑换技能书/@NewSkill_2>\'
  +'|{cmd}<返回/@shuye>\'
  ); 
end;

procedure _NewSkill_1;
begin
  This_Npc.NpcDialog(This_Player,
  '勇士，你现在身上有：\'
 // +'绑定书页：' + inttostr(This_Player.GetBagItemCount('绑定书页')) + '，\'
  +'书页：' + inttostr(This_Player.GetBagItemCount('书页')) +'\ \'
//  +'|{cmd}<绑定书页兑换贡献度/@NewSkill_1_1>\ \'
  +'|{cmd}<书页兑换贡献度/@NewSkill_1_2>\ \'
  +'|{cmd}<返回/@shuye_change>\'
  ); 
end;

procedure _NewSkill_1_1;
begin
  This_Npc.NpcDialog(This_Player,
  '勇士，你现在身上有：\'
  +'绑定书页：' + inttostr(This_Player.GetBagItemCount('绑定书页')) + '，书页：' + inttostr(This_Player.GetBagItemCount('书页')) +'\'
  +'|{cmd}<1绑定书页兑换1点贡献度/@NewSkill_1_1_1~1>\'
  +'|{cmd}<10绑定书页兑换10点贡献度/@NewSkill_1_1_1~10>\'
  +'|{cmd}<1绑定书页和5元宝兑换5点贡献度/@NewSkill_1_1_2~1>\'
  +'|{cmd}<10绑定书页和50元宝兑换50点贡献度/@NewSkill_1_1_2~10>\'
  //+'|{cmd}<1绑定书页和5金锭兑换5点贡献度/@NewSkill_1_1_3~1>\'
 // +'|{cmd}<10绑定书页和50金锭兑换50点贡献度/@NewSkill_1_1_3~10>\'
  +'|{cmd}<返回/@shuye_change>\'
  ); 
end;

procedure _NewSkill_1_1_1(str:string); 
var
  temp,temp_str:integer; 
begin
  temp_str:=strtointdef(str,-1);
  if (temp_str <> 1) and (temp_str <> 10) then exit;
  
  if This_Player.GetV(26,11) < 0 then
  begin
    This_Player.SetV(26,11,0);
  end; 
  temp := This_Player.GetV(26,11);
    if temp < 1200 then
  begin
    if This_Player.GetBagItemCount('绑定书页') >= temp_str then
    begin
      This_Player.Take('绑定书页',temp_str);
      This_Player.SetV(26,11, temp + temp_str);
      This_Player.AddLogRec(9, '贡献度', 811115, temp + temp_str, '递交书页当前贡献度');
        This_Player.AddLogRec(9, '绑定书页', 811155, temp_str, '47级技能书');
      This_Npc.NpcDialog(This_Player,
      '你递交了'+str+'张绑定书页，你的贡献度上升了'+str+'点！\' 
      +'当前你的贡献度为：' + inttostr(temp+temp_str) + '！\'
      +'加油吧，有潜力的勇士，老夫没有看错人。\ \'
      +'|{cmd}<继续兑换/@NewSkill_1_1_1~'+str+'>                ^<返回/@NewSkill_1>'
      );             
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果你带来了'+str+'张绑定书页，就赶快交给我吧！'); 
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '当前你的贡献度已经达到1200点，已经可以兑换技能书了！\ \'
    +'|{cmd}<贡献度兑换技能书/@NewSkill_2>'); 
  end;
end;

function NewSkill_YB1(price, num: Integer):boolean; 
var
temp:integer; 
begin
  This_Player.Take('绑定书页',price/5);
  temp := This_Player.GetV(26,11);
  This_Player.SetV(26,11, temp + price);
 // This_Player.IncActivePoint(2*price/5);  //增加活跃度每个2点 
  This_Player.AddLogRec(9, '绑定书页', 811155, price/5, '47级技能书');
  if num = 1 then
  begin
  This_Npc.NpcDialog(This_Player,
  '你递交了'+inttostr(price/5)+'张绑定书页，并且贡献了'+inttostr(price)+'元宝的研究经费。\'
  +'你的贡献度上升了'+inttostr(price)+'点！\' 
  +'当前你的贡献度为：' + inttostr(temp + price) + '！\'
  +'加油吧，有潜力的勇士，老夫没有看错人。\ \'
  +'|{cmd}<继续兑换/@NewSkill_1_1_2~'+inttostr(price/5)+'>                ^<返回/@NewSkill_1>'
  );  
  This_Player.AddLogRec(9, '贡献度', 811115, temp + price, '元宝递交书页');  
  end else
  begin
  This_Npc.NpcDialog(This_Player,
  '你递交了'+inttostr(price/5)+'张绑定书页，并且贡献了'+inttostr(price)+'金锭的研究经费。\'
  +'你的贡献度上升了'+inttostr(price)+'点！\' 
  +'当前你的贡献度为：' + inttostr(temp + price) + '！\'
  +'加油吧，有潜力的勇士，老夫没有看错人。\ \'
  +'|{cmd}<继续兑换/@NewSkill_1_1_3~'+inttostr(price/5)+'>                ^<返回/@NewSkill_1>'
  );  
  This_Player.AddLogRec(9, '贡献度', 811115, temp + price, '金锭递交书页');  
  end; 
  result:= true; 
end;

procedure _NewSkill_1_1_2(str:string); 
var
  temp,temp_str:integer; 
begin
  temp_str:=strtointdef(str,-1);
  if (temp_str <> 1) and (temp_str <> 10) then exit;
  
  if This_Player.GetV(26,11) < 0 then
  begin
    This_Player.SetV(26,11,0);
  end; 
  temp := This_Player.GetV(26,11);
    if temp < 1200 then
  begin
    if This_Player.GetBagItemCount('绑定书页') >= temp_str then
    begin
    This_Player.PsYBConsum(This_NPC,'NewSkill_YB1',20156,5*temp_str,1);         
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果你带来了'+str+'张绑定书页，就赶快交给我吧！'); 
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '当前你的贡献度已经达到1200点，已经可以兑换技能书了！\ \'
    +'|{cmd}<贡献度兑换技能书/@NewSkill_2>'); 
  end;
end;

procedure _NewSkill_1_1_3(str:string); 
var
  temp,temp_str:integer; 
begin
  temp_str:=strtointdef(str,-1);
  if (temp_str <> 1) and (temp_str <> 10) then exit;
  
  if This_Player.GetV(26,11) < 0 then
  begin
    This_Player.SetV(26,11,0);
  end; 
  temp := This_Player.GetV(26,11);
    if temp < 1200 then
  begin
    if This_Player.GetBagItemCount('绑定书页') >= temp_str then
    begin
      if This_Player.GloryPoint >= 500*temp_str then 
      begin
       if This_Player.DecGloryPoint(30088,500*temp_str,1,false,'书页兑换贡献度') then
       begin
       NewSkill_YB1(5*temp_str,0);
       end;
      end else
      This_Npc.NpcDialog(This_Player,
      '你的金锭不足！\'
      );          
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果你带来了'+str+'张绑定书页，就赶快交给我吧！'); 
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '当前你的贡献度已经达到1200点，已经可以兑换技能书了！\ \'
    +'|{cmd}<贡献度兑换技能书/@NewSkill_2>'); 
  end;
end;

procedure _NewSkill_1_2;
begin
  This_Npc.NpcDialog(This_Player,
  '勇士，你现在身上有：\'
 // +'绑定书页：' + inttostr(This_Player.GetBagItemCount('绑定书页')) + '，\'
  +'书页：' + inttostr(This_Player.GetBagItemCount('书页')) +'\'
  +'|{cmd}<1书页兑换1点贡献度/@NewSkill_1_2_1~1>\'
  +'|{cmd}<10书页兑换10点贡献度/@NewSkill_1_2_1~10>\'
  +'|{cmd}<1书页和5元宝兑换5点贡献度/@NewSkill_1_2_2~1>\'
  +'|{cmd}<10书页和50元宝兑换50点贡献度/@NewSkill_1_2_2~10>\'
  //+'|{cmd}<1书页和5金锭兑换5点贡献度/@NewSkill_1_2_3~1>\'
  //+'|{cmd}<10书页和50金锭兑换50点贡献度/@NewSkill_1_2_3~10>\'
  +'|{cmd}<返回/@shuye_change>\'
  ); 
end;

function NewSkill_YB2(price, num: Integer):boolean; 
var
temp:integer; 
begin
  This_Player.Take('书页',price/5);
  temp := This_Player.GetV(26,11);
  This_Player.SetV(26,11, temp + price);
  //This_Player.IncActivePoint(2*price/5);  //增加活跃度每个2点 
  This_Player.AddLogRec(9, '书页', 811155, price/5, '47级技能书');
  if num = 1 then
  begin
  This_Npc.NpcDialog(This_Player,
  '你递交了'+inttostr(price/5)+'张书页，并且贡献了'+inttostr(price)+'元宝的研究经费。\'
  +'你的贡献度上升了'+inttostr(price)+'点！\' 
  +'当前你的贡献度为：' + inttostr(temp + price) + '！\'
  +'加油吧，有潜力的勇士，老夫没有看错人。\ \'
  +'|{cmd}<继续兑换/@NewSkill_1_2_2~'+inttostr(price/5)+'>                ^<返回/@NewSkill_1>'
  );  
  This_Player.AddLogRec(9, '贡献度', 811115, temp + price, '元宝递交书页');  
  end else
  begin
  This_Npc.NpcDialog(This_Player,
  '你递交了'+inttostr(price/5)+'张书页，并且贡献了'+inttostr(price)+'金锭的研究经费。\'
  +'你的贡献度上升了'+inttostr(price)+'点！\' 
  +'当前你的贡献度为：' + inttostr(temp + price) + '！\'
  +'加油吧，有潜力的勇士，老夫没有看错人。\ \'
  +'|{cmd}<继续兑换/@NewSkill_1_2_3~'+inttostr(price/5)+'>                ^<返回/@NewSkill_1>'
  );  
  This_Player.AddLogRec(9, '贡献度', 811115, temp + price, '金锭递交书页');  
  end; 
  result:= true; 
end;

procedure _NewSkill_1_2_1(str:string); 
var
  temp,temp_str:integer; 
begin
  temp_str:=strtointdef(str,-1);
  if (temp_str <> 1) and (temp_str <> 10) then exit;
  
  if This_Player.GetV(26,11) < 0 then
  begin
    This_Player.SetV(26,11,0);
  end; 
  temp := This_Player.GetV(26,11);
    if temp < 1200 then
  begin
    if This_Player.GetBagItemCount('书页') >= temp_str then
    begin
      This_Player.Take('书页',temp_str);
      This_Player.SetV(26,11, temp + temp_str);
      This_Player.AddLogRec(9, '贡献度', 811115, temp + temp_str, '递交书页当前贡献度');
        This_Player.AddLogRec(9, '书页', 811155, temp_str, '47级技能书');
      This_Npc.NpcDialog(This_Player,
      '你递交了'+str+'张书页，你的贡献度上升了'+str+'点！\' 
      +'当前你的贡献度为：' + inttostr(temp+temp_str) + '！\'
      +'加油吧，有潜力的勇士，老夫没有看错人。\ \'
      +'|{cmd}<继续兑换/@NewSkill_1_2_1~'+str+'>                ^<返回/@NewSkill_1>'
      );             
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果你带来了'+str+'张书页，就赶快交给我吧！'); 
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '当前你的贡献度已经达到1200点，已经可以兑换技能书了！\ \'
    +'|{cmd}<贡献度兑换技能书/@NewSkill_2>'); 
  end;
end;

procedure _NewSkill_1_2_2(str:string); 
var
  temp,temp_str:integer; 
begin
  temp_str:=strtointdef(str,-1);
  if (temp_str <> 1) and (temp_str <> 10) then exit;
  
  if This_Player.GetV(26,11) < 0 then
  begin
    This_Player.SetV(26,11,0);
  end; 
  temp := This_Player.GetV(26,11);
    if temp < 1200 then
  begin
    if This_Player.GetBagItemCount('书页') >= temp_str then
    begin
    This_Player.PsYBConsum(This_NPC,'NewSkill_YB2',20156,5*temp_str,1);         
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果你带来了'+str+'张书页，就赶快交给我吧！'); 
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '当前你的贡献度已经达到1200点，已经可以兑换技能书了！\ \'
    +'|{cmd}<贡献度兑换技能书/@NewSkill_2>'); 
  end;
end;

procedure _NewSkill_1_2_3(str:string); 
var
  temp,temp_str:integer; 
begin
  temp_str:=strtointdef(str,-1);
  if (temp_str <> 1) and (temp_str <> 10) then exit;
  
  if This_Player.GetV(26,11) < 0 then
  begin
    This_Player.SetV(26,11,0);
  end; 
  temp := This_Player.GetV(26,11);
    if temp < 1200 then
  begin
    if This_Player.GetBagItemCount('书页') >= temp_str then
    begin
      if This_Player.GloryPoint >= 500*temp_str then 
      begin
       if This_Player.DecGloryPoint(30088,500*temp_str,1,false,'书页兑换贡献度') then
       begin
       NewSkill_YB2(5*temp_str,0);
       end;
      end else
      This_Npc.NpcDialog(This_Player,
      '你的金锭不足！\'
      );          
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '如果你带来了'+str+'张书页，就赶快交给我吧！'); 
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
      '当前你的贡献度已经达到1200点，已经可以兑换技能书了！\ \'
    +'|{cmd}<贡献度兑换技能书/@NewSkill_2>'); 
  end;
end;

procedure _NewSkill_2;
var
  temp:integer;
begin
  if This_Player.GetV(26,11) < 0 then
  begin
    This_Player.SetV(26,11,0);
  end;
  
  temp := This_Player.GetV(26,11);
    if temp >= 1200 then
  begin
    This_Npc.NpcDialog(This_Player,
    '勇士，目前，你的贡献度为：' + inttostr(temp) + '点。\'
    +'已经达到了兑换需求，请选择你需要的武学秘笈吧。\'
    +'请确认您有足够的包裹空间。您做好选择了么？\ \' 
    +'|{cmd}<换取流星火雨/@NewSkill_1_chg_1>          ^<换取逐日剑法/@NewSkill_1_chg_2>          |{cmd}<换取噬血术/@NewSkill_1_chg_3>\ \'
    +'|{cmd}<返回/@shuye_change>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '勇士，目前，你的贡献度为：' + inttostr(temp) + '点。\'
    +'尚没有满足我的要求，继续努力吧。\ \'
    +'|{cmd}<返回/@shuye_change>'
    ); 
  end;
end;

function Point_CHG_Book(Book_Name:string):Boolean;
var
  temp:integer;
begin
  if This_Player.Level < 40 then
  begin
    This_Npc.NpcDialog(This_Player,
    '对不起，你的等级太低，只有40级以上才可以进行兑换！');
    exit; 
  end;
  
  temp := This_Player.GetV(26,11);
    if temp >= 1200 then
  begin
    if This_Player.FreeBagNum > 0 then
    begin
        This_Player.SetV(26,11,temp - 1200);
      This_Player.Give(Book_Name,1);
        This_Player.AddLogRec(9, Book_Name, 811116, 1, '扣除1200贡献度获得');
      This_Npc.NpcDialog(This_Player,
      '你成功兑换到了：' + Book_Name + '！\ \'
      +'|{cmd}<返回/@NewSkill_2>'
      );
      This_NPC.NpcNotice('玩家：“' + This_Player.Name + '”，通过努力获得了皇家大学士的认可，兑换到技能书：' + Book_Name +'。');
      This_Player.AddLogRec(9, Book_Name, 811115, 1, '47级技能书贡献度兑换获得');
      Result := True; 
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '对不起，你的包裹满了，还是先整理一下再来找我吧！\ \'
      +'|{cmd}<返回/@NewSkill_2>'
      );
      Result := False;
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '对不起，您没有满足兑换条件，不能兑换。\ \'
    +'|{cmd}<返回/@NewSkill_2>'
    );
    Result := False;
  end; 
end;

procedure _NewSkill_1_chg_1;
begin
  Point_CHG_Book('流星火雨');
end;

procedure _NewSkill_1_chg_2;
begin
  Point_CHG_Book('逐日剑法');
end;

procedure _NewSkill_1_chg_3;
begin
  Point_CHG_Book('噬血术');
end;

procedure _shuye_explain;
begin
  This_Npc.NpcDialog(This_Player,
  '老夫一生，颇有清誉，很大程度皆因我做人做事从来都是讲究规矩。\'
  +'此次虽迫切希望得到那些珍奇书页，然我还是设立一套贡献度考核\'
  +'机制。当您在我这里记录的贡献度满足1200点，并且您的级别满足\'
  +'40级的时候，可以拥有兑换我珍藏的47武学秘笈的权利。\ \'
  +'|{cmd}<贡献度说明/@shuye_explain_1>      ^<书页说明/@shuye_explain_2>\'
  +'|{cmd}<返回/@shuye>'
  );
end;

procedure _shuye_explain_1;
begin
  This_Npc.NpcDialog(This_Player,
  '贡献度是考核您获取强大秘笈的兑换凭证。\'
  +'按照我的预估，大概1张书页我就能解读出一点有用的资料，所以，\'
  +'如果你能带给我<1/c=red>张书页，我就给你记录<1/c=red>点贡献度。当然如果你能\'
  +'在给我1张书页的同时，能捐献<5元宝/c=red>研究经费的话，\'
  +'我能破例给你记录5点贡献度。\'
  +'当你在我这里的贡献度满1200的时候，我将以珍藏的秘籍相赠。\ \'
  +'|{cmd}<返回/@shuye_explain>'
  );
end;

procedure _shuye_explain_2;
begin
  This_Npc.NpcDialog(This_Player,
  '书页分绑定书页和书页。绑定书页和书页都可以通过洞穴探险从怪物\'
  +'手中夺得，或者机缘巧合在市井之间获得。绑定书页只能你自己使用，\'
  +'书页的话可以进行交易。用绑定书页和书页都可以兑换贡献度或者直\'
  +'接让老夫解读来试运气，看是否是稀世书页。\ \'
  +'|{cmd}<返回/@shuye_explain>'
  );
end;

procedure _shuye_about;
begin
  This_Npc.NpcDialog(This_Player,
  '逐日剑法：战士47级技能。剑气凝聚成形，瞬间化作一道光影，突袭\'
  +'身前四格内的敌人。\'
  +'这是一种破坏力极强的直线远距离攻击，而如同烈火剑法一样，它也\'
  +'需要一定的时间，让剑气凝聚在战士的武器之上，等待爆发的那一瞬\'
  +'间，惊心动魄。\ \'
  +'|{cmd}<下一页/@shuye_about_1>\'
  +'|{cmd}<返回/@shuye>'
  );
end;

procedure _shuye_about_1;
begin
  This_Npc.NpcDialog(This_Player,
  '流星火雨：法师47级技能。在魔法的驱动下，一阵猛烈的火雨从天而\'
  +'降，法术区域内的任何生物都将受到极大的伤害。\'
  +'流星火雨是一个杀伤力很大，且范围很广的魔法，可以伤害7格内所\'
  +'有的部队，如果敌方的部队集中在一起时，就是使用这个魔法最好的\'
  +'时机了。而随着英雄等级的提高，以后魔法的威力会越来越强。\ \'
  +'|{cmd}<下一页/@shuye_about_2>\'
  +'|{cmd}<返回/@shuye>'
  );
end;

procedure _shuye_about_2;
begin
  This_Npc.NpcDialog(This_Player,
  '噬血术：道士47级技能。该技能驱使护身符，对敌人造成伤害。命中\'
  +'后还可吸取对方生命，为自己回复一定的血量。\'
  +'道士们除灵魂火符之外，第二个真正意义上的主动攻击法术！更恐怖\'
  +'的是，这种法术依靠是比以往更高境界的精神力，可以无视某些地形\'
  +'障碍，直击敌人的要害！噬血术的出现，会让道士们除了强大的召唤\'
  +'术之外，自身亦变成一个令人惧怕的对手。需要注意的是噬血术需要\'
  +'消耗护身符。\ \'
  +'|{cmd}<返回/@shuye>'
  );
end;

//------------------------------------------------------------------------------

begin

    This_Npc.NpcDialog(This_Player,
    '虽然半兽人已经被赶回了北部荒原，但是我们必须时刻保持警惕，\'+
    '并且做好迎接战斗的准备！\ \'
    +'|{cmd}<书页兑换/@shuye>                     \ \'
    );

end.