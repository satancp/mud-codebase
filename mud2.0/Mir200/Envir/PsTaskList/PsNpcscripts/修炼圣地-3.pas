{
*******************************************************************}

Program Mir2;



Procedure _doexit;
begin
   This_NPC.CloseDialog(This_Player);
end;




Procedure _gointo;
begin
   if This_Player.Level < 80 then
   begin
      This_NPC.NpcDialog(This_Player,
      '感谢您，你可以根据自身的实力选择进入修炼场进行修炼，\'+
      '但是需要提醒你，每个修炼场都有三层，危险程度一层比\'+
      '一层高，建议你携带足够补给药品后进入，40级以上修炼无等级限制！\ \'+
      '|{cmd}<骷髅谷(适合15-22级，进入需要5万金币)/@gointo17>\'+
      '|{cmd}<恶虫岛(适合23-30级，进入需要10万金币)/@gointo28>\'+
      '|{cmd}<邪恶谷(适合31-39级，进入需要30万金币)/@gointo35>\'+
      '|{cmd}<勇者殿堂(无限制等级，进入需要1元宝)/@gointo36>\'+
      '|{cmd}<返回/@main>');
   end else          
     begin
       This_NPC.NpcDialog(This_Player,
       '等级大于80级无法进入。'); 
     end;
end;

Procedure _gointo36;
begin
   
   
      if This_Player.YBNum >= 1 then 
   begin
     
         This_Player.RandomFlyTo('n111');
          end; 
       begin
     
       This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20190,1,1);
      end ;
       if This_Player.YBNum >= 1 then
    begin
     This_NPC.NpcNotice('玩家：'+This_Player.Name+'使用1元宝前往勇者殿堂练级！');
    
    end else          
     begin
       This_Player.NotifyClientCommitItem(0,'无法传送：你没有1元宝，需要1元宝。'); 
     end;
  end;
Procedure _gointo35;
begin
   
   
     if This_Player.GoldNum >= 300000 then 
   begin
      
         This_Player.RandomFlyTo('n103');
          end; 
       begin
     
       This_Player.DecGold(300000);
      end ;
      if This_Player.GoldNum >= 300000 then
    begin
     This_NPC.NpcNotice('玩家：'+This_Player.Name+'使用30万金币前往邪恶谷练级！');
    
    end else          
     begin
       This_Player.NotifyClientCommitItem(0,'无法传送：你的金币不足，需要30万金币。'); 
     end;
   
 
end;

Procedure _gointo28;
begin
   
   
     if This_Player.GoldNum >= 100000 then 
   begin
      
         This_Player.RandomFlyTo('n106');
          end; 
       begin
     
       This_Player.DecGold(100000);
      end ;
      if This_Player.GoldNum >= 100000 then
    begin
     This_NPC.NpcNotice('玩家：'+This_Player.Name+'使用10万金币前往恶虫岛练级！');
    
    end else          
     begin
       This_Player.NotifyClientCommitItem(0,'无法传送：你的金币不足，需要10万金币。'); 
     end;
   
 
end;


Procedure _gointo17;
begin
     if This_Player.GoldNum >= 50000 then 
   begin
   
    This_Player.RandomFlyTo('n102');
   end; 
       begin
     
       This_Player.DecGold(50000);
      end ;
      if This_Player.GoldNum >= 50000 then
    begin
     This_NPC.NpcNotice('玩家：'+This_Player.Name+'使用5万金币前往骷髅谷升级！');
    
    end else          
     begin
       This_Player.NotifyClientCommitItem(0,'无法传送：你的金币不足，需要5万金币。'); 
     end;
   
 
end;






begin
      This_NPC.NpcDialog(This_Player,
      '我这里提供便捷的修炼场所，当然需要收取一些费用。\ \'+
      '无限制等级。\ \'+
      
      +'|{cmd}<我要进行修炼/@gointo>\'
     
      
      );
  
end.