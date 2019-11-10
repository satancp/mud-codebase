{********************************************************************

*******************************************************************}
procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain;
begin
    IF  This_Player.GetV(9,6) = 1 then
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
       This_Player.RandomFlyTo('0113');
    end else
    if CheckOtherMapMon('01152') > 0 then
    begin

         This_NPC.NpcDialog(This_Player,
         '你还没有抓到怪物,已经没有时间了 \'
         +'快点行动吧,祝你好运 \ \'
         +'|{cmd}<退  出/@exit>'
         );

    end else
    begin
        IF (This_Player.FreeBagNum > 0)  then
        begin
           This_Player.Give('治愈术',1);
           This_Player.SetV(9,6,1);
           
           This_NPC.NpcDialog(This_Player,
           '考验已经通过了,你可以做我的徒弟\'
           +'祝贺你... 我先教你7级时候的基本技能治愈术 \ \'
           +'|{cmd}<退  出/@exit>'
           );
  
        end else
       This_NPC.NpcDialog(This_Player,
       '你的包裹已经装满了,给我腾出地方来.. \ \'
       +'|{cmd}<退  出/@exit>'
       );

    end;
end;



begin
    domain;
end.