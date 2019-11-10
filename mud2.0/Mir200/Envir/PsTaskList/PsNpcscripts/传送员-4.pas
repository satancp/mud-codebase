{
*******************************************************************}

Program Mir2;



Procedure _doexit;
begin
   This_NPC.CloseDialog(This_Player);
end;


Procedure _exit;
begin
   This_NPC.CloseDialog(This_Player);
end;



procedure _weixian; 
begin
 
      This_NPC.NpcDialog(This_Player,
      '现在您可以自己去探索玛法大陆的秘密了。\ \'+
     
     
      '|{cmd}<前往蜈蚣洞穴/@M1>          ^<前往祖玛寺庙/@M2>\'
      +'|{cmd}<前往石墓洞穴/@M3>          ^<前往毒蛇矿区/@M4>\' 
      +'|{cmd}<前往尸魔洞穴/@M5>          ^<前往骨魔洞穴/@M6>\' 
      +'|{cmd}<前往牛魔洞穴/@M7>          ^<前往封魔矿区/@M8>\'
      +'|{cmd}<前往赤月峡谷/@M9>          ^<前往尸王殿/@M10>\' 
    
      );
   
end;

procedure _M10; 
 var
 GoldNum:integer;
begin
   if This_Player.GoldNum >= 100000 then 
   begin
       This_Player.Flyto('Q004',14,14);
   end;  
       
    begin
     
     This_Player.DecGold(100000);
    end ;
      if This_Player.GoldNum >= 100000 then
    begin
     This_NPC.NpcNotice('玩家：'+This_Player.Name+'使用10万金币前往尸王殿！');
    
    end else          
     begin
       This_Player.NotifyClientCommitItem(0,'无法传送：你的金币不足，需要10万金币。'); 
     end;
   

end;

procedure _M9; 
begin
This_Player.Flyto('11',357,248);
end;

procedure _M1; 
begin
This_Player.Flyto('3',142,98);
end;

procedure _M2; 
begin
This_Player.Flyto('3',855,186);
end;

procedure _M3; 
begin
This_Player.Flyto('3',295,341);
end;

procedure _M4; 
begin
This_Player.Flyto('2',556,176);
end;

procedure _M5; 
begin
This_Player.Flyto('5',521,616);
end;

procedure _M6; 
begin
This_Player.Flyto('5',543,133);
end;

procedure _M7; 
begin
This_Player.Flyto('5',660,465);
end;

procedure _M8; 
begin
This_Player.Flyto('4',60,69);
end;





procedure _moveBQ; 
begin
This_Player.Flyto('0',333,274);
end;

procedure _moveBQ_1; 
begin
This_Player.Flyto('3',330,330);
end;

procedure _moveBQ_2; 
begin
This_Player.Flyto('11',176,326);
end;


procedure _moveBQ_3; 
begin
This_Player.Flyto('4',242,202);
end;

procedure _moveBQ_4; 
begin
This_Player.Flyto('2',500,485);
end;

procedure _moveBQ_5; 
begin
This_Player.Flyto('5',142,331);
end;


procedure _moveBQ_6; 
begin
This_Player.Flyto('0122',14,41);
end;



procedure _anquan; 
begin
 
      This_NPC.NpcDialog(This_Player,
      '现在您可以自己去探索玛法大陆的秘密了。\ \'+
     
     
      '|{cmd}<前往比奇/@MoveBQ>            ^<前往盟重/@MoveBQ_1>\'
      +'|{cmd}<前往白日门/@MoveBQ_2>          ^<前往封魔谷/@MoveBQ_3>\' 
      +'|{cmd}<前往毒蛇山谷/@MoveBQ_4>        ^<前往苍月岛/@MoveBQ_5>\' 
      +'|{cmd}<前往比奇皇宫/@MoveBQ_6>  \' 

      );
   
end;


begin
 
      This_NPC.NpcDialog(This_Player,
      '现在您可以自己去探索玛法大陆的秘密了。\ \'+
     
     
      '|{cmd}<★★★安全区域传送★★★/@anquan>\'
   
      +'|{cmd}<★★★危险区域传送★★★/@weixian>\' 
      );
   
end.