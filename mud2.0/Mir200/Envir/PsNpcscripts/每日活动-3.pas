

program mir2;



procedure _cj;
begin
  This_Npc.NpcDialog(This_Player,          
   '活动将在<每天/c=red>的<16点/c=red>和<19点/c=red>开放！\'+
   '+开放进入时间为<16点00分/c=red>和<19点00分/c=red>。\'+
   '每次开放时间60分钟，峡谷内隐藏大量携带经书的灵兽。\'+
   '击败他们！让他们现出原形，获得珍贵的书页！！\ \'+
   '|{cmd}<马上进入/@zou1>'); 
end;

procedure _zou1;
var
  temp1,temp2 : integer;
begin
  if (GetHour = 16) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<16点00分/c=red>和<19点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 19) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<16点00分/c=red>和<19点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 16) and (GetMin >= 00) and (GetMin < 60) then
  begin
    if temp1 = -1 then
    begin
      temp1 := 0;
    end
    if temp1 = GetDateNum(GetNow) then
    begin
      This_Player.RandomFlyTo('R001~21');
      This_Player.CallOut(This_Npc, 1, 'MFBG2');
    end
    else
    begin
      temp1 := GetDateNum(GetNow);
      This_Player.CallOut(This_Npc, 1, 'MFBG2');
      This_Player.RandomFlyTo('R001~21');
  
    end;
  end
  else if (GetHour = 19) and (GetMin >= 00) and (GetMin < 60) then
  begin
    if temp2 = -1 then
    begin
      temp2 := 0;
    end
    if temp2 = GetDateNum(GetNow) then
    begin
    This_Player.CallOut(This_Npc, 1, 'MFBG2');
      This_Player.RandomFlyTo('R001~21');
    end
    else
    begin
      temp2 := GetDateNum(GetNow);
      This_Player.CallOut(This_Npc, 1, 'MFBG2');
      This_Player.RandomFlyTo('R001~21');

    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '现在还不到时候，活动将在每天的16点00分和19点00分开放进入！\你过段时间再来吧。\ \');
  end;
end;


procedure MFBG2;

begin
  
      if ((GetHour = 16) or(GetMin < 59)) and ((GetHour = 19) or(GetMin < 59)) then
         
      begin
         if CompareText(This_Player.MapName,'R001~21') = 0 then
         begin
            This_Player.CallOut(This_Npc, 1, 'MFBG2');
            
         end ;  
         end else 
         begin
          
             This_Player.FlyTo('3', 333, 333);
            ServerSay('藏经峡谷活动结束，请等待下次开放时间！',3); 
             
            
         end ; 
        
end;







procedure _gongsha;
begin
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇\|'
	+'每天14:00-15:00及18:00-19:00可以进行模拟攻沙活动，\|'
    +'45级以上进入，杀死守城卫士可以获得一定的元宝，\|'
    +'最终杀死国王者有一定几率获得极品职业武器！\|'
    +'|{cmd}<进入模拟攻沙/@mngs>\');
end;
procedure mngs2;
begin
This_Player.FlyTo('3~1',693+random(5),349+random(5));  //随机降落范围，防止堵门进不去 

end; 

procedure _mngs; 
begin
if  ((GetHour = 14) and (GetMin < 60)) or 
((GetHour = 18) and (GetMin < 60)) then begin 
    if This_Player.Level >= 50 then
  begin                 
   This_Player.CallOut(This_Npc,50, 'mngs2');
    This_Player.RandomFlyTo('Q002~2');
    This_Npc.NpcDialog(This_Player,
   '攻沙开始，5秒后进入攻沙区域！');
   This_Npc.NpcNotice('强大的'+This_Player.Name+
   '加入了模拟攻沙！');
   end else
    This_Npc.NpcDialog(This_Player,
   '您的等级不够！');   
end else
     This_Npc.NpcDialog(This_Player,
   '不在活动时间！');  
  end;



Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _guaiwu;
begin
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇,怪物攻城时间为周六晚上20:00-21:30，\'
	+'在土城举行，每10分钟一波怪,共6波，第六波过5分钟后全BOSS攻城，\'
  +'21:30清空当期怪物\'
    +'|{cmd}<查询/@cx>\');
end;

procedure _cx; 

begin  
    if  ((GetHour = 20) and ( GetDayOfWeek = 6) and (GetMin < 60)) or
	((GetHour = 21) and ( GetDayOfWeek = 6) and (GetMin < 30))  then  
    begin
      This_Npc.NpcDialog(This_Player,
        '当前土城正在遭受怪物肆虐，请注意安全!');
	end else
  This_Npc.NpcDialog(This_Player,
        '不在怪物攻城时间!');
    end;
 
procedure Execute;
var   
gmin : integer;
begin
gmin := GetMin ;
if (GetDayOfWeek = 6) and (GetHour = 20)  then            //定时刷怪时间点
 case gmin of 
0 : begin
This_NPC.CreateMon('3',234,292,5,'僵尸',50);
This_NPC.CreateMon('3',347,376,5,'半兽人',50);
This_NPC.CreateMon('3',380,364,5,'尸王',10);
This_NPC.CreateMon('3',381,330,5,'半兽勇士',10);
This_NPC.CreateMon('3',380,364,5,'双头血魔',1);
This_NPC.CreateMon('3',380,364,5,'双头金刚',1);
This_NPC.SetMonTargetXY(333,333);
This_NPC.NpcNotice('怪物在盟重集结即将攻城，请各位勇士踊跃参与，维护一方安定！');
    end; 
10 : begin
This_NPC.CreateMon('3',234,292,5,'恶灵僵尸',50);
This_NPC.CreateMon('3',347,376,5,'骷髅长枪兵',50);
This_NPC.CreateMon('3',380,364,5,'尸王',10);
This_NPC.CreateMon('3',381,330,5,'电僵王',10);
This_NPC.SetMonTargetXY(323,323);
This_NPC.NpcNotice('第二波怪物正在盟重集结即将攻城，请各位勇士踊跃参与，维护一方安定！');
    end;   
20 : begin
This_NPC.CreateMon('3',234,292,5,'沃玛勇士',50);
This_NPC.CreateMon('3',347,376,5,'沃玛战将',50);
This_NPC.CreateMon('3',380,364,5,'火焰沃玛',10);
This_NPC.CreateMon('3',381,330,5,'沃玛教主',4);
This_NPC.CreateMon('3',381,330,5,'暗之沃玛教主',1);
This_NPC.SetMonTargetXY(337,325);
This_NPC.NpcNotice('第三波怪物正在盟重集结即将攻城，请各位勇士踊跃参与，维护一方安定！');
    end;   
 30 : begin
This_NPC.CreateMon('3',234,292,5,'祖玛弓箭手',20);
This_NPC.CreateMon('3',347,376,5,'楔蛾',20);
This_NPC.CreateMon('3',380,364,5,'邪恶钳虫',10);
This_NPC.CreateMon('3',381,330,5,'暴牙蜘蛛',10);
This_NPC.CreateMon('3',381,330,5,'血巨人',10);
This_NPC.CreateMon('3',380,364,5,'白野猪',10);
This_NPC.CreateMon('3',381,330,5,'暗之黄泉教主',1);
This_NPC.CreateMon('3',380,364,5,'暗之虹魔教主',1);
This_NPC.SetMonTargetXY(323,337);
This_NPC.NpcNotice('第四波怪物正在盟重集结即将攻城，请各位勇士踊跃参与，维护一方安定！');
    end;  
 40 : begin
This_NPC.CreateMon('3',234,292,5,'僵尸',50);
This_NPC.CreateMon('3',347,376,5,'半兽人',50);
This_NPC.CreateMon('3',380,364,5,'尸王',10);
This_NPC.CreateMon('3',381,330,5,'半兽勇士',10);
This_NPC.CreateMon('3',234,292,5,'重装使者',2);
This_NPC.CreateMon('3',347,376,5,'暗之双头血魔',1);
This_NPC.CreateMon('3',380,364,5,'暗之双头金刚',1);
This_NPC.CreateMon('3',381,330,5,'暗之骷髅精灵',1);
This_NPC.SetMonTargetXY(337,337);
This_NPC.NpcNotice('第五波怪物正在盟重集结即将攻城，请各位勇士踊跃参与，维护一方安定！');
    end;  
  50 : begin
This_NPC.CreateMon('3',234,292,5,'虹魔猪卫',5);
This_NPC.CreateMon('3',347,376,5,'黑野猪',20);
This_NPC.CreateMon('3',380,364,5,'邪恶毒蛇',5);
This_NPC.CreateMon('3',381,330,5,'虹魔蝎卫',5);
This_NPC.CreateMon('3',234,292,5,'虹魔猪卫',5);
This_NPC.CreateMon('3',347,376,5,'虹魔教主',1);
This_NPC.CreateMon('3',380,364,5,'牛魔将军',5);
This_NPC.CreateMon('3',381,330,5,'牛魔法师',5);
This_NPC.CreateMon('3',347,376,5,'魔龙刀兵',20);
This_NPC.CreateMon('3',380,364,5,'魔龙力士',5);
This_NPC.CreateMon('3',381,330,5,'魔龙教主',1);
This_NPC.CreateMon('3',347,376,5,'暗之魔龙教主',1);
This_NPC.CreateMon('3',380,364,5,'牛魔王',1);
This_NPC.CreateMon('3',381,330,5,'暗之牛魔王',1);
This_NPC.CreateMon('3',347,376,5,'黄泉教主',1);
This_NPC.CreateMon('3',380,364,5,'魔影巨人',1);
This_NPC.SetMonTargetXY(329,333);
This_NPC.NpcNotice('第六波怪物正在盟重集结即将攻城，请各位勇士踊跃参与，维护一方安定！');
    end;  
60 : begin
This_NPC.CreateMon('3',381,330,5,'魔龙教主',1);
This_NPC.CreateMon('3',347,376,5,'暗之魔龙教主',1);
This_NPC.CreateMon('3',380,364,5,'牛魔王',1);
This_NPC.CreateMon('3',381,330,5,'暗之牛魔王',1);
This_NPC.CreateMon('3',347,376,5,'黄泉教主',1);
This_NPC.CreateMon('3',380,364,5,'魔影巨人',1);
This_NPC.CreateMon('3',333,333,5,'巨灵神',1);
This_NPC.CreateMon('3',333,333,5,'烈焰战熊',1);
This_NPC.CreateMon('3',333,333,5,'烈焰魔神',1);
This_NPC.CreateMon('3',333,333,5,'火龙1',1);
This_NPC.SetMonTargetXY(333,333);
This_NPC.NpcNotice('攻城统帅正在盟重集结即将攻城，请各位勇士踊跃参与，维护一方安定！');
    end;  
  end;
if  (GetDayOfWeek = 6) and (GetHour = 21) and  (GetMin = 30)  then
  begin
    This_NPC.ClearMon('3');
    This_NPC.NpcNotice('怪物攻城结束，请各位勇士下次再来！'); 
  end;
  end; 








procedure _letgo;
begin
  if (GetHour <> 12) and (GetHour <> 19) and (GetHour <> 22) then
  begin
    This_Player.PlayerNotice('争霸活动还没有开始！', 0);
    exit;
  end;
  if GetMin > 5 then
  begin
    This_Player.PlayerNotice('已经超过了进入时间了，请在活动开始5分钟内进入！', 0);
    exit;
  end;
  if GetMin > 20 then
  begin
    This_Player.PlayerNotice('活动已经结束，请等待下次活动！', 0);
    exit;
  end;
  This_Player.RandomFlyTo('0139~30');
  This_Player.PlayerNotice('争霸活动将在10分时开始，请耐心等待！', 2);
  This_Player.CallOut(This_Npc, 1, 'luandou');
end;

procedure luandou;
begin
  if not(This_Player.MapName = '0139~30') then
    exit;
  if GetMin = 10 then
  begin
    This_Player.RandomFlyTo('0139~31');
    This_Player.CallOut(This_Npc, 10, 'jieshu');
    This_Player.PlayerNotice('争霸活动已经开始！请打败其他玩家，获得最终胜利！', 2);
    exit;
  end;
  This_Player.CallOut(This_Npc, 1, 'luandou');
end;

procedure jieshu;
begin
  if not(This_Player.MapName = '0139~31') then
    exit;
  if GetMin > 20 then
  begin
    This_Player.RandomFlyTo('0159');
    This_Player.PlayerNotice('争霸活动已经结束！', 2);
    exit;
  end;
  This_Player.CallOut(This_Npc, 10, 'jieshu');
end;
procedure _luandou;
begin
  This_Npc.NpcDialog(This_Player,
    '每天12点，19点，22点整将举行群雄争霸活动\|'
	+'|活动结束时地图内的最后一个玩家将获得<50灵符/c=red>和<200万经验/c=red>。\'
    +'|活动开始后的前5分钟请要参加活动的玩家.\'
	+'|进入等待室(超时将无法进入)，10分时所有人将传送到争霸地图.\'
	+'|地图内最后一个玩家获得奖励！.\'
    +'|{cmd}<进入等待室/@letgo>');

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


procedure _guanduobao;
begin
  This_Npc.NpcDialog(This_Player,          
  '每日的活动开放进入时间为<18点20分至18点40分/c=red>，\'
  +'每次进入需要<支付1000金币/c=red>。\ \'
  +'|{cmd}<我要闯关夺宝/@guanduobao_start>'
  ); 
end;

procedure _guanduobao_start;
begin
  if This_Player.Level >= 40 then
  begin
    if (GetHour = 18) and (GetMin >= 40) then
    begin
      This_Npc.NpcDialog(This_Player,          
      '非常的抱歉，你已经错过了本次活动的进入时间，\每日的活动开放进入时间为<18点20分至18点40分/c=red>，\请等待下次活动开启！\');
    end
    else if (GetHour = 18) and (GetMin >= 20) and (GetMin < 40) then
    begin
      This_Npc.NpcDialog(This_Player,          
      '目前夺宝战即将正式开启，请你抓紧时间尽快赶往停留地\等待活动开始，每次进入停留地都需要<支付1000金币/c=red>！\ \'
      +'|{cmd}<进入停留地/@GOONE>');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,          
      '非常的抱歉，你已经错过了本次活动的进入时间，\每日的活动开放进入时间为<18点20分至18点40分/c=red>，\请等待下次活动开启！\');
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '非常的遗憾，只有等级达到<40级/c=red>的玩家才能参加此活动！');
  end;
end;

procedure _GOONE;
begin
  if This_Player.Level >= 40 then
  begin
    if (GetHour = 18) and (GetMin >= 20) and (GetMin < 40) then
    begin
      if This_Player.GoldNum >= 1000 then
      begin
        This_Player.DecGold(1000);
        This_Player.RandomFlyTo('0139~12');
      end
      else
      begin
        This_Npc.NpcDialog(This_Player,          
        '你好象没有足够的金币啊，那怎么行呢？');
      end;
    end
  end
  else
    exit;
end;

procedure _Alivemission;
begin
  This_Npc.NpcDialog(This_Player,          
   '活动将在<每天/c=red>的<14点/c=red>和<17点/c=red>开放！\'+
   '+开放进入时间为<13点50分/c=red>和<16点50分/c=red>。\'+
   '试炼大厅内机遇与危险是并存的，越危险的地方获得的利益也越大。\'+
   '你做好充足的准备了嘛？\如果你准备好了可以先进入休息室等待活动开始！\ \'+
   '|{cmd}<进入休息室/@gorestroom>'); 
end;

procedure _gorestroom;
var
  temp1,temp2 : integer;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<13点50分/c=red>和<16点50分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<13点50分/c=red>和<16点50分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 13) and (GetMin >= 50) and (GetMin < 60) then
  begin
    if temp1 = -1 then
    begin
      temp1 := 0;
    end
    if temp1 = GetDateNum(GetNow) then
    begin
      This_Player.RandomFlyTo('EM002~001');
    end
    else
    begin
      temp1 := GetDateNum(GetNow);
      This_Player.RandomFlyTo('EM002~001');
      This_NPC.ClearMon('D2079~001');
      This_NPC.ClearMon('D2079~002');
      This_NPC.ClearMon('D2079~003');
      This_NPC.ClearMon('D2079~004');
      This_NPC.ClearMon('D2079~005');
      This_NPC.ClearMon('D2079~006');
    end;
  end
  else if (GetHour = 16) and (GetMin >= 50) and (GetMin < 60) then
  begin
    if temp2 = -1 then
    begin
      temp2 := 0;
    end
    if temp2 = GetDateNum(GetNow) then
    begin
      This_Player.RandomFlyTo('EM002~001');
    end
    else
    begin
      temp2 := GetDateNum(GetNow);
      This_Player.RandomFlyTo('EM002~001');
      This_NPC.ClearMon('D2079~001');
      This_NPC.ClearMon('D2079~002');
      This_NPC.ClearMon('D2079~003');
      This_NPC.ClearMon('D2079~004');
      This_NPC.ClearMon('D2079~005');
      This_NPC.ClearMon('D2079~006');
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '现在还不到时候，活动将在每天的13点50分和16点50分开放进入！\你过段时间再来吧。\ \');
  end;
end;

procedure _gohuan7;
begin
  This_Npc.NpcDialog(This_Player,
    '|只要你拥有地下组队卷轴、\' +
    '|我就可以送你前往地下迷宫，那里也有一个地下城守卫\' +
    '|他可以送你去宫殿长廊，前去参加夺宝活动\' +
    '只有到达地下宫殿最中间的勇士，才通过送宝人偶进入夺宝地图\' +
    '|{cmd}<组队前往地下迷宫/@checkthing>\' +
    '|{cmd}<单独前往地下迷宫/@checkthing1>\' +
    '|{cmd}<返回/@main>');

end;

procedure _checkthing;
begin
  if This_Player.MapName = '3' then
  begin
    if This_Player.IsGroupOwner then
    begin
    if This_Player.GetBagItemCount('地下组队卷轴') > 0 then
    begin
      if This_Player.Take('地下组队卷轴', 1) then
        This_Player.GroupFly('T3063~01');
      end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有任何组队卷轴啊，我不能送你去');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
        '你不是所在队伍的队长，不能进入');
    end;
  end;
end;


procedure _checkthing1;
begin
  if compareText(This_Player.MapName, '3') = 0 then
  begin
    if This_Player.GetBagItemCount('地下组队卷轴') > 0 then
    begin
    if This_Player.Take('地下组队卷轴', 1) then
        This_Player.Flyto('T3063~01', 0, 0);
   
    
    end
    else
      This_Npc.NpcDialog(This_Player,
        '你没有任何组队卷轴啊，我不能送你去');
  end;

end;


procedure _move;
begin
   This_NPC.NpcDialog(This_Player,
   '你想移动到哪里去呢？\'+
   '|{cmd}<挑战幻境一层/@move1> \'+
   '|{cmd}<我有钱,直接挑战幻境7层/@move2> \'+

   '|{cmd}<返回/@main>');
end;



procedure _move2;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到幻境七层。\'+ 
   '不能让你免费使用，你必须支付3000000金币！\'+ 
   '你想花这笔钱吗？\ \'+  
   '|{cmd}<移动/@pay2>\');

end;


procedure _pay2;
begin
   if This_Player.GoldNum >= 3000000 then
        begin
     
          This_Player.Flyto('H007',161,172);

           
           end;
           
           begin
            This_Player.DecGold(3000000);
           end;
           if This_Player.GoldNum >= 3000000 then
        begin
         ServerSay('土豪玩家：'+This_Player.Name+'直接使用300万金币前往幻境7层，祝他好运！',3);
    
        end else       
        begin
         This_Player.NotifyClientCommitItem(0,'如果你想去，就必须首先给我300万金币，赶快给我吧。'); 
        end;
end;



procedure _move1;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到幻境一层需要金币。\'+ 
   '不能让你免费使用，你必须支付100000金币！\'+ 
   '你想花这笔钱吗？\ \'+  
   '|{cmd}<移动/@pay1>\'+ 
   '|{cmd}<退出/@talkwith>');
end;

procedure _pay1;
begin
   if This_Player.GoldNum >= 100000 then
        begin
     
           This_Player.Flyto('H001',73,79);

           
         end;
           
         begin
            This_Player.DecGold(100000);
         end ;
         if This_Player.GoldNum >= 100000 then
        begin
         ServerSay('玩家：'+This_Player.Name+'使用10万金币前往幻境！',3);
    
        end else   
        begin
         This_Player.NotifyClientCommitItem(0,'如果你想去，就必须首先给我10万金币，赶快给我吧。'); 
        end;
end;

var
  JLTem, iDayWt, iChae , nowDay : integer;
  sDay : double;
  mail_str , day_Mstr : string;
Begin

   This_Npc.NpcDialog(This_Player,
   '为了让众多的勇士们更快获得能力的提升，比奇国王特意颁布了\'+
   '一系列的法令，以此来鼓励勇士们更快提升自己的能力。\ '+
        
   '|{cmd}<地下夺宝活动/@gohuan7>               ^<闯关夺宝活动/@guanduobao> \'+
   '|{cmd}<争霸活动/@luandou>                     ^<怪物攻城/@guaiwu> \'+
   '|{cmd}<模拟攻城/@gongsha>             ^<藏经峡谷/@cj> \'
   + '|{cmd}<书页兑换/@shuye>            ^<挑战幻境/@move>\'         
   
   );
END.