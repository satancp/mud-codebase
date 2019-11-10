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
       +'请双击那本基本剑术书（双击鼠标的左键），\'
       +'书会消失，你也已经学到了这个功夫，\'
       +'它会使你的能力中增加命中率，\'
       +'你的功夫越深你的命中率也就越高。\'
       +'现在你可以去比奇省的书店， \'
       +'书店的主人会交你更加厉害。 \ '
       +'比奇书店的坐标是323，247，你去吧。\'
       +'|{cmd}<关闭/@exit>'
       );
       This_Player.RandomFlyTo('0114');
    
    end else
    IF CheckOtherMapMon('01142') > 0 then
    begin
    
       This_NPC.NpcDialog(This_Player,
       '还没有抓到怪物?没时间了\'
       +'快点吧.. 祝你好运 \ \'
       +'|{cmd}<取消/@exit>'   
       )
    end 
    else
    begin
        IF (This_Player.GetV(9,6) <= 0) and (This_Player.FreeBagNum > 0)  then
        begin
             This_Player.Give('基本剑术',1);
             This_Player.SetV(9,6,1);
           This_NPC.NpcDialog(This_Player,
           '好，你已经具备资格做我的徒弟\'
           +'祝贺你啊... \'
           +'给你基本剑术到了7级之后练，祝贺你 \ \'
           +'|{cmd}<取消/@exit>'
           );
        end else
       This_NPC.NpcDialog(This_Player,
       '你的包里东西已经满了，快清理一下吧.. \ \'
       +'|{cmd}<取消/@exit>'
       );
    end;
end;



begin
    domain;
end.