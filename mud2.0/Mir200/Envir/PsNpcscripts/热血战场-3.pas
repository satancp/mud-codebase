{********************************************************************


*******************************************************************}

program mir2;

procedure _leiyan;
begin
  if (This_Player.GetBagItemCount('会员回收箱') > 0) then
   
    
  begin
     if compareText(This_Player.MapName, '3') = 0 then
     begin
        This_Player.Flyto('HL002', 83, 156);
        This_Npc.CloseDialog(This_Player);
		ServerSay('玩家<' + This_Player.Name + '>进入了热血战场', 2);
       
     end;
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你不是会员，无法进入!'
    );
end;

begin

 This_Npc.NpcDialog(This_Player,
   +'<★★★★★★热血战场★★★★★★/c=red>\|'
   +'年轻人，你想要终极装备吗？\|'
   +'如果你拥有<会员回收箱/c=red>证明你是会员，我可以将你传送到热血战场\|'
   +'里面隐藏着大量未知生物，你想前往挑战吗？\\|'
  
   +'|{cmd}<我是会员，我要前往!/@leiyan>'      
    );  
end.