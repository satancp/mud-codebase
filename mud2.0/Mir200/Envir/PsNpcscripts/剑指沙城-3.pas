{
*******************************************************************}

Program Mir2;



Procedure _doexit;
begin
   This_NPC.CloseDialog(This_Player);
end;

//==============================================================新手任务 


procedure _shamen;
begin
   if This_Player.YBNum >= 5 then 
begin
This_Player.Flyto('3',674,332);
end else
   begin
      This_NPC.NpcDialog(This_Player,
      '对不起，你元宝不足。');
  end;
end;


procedure _fuhuo;
begin
   if This_Player.YBNum >= 5 then 
begin
This_Player.Flyto('3',650,292);
end else
   begin
      This_NPC.NpcDialog(This_Player,
      '对不起，你元宝不足。');
  end;
end;


procedure _yifu;
begin
   if This_Player.YBNum >= 5 then 
begin
This_Player.Flyto('3',665,284);
end else
   begin
      This_NPC.NpcDialog(This_Player,
      '对不起，你元宝不足。');
  end;
end;


procedure _wuqi;
begin
   if This_Player.YBNum >= 5 then 
begin
This_Player.Flyto('3',637,311);
end else
   begin
      This_NPC.NpcDialog(This_Player,
      '对不起，你元宝不足。');
  end;
end;



   begin
      This_NPC.NpcDialog(This_Player,
	+'我可以直接把你送到沙巴克皇宫哦！\'
	+'每传送一次我要收取5个元宝的路费！'
    +'|{cmd}<沙正大门/@shamen>   <沙复活点/@fuhuo>\\'
    +'|{cmd}<沙衣服店/@yifu>    <沙武器店/@wuqi>\\' 
      );
   end.
