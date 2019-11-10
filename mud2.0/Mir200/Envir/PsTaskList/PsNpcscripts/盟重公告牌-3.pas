{
*******************************************************************}

program Mir2;

{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas}

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end; 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;
var
goldPigId : integer;

procedure _move;
begin
   This_NPC.NpcDialog(This_Player,
   '你想移动到哪里去呢？\'+
   '|{cmd}<向白日门移动/@move1>                       \'+
   '|{cmd}<向毒蛇山谷移动/@move2>                     \'+
   '|{cmd}<想去苍月岛/@move4>\'+
   '|{cmd}<想去魔龙城/@move6>\'+
   '|{cmd}<挑战暗之祖玛教主/@zuma>\'+
   '|{cmd}<返回/@main>');
end;

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

procedure _zuma;
begin
   if AutoOpen(2) then
   begin
   This_NPC.NpcDialog(This_Player,
   '我可以送你前往祖玛大厅，不过必须首先给我10万金币。\'+
   '目前玛法大陆魔物骚乱，魔王派出了手下的精英怪物占据了<祖玛神殿/c=red>\'+
   '<七层大厅/c=red>，此地图现在异常凶险，如果没有足够的传奇信用分我是不\'+
   '会放你进去送死的。\'+
   '你当前的传奇信用分为<' + getXYstr(0) + '/c=red>分，其中临时信用分为<' + getXYstr(2) + '/c=red>分，\'+
   '进入此地图需要达到<30/c=red>分。\ \'+     
   '|{cmd}<前往祖玛大厅/@dating>             ^<前往祖玛神殿七层1/@goToMonMap_1>\'
   +ActiveValidateStr
   );
   end else
   This_NPC.NpcDialog(This_Player,
   '我可以送你前往祖玛大厅，不过必须首先给我1万金币。\'+
   '目前玛法大陆魔物骚乱，魔王派出了手下的精英怪物占据了<祖玛神殿/c=red>\'+
   '<七层大厅/c=red>，此地图现在异常凶险，如果没有足够的传奇信用分我是不\'+
   '会放你进去送死的。\'+
   '你当前的传奇信用分为<' + getXYstr(0) + '/c=red>分，其中临时信用分为<' + getXYstr(2) + '/c=red>分，\'+
   '进入此地图需要达到<30/c=red>分。<（当前可直接进入，'+inttostr(AutoOpenDay(2))+'天后开启验证）/c=red>\ \'+     
   '|{cmd}<前往祖玛大厅/@dating>             ^<前往祖玛神殿七层1/@goToMonMap_1>\'
   +ActiveValidateStr
   );
end;

procedure _goToMonMap_1;  
begin  
    if This_Player.MapName = '3' then  
    This_Player.FlyTo('D5072' , 10 , 55);  
end;                      

procedure _dating;
begin
   if This_Player.GoldNum >= 100000 then
   begin
      if compareText(This_Player.MapName,'3') = 0 then
      begin
         if This_Player.GetActivePoint + This_Player.GetTmpActivePoint >= 30 then
         This_Player.DecGold(100000);
         
         This_Player.Flyto('D5071',9,11);
      end;
   end else
   begin 
      This_NPC.NpcDialog(This_Player,
      '如果你想去，就必须首先给我10万金币，赶快给我吧！\ \'+ 
      '|{cmd}<返回/@main>');
   end;
end;

procedure _move6;
begin
   if compareText(This_Player.MapName,'3') = 0 then
      This_Player.Flyto('6',121,154);
end;

procedure _move4;
begin
   if compareText(This_Player.MapName,'3') = 0 then
   begin
      This_Player.Flyto('5',140,330);
   end;
end;

procedure _move2;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到毒蛇山谷需要金币。\'+ 
   '不能让你免费使用，你必须支付1000金币！\'+ 
   '你想花这笔钱吗？\ \'+  
   '|{cmd}<移动/@pay2>\'+ 
   '|{cmd}<退出/@talkwith>');
end;

procedure _talkwith;
begin
   This_NPC.NpcDialog(This_Player,
   '有人挖了一条通道，\'+
   '通过这个通道， 可以马上到达白日门。。 \'+
   '你想快速到达那里吗？ \ \'+
   '|{cmd}<向通道移动/@move1>\'+
   '|{cmd}<向毒蛇山谷移动/@move2>\'+
   '|{cmd}<返回/@main>');
end;

procedure _pay2;
begin
   if This_Player.GoldNum >= 1000 then
   begin
      if compareText(This_Player.MapName,'3') = 0 then
      begin
         This_Player.DecGold(1000);
         This_Player.Flyto('3',521,764);
      end;
   end else
   begin 
      This_NPC.NpcDialog(This_Player,
      '你在开玩笑吧？这点钱也没有。。。 \'+
      '还想移动？ 我不想再见到你。。。\ \'+ 
      '|{cmd}<返回/@main>');
   end;
end;

procedure _move1;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到通道需要金币。\'+ 
   '不能让你免费使用，你必须支付1000金币！\'+ 
   '你想花这笔钱吗？\ \'+  
   '|{cmd}<移动/@pay1>\'+ 
   '|{cmd}<退出/@talkwith>');
end;

procedure _pay1;
begin
   if This_Player.GoldNum >= 1000 then
   begin
      if compareText(This_Player.MapName,'3') = 0 then
      begin
         This_Player.DecGold(1000);
         This_Player.Flyto('D701',108,155);
      end;
   end else
   begin 
      This_NPC.NpcDialog(This_Player,
      '你在开玩笑吧？这点钱也没有。。。 \'+
      '还想移动？ 我不想再见到你。。。\ \'+ 
      '|{cmd}<返回/@main>');
   end;
end;

procedure _swz;
begin
  This_Npc.NpcDialog(This_Player,
  '我可以帮你使用声望值来消减PK值，\每一点声望值可以帮你消减100点PK值。\ \'
  +'|{cmd}<消减100点PK值/@decpkdecsw>\'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _decpkdecsw;
begin
   if This_Player.MyPkpoint >= 100 then
   begin
      if This_Player.MyShengwan >= 1 then
      begin
         This_Player.MyShengwan := This_Player.MyShengwan-1;
         This_Player.DecPkPoint(100);
      end
      else
      begin
         This_Npc.NpcDialog(This_Player,
         '对不起，你没有声望，不能消减PK值！'
         );
      end;
   end
   else
   begin
      This_Npc.NpcDialog(This_Player,
      '你现在不需要消减PK值！' 
      );
   end;
end;

procedure Execute;
var
BookCanyon_div,BookCanyon_mod,tempNow , tempTime :integer;
pigRdm ,pigX , pigY :integer;
pigStr : string;
begin
   //战争地图
   tempNow := GetDateNum(GetNow) *10000 +(GetHour * 100) + (GetMin);
   tempTime := tempNow mod 10000;
   if GetG(36,36) <> tempNow then
   begin 
   
     
   
     if ((GetHour = 19) or (GetHour = 21) or (GetHour = 23) )and (GetMin = 0) then
     begin 
       if GetHour = 19 then
       begin  
       This_NPC.NpcNotice('不祥的黑影自苍月蔓延，牛魔王分裂出吸收了混沌之力的分身--混沌牛魔王与数不胜数的混沌魔物，鲸吞蚕食玛法大陆上的生灵。');
       This_NPC.NpcNotice('混沌牛魔王的活动的区域失去了规则的制约，敌人的概念变得模糊不清，在此区域攻击任何敌人都将不受惩罚。');
       end;
       
       if (This_NPC.CheckMapMonByName('D5071','混沌牛魔王') = 0) then
       begin
       This_NPC.CreateMon('D5071',20,23,10,'混沌牛魔王',1);

       This_NPC.NpcNotice('【混沌之地】祖玛神殿七层大厅（20，23）出现混沌牛魔王！');
       end; 
       
       if (This_NPC.CheckMapMonByName('D5072','混沌牛魔王') = 0) then
       begin
       This_NPC.CreateMon('D5072',27,20,7,'混沌牛魔王',1);

       This_NPC.NpcNotice('【混沌之地】祖玛神殿七层（27，20）出现混沌牛魔王！');
       end; 
       
       if (This_NPC.CheckMapMonByName('63','混沌牛魔王') = 0) then
       begin
       This_NPC.CreateMon('63',126,27,10,'混沌牛魔王',1);
       This_NPC.CreateMon('63',126,27,10,'混沌牛魔祭司',5);
       This_NPC.CreateMon('63',126,27,10,'混沌牛魔将军',5);
       This_NPC.CreateMon('63',126,27,10,'混沌牛魔法师',5);
       This_NPC.CreateMon('63',126,27,10,'混沌牛魔侍卫',5);
       This_NPC.NpcNotice('【混沌之地】魔龙岭（126，27）出现混沌牛魔王！');
       end; 
       
       if (This_NPC.CheckMapMonByName('6','混沌牛魔王') = 0) then
       begin
       This_NPC.CreateMon('6',423,65,10,'混沌牛魔王',1);

       This_NPC.NpcNotice('【混沌之地】魔龙城（423，65）出现混沌牛魔王！');
       end; 
       
       if (This_NPC.CheckMapMonByName('5','混沌牛魔王') = 0) then
       begin
       This_NPC.CreateMon('5',101,267,1,'混沌牛魔王',1);
    
       This_NPC.NpcNotice('【混沌之地】苍月岛（101，267）出现混沌牛魔王！');
       end; 
     end; 
     
     if (GetHour = 22) and (GetMin = 0) then
     begin     
       if (This_NPC.CheckMapMonByName('D701','混沌牛魔王') = 0) then
       begin
       This_NPC.CreateMon('D701',74,39,6,'混沌牛魔王',1);

       This_NPC.NpcNotice('【混沌之地】沙巴克密道（74，39）出现混沌牛魔王！');
       end; 
     end;  
     
     if AutoOpenDay(1) = 0 then      //衣服点开启红字提示 
     begin
        if (GetHour = 0) and (GetMin = 0) then
        This_NPC.NpcNotice('【恶魔降临】堕落坟场、死亡神殿、深渊魔域、钳虫巢穴、地狱烈焰、困惑殿堂的重装恶魔已经出现，勇士们可以前往探险！');
     end;
     
     if AutoOpenDay(2) = 0 then      //传奇信用分开启红字提示 
     begin
        if (GetHour = 0) and (GetMin = 0) then
        This_NPC.NpcNotice('【传奇信用分】传奇信用分系统现已开启，勇士们可以前往各传送使者和仓库管理员处验证传奇信用分，更好的体验游戏内容！');
     end;
     
     
     
     if AutoOpenDay(5) = 0 then      //沙巴克开启红字提示 
     begin
        if (GetHour = 0) and (GetMin = 0) then
        This_NPC.NpcNotice('【决战沙城】沙巴克申请现已开启，勇士们可以在比奇国王处申请战役，群雄逐鹿，决战沙城！');
     end;
     
      if AutoOpen(3) then
     begin
        if (GetHour = 10) and (GetMin = 25) then
        This_NPC.NpcNotice('地下夺宝活动5分钟开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
     
     if AutoOpen(3) then
     begin
        if (GetHour = 10) and (GetMin = 30) then
        This_NPC.NpcNotice('地下夺宝活动开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
     
     if AutoOpen(3) then
     begin
        if (GetHour = 13) and (GetMin = 25) then
        This_NPC.NpcNotice('地下夺宝活动5分钟开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
     
     if AutoOpen(3) then
     begin
        if (GetHour = 13) and (GetMin = 30) then
        This_NPC.NpcNotice('地下夺宝活动开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
  
          if AutoOpen(3) then
     begin
        if (GetHour = 15) and (GetMin = 25) then
        This_NPC.NpcNotice('地下夺宝活动5分钟开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
     
     if AutoOpen(3) then
     begin
        if (GetHour = 15) and (GetMin = 30) then
        This_NPC.NpcNotice('地下夺宝活动开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
  
           if AutoOpen(3) then
     begin
        if (GetHour = 20) and (GetMin = 25) then
        This_NPC.NpcNotice('地下夺宝活动5分钟开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
     
     if AutoOpen(3) then
     begin
        if (GetHour = 20) and (GetMin = 30) then
        This_NPC.NpcNotice('地下夺宝活动开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
  
          if AutoOpen(3) then
     begin
        if (GetHour = 22) and (GetMin = 55) then
        This_NPC.NpcNotice('地下夺宝活动5分钟开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
     
     if AutoOpen(3) then
     begin
        if (GetHour = 23) and (GetMin = 00) then
        This_NPC.NpcNotice('地下夺宝活动开启，想要去的玩家可以从土城左下角-镇魔守将-解救天工-单独或者组队前往地下宫殿，在宫殿中央位置点击送宝人偶NPC传送进入夺宝地图，夺宝人偶将在55分后由玩家点击后在NPC周围刷出大量物品，物品2分钟后才能拾取！');
     end;
     
               if AutoOpen(3) then
     begin
        if (GetHour = 18) and (GetMin = 15) then
        This_NPC.NpcNotice('闯关夺宝活动5分钟开启，想要去的玩家可以从土城-活动使者处进入！');
     end;
     
     if AutoOpen(3) then
     begin
        if (GetHour = 18) and (GetMin = 20) then
        This_NPC.NpcNotice('闯关夺宝活动开启，想要去的玩家可以从土城-活动使者处进入！，入口20分钟后关闭');
     end; 
     
     if AutoOpen(3) then
     begin
       //藏经峡谷 
       if ((GetHour = 15) and (GetMin = 55)) or ((GetHour = 19) and (GetMin = 25)) then
       begin
       RollMSG('传说中的藏经峡谷5分钟后开启，击杀怪物，就能将它们打回原形，找寻散落的书页宝藏，勇士们赶紧前往夺取宝物吧！');
       This_NPC.ClearMon('R001~01');
       end else
       if ((GetHour = 16) and (GetMin = 25)) or ((GetHour = 19) and (GetMin = 55)) then
       begin
       RollMSG('传说中的藏经峡谷5分钟后关闭，请各位勇士抓紧时间找寻散落的书页宝藏！');
       end;
       
       if ((GetHour = 16) and (GetMin < 30)) or ((GetHour = 19) and (GetMin >= 30)) then
       begin
         BookCanyon_div := GetMin div 2;
         BookCanyon_mod := GetMin mod 2;
         if (BookCanyon_mod = 0) and (GetG(35,43) <> BookCanyon_div) then
         begin
           if (GetMin = 0) or (GetMin = 30) then
           begin
           This_NPC.ClearMon('R001~01');
           SetG(35,43,BookCanyon_div);
           if (This_NPC.CheckMapMonByName('R001~01','兽皮卷') < 400) then This_NPC.CreateMon('R001~01',100,100,100,'兽皮卷',250);
           if (This_NPC.CheckMapMonByName('R001~01','甲骨文') < 400) then This_NPC.CreateMon('R001~01',100,100,100,'甲骨文',250);       
           This_NPC.NpcNotice('【藏经峡谷】传说中的藏经峡谷开启啦，击杀怪物，就能将它们打回原形，找寻散落的书页宝藏，勇士们赶紧前往夺取宝物吧！');
           RollMSG('传说中的藏经峡谷开启啦，击杀怪物，就能将它们打回原形，找寻散落的书页宝藏，勇士们赶紧前往夺取宝物吧！');
           end else
           begin
           SetG(35,43,BookCanyon_div);
           if (This_NPC.CheckMapMonByName('R001~01','兽皮卷') < 400) then This_NPC.CreateMon('R001~01',100,100,100,'兽皮卷',250);
           if (This_NPC.CheckMapMonByName('R001~01','甲骨文') < 400) then This_NPC.CreateMon('R001~01',100,100,100,'甲骨文',250);
           end;
         end;
       end;       
     end;
     
     if (GetHour = 22) then
     begin
        if GetMin = 15 then
        begin
          if This_NPC.GetCastleGuildName <> '' then
          begin
            if (This_NPC.CheckMapMonByName('H204','千年树妖') = 0) then
            begin
            This_NPC.CreateMon('H204',50,50,50,'千年树妖',1);
            This_NPC.NpcNotice('【沙巴克】盟重大地微微一颤，神秘的BOSS出现在沙巴克藏宝阁');
            end;
          end;
        end else
        if GetMin = 30 then
        begin
          if This_NPC.GetCastleGuildName <> '' then
          begin
            if (This_NPC.CheckMapMonByName('H204','黄泉教主16') = 0) then
            begin
            This_NPC.CreateMon('H204',50,50,50,'黄泉教主16',1);
            This_NPC.NpcNotice('【沙巴克】盟重大地微微一颤，神秘的BOSS出现在沙巴克藏宝阁');
            end;
          end;
        end else
        if GetMin = 45 then
        begin
          if This_NPC.GetCastleGuildName <> '' then
          begin
            if (This_NPC.CheckMapMonByName('H204','地藏魔王16') = 0) then
            begin
            This_NPC.CreateMon('H204',50,50,50,'地藏魔王16',1);
            This_NPC.NpcNotice('【沙巴克】盟重大地微微一颤，神秘的BOSS出现在沙巴克藏宝阁');
            end;
          end;
        end;  
     end; 
     
     if (tempTime >=0000) and (tempTime < 2359) then
     begin
         if (tempTime mod 60) = 0 then
         begin
             pigRdm := random(6) + 1;
             while (pigRdm) = goldPigId do
             pigRdm := random(6) + 1;
             
             goldPigId := pigRdm;
             
             case pigRdm of
                 1:      //3 200,150-700,600           
                 begin
                    pigX := 200 + random(500);
                    pigY := 150 + random(450);
                    This_NPC.CreateMon('3',pigX,pigX,3,'散财猪',1);
                    pigStr := '各位玩家请注意：带有大量财宝的散财猪再次降临在盟重省(' + inttostr(pigX) + '，' + inttostr(pigY) + ')附近。'
                 end;
                 2:      //0 100,100-600,600           
                 begin
                    pigX := 100 + random(50);
                    pigY := 100 + random(50);
                    This_NPC.CreateMon('f011',pigX,pigX,3,'经验猪',1);
                    pigStr := '各位玩家请注意：带有大量经验的经验猪再次降临在激情战场(' + inttostr(pigX) + '，' + inttostr(pigY) + ')附近。'
                 end;
                 3:      //0 420,300-550,500           
                 begin
                    pigX := 420 + random(130);
                    pigY := 300 + random(200);
                    This_NPC.CreateMon('5',pigX,pigX,3,'散财猪',1);
                    pigStr := '各位玩家请注意：带有大量财宝的散财猪再次降临在苍月岛(' + inttostr(pigX) + '，' + inttostr(pigY) + ')附近。'
                 end;
                 
                4:      //0 420,300-550,500           
                 begin
                    pigX := 420 + random(130);
                    pigY := 300 + random(200);
                    This_NPC.CreateMon('5',pigX,pigX,3,'经验猪',1);
                    pigStr := '各位玩家请注意：带有大量经验的经验猪再次降临在苍月岛(' + inttostr(pigX) + '，' + inttostr(pigY) + ')附近。'
                 end;
                 
                 5:      //3 200,150-700,600           
                 begin
                    pigX := 200 + random(500);
                    pigY := 150 + random(450);
                    This_NPC.CreateMon('3',pigX,pigX,3,'经验猪',1);
                    pigStr := '各位玩家请注意：带有大量经验的经验猪再次降临在盟重省(' + inttostr(pigX) + '，' + inttostr(pigY) + ')附近。'
                 end;
                 6:      //0 100,100-600,600           
                 begin
                    pigX := 100 + random(50);
                    pigY := 100 + random(50);
                    This_NPC.CreateMon('f011',pigX,pigX,3,'散财猪',1);
                    pigStr := '各位玩家请注意：带有大量财宝的散财猪再次降临在激情战场(' + inttostr(pigX) + '，' + inttostr(pigY) + ')附近。'
                 end;
   
             end;
             if (tempTime = 0000) then
             begin
                 This_NPC.NpcNotice('新的一天开始啦！！' + pigStr);
                 RollMsg('新的一天开始啦！！' + pigStr);
             end else
             begin
                 This_NPC.NpcNotice(pigStr);
                 RollMsg(pigStr);
             end; 
         end;
     end; 

        SetG(36,36,tempNow);  
   end;
  
end;
procedure _GoTocastlewar;
begin
   if AutoOpen(5) then
   begin
     if This_Player.MapName = '3' then This_Player.Flyto('3',700,400); 
   end;
end;

var
tem : integer;
say : string;
Begin
   tem := random(5)+1;
   case tem of
     1 : say := '当封魔谷的禁咒被打破之后，封魔谷又成了人类的都市；\当通往苍月岛的路途被发现之后，玛法大陆更是热闹非凡；\而当勇者雕像数立在比奇城中的时候，一切又变得与众不同。\' ;
     2 : say := '魔龙城是人类最近发现的远古城市。\最近，魔龙军团更是将魔影巨人和魔龙树妖召来，\这两个凶狠的恶魔更是向玛法大陆发起了冲击。\';
     3 : say := '暗之魔龙教主使用邪恶力量封印了魔龙西关，\从此以后，勇士们再也不能进入此地，\原先镇守这里的魔龙力士等已经转而踞守魔龙血域这个恶魔老巢。\';
     4 : say := '最近魔龙军团的进攻十分凶猛，盟重可谓岌岌可危！\在盟重这个勇士聚集的地方，传送戒指失去了它的作用，\不再可以依靠它传送到盟重各地。\';
     5 : say := '暗之魔龙教主使用邪恶力量封印了魔龙西关，\从此以后，勇士们再也不能进入此地，\原先镇守这里的魔龙力士等已经转而踞守魔龙血域这个恶魔老巢。\';
   end;
   

   if AutoOpen(5) then
   begin
     This_NPC.NpcDialog(This_Player,
     say+
     '\|{cmd}<使用移动/@move>                   ^<使用声望值/@swz>\ \'+
     '|{cmd}<传送至沙巴克集合点/@GoTocastlewar>\'+
     '|{cmd}<退出/@exit>   '); 
   end else
   This_NPC.NpcDialog(This_Player,
   say+
   '\|{cmd}<使用移动/@move>                   ^<使用声望值/@swz>\ \'+
   '|{cmd}<退出/@exit>'); 
end.