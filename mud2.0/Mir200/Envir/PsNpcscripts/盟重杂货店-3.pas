{
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
var temp : integer;
begin
  temp := random(2);
  if temp = 1 then
  begin
  This_Npc.NpcDialog(This_Player,
  '年轻人您是不是来打听关于封魔谷宝物的消息？\呵呵，告诉您吧最近，虹魔教主从其他地方搜刮来了一批宝物，\而且还将其中部分宝物分给了它的一些部下。这个消息我可是\冒着生命危险得来的哟～您千万不要告诉别人。\ \'
  +'|{cmd}<购买物品/@buy>'+ addSpace('', 24) + '^<出售物品/@sell>\'
  +'|{cmd}<灵符购买/@lingfuBuy>\'
  
  +'|{cmd}<退出/@doexit>'
  );
  end
  else
  begin
  This_Npc.NpcDialog(This_Player,
  '感谢，我可以为你做什么吗？我这里出售的都是最抢手的物品，\并且我可是盟重省独家经营哦！\ \'
  +'|{cmd}<购买物品/@buy>'+ addSpace('', 14) + '^<出售物品/@sell>\'
  +'|{cmd}<灵符购买/@lingfuBuy>\'

  +'|{cmd}<退出/@doexit>'
  );
  end;
end;

function geiLinfItemName(itemId : integer):string; 
begin
    result := '';
    case itemId of        

        1 : result := '比奇传送石';
        2 : result := '盟重传送石';
        3 : result := '随机传送石';
        4 : result := '修复神水';
        5 : result := '幻魔石(小)';
        6 : result := '乾坤令包';
        7 : result := '地穴组队卷轴';
        8 : result := '金条';
        9 : result := '雪霜捆药绳';
        10 : result := '疗伤药捆药绳';
        11 : result := '太阳水捆药绳';
        12 : result := '千里传音';
        13 : result := '50倍卷轴';
        14 : result := '地下组队卷轴';
		15 : result := '气血石(小)';
		16 : result := '魔血石(大)';
    end;
end;

function needLFnum(itemId : integer):integer; 
begin
    result := 0;
    case itemId of        
        1 : result := 40;
        2 : result := 40;
        3 : result := 40;
        4 : result := 5;
        5 : result := 10;
        6 : result := 5;
        7 : result := 10;
        8 : result := 20;
        9 : result := 2;
        10 : result := 10;
        11 : result := 5;
        12 : result := 50;
        13 : result := 100;
        14 : result := 10;
		15 : result := 20;
		16 : result := 100;

    end;
end;

procedure _lingfuBuy;
var str : string;
i : integer;
begin
   str := '';
   
   for i:=5 to 16 do
   begin
       str := str + '<' + geiLinfItemName(i) + '/@buyLFitem_Dlg~' + inttostr(i) + '>'
       if (i mod 2) = 1 then
       str := str + '^'
       else
       str := str + '|'; 
   end;
   This_Npc.NpcDialog(This_Player,
  '请选择你要购买的物品\ \|{cmd}'
  +str
  +'{cmd}<返回/@main>'
  );
end;

procedure _buyLFitem_Dlg(strId : string);
var str : string;
i : integer;
begin
   str := '';
   
   i := StrToIntDef(strId,0);
 
   This_Npc.NpcDialog(This_Player,
  '购买<' + geiLinfItemName(i) + '/c=red>需要<' + inttostr(needLFnum(i)) + '灵符/c=red>，|你确定使用' + inttostr(needLFnum(i)) + '灵符购买' + geiLinfItemName(i) + '吗？\ \'
  +'|{cmd}<确认购买' + geiLinfItemName(i) + '/@buyLFitem~' + strId + '>'
  +'{cmd}<返回/@lingfuBuy>'
  );
end;

procedure _buyLFitem(strId : string);
var itemId , needLf: integer;
iName : string;
begin
    itemId := StrToIntDef(strId , 0);
    needLf := needLFnum(itemId);
    iName := geiLinfItemName(itemId);
    
    if iName <> '' then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
            if This_Player.MyLFnum >= needLf then
            begin
                This_Player.DecLF(10001, needLf, false);
                This_Player.Give(iName,1);
                This_Npc.NpcDialog(This_Player,
                '恭喜你获得:' + iName + '！'
                +'|{cmd}<继续购买' + iName + ' /@buyLFitem~' + strId + '>'
                +'|{cmd}<返回/@lingfuBuy>'
                );
            end else
            This_Npc.NpcDialog(This_Player,
          '灵符数量不足，无法购买！'
          +'{cmd}<返回/@main>'
          );
        end else
        This_Npc.NpcDialog(This_Player,
      '包裹空间不足，无法购买！'
      +'{cmd}<返回/@main>'
      );
    end;
end;

procedure _baijin;
begin
  This_Npc.NpcDialog(This_Player, 
  '这是我刚学会的技能，你可要替我保守这个秘密，我可以把六个白金积分捆成一个白金积分包。\捆一次需要支付10万金币，\你要不要也让我帮你捆一包啊？\'
  +'|{cmd}<帮我捆白金积分/@baijin1>\ \'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _baijin1;
begin
  if This_Player.GetBagItemCount('白金积分') < 6 then
  begin
    This_Npc.NpcDialog(This_Player, 
    '你没有足够的白金积分啊！'
    );
  end
  else if This_Player.GoldNum >= 100000 then
  begin
    This_Player.DecGold(100000);
    This_Player.Take('白金积分',6);
    This_Player.Give('白金积分包',1);
    This_Npc.NpcDialog(This_Player,
    '已经捆好了，还需不需要继续捆？\ \'
    +'|{cmd}<继续捆/@baijin1>\ \'
    +'|{cmd}<返回/@main>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够金币，我也帮不了你啊！'
    );
  end;
end; 

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
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！'
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
  This_Npc.AddStdMode(30);
  This_Npc.FillGoods('地牢逃脱卷',100,1);
  This_Npc.FillGoods('随机传送卷',100,1);
  This_Npc.FillGoods('行会回城卷',100,1);
  This_Npc.FillGoods('护身符',100,1); 
  This_Npc.FillGoods('修复油',50,1);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.FillGoods('随机传送卷包',100,1);
  This_Npc.FillGoods('行会回城卷包',100,1);
  This_Npc.FillGoods('木箱钥匙',100,1);
  This_Npc.FillGoods('神水',5,5);
  This_Npc.FillGoods('护身符(大)',50,1);
  This_Npc.FillGoods('超级护身符',10,1);
  This_Npc.SetRebate(100);
end;

//=============================================================================
procedure _SHISHI_108;
begin
   This_Npc.NpcDialog(This_Player,
   '既然你自愿帮忙，那好吧，盟重城中心有个石墓入口，你进去过么？\'+
   '……一看就知道你没去过，就你这样的也能帮的上忙么？\'+
   '你先去里面看看吧，就在<石墓一层/c=red>顺手帮我解决<5只红野猪/c=red>吧。\'+
   '（任务目标：进入石墓一层，杀死5只红野猪）\ \'+
   '|{cmd}<石墓？好的，我这就去/@SHISHI_108_01>\');
end;

procedure _SHISHI_108_01;
begin
   if This_Player.GetV(108,1) = 1 then
   begin
      This_Player.Give('经验',360000);
      This_Player.SetV(108,1,2);
      This_Player.SetV(108,2,0);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

procedure _HeiYZ108_3;
begin
   if This_Player.GetV(108,1) = 3 then
   begin
      This_Player.Give('经验',360000);
      This_Player.SetV(108,1,4);
      This_Player.SetV(108,3,0);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

procedure _Dowhat108;
begin
   This_Npc.NpcDialog(This_Player,
   '那夜，土城受到了石墓怪物的突然袭击，\'+
   '很多人都被怪物抓进了石墓洞穴中，再也没有出来，\'+
   '我的亲人被杀死，就连尸体都被带走了，混乱中只剩下我一个人，\'+
   '为了寻找他们，这些年我不断的进入石墓洞穴，可惜一直无法找到。\'+
   '我只有一个心愿：希望能找回他们的尸骨安葬。\'+
   '（任务目标：深入石墓二层，杀死黑色恶蛆，\'+
   '寻找流浪汉亲人的遗骸）\ \'+
   '|{cmd}<落叶归根。我一定帮你找回遗骸/@Dowhat108_01>\');
end;

procedure _Dowhat108_01;
begin
   if This_Player.GetV(108,1) = 5 then
   begin
      This_Player.Give('经验',360000);
      This_Player.SetV(108,1,6);
      This_Player.SetV(108,4,0);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

procedure _Jinli108;
begin
   This_Npc.NpcDialog(This_Player,
   '那群可怕的野猪可能已经拥有了一定的智慧，\'+
   '说不定……说不定……丢失的骸骨被它们拿去做成饰品戴在身上。\'+
   '帮我找回剩下的骸骨好么？拜托了！\'+
   '（任务目标：深入石墓三层，杀死里面的红野猪，\'+
   '剩下的骸骨一定在红野猪身上）\ \'+
   '|{cmd}<好的，我一定会找到的/@Jinli108_01>\');
end;

procedure _Jinli108_01;
begin
   if This_Player.GetV(108,1) = 7 then
   begin
      This_Player.Give('经验',300000);
      This_Player.SetV(108,1,8);
      This_Player.SetV(108,5,0);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

procedure _TouGuoL108;
begin
   This_Npc.NpcDialog(This_Player,
   '勇士，我真心的谢谢你。如果你不嫌弃，我就把它送给你吧。\ \'+
   '这怎么行！这条项链溢彩流光，一定蕴含着大量的能量。\'+
   '|{cmd}<你还是自己留作纪念吧/@TouGuoL108_01>。');
end;

procedure _TouGuoL108_01;
begin
   This_Npc.NpcDialog(This_Player,
   '不管这条项链的材料中是否有我亲人的骸骨，\'+
   '它都是用我们玛法人民的身体打造而成。\'+
   '你对我这样的流浪者都愿意伸出援手。我相信你有资格佩戴它。\'+
   '玛法人民的英灵一定会护佑你的。况且它对于我而言除了纪念\'+
   '别无他用，还是让它发挥它的作用吧！\ \'+
   '|{cmd}<那好吧，我保证会好好的利用它/@TouGuoL108_02>。');
end;

procedure _TouGuoL108_02;
begin
   This_Npc.NpcDialog(This_Player,
   '这封信，还是要麻烦你帮我转交盟重指挥官！请你尽快帮我送到。\ \'+
   '|{cmd}<好的，没问题，我这就去/@TouGuoL108_03>。');
end;

procedure _TouGuoL108_03;
begin
   if This_Player.GetV(108,1) = 9 then
   begin
      if This_Player.FreeBagNum >= 1 then
      begin
         This_Player.Give('经验',320000);
         This_Player.Give('灵魂项链',1);
         This_Player.SetV(108,1,10);
         This_Player.UpdateTaskDetail(108,1);
         This_NPC.CloseDialog(This_Player);
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你的包裹已满，请整理出空间以后再来找我。');
      end;
   end;
end;

Procedure _Tongzhi108;
begin
   This_Npc.NpcDialog(This_Player,
   '我和他们已经很久没有见了。真的很想念他们！\'+
   '你看我，一激动就情不自禁了……我看勇士的实力已进入瓶颈，\'+
   '我和宗师还有一点交情，想把勇士推荐给他。\'+
   '只是不知道勇士意下如何？\ \'+
   '|{cmd}<我一直在努力修行，可是苦于无法精进/@Tongzhi108_01>');
end;

Procedure _Tongzhi108_01;
begin
   This_Npc.NpcDialog(This_Player,
   '但是想要得到宗师的指点，还是要遵守他的规矩。\'+
   '你对蜈蚣洞已经轻车熟路了吧！在蜈蚣洞的最深层“死亡棺材”，\'+
   '有一种可怕的巨兽邪恶钳虫，它喜欢蛰伏在地下，去杀了他，\'+
   '获取钳虫角！(任务目标：深入蜈蚣洞的“死亡棺材”，\'+
   '杀死一只邪恶钳虫，获得钳虫角)\ \'+
   '|{cmd}<邪恶钳虫？我会证明我的能力的。/@Tongzhi108_02>');
end;

procedure _Tongzhi108_02;
begin
   if This_Player.GetV(108,1) = 16 then
   begin
      This_Player.Give('经验',360000);
      This_Player.SetV(108,1,17);
      This_Player.SetV(108,7,0);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

Procedure _Thanks108;
begin
   if This_Player.GetV(108,1) = 18 then
   begin
      if This_Player.FreeBagNum >= 1 then
      begin
        //This_Player.Give('聚气丹',1);
        This_Player.Give('经验',400000);
        This_Player.SetV(108,1,19);
        This_Player.UpdateTaskDetail(108,1);
        This_NPC.CloseDialog(This_Player);
      end else
      begin
        This_Npc.NpcDialog(This_Player,
        '你的包裹空间不够，我怎么送东西感谢你呢？'); 
      end;
   end;
end;
//=============================================================================

//脚本执行的入口
var
  RW108 : integer;
begin
   RW108 := This_Player.GetV(108,1);
   if RW108 = 19 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经见到宗师了么？\ \'+
      '|{cmd}<好的，我这就去/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 18 then
   begin
      This_Npc.NpcDialog(This_Player,
      '干的漂亮！你拿着我的信去找宗师吧！希望你有所收获。\ \'+
      '|{cmd}<谢谢你，我这就去找宗师/@Thanks108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 17 then
   begin
      This_Npc.NpcDialog(This_Player,
      '忘记蜈蚣洞的路了么？\ \'+
      '(任务目标：深入蜈蚣洞的“死亡棺材”，杀死一只邪恶钳虫)\ \'+
      '|{cmd}<邪恶钳虫？我会证明我的能力的/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 16 then
   begin
      This_Npc.NpcDialog(This_Player,
      '盟重指挥官告诉我，能够安全出入石墓的人只有你，\'+
      '所以他还是派你去石墓找寻我的弟兄们。大恩不言谢。\'+
      '只是不知道我的弟兄们情况如何？\ \'+
      '|{cmd}<放心吧，前辈们让我先行一步通知你，他们已动身返回。/@Tongzhi108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 10 then
   begin
      This_Npc.NpcDialog(This_Player,
      '这封信，还是要麻烦你帮我转交盟重指挥官！请你尽快帮我送到。\ \'+
      '|{cmd}<好的，没问题，我这就去/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 9 then
   begin
      This_Npc.NpcDialog(This_Player,
      '这……这是灵魂项链……\ \'+
      '这条项链被野猪的头领佩戴在身上，看上去应该\'+
      '是由骸骨制成的。\|{cmd}<我就把它偷了过来/@TouGuoL108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 8 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你找到剩下的遗骸了么？他们死了，我却连安葬他们都做不到！\'+
      '我真没用……\'+
      '（任务目标：深入石墓三层，杀死里面的怪物，\'+
      '剩下的骸骨一定在某只怪物身上）\ \'+
      '|{cmd}<好的，我一定会找到的/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 7 then
   begin
      This_Npc.NpcDialog(This_Player,
      '只剩下这几根遗骨了么？我的亲人何时才能安息？\'+
      '……我，我可以再请你帮一次么？\ \'+
      '|{cmd}<您说吧，我一定尽力而为！/@Jinli108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 6 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你找到我亲人的遗骸了么？他们死了，\'+
      '我却连安葬他们都做不到！我真没用……\'+
      '（任务目标：深入石墓二层，杀死黑色恶蛆，\'+
      '遗骸一定在某只怪物身上）\ \'+
      '|{cmd}<落叶须归根，我一定帮你找回遗骸/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 5 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你为什么要帮我，你真的能帮的了我么？\ \'+
      '|{cmd}<请你告诉我能为你做点什么吧/@Dowhat108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 4 then
   begin
      This_Npc.NpcDialog(This_Player,
      '不要告诉我，你忘了石墓的入口在哪里？\'+
      '（任务目标：进入石墓一层，杀死5只黑野猪）\ \'+
      '|{cmd}<好的，我这就去/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 3 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你居然活着回来了？看来你还是有两下子的。\'+
      '那么再去<石墓一层/c=red>帮我杀<5只黑野猪/c=red>吧！\'+
      '这些该死的猪，我真想把他们都凌迟了。\'+
      '（任务目标：进入石墓一层，杀死5只黑野猪）\ \'+
      '|{cmd}<这个人还真是……算了，杀完再说吧/@HeiYZ108_3>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '不要告诉我，你就连石墓的入口都还没有找到？\'+
      '（任务目标：进入石墓一层，杀死5只红野猪）\ \'+
      '|{cmd}<好的，我这就去/@doexit>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else if RW108 = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你说盟重指挥官让你来帮助我？\'+
      '谢谢他的好意，可惜没有人能帮得上我。\ \'+
      '|{cmd}<前辈，你且让我试试吧！/@SHISHI_108>\ \'+
      '|{cmd}<我有其他事情找你/@Normal>');
   end else
   begin
      _Normal;
   end;
    _Normal;
end.