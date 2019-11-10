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
        if This_Player.MyLFnum >= 5 then  
    begin   
       if This_Player.Level < 50 then
       begin                 
         This_Player.CallOut(This_Npc, 1, 'MFBG2');
        This_Player.RandomFlyTo('0139~1');
		ServerSay('土豪玩家<' + This_Player.Name + '>进入了灵符泡点地图,升级快人一步！', 2);
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
   
       end 
       else  
       begin
          This_Player.FlyTo('3', 333, 333);
           This_Npc.NpcDialog(This_Player,
        '等级大于50级，无法进入。'
        );   
        end; 
    end 
   else  
   begin
       This_Player.FlyTo('3', 333, 333);
       This_Npc.NpcDialog(This_Player,
       '灵符不足了。'
   );   
   end; 
end; 

procedure MFBG2;
begin
   if This_Player.MyLFnum >= 5 then
   begin
          if This_Player.Level < 50 then
      begin
         if CompareText(This_Player.MapName,'0139~1') = 0 then
         begin
            This_Player.CallOut(This_Npc, 1, 'MFBG2');
            This_Player.Give('经验',500000);
            This_Player.DecLF(0,5,false);
    
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
          '等级大于50级，无法继续泡点。'
           ); 
        end;
        
         end 
         else
        begin
          This_Player.FlyTo('3', 333, 333);
         This_Npc.NpcDialog(This_Player,
          '灵符不足，无法继续泡点。'
           ); 
        
        
      end;
   end;
   
   
procedure _YBBG1; 
var
  temp1,temp2 : integer;
begin
  if (GetHour = 11) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<8点00分/c=red>和<16点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 20) and (GetMin < 00) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<8点00分/c=red>和<16点00分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else 
  if (GetHour = 11) and (GetMin >= 00) and (GetMin < 59) then
  begin
    if temp1 = -1 then
    begin
      temp1 := 0;
    end
    if temp1 = GetDateNum(GetNow) then
    begin
      This_Player.CallOut(This_Npc, 1, 'MFBG25');
        This_Player.RandomFlyTo('0139~2');
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
    end
    else
    begin
      temp1 := GetDateNum(GetNow);
      This_Player.CallOut(This_Npc, 1, 'MFBG25');
        This_Player.RandomFlyTo('0139~2');
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
  
    end;
  end
  else if (GetHour = 20) and (GetMin >= 00) and (GetMin < 59) then
  begin
    if temp2 = -1 then
    begin
      temp2 := 0;
    end
    if temp2 = GetDateNum(GetNow) then
    begin
      This_Player.CallOut(This_Npc, 1, 'MFBG25');
        This_Player.RandomFlyTo('0139~2');
        ServerSay('玩家★★★【' + This_Player.Name + '】★★★进入激情闭关，此活动每天开放2次！！',3); 
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
    end
    else
    begin
      temp2 := GetDateNum(GetNow);
      This_Player.CallOut(This_Npc, 1, 'MFBG25');
        This_Player.RandomFlyTo('0139~2');
        ServerSay('玩家★★★【' + This_Player.Name + '】★★★进入激情闭关，此活动每天开放2次！！',3);
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 

    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '现在还不到时候，活动将在每天的11点00分和20点00分开放进入！\你过段时间再来吧。\ \');
  end;
end;


procedure MFBG25;

begin
  
      if ((GetHour = 11) or(GetMin < 59)) and ((GetHour = 20) or(GetMin < 59)) then
         
      begin
         if CompareText(This_Player.MapName,'0139~2') = 0 then
         begin
            This_Player.CallOut(This_Npc, 1, 'MFBG25');
            This_Player.Give('经验',10000);
         end ;  
         end else 
         begin
          
             This_Player.FlyTo('3', 333, 333);
            ServerSay('激情闭关活动结束，请等待下次开放时间！',3); 
             
            
         end ; 
        
end;



procedure _YBBG2; 

begin 
    if This_Player.Level < 60then       
  begin         
        if This_Player.MyLFnum >= 200 then  
    begin   
       
                       
         This_Player.CallOut(This_Npc, 1, 'MFBG22');
        This_Player.RandomFlyTo('0116~1');
		ServerSay('土豪玩家<' + This_Player.Name + '>进入了灵符泡点地图,升级快人一步！', 2);
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
   
       
    end 
   else  
   begin
       This_Player.FlyTo('3', 333, 333);
       This_Npc.NpcDialog(This_Player,
      '灵符大于200才能进入。'
      ); 
   end;  
  end 
  else
  begin
       This_Player.FlyTo('3', 333, 333);
         This_Npc.NpcDialog(This_Player,
          '等级大于60级，无法继续闭关。'
           ); 
  end;
end;
 

procedure MFBG22;
begin
    if This_Player.Level < 60 then
    begin
       if This_Player.MyLFnum >= 10 then
       begin
         if CompareText(This_Player.MapName,'0116~1') = 0 then
         begin
            This_Player.CallOut(This_Npc, 1, 'MFBG22');
            This_Player.Give('经验',1000000);
            This_Player.DecLF(0,10,false);
           end;
           end 
         else  
          begin
          
             This_Player.FlyTo('3', 333, 333);
               This_Npc.NpcDialog(This_Player,
              '你的灵符不足，自动取消闭关，返回土城。'
               );   
             
           end; 
    end  
    else  
    begin
          This_Player.FlyTo('3', 333, 333);
               This_Npc.NpcDialog(This_Player,
              '你的等级到达60级，自动取消闭关。'
               );   
         end;
end;
    
       
procedure _YBBG3; 

begin  
    if (This_Player.GetBagItemCount('会员回收箱') > 0) then    
  begin            
        if This_Player.MyLFnum >= 500 then  
    begin   
       
                       
         This_Player.CallOut(This_Npc, 1, 'MFBG23');
        This_Player.RandomFlyTo('0116~2');
		ServerSay('土豪玩家<' + This_Player.Name + '>进入了会员泡点地图,升级快人一步！', 2);
        This_Npc.NpcDialog(This_Player,
         ' 请好好把握这幸福的时光。'
         ); 
   
       
    end 
   else  
   begin
       This_Player.FlyTo('3', 333, 333);
       This_Npc.NpcDialog(This_Player,
       '灵符大于500才能进入。'
        );   
   end;
  end 
  else
  begin
       This_Player.FlyTo('3', 333, 333);
         This_Npc.NpcDialog(This_Player,
          '进入失败，只有本服会员才可以进入。'
           ); 
  end; 
end; 

procedure MFBG23;
begin
   if This_Player.MyLFnum >= 20 then 
   begin
         if CompareText(This_Player.MapName,'0116~2') = 0 then
         begin
            This_Player.CallOut(This_Npc, 1, 'MFBG23');
            This_Player.Give('经验',2000000);
            This_Player.DecLF(0,20,false);
    
           end;
           end 
         else  
          begin
          
             This_Player.FlyTo('3', 333, 333);
               This_Npc.NpcDialog(This_Player,
              '你的灵符不足，自动取消闭关，返回土城。'
               );   
             
            
           end ; 
  end ;     
      
     
   
   
   
      

begin
   This_NPC.NpcDialog(This_Player,
   '|欢迎您：\'+
   '|我这里可以进入闭关修炼房间\'+
   '|激情闭关每天的11点00分和20点00分开放,每次开放时间1小时，每秒10000经验 \'+
   '|初级闭关每秒消耗5灵符，每秒50W经验，可以修炼到50级 \'+
   '|中级闭关每秒消耗10灵符，每秒100W经验，可以修炼到60级\ '+
   '|高级闭关每秒消耗20灵符，每秒200W经验，可以修炼到70级，每两小时刷新一只<爆不爆谁知道/c=red>,爆率超高。\ '+
   '|{cmd}<◆激情闭关◆/@YBBG1>\ '+
   '|{cmd}<◆初级灵符闭关◆/@YBBG>\ '+
   '|{cmd}<◆中级灵符闭关◆/@YBBG2>\ '+
   '|{cmd}<◆高级灵符闭关◆/@YBBG3>');
end.    