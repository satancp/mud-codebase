{********************************************************************

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
procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '欢迎光临，有什么事情需要我帮忙吗？\ \'
   +'|{cmd}<买/@buy>衣服\'
   +'|{cmd}<卖/@sell>衣服\'
   +'|{cmd}<修复/@repair>衣服\'
   +'|{cmd}<进行对话/@talkwith>\'
   +'|{cmd}<特殊修理/@s_repair>\'
   +'|{cmd}<回比奇城/@moveout>\'
   +'|{cmd}<取消/@exit> '
   );
end;

procedure _moveout;
begin  
    if This_Player.MapName = '0106' then 
    This_Player.Flyto('0',322 + random(3) - 1,302 + random(3) - 1); 
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
  '要购买什么吗？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '请放上去要卖的衣服，我给估价。\头盔和帽子也收购，\最好在这儿一起卖吧。\ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '可以修复衣服，头盔，帽子。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '修得还算不错。\ \ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。，\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了……\请好好的使用它。\ \|{cmd}<返回/@main>'
  );
end;


procedure _talkwith; 
begin
    
    IF (This_Player.GetS(80,12) = 9) then
    begin
    This_Npc.NpcDialog(This_Player,
    '这可怎么办？\'
    +'哥哥是想知道关于刘爷爷的事情吧！\'
    +'我答应过刘爷爷又不能装作不知道，我还是告诉你吧。\'
    +'不过你千万不要和刘爷爷讲是我说的,\' 
    +'请你一定答应我。\ \'
    +'|{cmd}<答应/@ok_make_promise>\'
    +'|{cmd}<拒绝/@no_make_promise>\'
    );
    end else
    IF This_Player.GetS(80,12) = 8 then
    begin
        IF random(3) = 0 then
        This_Npc.NpcDialog(This_Player,
        '' + This_Player.Name + '哥哥, 我现在很疲劳。\'
        +'真对不起，我们有办法听你讲。\ \'
        +'|{cmd}<把身上带着的项链当作礼物送。/@give_my_necklace>\'
        )
        else
        This_Npc.NpcDialog(This_Player,
        '' + This_Player.Name + '哥哥, 你来得正好，我正觉得无聊。\'
        +'给我讲有趣的故事吧。\'
        +'好吗？\ \'
        +'|{cmd}<讲沃玛打饱嗝的故事。/@talk_about_oma>\'
        );
    end else
    IF (This_Player.GetS(80,12) = 6) then
    begin
    This_Npc.NpcDialog(This_Player,
    '有什么事情吗？我现在要做事。\'
    +'简单点问吧。\ \'
    +'|{cmd}<问有关刘老中医的事情/@talk_yu_doctor>\'
    );
    end else
    IF (This_Player.GetS(80,12) = 7) then
    This_Npc.NpcDialog(This_Player,
    '哦，给我这么贵重的东西，太感谢了\'
    +'真太谢谢了，\'
    +'这是我梦寐以求的东西。\ \'
    +'|{cmd}<再次问有关刘中医的事情./@talk_yu_again>\'
    )
    else
    This_Npc.NpcDialog(This_Player,
    '今天天气真好。\'
    +'这么好的天气，\'
    +'就该和男朋友一起出去玩。\'
    );
end;

procedure _talk_yu_doctor; 
begin
     IF This_Player.GetItemNameOnBody(3) = '金项链' then
     This_Npc.NpcDialog(This_Player,
      '哦，原来是在讲刘老头啊。\'
      +'可是我答应过他对任何人都不说他在哪儿。\ \'
      +'|{cmd}<给身上带着的金项链./@give_goldnecklace>\'
      )
      else
      This_Npc.NpcDialog(This_Player,
      '哦，原来是在讲刘老头啊。\'
      +'可是我答应过他对任何人都不说他在哪儿。\ '
      +'很抱歉，我也没办法，\'
      +'你还是回去吧。\'
      +'（安老板下意识的瞅了瞅你脖子上带的<金项链/c=red>）\'
      );
end;
{
This_Player.GetItemNameOnBody(i);
0:衣服
1：武器
2：勋章 
3：项链
4：头盔 
5：左手腕
6：右手腕
7：左戒指 
8：右戒指
9：护身符 
10：腰带
11：鞋子 
}
procedure _give_goldnecklace; 
begin
    IF (This_Player.GetItemNameOnBody(3) = '金项链') and (This_Player.GetS(80,12) = 6) then
    begin
        This_Player.Takebodyequipbypos(3);
        This_Player.SetS(80,12,7);
        This_Npc.NpcDialog(This_Player,
          '哦，给我这么贵重的东西，太感谢了\'
          +'真太谢谢了，\'
          +'这是我梦寐以求的东西。\ \'
          +'|{cmd}<再次问有关刘中医的事情./@talk_yu_again>\'
          );
    end;
end;

procedure _talk_yu_again; 
begin
      This_Npc.NpcDialog(This_Player,
      '不行，不能说的。\'
      +'给我项链，不会是因为这个吧？\'
      +'|{cmd}<要求退还项链。/@getback_necklace>\'
      +'|{cmd}<怎么会呢。/@noproblem>\'
      );

end;

procedure _getback_necklace; 
begin
    if This_Player.GetS(80,12) = 7 then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
        This_Npc.NpcDialog(This_Player,
        '哼，你太低级了。\'
        +'接着，以后别再出现在这里。\'
        +'哼。。。'
        ); 
       // This_Player.Give('金项链',1);
        end else
        This_Npc.NpcDialog(This_Player,
        '你的包裹太满了！'
        );
    end;
end;

procedure _noproblem; 
begin
    if This_Player.GetS(80,12) = 7 then
    begin
        IF (random(5) = 0) then
        begin
        This_Npc.NpcDialog(This_Player,
        '' + This_Player.Name + ' 你是真正的男子汉。\'
        +'.. 以后就叫你哥哥，可以这样叫吗？\'
        +'还有啊，和哥哥在一起就感觉很开心。\'
        +'下次经过这里，一定来看我喔。\'
        +'好吗？\'
        );
        This_Player.SetS(80,12,8);
        end
        else
        This_Npc.NpcDialog(This_Player,
        '你真是个好人。\'
        +'经过附近一定要来我们店喔。\'
        );
    end;
end;

procedure _ok_make_promise; 
begin
     if This_Player.GetS(80,12) = 9 then
     begin
     This_Npc.NpcDialog(This_Player,
      '一定要这样做。\'
      +'刘爷爷现在在兽人古墓二层，\'
      +'我没有去过，所以具体就不知道了。\'
      +'走的时候说要在那里住几个月，\'
      +'我想应该在那里吧。\'
      +'就算见到，\'
      +'千万不要提起我。\'
      +'拜托哥哥了。' 
      );
      This_Player.SetS(80,12,10);
     end; 
end;

procedure _no_make_promise; 
begin
     This_Npc.NpcDialog(This_Player,
      '哦，这可不行。\'
      +'我可是和刘爷爷发誓过的。\'
      +'如果他知道我没有守信用，\'
      +'会很失望的。\'
      +'对不起。\ \'
      );
end;


procedure _talk_about_oma; 
begin
This_Npc.NpcDialog(This_Player,
      '哈哈哈哈哈....\'
      +'太有意思了，哥哥真是一个有趣的人。\'
      );
end;

procedure _give_my_necklace; 
begin
    IF (This_Player.GetItemNameOnBody(3) = '金项链') and (This_Player.GetS(80,12) = 8) then
    begin
        This_Player.Takebodyequipbypos(3);
        This_Player.SetS(80,12,9);
        This_Npc.NpcDialog(This_Player,
        '哥哥, 你竟然给我这样的礼物，太好了。\'
        +'我好像又有力气了。\'
        ); 
    end else
    This_Npc.NpcDialog(This_Player,
    '哥哥也真会说笑话。\'
    +'不过有这句话，我就已经很感谢了...\'
    );
end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(10);
  This_Npc.AddStdMode(11);
  This_Npc.AddStdMode(15);
  This_Npc.FillGoods('布衣(男)',50,1);
  This_Npc.FillGoods('布衣(女)',50,1);
  This_Npc.FillGoods('轻型盔甲(男)',50,1); 
  This_Npc.FillGoods('轻型盔甲(女)',50,1);
  This_Npc.FillGoods('中型盔甲(男)',50,1);
  This_Npc.FillGoods('中型盔甲(女)',50,1);
  This_Npc.FillGoods('重盔甲(男)',50,1);
  This_Npc.FillGoods('重盔甲(女)',50,1);
  This_Npc.FillGoods('魔法长袍(男)',50,1);
  This_Npc.FillGoods('魔法长袍(女)',50,1);
  This_Npc.FillGoods('灵魂战衣(男)',50,1); 
  This_Npc.FillGoods('灵魂战衣(女)',50,1);
  This_Npc.FillGoods('幽灵战衣(男)',50,1);
  This_Npc.FillGoods('幽灵战衣(女)',50,1);
  This_Npc.FillGoods('恶魔长袍(男)',50,1);
  This_Npc.FillGoods('恶魔长袍(女)',30,1);
  This_Npc.FillGoods('战神盔甲(男)',30,1);
  This_Npc.FillGoods('战神盔甲(女)',30,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.