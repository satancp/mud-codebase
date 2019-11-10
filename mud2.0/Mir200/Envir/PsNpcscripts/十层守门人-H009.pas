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




procedure _talkwith;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到下一层需要金币  \'
   +'不能让你免费使用 \'
   +'你必须支付1000000金币 \ '
   +'你想花这笔钱吗? \ \'
   +'   '
   +'|{cmd}<移动/@pay1> \'
   +'|{cmd}<退出/@talkwith>'
   
   
   
   );

end;

procedure _pay1;
begin
    if This_Player.GoldNum >= 1000000 then
    begin
     
        This_Player.Flyto('H010',155,157);
        ServerSay('玩家：'+This_Player.Name+'带着他的葵花宝典偷偷潜入了幻境十层,屠龙刀封印又松动了 ！',3);
         This_Player.DecGold(1000000);
    end else
	  
   
    begin
    This_Player.NotifyClientCommitItem(0,'如果你想去，就必须首先给我100万金币，赶快给我吧。');
      
    end ;
    

end;


begin
   This_NPC.NpcDialog(This_Player,
   '呵呵，幻境终于被人发现了！我也没必要再隐瞒什么了。\'
   +'只要你有勇气去幻境挑战，我现在就可以送你！\ \'
   +'|{cmd}<去下一层/@talkwith>\'
   +'|{cmd}<确定/@exit>'   
   );

end.