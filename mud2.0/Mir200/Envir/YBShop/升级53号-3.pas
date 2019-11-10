

 procedure _sj53;                         
begin
   This_Npc.NpcDialog(This_Player,
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
   '|{cmd}<开始升级/@y1>\ \'+
   

    '|{cmd}<返回/@main>');


end;


Procedure DuanZaoMB(tu01:string; tu02:string; tu03:string; DZItem:string);
Begin
if ( This_Player.GetBagItemCount(tu01) >= 1 ) and ( This_Player.GetBagItemCount(tu02) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu03) >= 1 ) 
      and ( This_Player.YBNum >= 20000) then
   begin
      This_Player.Take(tu01,1);
      This_Player.Take(tu02,1);
      This_Player.Take(tu03,1);
     
      This_Player.Give(DZItem,1);
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
end;

procedure _y1;                         
begin
   This_Npc.NpcDialog(This_Player,
   '升级53号勋章所需物品：\'+
   '元宝：2W，\'+
   '43号勋章，44号勋章，45号勋章\ \'+
   '进行<锻造/@makey1>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey1;
Begin
   if This_Player.YBNum >= 20000 then
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20190,20000,1); 
   DuanZaoMB('荣誉勋章43号','荣誉勋章44号','荣誉勋章45号','荣誉勋章53号');
end;




//脚本执行的入口
Begin
   This_Npc.NpcDialog(This_Player,
   '我这里可以用元宝升级勋章！\'+
   '升级物品不需要消耗时间，百分百升级成功，\'+
   '如果你有43号，44号，45号荣誉勋章，可以到\'+   
   '我这里升级成53号勋章，防魔6-7，攻魔道6-7\'+   
     
   '|{cmd}<升级53号勋章/@sj53>'); 

end.    