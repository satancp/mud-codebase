 program mir2;

var
  Snum,HPnum,xiangcha : integer;
procedure _kaiqi;
begin
     snum  := This_Player.GetV(59,6);
     HPnum := This_Player.GetV(59,7);
	 if snum <> 2 then
   begin
       if This_Player.MyLFnum >= 150 then
       begin
	     This_Player.SetV(59,6,-1);
         This_Player.SetV(59,7,-1);
          if snum = -1 then
          begin
            This_Player.DecLF(21250, 150, False);
            This_Player.AddPlayerAbil(4,200,64800);
            This_Player.SetV(59,6,snum+1);
            This_Player.SetV(59,7,HPnum+1);
            This_Npc.CloseDialog(This_Player);
            ServerSay('玩家<' + This_Player.Name + '>开启了练体，HP血量增加了200点，顿时增强了很多 ！ ', 5);
          end 
          This_NPC.NpcDialog(This_Player,
            '花费150灵符可以练体200HP，最多提升三次，增加你自身的HP血量。|'
              +'练体可以临时增加你的属性，杀人夺宝，无往不利 |'
              +'你当前灵符数：<' + inttostr(This_Player.MyLFnum) + '个/c=red>\|'
              +'你当前的连体次数：< ' + inttostr(snum+2) + '次/c=red>\|'
              +'你当前的HP增加：< ' + inttostr((HPnum+2) * 200) + '/c=red>\|'         
              +'<说明/c=red>：持续18小时，下线后不消失，重新计算时间!\|'
              +'|{cmd}   <我还要炼体/@kaiqi1>  \|'
               );

       end else
          This_Player.PlayerNotice('你的灵符数量不足150！', 0);
   end else
          This_Player.PlayerNotice('你已经炼体3次了，不能继续炼体了！', 0);
end;  
 
 procedure _kaiqi1;
begin
   if This_Player.MyLFnum >= 150 then
   begin
      snum  := This_Player.GetV(59,6);
      HPnum := This_Player.GetV(59,7);
      if snum = 0 then
      begin
           This_Player.DecLF(21250, 150, False);
           This_Player.AddPlayerAbil(4,400,64800);
           This_Player.SetV(59,6,snum+1);
           This_Player.SetV(59,7,HPnum+1);
           This_Npc.CloseDialog(This_Player);
           ServerSay('玩家<' + This_Player.Name + '>开启了练体，HP血量增加了200点，顿时增强了很多 ！ ', 5);
      end 
            This_NPC.NpcDialog(This_Player,
            '花费150灵符可以练体200HP，最多提升三次，增加你自身的HP血量。|'
              +'练体可以临时增加你的属性，杀人夺宝，无往不利 |'
              +'你当前灵符数：<' + inttostr(This_Player.MyLFnum) + '个/c=red>\|'
              +'你当前的连体次数：< ' + inttostr(snum+2) + '次/c=red>\|'
              +'你当前的HP增加：< ' + inttostr((HPnum+2) * 200) + '/c=red>\|'         
              +'<说明/c=red>：持续18小时，下线后不消失，重新计算时间!\|'
              +'|{cmd}   <我还要炼体/@kaiqi2>  \|'
               );
   end else
          This_Player.PlayerNotice('你的灵符数量不足150！', 0);
end;

 procedure _kaiqi2;
begin
    if This_Player.MyLFnum >= 150 then
   begin
       snum  := This_Player.GetV(59,6);
       HPnum := This_Player.GetV(59,7); 
      if snum = 1 then
      begin
        This_Player.DecLF(21250, 150, False);
        This_Player.AddPlayerAbil(4,600,64800);
        This_Player.SetV(59,6,snum+1);
        This_Player.SetV(59,7,HPnum+1);
        This_Npc.CloseDialog(This_Player);
       ServerSay('玩家<' + This_Player.Name + '>开启了练体，HP血量增加了200点，顿时增强了很多 ！ ', 5);
      end
	    This_NPC.NpcDialog(This_Player,
            '花费150灵符可以练体200HP，最多提升三次，增加你自身的HP血量。|'
              +'练体可以临时增加你的属性，杀人夺宝，无往不利 |'
              +'你当前灵符数：<' + inttostr(This_Player.MyLFnum) + '个/c=red>\|'
              +'你当前的连体次数：< ' + inttostr(snum+2) + '次/c=red>\|'
              +'你当前的HP增加：< ' + inttostr((HPnum+2) * 200) + '/c=red>\|'         
              +'<说明/c=red>：持续18小时，下线后不消失，重新计算时间!\|'
               );
   end else
          This_Player.PlayerNotice('你的灵符数量不足150！', 0);
end;


 begin
     snum  := This_Player.GetV(59,6);
     HPnum := This_Player.GetV(59,7);
   This_NPC.NpcDialog(This_Player,
    '花费150灵符可以练体200HP，最多提升三次，增加你自身的HP血量。|'
   +'练体可以临时增加你的属性，杀人夺宝，无往不利 |'
   +'你当前灵符数：<' + inttostr(This_Player.MyLFnum) + '个/c=red>\|'
   +'你当前的连体次数：< ' + inttostr(snum+1) + '次/c=red>\|'
   +'你当前的HP增加：< ' + inttostr((HPnum+1) * 200) + '/c=red>\|'         
   +'<说明/c=red>：持续18小时，下线后不消失，重新计算时间!\|'
   +'|{cmd}   <我要炼体/@kaiqi>  \|'
   );
 
 end.