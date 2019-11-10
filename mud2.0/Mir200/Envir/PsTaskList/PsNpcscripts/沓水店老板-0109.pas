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
   '你是来炼什么药？\ \'
   +'|{cmd}<炼药/@makedrug>\'
   +' |<有关毒药听说明./@helpmakedrug>\'
   +'|{cmd}<进行对话./@talkwith>\'
   +'|{cmd}<关闭/@exit>'
   );
end;


procedure _makedrug;
begin
   This_NPC.NpcDialog(This_Player,
   '请选择想炼什么药。\'
   +'所需材料应该带来了吧？\ \'
   +'|{cmd}<返回/@main>'
   );
  This_Npc.Click_Makedrug(This_Player);
end;

procedure _helpmakedrug;
begin
  This_Npc.NpcDialog(This_Player,
  '这里可以炼的药只有两种。\ \'
  +'|{cmd}<灰色毒粉的功能/@helpdrug1>\'
  +'|{cmd}<黄色毒粉的功能/@helpdrug2>\'
  +'|{cmd}<灰色毒粉的原料/@helpmakedrug1>\'
  +'|{cmd}<黄色毒粉的原料/@helpmakedrug2>\'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _helpdrug1;
begin
  This_Npc.NpcDialog(This_Player,
  '道士可以在使施毒术时，用灰色毒粉，\中毒会减掉体力。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpdrug2;
begin
  This_Npc.NpcDialog(This_Player,
  '道士可以在使施毒术时，用黄色毒粉，\中毒会减掉防御能力。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpmakedrug1;
begin
  This_Npc.NpcDialog(This_Player,
  '灰色毒粉的原料有 <食人树的果实/@helpitem_1> 1个，\毒蜘蛛牙齿 2个,\食人树叶 4个。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpmakedrug2;
begin
  This_Npc.NpcDialog(This_Player,
  '黄色毒粉的原料有 <蛆卵/@helpitem_2> 1个, 蝎子的尾巴\1个, 食人树叶 4个。\ \|{cmd}<返回/@helpmakedrug>'
  );
end;

procedure _helpitem_1;
begin
  This_Npc.NpcDialog(This_Player,
  '割食人草可以得到食人树的果实，\但是5个食人草中可以得到果实的，\只有1个。\ \|{cmd}<返回/@helpmakedrug1>'
  );
end;

procedure _helpitem_2;
begin
  This_Npc.NpcDialog(This_Player,
  '抓到洞穴里的洞蛆，就可以得到蛆卵。\长得像圆圆的茧。\ \|{cmd}<返回/@helpmakedrug2>'
  );
end;

procedure _talkwith;
begin 
This_Npc.NpcDialog(This_Player,
      '哈哈哈, ' + This_Player.Name + '是个好名字。\'
      +'我需要5个毒蜘蛛牙齿，能帮我去拿吗？\'
      +'如果你能拿回来，我会给你好价钱的。\ \'
      +'|{cmd}<给5个毒蜘蛛牙齿/@give_st_10>\'
      +'|{cmd}<下次给找。/@i_will_do_next_time>\'
      
      );

end;

procedure _give_st_10;
begin
    IF This_Player.GetBagItemCount('毒蜘蛛牙齿') >= 5 then
    begin
      This_Player.Take('毒蜘蛛牙齿',5);
      This_Player.AddGold(1500);
      IF (random(3) = 0) then
      begin
      This_Npc.NpcDialog(This_Player,
      '我还有另外一个请求，不知道你能不能答应？\'
      +'如果答应，那就太感谢了。\ \'
      +'|{cmd}<接受请求/@ok_order_1>\'
      +'|{cmd}<拒绝请求/@no_order_1>\'
      );
      This_Player.SetS(80,11,1);
      end else
      This_Npc.NpcDialog(This_Player,
      '谢谢你，我给你一个算300元。\'
      +'谢谢，欢迎下次再来。\'
      +'我需要很多毒蜘蛛牙齿，随时都可以拿来。\'
      );
    end else
    This_Npc.NpcDialog(This_Player,
    '我现在很需要5个毒蜘蛛牙齿,\'
    +'请不要开玩笑，快帮我找5个。\'
    );

end;



procedure _ok_order_1;
begin
    IF (This_Player.GetS(80,11) = 1) then
    begin
        if This_Player.FreeBagNum > 0 then
        begin
        This_Player.Give('药剂师的信',1);
        This_Player.SetS(80,11,0);
        This_Npc.NpcDialog(This_Player,
          '' + This_Player.Name + ', 你真是我的好朋友。\'
          +'我要你帮忙的就是，\'
          +'把这封信交给在银杏山谷的我的儿子。\'
          +'在银杏山谷只要提起许中医，无人不知，\'
          +'拜托了。\' 
          );
        end else
        This_Npc.NpcDialog(This_Player,
        '你的包裹太满了！\'
          );
    end;
end;

procedure _no_order_1;
begin
This_Npc.NpcDialog(This_Player,
      '既然你说没时间，那我也没办法。\'
      +'下次有时间，就帮我忙吧。\'
      +'再见\'
      
      );

end;

procedure _i_will_do_next_time;
begin
This_NPC.CloseDialog(This_Player);
end;




procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('灰色药粉(少量)',1,1);
  This_Npc.FillGoods('黄色药粉(少量)',1,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.
   