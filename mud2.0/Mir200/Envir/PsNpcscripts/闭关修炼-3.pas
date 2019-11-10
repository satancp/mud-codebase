     {
*******************************************************************}

program Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

function Gaoji0LB(price, num: Integer):boolean;
begin                                               

  result := true;
end;

procedure _YBBG; 

begin            
        if This_Player.YBNum >= 1 then  
    begin   
       if This_Player.Level < 80 then
       begin                 
         This_Player.CallOut(This_Npc, 1, 'MFBG2');
        This_Player.RandomFlyTo('0139~1');
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
   
       end 
       else  
       begin
          This_Player.FlyTo('3', 333, 333);
           This_Npc.NpcDialog(This_Player,
        '等级大于80级，无法进入。'
        );   
        end; 
    end 
   else  
   begin
       This_Player.FlyTo('3', 333, 333);
       This_Npc.NpcDialog(This_Player,
   '元宝不足了。'
   );   
   end; 
end; 

procedure MFBG2;
begin
   if This_Player.YBNum >= 1 then
   begin
          if This_Player.Level < 80 then
      begin
         if CompareText(This_Player.MapName,'0139~1') = 0 then
         begin
            This_Player.CallOut(This_Npc, 1, 'MFBG2');
            This_Player.Give('经验',300000);
            This_Player.PsYBConsum(This_NPC,'Gaoji0LB',20051,1,1);
    
           end 
         else  
          begin
          
             This_Player.FlyTo('3', 333, 333);
          
             
            
         end ; 
          end 
         else
        begin
           This_Player.FlyTo('3', 333, 333);
         This_Npc.NpcDialog(This_Player,
          '等级大于80级，无法继续泡点。'
           ); 
        end;
      end;
   end;


begin
   This_NPC.NpcDialog(This_Player,
   '土豪闭关：\|'
   +'欢迎来到土豪闭关.\|'
   +'进入每秒扣除<1元宝/c=red>，获得<30W/c=red>经验.\|'
   +'想要强大就得快人一步\|'
   +'元宝泡点无等级限制.\|'
   +'|{cmd}<◆元宝闭关/@YBBG>');
end.    