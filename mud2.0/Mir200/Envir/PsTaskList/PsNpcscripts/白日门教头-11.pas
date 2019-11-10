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
    if This_Player.GetV(1,400) = 0 then
    This_Npc.NpcDialog(This_Player,
   '破关珍剑? 哦...看来学徒们和你说了一些废话 \ \'
   +'对我们这些修道的人来说，\\'
   +'那种废铁是没用的... \ \\'
   +'|{cmd}<原来如此, 破关珍剑真的存在吗?/@next> \\'
   +'|{cmd}<原来如此. 看来不能依靠身外之物./@deney>\') 
   else
   This_Npc.NpcDialog(This_Player,
   '如果你实在很好奇, 那就去找馆主吧.. \ \\'
   +'|{cmd}<关闭/@exit>\');
end;

procedure _deney; 
begin
This_Npc.NpcDialog(This_Player,
   '对，就要这样. 我要好好教训这些不懂事的家伙 \\'
   +'请施主避开一会儿. \ \\'
   +'|{cmd}<关闭/@exit>\');

end;

procedure _next; 
begin
This_Npc.NpcDialog(This_Player,
   '破关珍剑是我们道馆镇馆之宝... \\'
   +'那是许多年以前的事情了\\'
   +'我也是听馆主无意中谈起才知道的... \ \\'
   +'|{cmd}<关闭/@exit>\');
This_Player.SetV(1,400,1);
end;

//脚本执行的入口
begin
  domain;
end.