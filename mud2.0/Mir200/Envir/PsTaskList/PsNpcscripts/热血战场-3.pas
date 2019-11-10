{********************************************************************


*******************************************************************}

program mir2;

procedure _leiyan;
begin
  if (This_Player.GetBagItemCount('热血凭证') > 0) then
   
    
  begin
     if compareText(This_Player.MapName, '3') = 0 then
     begin
        This_Player.Flyto('HL002', 83, 156);
        This_Npc.CloseDialog(This_Player);
       
     end;
  end
  else
    This_Npc.NpcDialog(This_Player,
      '你不是热血勇士，无法进入，请将热血令牌放在包里!'
    );
end;

begin

 This_Npc.NpcDialog(This_Player,
   '年轻人，你想要终极装备吗？\' +
   '如果你拥有<热血凭证/c=red>，我可以将你传送到神秘洞穴\' +
   '里面隐藏着大量未知生物，你想前往挑战吗？\' +
   '<热血凭证/c=red>可以用积分去金牌尊者处兑换，也可以商城购买.\' +
  
   '|{cmd}<我有热血凭证，前往挑战热血战场/@leiyan>'      
    );  
end.