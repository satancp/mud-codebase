{********************************************************************
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}


Program Mir2;


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
	 ServerSay('玩家<' + This_Player.Name + '>使用10万金币前往尸王殿！', 2);
    
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
ServerSay('玩家<' + This_Player.Name + '>进入初级打宝地图蜈蚣洞，祝他好运！', 2);
end;

procedure _M2; 
begin
This_Player.Flyto('3',855,186);
end;

procedure _M3; 
begin
This_Player.Flyto('3',295,341);
ServerSay('玩家<' + This_Player.Name + '>进入初级打宝地图石墓洞穴，祝他好运！', 2);
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
ServerSay('玩家<' + This_Player.Name + '>进入初级打宝地图骨魔洞，祝他好运！', 2);
end;

procedure _M7; 
begin
This_Player.Flyto('5',660,465);
end;

procedure _M8; 
begin
This_Player.Flyto('4',60,69);
ServerSay('玩家<' + This_Player.Name + '>进入初级打宝地图封魔矿区，祝他好运！', 2);
end;

procedure _goToNewMonMap_3; 
begin 
    if This_Player.MapName = '0' then 
    This_Player.Flyto('1',90 + random(3) - 1,285 + random(3) - 1); 
end;



begin
This_Npc.NpcDialog(This_Player,
'<★★★★★★初级打宝★★★★★★/c=red>\'+
   '|我这里可以免费进入初级打宝地图，\ '+
   '|爆率，沃玛级装备，技能书等\'+
   '|尸王殿每30分钟刷新一次，进入需要10W金币\ '+
   '|BOSS：触龙神，沃玛教主，黄泉教主等\'+
   '|{cmd}<前往蜈蚣洞穴/@M1>     ^<前往骨魔洞穴/@M6>\' + 
   '|{cmd}<前往封魔矿区/@M8>     ^<前往石墓洞穴/@M3>\' +
   '|{cmd}<前往沃玛寺庙/@goToNewMonMap_3>     ^<前往尸王殿/@M10>\'
    );  

end.