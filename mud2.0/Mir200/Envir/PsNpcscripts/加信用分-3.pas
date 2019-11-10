{
*******************************************************************}


program mir2;

 function getXYstr(Num:integer) : string; 
var temp_xy,temp_xy1,temp_xy2 : integer; 
begin 
    temp_xy1 := This_Player.GetActivePoint; 
    temp_xy2 := This_Player.GetTmpActivePoint;
    temp_xy :=temp_xy1+temp_xy2;
    case Num of
    0: result := inttostr(temp_xy);
    1: result := inttostr(temp_xy1);
    2: result := inttostr(temp_xy2);
    end;   
end;  




procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;
Procedure _xinyong;
begin
   if This_Player.GoldNum >= 100000 then  
     begin 
      This_Player.IncActivePoint(1);  //增加信用分1
      This_Player.DecGold(100000);
      This_NPC.NpcNotice('恭喜'+ This_Player.Name+'在盟重信用大使处增加1点信用分，信用分30以上可以验证成为传奇用户！'); 
      
     end else 
     begin
      This_Npc.NpcDialog(This_Player,
          '金币不足10万! '  );
     end;
  
    
     
    
end;





Begin
   This_Npc.NpcDialog(This_Player,
   '当前服务器开启验证功能，未验证用户金币携带不得大于200W\'+
   '丢弃物品其他玩家无法拾取，信用分可以通过击杀BOSS获得，也可以在我这里可以用10万金币换一点信用分\'+
   '信用分大于30分，可以在老兵和仓库处验证。\'+
   '你当前的传奇信用分为<' + getXYstr(0) + '/c=red>分，其中临时信用分为<' + getXYstr(2) + '/c=red>分，\'+
   '|{cmd}<10万换1点信用分/@xinyong>');    


end.    