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
var
num,duramax,duraav : integer;
num_1,duramax_1,duraav_1 : integer;
begin
   This_Player.CheckBagItemEx('鸡肉',num,duramax,duraav);
   This_Player.CheckBagItemEx('肉',num_1,duramax_1,duraav_1);
   
   This_Player.PlayerNotice('鸡肉:' + inttostr(num) + '-' + inttostr(duramax),2);
   This_Player.PlayerNotice('肉:' + inttostr(num_1) + '-' + inttostr(duramax_1),2);

    if (num >= 5) and (duramax > 3500) and  (num_1 >= 5) and (duramax_1 > 9500) then 
    begin
        This_Player.Take('鸡肉',5);
        This_Player.Take('肉',5);
        
        if This_Player.Level >= 11 then
        begin
            This_Player.AddGold(1000);
           This_NPC.NpcDialog(This_Player,
           '多谢你送给我这些肉\'
           +'这些钱是给你的报酬\'
           +'请务必收下\\'
           +'|<确定/@exit>'
           );
        
        end
        else
        begin
           This_NPC.NpcDialog(This_Player,
           '年轻人\'
           +'真是太感谢你了\'
           +'你叫' + This_Player.Name + '?\'
           +'这个名字将来一定会传遍整个大陆的\'
           +'这是我家祖传的一条传统项链\'
           +'送给你做个纪念吧!\'
           
           +'|<接受/@new3_21>\'
           +'助人为快乐之本,<我不能要/@new3_22>'
           
           );
        
        end;
    end else
    This_NPC.NpcDialog(This_Player,
   '你是来炼什么药？\ \'
   +'|<炼/@makedrug>药\'
   +' 有关毒药<听说明./@helpmakedrug>\'
   +'|<进行对话./@news>\'
   +'|<关闭/@exit>'
   );
end;


procedure _makedrug;
begin
   This_NPC.NpcDialog(This_Player,
   '请选择想炼什么药。\'
   +'所需材料应该带来了吧？\ \'
   +'|<返回/@main>'
   );
  This_Npc.Click_Makedrug(This_Player);
end;
procedure _helpmakedrug;
begin
  This_Npc.NpcDialog(This_Player,
  '这里可以炼的药只有两种。\ \'
  +'|<灰色毒粉/@helpdrug1>的功能\'
  +'|<黄色毒粉/@helpdrug2>的功能\'
  +'|<灰色毒粉/@helpmakedrug1>的原料\'
  +'|<黄色毒粉/@helpmakedrug2>的原料\'
  +'|<返回/@main>'
  );
end;

procedure _helpdrug1;
begin
  This_Npc.NpcDialog(This_Player,
  '道士可以在使施毒术时，用灰色毒粉，\中毒会减掉体力。\ \|<返回/@helpmakedrug>'
  );
end;

procedure _helpdrug2;
begin
  This_Npc.NpcDialog(This_Player,
  '道士可以在使施毒术时，用黄色毒粉，\中毒会减掉防御能力。\ \|<返回/@helpmakedrug>'
  );
end;

procedure _helpmakedrug1;
begin
  This_Npc.NpcDialog(This_Player,
  '灰色毒粉的原料有 <食人树的果子/@helpitem_1> 2个，\毒蜘蛛牙齿 4个,\食人树叶 8个。\ \|<返回/@helpmakedrug>'
  );
end;

procedure _helpmakedrug2;
begin
  This_Npc.NpcDialog(This_Player,
  '黄色毒粉的原料有 <蛆卵/@helpitem_2> 2个, 蝎子的尾巴\4个, 食人树叶 8个。\ \|<返回/@helpmakedrug>'
  );
end;

procedure _helpitem_1;
begin
  This_Npc.NpcDialog(This_Player,
  '切就食人草可以得到食人树的果子，\但是5个食人草中可以得到果实的，\只有1个。\ \|<返回/@helpmakedrug1>'
  );
end;

procedure _helpitem_2;
begin
  This_Npc.NpcDialog(This_Player,
  '抓到洞穴里的洞蛆，就可以得到蛆卵。\长得像圆圆的茧。\ \|<返回/@helpmakedrug2>'
  );
end;


procedure _new3_21;
begin
This_Player.Give('传统项链',1);
   This_NPC.NpcDialog(This_Player,
   '戴上它吧\'
   +'希望能对你有所帮助\'
   +'不要再留恋这个小村庄了\'
   +'勇敢的少年啊!快去创造奇迹!\\'
   +'|<再见/@exit>'
   );

end;

procedure _new3_22;
begin
   This_Player.Give('疗伤药',1);
   This_NPC.NpcDialog(This_Player,
   '真的吗?\'
   +'你是我这么多年来见过的心肠最好的人了!\'
   +'既然你执意如此,我也不勉强你了\'
   +'我想你一定愿意再帮我一次.\'
   +'我有一个儿子在比奇城飞天武馆教人武功\'
   +'你帮我把这瓶疗伤药送给他吧!\'
   +'千万不要丢在路上啊!\\'
   +'|<询问/@ask>武馆的位置\'
   +'|<确定/@exit>'
   
   );

end;

procedure _ask;
begin
   This_NPC.NpcDialog(This_Player,
   '飞天武馆在比奇城的右上方\'
   +'比奇城在比奇省的中部\'
   +'坐标300,300左右的地方\'
   +'祝你一路顺风!这样我再给你点路费,不要推辞哦\\'
   +'|<收取路费/@lufei>'
   );

end;


procedure _lufei;
begin
This_Player.AddGold(200);
   This_NPC.NpcDialog(This_Player,
   '收好,不要给人偷了哦\\'
   +'|<再见了/@exit>'
   
   );

end;

procedure _news;
begin
    if This_Player.GetBagItemCount('薄荷叶') >= 1 then
    begin
        if This_Player.Level >= 11 then
        begin
        This_Player.Take('薄荷叶',1);
           This_NPC.NpcDialog(This_Player,
           '这是那个经常和我吵架的屠夫送给我的薄荷叶吗?\'
           +'想不到他会这样....\'
           +'' + This_Player.Name + ',你真不错啊!\'
           +'看在你的面子上这薄荷叶我就收下了!\\'
           +'|<确定/@exit>'
           );
        
        end else
        begin
           This_Player.Take('薄荷叶',1);
           This_NPC.NpcDialog(This_Player,
           '这是那个莽撞的屠夫让你送来的吗?\'
           +'真想不到他的心挺细的\'
           +'真是谢谢你了!\'
           +'看在你的面子上这薄荷叶我就收下了\'
           +'但今晚的晚宴还缺一些材料啊\'
           +'你能帮我找来吗?\\'
           
           +'|<可以/@new2_21>,我很乐意帮助你\'
           +'|<抱歉/@new2_22>,我很忙,帮不了你\'
           
           );
        
        end;
    end
    else
    begin
    if random(2) = 0 then
    
       This_NPC.NpcDialog(This_Player,
       '我店里的许中医远近闻名,啥毛病都能治!\'
       +'他在比奇城里药店的父亲\'
       +'也是很有名的药剂师哦\\'
       +'|<返回/@Main>'
       
       )
       else
       This_NPC.NpcDialog(This_Player,
       '今天我要大宴宾客\'
       +'但是还缺少5块好鹿肉和5块好鸡肉\'
       +'怎么办啊?\\'
       +'|<返回/@Main>'
       );
    
    end;
end;









procedure _new2_22;
begin
   This_NPC.NpcDialog(This_Player,
   '真是可惜\'
   +'再见了\\'
   +'|<再见/@exit>' 
   );

end;

procedure _new2_21;
begin
   This_NPC.NpcDialog(This_Player,
   '真的吗?太好了\'
   +'请帮我找5块品质12以上的肉\'
   +'和5块品质5以上的鸡肉\'
   +'如果找到的话请尽快给我\'
   
   +'|<接受/@new2_211>\'
   +'|<太难了/@new2_212>,我完成不了'
   );

end;

procedure _new2_212;
begin
   This_NPC.NpcDialog(This_Player,
   '这样啊\'
   +'那我找别人帮忙吧!\\'
   +'|<确定/@exit>'
   );

end;

procedure _new2_211;
begin
   This_NPC.NpcDialog(This_Player,
   '在这个村子周围有很多鹿啊,鸡啊\'
   +'你能在这里得到足够的肉\'
   +'|<确定/@exit>'
   );

end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('灰色药粉(少量)',1,1);
  This_Npc.FillGoods('黄色药粉(少量)',1,1);
  This_Npc.FillGoods('灰色药粉(中量)',1,1);
  This_Npc.FillGoods('黄色药粉(中量)',1,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.