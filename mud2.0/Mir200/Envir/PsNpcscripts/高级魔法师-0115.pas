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
       '你不是已经收到书了吗？如果已收到书，\'
       +'请双击那本火球术书（双击鼠标的左键），\'
       +'书会消失，你也已经学到了这个功夫，\'
       +'按f11键就可以确认武功\'
       +'设定武功的方法是点击武功画面，指定键盘，按指定键盘就可以发功\'
       +'现在你可以去比奇省的书店， \'
       +'书店的主人会交你更加厉害。 \ '
       +'比奇书店的坐标是323，247，你去吧。\'
       +'|{cmd}<关闭/@exit>'
       
       );
    
    end else
    IF This_Player.GetV(9,1) = 1 then
    begin
       IF This_Player.Level >= 7 then
       This_NPC.NpcDialog(This_Player,
       '我来测验一下你的能力，\'
       +'有很多绵羊，鹿，鸡等妖怪，限你在5分钟之内把它们抓完，再和我进行对话。\ \'
       +'|{cmd}<关闭/@Q706_1>'   
       )
       else
       This_NPC.NpcDialog(This_Player,
       '我是高级法师，很高兴见到你，\'
       +'至于你的魔法师职业，我听向导了解了很多，\'
       +'法师的第一个功夫就是火球术，\'
       +'练这个武功要求你的级别是7级，\'
       +'先练练你的能力再来吧。\ \'
       +'|{cmd}<关闭/@exit>'
       
       );
    
    end else
    begin
       This_NPC.NpcDialog(This_Player,
       '我是高级法师，你叫什么? \'
       +'不告诉我?嗯.. 我知道了 \'
       +'你继续做你的事情吧 \ \'
       +'|{cmd}<取消/@exit>'
       );
    
    end;
end;


procedure call_back;
begin
    if This_Player.MapName = '01152' then
    This_Player.RandomFlyTo('0115');
end;

procedure _Q706_1;
begin
    IF CheckOtherMapHum('01152') > 0 then
    begin 
       This_NPC.NpcDialog(This_Player,
       '现在有人在接受我的测验，\'
       +'请你等他测试完，很抱歉。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end else
    begin
        This_NPC.ClearMon('01152');
        This_NPC.CreateMon('01152',19,19,10,'鹿',10);
        This_NPC.CreateMon('01152',19,19,10,'鸡',20);
        This_NPC.CreateMon('01152',19,19,10,'羊',10);
        This_Player.RandomFlyTo('01152');
        This_Player.CallOut(This_Npc, 300, 'call_back');
    end;
end;

begin
    domain;
end.