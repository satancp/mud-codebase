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
    This_Npc.NpcDialog(This_Player,
      '欢迎，你想买些武技修炼的书吗？\ \'
      +'|{cmd}<买/@buy>  书\'
      +'|{cmd}<卖/@sell>  书 \'
      +'|{cmd}<询问各种武技的细节/@helpbooks>  \'
      +'|{cmd}<交谈/@talk>\'
      +'|{cmd}<取消/@exit>'
      
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
      '你对哪种书感兴趣？\ \'
      +'武士可以学<基本剑术/@help11>和<攻杀剑术/@help12>\'
      +'魔法师可以学<火球术/@help21>和<爆裂火焰/@help23>'
      +'道士可以学<治愈术/@help31>,<精神力战法/@help32>,和\'
      +'<施毒术/@help33>\ \'
      +'|{cmd}<返回/@Main>'
      
      );

end;

procedure _help11;
begin
This_Npc.NpcDialog(This_Player,
      '基本剑术你可以按如下步骤修炼：\'
      +'Lv.1 : 你可以在第 7 级开始修炼\'
      +'Lv.2 : 你可以在第 11 级开始修炼\'
      +'Lv.3 : 你可以在第 16 级开始修炼\\'
      +'|{cmd}<返回/@helpbooks>'
      );

end;

procedure _help12;
begin
This_Npc.NpcDialog(This_Player,
      '攻杀剑术你可以按如下步骤修炼：\'
      +'Lv.1 : 你可以在第 20 级开始修炼。\'
      +'Lv.2 : 你可以在第 22 级开始修炼。\'
      +'Lv.3 : 你可以在第 24 级开始修炼。\\'
      +'|{cmd}<返回/@helpbooks>'
      );

end;

procedure _help21;
begin

This_Npc.NpcDialog(This_Player,
      '火球术你可以按如下步骤修炼：\'
      +'Lv.1: 你可以在第 7 级开始修炼。\'
      +'Lv.2: 你可以在第 11 级开始修炼。\'
      +'Lv.3: 你可以在第 16 级开始修炼。\\'
      +'|{cmd}<返回/@helpbooks>'
      );

end;

procedure _help23;
begin
This_Npc.NpcDialog(This_Player,
      '爆裂火焰你可以按如下步骤修炼：\'
      +'Lv.1: 你可以在第 22 级开始修炼。\'
      +'Lv.2: 你可以在第 27 级开始修炼。\'
      +'Lv.3: 你可以在第 31 级开始修炼。\\'
      +'|{cmd}<返回/@helpbooks>'
      );

end;

procedure _help31;
begin
This_Npc.NpcDialog(This_Player,
      '治愈术你可以按如下步骤修炼：\'
      +'Lv.1 : 你可以在第 7 级开始修炼.\'
      +'Lv.2 : 你可以在第 11 级开始修炼.\'
      +'Lv.3 : 你可以在第 16 级开始修炼. \\'
      +'  <返回/@helpbooks>'
      );

end;

procedure _help32;
begin
This_Npc.NpcDialog(This_Player,
      '精神力战法你可以按如下步骤修炼：\'
      +'Lv.1 : 你可以在第 9 级开始修炼.\'
      +'Lv.2 : 你可以在第 13 级开始修炼.\'
      +'Lv.3 : 你可以在第 19 级开始修炼.\\'
      +'  <返回/@helpbooks>'
      );

end;

procedure _help33;
begin
This_Npc.NpcDialog(This_Player,
      '施毒术你可以按如下步骤修炼：\'
      +'Lv.1 : 你可以在第 14 级开始修炼.\'
      +'Lv.2 : 你可以在第 17 级开始修炼.\'
      +'Lv.3 : 你可以在第 20 级开始修炼.\\'
      +'|{cmd}<返回/@helpbooks>'
      
      
      
      
      
      
      );

end;

procedure _talk;
begin
This_Npc.NpcDialog(This_Player,
      '我是这里的学者兼教师,我对我的学生很严厉\'
      +'因为我想让他们尽快的成材\\'
      +'|{cmd}<再多聊聊/@new>\'
      +'|{cmd}<返回/@Main>\\'
      );

end;

procedure _new;
var
num,duramax,duraav : integer;
num_1,duramax_1,duraav_1 : integer;
begin
   This_Player.CheckBagItemEx('鸡肉',num,duramax,duraav);
   This_Player.CheckBagItemEx('肉',num_1,duramax_1,duraav_1);
    if (This_Player.GetBagItemCount('佛牌') >= 1) and (This_Player.GetV(11,7) = 5) then
    begin
        if This_Player.Level >= 11 then
        begin
        This_Player.Take('佛牌',1);
        This_Player.SetV(11,7,100);
        This_Npc.NpcDialog(This_Player,
              '这是我那屠夫学生送给我的佛牌吗?\'
              +'想不到他也会想的到我....\'
              +'' + This_Player.Name + ',谢谢你啊!\'
              +'这块佛牌我收下了!\\'
              +'|{cmd}<确定/@exit>'
              );
        
        end else
        begin
        This_Player.Take('佛牌',1);
        This_Player.SetV(11,7,10);
        This_Npc.NpcDialog(This_Player,
              '这是我那屠夫学生送给我的佛牌吗?\'
              +'想不到他也会想的到我....\'
              +'真是谢谢你了!\'
              +'这块佛牌我收下了\'
              +'但今晚的晚宴还缺一些材料啊\'
              +'你能帮我找来吗?\\'
              
              +'|{cmd}<可以/@new2_21>,我很乐意帮助你\'
              +'|{cmd}<抱歉/@new2_22>,我很忙,帮不了你\'
              );
        
        end;
    
    end else
    if This_Player.GetV(11,7) = 10 then
    begin
   

        if (num >= 5) and (duramax > 4500) and  (num_1 >= 5) and (duramax_1 > 11500) then 
        begin
            This_Player.Take('鸡肉',5);
            This_Player.Take('肉',5);
            This_Player.AddGold(1000);
    
    
            if This_Player.Level >= 11 then
            begin
            This_Npc.NpcDialog(This_Player,
                  '多谢你送给我这些肉\'
                  +'这些钱是给你的报酬\'
                  +'请务必收下\\'
                  +'|{cmd}<确定/@exit>'
                  
                  );
                 This_Player.SetV(11,7,100);
            end else
            begin
                This_Player.SetV(11,7,11);
                 This_Npc.NpcDialog(This_Player,
                  '年轻人\'
                  +'真是太感谢你了\'
                  +'' + This_Player.Name + '\'
                  +'这个名字将来一定会传遍整个大陆的\'
                  +'这是我家代代相传的一条传统项链\'
                  +'送给你做个纪念吧!\'
                  
                  +'|{cmd}<接受/@new3_21>\'
                  +'助人为快乐之本,<我不能要/@new3_22>'
                  
                  
                  );
            
            end;
          
        end else
        This_Npc.NpcDialog(This_Player,
              '这是我那屠夫学生送给我的佛牌吗?\'
              +'想不到他也会想的到我....\'
              +'真是谢谢你了!\'
              +'这块佛牌我收下了\'
              +'但今晚的晚宴还缺一些材料啊\'
              +'你能帮我找来吗?\\'
              
              +'|{cmd}<可以/@new2_21>,我很乐意帮助你\'
              +'|{cmd}<抱歉/@new2_22>,我很忙,帮不了你\'
              );
    end else
    if This_Player.GetV(11,7) = 11 then
    This_Npc.NpcDialog(This_Player,
                  '年轻人\'
                  +'真是太感谢你了\'
                  +'' + This_Player.Name + '\'
                  +'这个名字将来一定会传遍整个大陆的\'
                  +'这是我家代代相传的一条传统项链\'
                  +'送给你做个纪念吧!\'
                  
                  +'|{cmd}<接受/@new3_21>\'
                  +'助人为快乐之本,<我不能要/@new3_22>'
                  
                  
                  )
    else if This_Player.GetV(11,7) = 12 then 
    This_Npc.NpcDialog(This_Player,
      '飞天武馆在比奇城的右上方\'
      +'比奇城在比奇省的中部\'
      +'坐标300,300左右的地方\'
      +'祝你一路顺风!这样我再给你点路费,你就不要推辞了\\'
      +'|{cmd}<收取路费/@lufei>'
      )
    else
    begin
    This_Npc.NpcDialog(This_Player,
          '而我这里的藏书算是应有尽有了,但还是比比奇城堡差了些\'
          +'比奇城堡的书店是由一对双生兄弟所经营的店铺\'
          +'如果这里没有你要的书,你可以去那里看看\\'
          +'|{cmd}<返回/@Main>'
          );
    
    end;
end;







procedure _new2_22;
begin
This_Npc.NpcDialog(This_Player,
      '真是可惜了\'
      +'那再见了\'
      +'|{cmd}<再见/@exit>'
      );

end;

procedure _new2_21;
begin
This_Npc.NpcDialog(This_Player,
      '真的吗?太好了非常感谢你啊\'
      +'请帮我找5块品质12以上的肉\'
      +'和5块品质5以上的鸡肉\'
      +'如果找到的话请尽快给我\'
      
      +'|{cmd}<接受/@new2_211>\'
      +'|{cmd}<太难了/@new2_212>,我完成不了'
      );

end;

procedure _new2_212;
begin
This_Npc.NpcDialog(This_Player,
      '这样啊\'
      +'那我还是找别人帮忙吧!佛牌我就拿走了\'
      );

end;

procedure _new2_211;
begin
This_Npc.NpcDialog(This_Player,
      '在这个村子周围有很多鹿啊,鸡啊\'
      +'你应该能在这里得到足够的肉\'
      +'|{cmd}<确定/@exit>'
      );

end;


procedure _new3_21;
begin
    if This_Player.GetV(11,7) = 11 then
    begin
      This_Player.Give('传统项链',1);
      This_Player.SetV(11,7,100);
      This_Npc.NpcDialog(This_Player,
      '戴上它吧\'
      +'希望能对你有所帮助\'
      +'不要再留恋这个小村庄了\'
      +'勇敢的青年啊!快去创造奇迹!\\'
      +'|{cmd}<再见/@exit>'
      );
    end;
end;

procedure _new3_22;
begin
    if This_Player.GetV(11,7) = 11 then
    begin
    This_Player.Give('祈福项链',1);
    This_Player.SetV(11,7,12);
    This_Npc.NpcDialog(This_Player,
      '真的吗?\'
      +'你是我这么多年来见过的心肠最好的人了!\'
      +'既然你执意如此,我也不勉强你了\'
      +'我想你一定愿意再帮我一次.\'
      +'我有一个侄子在比奇城飞天武馆教人武功\'
      +'你帮我把这条祈福项链送给他吧!\'
      +'千万不要丢在路上啊!\\'
      +'|{cmd}<询问/@ask>武馆的位置\'
      +'|{cmd}<确定/@exit>'
      
      
      );
    end;
end;

procedure _ask;
begin
    This_Npc.NpcDialog(This_Player,
      '飞天武馆在比奇城的右上方\'
      +'比奇城在比奇省的中部\'
      +'坐标300,300左右的地方\'
      +'祝你一路顺风!这样我再给你点路费,你就不要推辞了\\'
      +'|{cmd}<收取路费/@lufei>'
      );

end;

procedure _lufei;
begin
    if This_Player.GetV(11,7) = 12 then
    begin
       This_Player.SetV(11,7,13);
      This_Player.AddGold(180);
      This_Npc.NpcDialog(This_Player,
            '收好,不要给人抢了哦\\'
            +'|{cmd}<再见了/@exit>'
            );
    end;
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
  This_NPC.FillGoods('大火球', 100, 1);
  This_NPC.FillGoods('攻杀剑术', 100, 1);
  This_NPC.FillGoods('施毒术', 100, 1);
  This_NPC.FillGoods('抗拒火环', 100, 1);
  This_NPC.FillGoods('地狱火', 100, 1);
  This_NPC.FillGoods('雷电术', 100, 1);
  This_NPC.FillGoods('疾光电影', 100, 1);
  This_NPC.FillGoods('灵魂火符', 100, 1);
  This_NPC.FillGoods('幽灵盾', 100, 1);
  This_NPC.FillGoods('神圣战甲术', 100, 1);
  This_NPC.FillGoods('刺杀剑术', 100, 1);
  This_NPC.FillGoods('困魔咒', 100, 1);
  This_NPC.FillGoods('召唤骷髅', 100, 1);
  This_NPC.FillGoods('隐身术', 100, 1);
  This_NPC.FillGoods('集体隐身术', 100, 1);
  This_NPC.FillGoods('诱惑之光', 100, 1);
  This_NPC.FillGoods('瞬息移动', 100, 1);
  This_NPC.FillGoods('火墙', 100, 1);
  This_NPC.FillGoods('爆裂火焰', 100, 1);
  This_NPC.FillGoods('地狱雷光', 100, 1);
  This_NPC.FillGoods('半月弯刀', 100, 1);
  This_NPC.FillGoods('野蛮冲撞', 100, 1);
  This_NPC.FillGoods('心灵启示', 100, 1);
  This_NPC.FillGoods('群体治愈术', 100, 1);
  This_NPC.FillGoods('魔法盾', 100, 1);
  This_NPC.FillGoods('圣言术', 100, 1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.    