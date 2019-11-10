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

procedure _heard;
begin
   This_NPC.NpcDialog(This_Player,
   '哄他不生气的办法很简单，\'
   +'我想他肯定是要你白给他金矿，而你没给，对吗？\'
   +'我会哄他的。\'
   +'只要你给我5个金矿。\ \'
   +'|{cmd}<给金矿/@heard_1>\'
   +'|{cmd}<拒绝/@noheard>'
   );

end; 

procedure domain;
begin
    IF (This_Player.GetV(8,19) = 1) and
    (This_Player.GetV(8,26) = 1) then
    begin
        IF RANDOM(5) = 0 then
        begin
           This_Player.SetV(8,26,0);
           This_NPC.NpcDialog(This_Player,
           '既然你这样讲话，那我就原谅你吧。\'
           +'但是你不能像对我一样对待卫家店，\'
           +'他和我不一样。他是很小心眼的。\ \'
           +'|{cmd}<好的/@heard>'
           
           );
        
        end
        else
       This_NPC.NpcDialog(This_Player,
       '我不想和像你这样的人再讲下去。\'
       +'马上出去!!\ \'
       +'|{cmd}<关闭/@exit>'
       
       );
    
    end else
    IF (This_Player.GetV(8,19) = 1) and (This_Player.GetV(8,27) = 1) then
    _heard
    
    else 
    //IF This_Player.GetV(8,19) = 1 then
    if (This_Player.GetV(11,5) = 3) and (This_Player.GetV(11,4) = 2) then
    begin
       This_NPC.NpcDialog(This_Player,
       '哎呀，听说惹恼了卫家店？\'
       +'他虽然做的是粗活，\'
       +'但是性格却格外的小气，\'
       +'只有我才有办法哄他不生气，\'
       +'怎么样，想听听吗？\ \'
       +'|{cmd}<听/@heard>\'
       +'|{cmd}<拒绝/@noheard>'
       
       
       
       );
    
    end else
    //IF (This_Player.GetV(8,22) = 1) then
    if (This_Player.GetV(11,5) = 2) and (This_Player.GetV(11,4) = 2) then
    begin
        //IF This_Player.GetV(8,14) <=  0 then

           This_NPC.NpcDialog(This_Player,
           '啊，你是帮助卫家店的那位。\'
           +'我听说过你。\'
           +'你认识现在住在比奇省的铁匠铺老板吗？\'
           +'虽然现在看起来很寒酸，\'
           +'但是以前可是很有名气的匠人，现在是喝酒喝成那个样子。\'
           +'我替你和比奇省铁匠铺老板讲，你去找他吧。\ \'
           +'|{cmd}<下一个/@next>'
           
           );
        
    end else
    if (This_Player.GetV(11,4) = 6) then 
     begin
           This_NPC.NpcDialog(This_Player,
           '快去找比奇省铁匠铺老板吧。\ \'
           +'|{cmd}<关闭/@exit>'
           );
        
        
          // This_Player.SetV(8,22,0);
     end else
    This_Npc.NpcDialog(This_Player,
      '欢迎光临，有什么事情吗？\ \'
      +'|{cmd}<买戒指/@buy>' + addSpace('', 22) + '^<卖戒指/@sell>\'
      +'|{cmd}<修理戒指/@repair>\'
      +'|{cmd}<特殊修理/@s_repair>\'
      +'|{cmd}<回比奇城/@moveout>\'
      +'|{cmd}<退出/@doexit>'
      );
end;

procedure _moveout;
begin  
    if This_Player.MapName = '0105' then 
    This_Player.Flyto('0',298 + random(3) - 1,289 + random(3) - 1); 
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '要买戒指吗？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '要卖戒指吗？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '要修理戒指吗？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '修理得还算不错。\ \|{cmd}<返回/@main>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|{cmd}<返回/@main>'
  );
end;


procedure _heard_1;
begin
    IF This_Player.GetBagItemCount('金矿') >= 5 then
    begin
    This_Player.Take('金矿',5);
       This_NPC.NpcDialog(This_Player,
       '请稍等，我马上来。\ \'
       +'|{cmd}<过一会儿/@appease>'
       );
    end else
    begin
    
       This_NPC.NpcDialog(This_Player,
       '没有金矿，快去找回来。\ \'
       +'|{cmd}<关闭/@exit>'       
       );
    
    This_Player.SetV(8,27,1);
    end;
end;

procedure _noheard;
begin
This_Player.SetV(8,26,1);
   This_NPC.NpcDialog(This_Player,
   '原来匠人生气有理由啊。\'
   +'这样对待很亲切的人的人，我是第一次见。\'
   +'哼，我也不想和你多说。\'
   +'你走吧。\ \'
   +'|{cmd}<关闭/@exit>'
   );

end;



procedure _appease;
begin
    if (This_Player.GetV(11,5) = 3) and (This_Player.GetV(11,4) = 2) then
    begin
    // This_Player.SetV(8,19,0);
     //This_Player.SetV(8,21,1);
       This_Player.SetV(11,4,3);
       This_NPC.NpcDialog(This_Player,
       '现在好了，你可以去看看卫家店。\ \'
       +'|{cmd}<关闭/@exit>'
       );
    end;
end;



procedure _next;
begin
    if (This_Player.GetV(11,5) = 2) and (This_Player.GetV(11,4) = 2) then
    begin
        //IF This_Player.GetV(8,14) <=  0 then

         This_Player.SetV(11,4,6);
         This_Player.AddGold(5000);
         This_NPC.NpcDialog(This_Player,
         '哎，卫家店把赊账的金矿价钱交给我了，\'
         +'给你，这是500分。\'
         +'他说他只能给你这些。\ \'
         +'|{cmd}<关闭/@exit>'
         );

    end;
end;


//初始化操作
procedure OnInitialize;
begin

  This_Npc.AddStdMode(22);
  This_Npc.AddStdMode(23);
  This_Npc.FillGoods('古铜戒指',3,3);
  This_Npc.FillGoods('六角戒指',3,3);
  This_Npc.FillGoods('玻璃戒指',3,3);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.  