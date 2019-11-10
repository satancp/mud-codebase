
function AutoClothersMapOpen() :boolean;  //按达到等级人数 
var MplayerNum : integer; 
begin
    result := false;
    MplayerNum := 6; 
    if GetG(2,2) < 0 then SetG(2,2,0);
     
    if GetG(2,2) >= MplayerNum then result := true
    else
    begin
        This_Npc.NpcDialog(This_Player,
      '相传在玛法大陆的某些角落，有一批恶魔镇守着六件重装，\想要获得这些宝物，就必须首先要杀死这些恶魔，\无数的人为了获得这些宝物，不惜以自己的生命作为代价，\ 有些人成功了，更多的勇士则倒在了恶魔的脚下，\ 如果有'+inttostr(MplayerNum)+'位勇士等级达到40级，地图封印才会解除。\'
      +'|<解除地图封印还需要'+inttostr(MplayerNum - GetG(2,2))+'位勇士达到40级。/c=red>\'
      );
      exit;
    end; 
   
end;

procedure _goToMonMap_1;   
begin   
    if This_Player.MapName = '3' then   
    This_Player.Flyto('D711',200 + random(3) - 1,204 + random(3) - 1);   
end;  
procedure _goToMonMap_2;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往石墓二层，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往石墓二层/@goToMonMap_2_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_2_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D712',367 + random(3) - 1,223 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_3;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往石墓三层，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往石墓三层/@goToMonMap_3_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_3_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D713',35 + random(3) - 1,190 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_4;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往石墓四层，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往石墓四层/@goToMonMap_4_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_4_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D714',387 + random(3) - 1,187 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_5;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往石墓五层，不过必须首先给我2万金币。\ \' 
    +'|{cmd}<前往石墓五层/@goToMonMap_5_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_5_1;  
begin  
    if This_Player.GoldNum >= 20000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(20000);  
        This_Player.Flyto('D715',30 + random(3) - 1,340 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我2万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_6;   
begin   
    if This_Player.MapName = '3' then   
    This_Player.Flyto('D501',174 + random(3) - 1,221 + random(3) - 1);   
end;  
procedure _goToMonMap_7;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往祖玛寺庙二层，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往祖玛寺庙二层/@goToMonMap_7_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_7_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D502',174 + random(3) - 1,221 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_8;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往祖玛寺庙三层，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往祖玛寺庙三层/@goToMonMap_8_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_8_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D503',174 + random(3) - 1,221 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_9;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往祖玛寺庙四层，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往祖玛寺庙四层/@goToMonMap_9_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_9_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D504',174 + random(3) - 1,221 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_10;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往祖玛寺庙五层，不过必须首先给我2万金币。\ \' 
    +'|{cmd}<前往祖玛寺庙五层/@goToMonMap_10_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_10_1;  
begin  
    if This_Player.GoldNum >= 20000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        if This_Player.GetActivePoint + This_Player.GetTmpActivePoint >= 10 then
        This_Player.DecGold(20000);  
        This_Player.Flyto('D505',100 + random(3) - 1,100 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我2万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_11;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往祖玛阁，不过必须首先给我3万金币。\ \' 
    +'|{cmd}<前往祖玛阁/@goToMonMap_11_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_11_1;  
begin  
    if This_Player.GoldNum >= 30000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        if This_Player.GetActivePoint + This_Player.GetTmpActivePoint >= 30 then  
        This_Player.DecGold(30000);  
        This_Player.Flyto('D5061',10 + random(3) - 1,14 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我3万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_12;   
begin   
    if This_Player.MapName = '3' then   
    This_Player.Flyto('D601',205 + random(3) - 1,235 + random(3) - 1);   
end;  
procedure _goToMonMap_13;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往地牢一层北，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往地牢一层北/@goToMonMap_13_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_13_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D603',78 + random(3) - 1,87 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_14;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往地牢一层西2，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往地牢一层西2/@goToMonMap_14_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_14_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D604',145 + random(3) - 1,135 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_15;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往地牢一层西，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往地牢一层西/@goToMonMap_15_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_15_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D602',109 + random(3) - 1,93 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_16;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往地牢一层北2，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往地牢一层北2/@goToMonMap_16_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_16_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D605',46 + random(3) - 1,22 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_17;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往传奇部落，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往传奇部落/@goToMonMap_17_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_17_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D614',72 + random(3) - 1,68 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_18;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往邪恶势力，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往邪恶势力/@goToMonMap_18_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_18_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D615',60 + random(3) - 1,85 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_19;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往幽冥圣域，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往幽冥圣域/@goToMonMap_19_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_19_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D616',21 + random(3) - 1,24 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_20;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往恐怖空间，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往恐怖空间/@goToMonMap_20_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_20_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '3' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D617',53 + random(3) - 1,45 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_21;   
begin   
    if This_Player.MapName = '4' then   
    This_Player.Flyto('D2000',175 + random(3) - 1,100 + random(3) - 1);   
end;  
procedure _goToMonMap_22;   
begin   
    if This_Player.MapName = '4' then   
    This_Player.Flyto('D2001',256 + random(3) - 1,266 + random(3) - 1);   
end;  
procedure _goToMonMap_23;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往连接通道，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往连接通道/@goToMonMap_23_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_23_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '4' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D2002',31 + random(3) - 1,34 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_24;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往疾风殿，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往疾风殿/@goToMonMap_24_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_24_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '4' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D2004',75 + random(3) - 1,70 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_25;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往光芒回廊，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往光芒回廊/@goToMonMap_25_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_25_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '4' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D2005',80 + random(3) - 1,80 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_26;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往烈焰殿，不过必须首先给我2万金币。\ \' 
    +'|{cmd}<前往烈焰殿/@goToMonMap_26_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_26_1;  
begin  
    if This_Player.GoldNum >= 20000 then 
    begin 
        if This_Player.MapName = '4' then 
        begin 
        This_Player.DecGold(20000);  
        This_Player.Flyto('D2006',70 + random(3) - 1,75 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我2万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_27;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往雷霆之路，不过必须首先给我3万金币。\ \' 
    +'|{cmd}<前往雷霆之路/@goToMonMap_27_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_27_1;  
begin  
    if This_Player.GoldNum >= 30000 then 
    begin 
        if This_Player.MapName = '4' then 
        begin 
        This_Player.DecGold(30000);  
        This_Player.Flyto('D2007',180 + random(3) - 1,175 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我3万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_28;   
begin   
    if This_Player.MapName = '5' then   
    This_Player.Flyto('D2051',110 + random(3) - 1,175 + random(3) - 1);   
end;  
procedure _goToMonMap_29;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往尸魔洞二层，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往尸魔洞二层/@goToMonMap_29_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_29_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D2053',195 + random(3) - 1,270 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_30;   
begin   
    if This_Player.MapName = '5' then   
    This_Player.Flyto('D2061',22 + random(3) - 1,168 + random(3) - 1);   
end;  
procedure _goToMonMap_31;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往骨魔洞二层，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往骨魔洞二层/@goToMonMap_31_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_31_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D2062',30 + random(3) - 1,22 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_32;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往骨魔洞三层，不过必须首先给我15000金币。\ \' 
    +'|{cmd}<前往骨魔洞三层/@goToMonMap_32_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_32_1;  
begin  
    if This_Player.GoldNum >= 15000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(15000);  
        This_Player.Flyto('D2063',91 + random(3) - 1,167 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我15000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_33;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往骨魔洞四层，不过必须首先给我2万金币。\ \' 
    +'|{cmd}<前往骨魔洞四层/@goToMonMap_33_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_33_1;  
begin  
    if This_Player.GoldNum >= 20000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(20000);  
        This_Player.Flyto('D2064',15 + random(3) - 1,35 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我2万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_34;   
begin   
    if This_Player.MapName = '5' then   
    This_Player.Flyto('D2071',220 + random(3) - 1,220 + random(3) - 1);   
end;  
procedure _goToMonMap_35;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往牛魔寺庙二层，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往牛魔寺庙二层/@goToMonMap_35_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_35_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D2072',150 + random(3) - 1,115 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_36;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往牛魔寺庙三层，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往牛魔寺庙三层/@goToMonMap_36_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_36_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D2073',160 + random(3) - 1,160 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_37;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往牛魔寺庙四层，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往牛魔寺庙四层/@goToMonMap_37_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_37_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D2075',40 + random(3) - 1,105 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_38;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往牛魔寺庙五层，不过必须首先给我2万金币。\ \' 
    +'|{cmd}<前往牛魔寺庙五层/@goToMonMap_38_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_38_1;  
begin  
    if This_Player.GoldNum >= 20000 then 
    begin 
        if This_Player.MapName = '5' then 
        begin 
        This_Player.DecGold(20000);  
        This_Player.Flyto('D2076',91 + random(3) - 1,129 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我2万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_39;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('D001',160 + random(3) - 1,355 + random(3) - 1);   
end;  
procedure _goToMonMap_40;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('D002',200 + random(3) - 1,200 + random(3) - 1);   
end;  
procedure _goToMonMap_41;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('D003',200 + random(3) - 1,150 + random(3) - 1);   
end;  
procedure _goToMonMap_42;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('D011',150 + random(3) - 1,360 + random(3) - 1);   
end;  
procedure _goToMonMap_43;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('D012',193 + random(3) - 1,203 + random(3) - 1);   
end;  
procedure _goToMonMap_44;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('E001',19 + random(3) - 1,19 + random(3) - 1);   
end;  
procedure _goToMonMap_45;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('E002',88 + random(3) - 1,16 + random(3) - 1);   
end;  
procedure _goToMonMap_46;   
begin   
    if This_Player.MapName = '0' then   
    This_Player.Flyto('D401',27 + random(3) - 1,178 + random(3) - 1);   
end;  
procedure _goToMonMap_47;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往废矿区东部，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往废矿区东部/@goToMonMap_47_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_47_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '0' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D402',142 + random(3) - 1,107 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_48;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往矿区一层，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往矿区一层/@goToMonMap_48_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_48_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '0' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D403',90 + random(3) - 1,90 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_49;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往矿区B二层，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往矿区B二层/@goToMonMap_49_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_49_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '0' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D404',100 + random(3) - 1,100 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_50;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往矿物回收站，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往矿物回收站/@goToMonMap_50_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_50_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '0' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D405',106 + random(3) - 1,61 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_51;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往废矿区南部，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往废矿区南部/@goToMonMap_51_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_51_1;  
begin  
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '0' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D406',138 + random(3) - 1,118 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_52;   
begin   
    if This_Player.MapName = '1' then   
    This_Player.Flyto('D021',72 + random(3) - 1,70 + random(3) - 1);   
end;  

procedure _goToMonMap_53;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往沃玛寺庙一层，不过必须首先给我5000金币。\ \' 
    +'|{cmd}<前往沃玛寺庙一层/@goToMonMap_53_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  

procedure _goToMonMap_53_1;   
begin          
    if This_Player.GoldNum >= 5000 then 
    begin 
        if This_Player.MapName = '1' then 
        begin 
        This_Player.DecGold(5000);  
        This_Player.Flyto('D022',340 + random(3) - 1,360 + random(3) - 1);   
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 

procedure _goToMonMap_54;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往沃玛寺庙二层，不过必须首先给我8000金币。\ \' 
    +'|{cmd}<前往沃玛寺庙二层/@goToMonMap_54_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_54_1;  
begin  
    if This_Player.GoldNum >= 8000 then 
    begin 
        if This_Player.MapName = '1' then 
        begin 
        This_Player.DecGold(8000);  
        This_Player.Flyto('D023',205 + random(3) - 1,200 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我8000金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_55;   
begin   
    if This_Player.MapName = '2' then   
    This_Player.Flyto('D421',32 + random(3) - 1,365 + random(3) - 1);   
end;  
procedure _goToMonMap_56;   
begin   
    if This_Player.MapName = '2' then   
    This_Player.Flyto('D422',180 + random(3) - 1,185 + random(3) - 1);   
end;  
procedure _goToMonMap_57;   
begin   
    if This_Player.MapName = '11' then   
    This_Player.Flyto('12',320 + random(3) - 1,465 + random(3) - 1);   
end;  
procedure _goToMonMap_58;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往赤月峡谷南入口，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往赤月峡谷南入口/@goToMonMap_58_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_58_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '11' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D10012',40 + random(3) - 1,275 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_59;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往赤月峡谷广场，不过必须首先给我2万金币。\ \' 
    +'|{cmd}<前往赤月峡谷广场/@goToMonMap_59_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_59_1;  
begin  
    if This_Player.GoldNum >= 20000 then 
    begin 
        if This_Player.MapName = '11' then 
        begin 
        This_Player.DecGold(20000);  
        This_Player.Flyto('D1002',220 + random(3) - 1,260 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我2万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_60;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往左回廊，不过必须首先给我5万金币。\ \' 
    +'|{cmd}<前往左回廊/@goToMonMap_60_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_60_1;  
begin  
    if This_Player.GoldNum >= 50000 then 
    begin 
        if This_Player.MapName = '11' then 
        begin 
        This_Player.DecGold(50000);  
        This_Player.Flyto('D10031',285 + random(3) - 1,150 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_61;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往抉择之地，不过必须首先给我10万金币。\ \' 
    +'|{cmd}<前往抉择之地/@goToMonMap_61_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_61_1;  
begin  
    if This_Player.GoldNum >= 100000 then 
    begin 
        if This_Player.MapName = '11' then 
        begin 
        This_Player.DecGold(100000);  
        This_Player.Flyto('D1004',105 + random(3) - 1,195 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我10万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_62;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往赤月峡谷东入口，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往赤月峡谷东入口/@goToMonMap_62_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_62_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '11' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D10013',285 + random(3) - 1,280 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_63;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往右回廊，不过必须首先给我5万金币。\ \' 
    +'|{cmd}<前往右回廊/@goToMonMap_63_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_63_1;  
begin  
    if This_Player.GoldNum >= 50000 then 
    begin 
        if This_Player.MapName = '11' then 
        begin 
        This_Player.DecGold(50000);  
        This_Player.Flyto('D10032',15 + random(3) - 1,151 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 
 
procedure _goToMonMap_64;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往赤月峡谷北入口，不过必须首先给我1万金币。\ \' 
    +'|{cmd}<前往赤月峡谷北入口/@goToMonMap_64_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  
 
procedure _goToMonMap_64_1;  
begin  
    if This_Player.GoldNum >= 10000 then 
    begin 
        if This_Player.MapName = '11' then 
        begin 
        This_Player.DecGold(10000);  
        This_Player.Flyto('D10011',268 + random(3) - 1,380 + random(3) - 1); 
        end;  
    end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我1万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'); 
end; 

procedure _goToMonMap_65;  
begin  
    This_NPC.NpcDialog(This_Player, 
    '我可以送你前往未知暗殿，不过必须首先给我5万金币。\ \' 
    +'|{cmd}<前往未知暗殿/@goToMonMap_65_1>\ \' 
    +'|{cmd}<返回/@main>'  
    ); 
end;  

procedure _goToMonMap_65_1; 
begin 
   if This_Player.GoldNum >= 50000 then 
   begin 
    if (This_Player.MapName = '2') or (This_Player.MapName = '3') then 
    begin
    This_Player.DecGold(50000);  
    This_Player.Flyto('E603',26 + random(3) - 1,183 + random(3) - 1); 
    end;
   end else 
    This_NPC.NpcDialog(This_Player, 
   '如果你想去，就必须首先给我5万金币，赶快给我吧！\ \'+  
   '|{cmd}<返回/@main>'
   );  
end; 