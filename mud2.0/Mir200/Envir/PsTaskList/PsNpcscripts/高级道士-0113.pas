{********************************************************************

*******************************************************************}
procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain;
begin
    IF This_Player.GetV(9,6) = 1 then
    begin
       This_NPC.NpcDialog(This_Player,
       '你是不是已经拿到了书? \'
       +'如果你拿到了治愈术就(双击鼠标左键) \'
       +'那样书就会渐渐消失同时也学会了这项技能,功能键是按F11 \'
       +'点选上面显示的技能,就可以设置快捷键来使用. \'
       +'现在你去比奇城找书店老板 \'
       +'他会告诉你技能的升级方式\ \'
       +'|{cmd}<退  出/@exit>'
       );
    
    
    end else
    IF This_Player.GetV(9,1) = 1 then
    begin
       IF This_Player.Level >= 7 then
       This_NPC.NpcDialog(This_Player,
       '我先要考验你的武功, 这里有很多羊 鹿 鸡 \'
       +'五分钟内将它们杀死,再和我说话 \ \'
       +'|{cmd}<退 出/@Q706_1>'
       )
       else
       This_NPC.NpcDialog(This_Player,
       '我叫大飞圣僧,很高兴认识你...\'
       +'对于道士职业你从其他NPC那里了解了很多了吧 \'
       +'道士第一个武功是治愈术 \'
       +'只有等级到了7级才能使用\'
       +'到时候你再来找我吧 \ \'
       +'|{cmd}<退 出/@exit>'
       );
    end else
     This_NPC.NpcDialog(This_Player,
       '我叫大飞圣僧,你叫什么名字? \'
       +'不愿意告诉我? 嗳.. 算了 \'
       +'那你就忙去吧 \ \'
       +'|{cmd}<退  出/@exit>'
       );
end;

procedure call_back;
begin
    if This_Player.MapName = '01132' then
    This_Player.RandomFlyTo('0113');
end;

procedure _Q706_1;
begin
   if CheckOtherMapHum('01132') > 0 then
   This_NPC.NpcDialog(This_Player,
   '现在这里正有一个人在进行试练 \'
   +'很抱歉,你稍微等一下吧. \ \'
   +'|{cmd}<退  出/@exit>'
   )
   else
   begin
       This_NPC.ClearMon('01132'); 
       This_NPC.CreateMon('01132',10,10,10,'鹿',10);
       This_NPC.CreateMon('01132',10,10,10,'鸡',10);
       This_NPC.CreateMon('01132',10,10,10,'羊',10);
       This_Player.RandomFlyTo('01132');
       This_Player.CallOut(This_Npc, 300, 'call_back')
   
   end
end;

begin
    domain;
end.