{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _qianming;
begin
  This_Npc.NpcDialog(This_Player,
   '为了庆祝新年的到来，国王征集大量的勇士前往玛法各处巡查，\'+
   '以保证新年的安全到来。只要在玛法大陆上四处巡查两个小时，\'+
   '就可以得到大量的经验回馈。每日22点以后，不可以接受巡查\'+
   '任务。勇士，你愿意接受这个巡查任务么？\ \'+
   '|{cmd}<是的，我愿意/@qianming_1>\ \'+
   '|{cmd}<我再考虑一下/@doexit>');
end;

procedure _qianming_1;
var
d1 , d2 , d3 : integer;
s1 , td : double;
begin
   td := GetNow;
   d1 := GetDateNum(td);
   if d1 = This_Player.GetS(15,4) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经参加过今天的玛法巡查任务了，请明天再来吧！');
      Exit; 
   end;
   
   if d1 = This_Player.GetS(15,2) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经领取任务了，请自领任务起两小时后，\'+
      '到比奇国王那里领奖吧。\');
      Exit;
   end;
  
   if (GetHour >= 22) or (GetHour >= 23) then
   begin
      This_Npc.NpcDialog(This_Player,
      '现在已经是22点之后的深夜了，\'+
      '勇士，我这里已经不再接受巡查任务了，明天再来吧！\');
   end else
   begin
      s1 := GetNow;
      d2 := GetDateNum(s1);
      //将getnow的浮点数转换为整型进行保存； 
      d3 := ConvertDateTimeToDB(s1);
      This_Npc.NpcDialog(This_Player,
      '我记下你的名字了，两小时后去找比奇国王吧！');
      This_Player.SetS(15,2,d2);
      This_Player.SetS(15,3,d3);
   end;
end;

procedure _ChuMoRDM;
begin
   if This_Player.Level < 36 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你的等级没到36级，为了你的安全，我不能让你去冒险！\ \|{cmd}<返回/@main>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你可以在我这里领取除魔任务，完成后可以获得高额奖励。\'+
      '在一轮除魔任务（完成5次任务）中，每次完成任务后的奖励会\'+
      '越来越好。\'+
      '如果你觉得领取的任务太难，你也可以花费50000金币重新领取任务。\'+
      '不过你每天只能完成一轮的除魔任务……\ \'+
      '|{cmd}<领取任务/@GetCMShaG>             ^<重新领取任务/@ChgCMShaG>            ^<领取奖励/@DoneCMShaG>\ \'+
      '|{cmd}<返回/@main>');
   end;
end;

Procedure Clear;
var
  iGetSG: integer;
begin
   for iGetSG := 1 to 22 do
   begin
      This_Player.SetV(23,iGetSG,0);
   end;
end;

Procedure _DoneCMShaG;
var
  tFin, iGetSG, iTod: integer;
  sTod : double;
begin
   sTod := GetNow();
   iTod := GetDateNum(sTod);
   if iTod = This_Player.GetV(23,25) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天已经完成了一轮除魔任务，请明天再来吧！');
      Exit;
   end;
   
   if iTod <> This_Player.GetV(23,24) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天还没有领取任务，我不能给你任何奖励！');
      Exit;
   end;
   
   if This_Player.Level < 36 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你的等级没到36级，为了你的安全，我不能让你去冒险！\ \|{cmd}<返回/@main>');
      Exit;
   end;
   
   tFin := This_Player.GetV(23,23);                               //记录累积完成的次数1-5
   if (This_Player.GetV(23,11) = 5) or (This_Player.GetV(23,10) = 5) or (This_Player.GetV(23,9) = 5) or (This_Player.GetV(23,8) = 5) 
      or (This_Player.GetV(23,7) = 5) or (This_Player.GetV(23,6) = 5) or (This_Player.GetV(23,5) = 5) or (This_Player.GetV(23,4) = 5) 
      or (This_Player.GetV(23,3) = 5) or (This_Player.GetV(23,2) = 5) or (This_Player.GetV(23,1) = 5) then
   begin
      This_NPC.NpcDialog(This_Player,
      '你还没有完成我交给你的任务，怎么能领取奖励呢？');
   end else if (This_Player.GetV(23,11) <= 0) and (This_Player.GetV(23,10) <= 0) and (This_Player.GetV(23,9) <= 0) and (This_Player.GetV(23,8) <= 0) 
      and (This_Player.GetV(23,7) <= 0) and (This_Player.GetV(23,6) <= 0) and (This_Player.GetV(23,5) <= 0) and (This_Player.GetV(23,4) <= 0) 
      and (This_Player.GetV(23,3) <= 0) and (This_Player.GetV(23,2) <= 0) and (This_Player.GetV(23,1) <= 0) then 
   begin
      This_NPC.NpcDialog(This_Player,
      '你还没有领取任务呢，我不能给你任何奖励！');
   end else
   begin 
      tFin := This_Player.GetV(23,23);                               //记录累积完成的次数1-5  
      for iGetSG := 1 to 11 do
      begin
         if This_Player.GetV(23,iGetSG) = 10 then
         begin
            if This_Player.FreeBagNum < 1 then
            begin
               This_NPC.NpcDialog(This_Player,
               '你的包裹太满，请整理之后再来。');
               Exit;
            end else
            begin
               if tFin > 4 then
               begin
                  Exit;
               end else if (tFin <= 4) and (tFin > 0) then
               begin
                  case tFin of 
                    4 :
                    begin
                       if This_Player.SetV(23,25,iTod) then
                       begin
                          {$IFDEF Q130_zhenlong}
                          This_Player.Give('经验',18000000);
                          {$ELSE}
                          This_Player.Give('经验',30000000);
                          {$ENDIF}
                          This_Player.Give('幸运灵符礼包',1);
                          This_NPC.NpcDialog(This_Player,
                          '这是你的奖励，请收下！\恭喜你完成了一轮除魔任务。');
                          This_Player.SetV(23,23,0);
                       end;
                    end;
                    3 :
                    begin
                       {$IFDEF Q130_zhenlong}
                       This_Player.Give('经验',7000000);
                       {$ELSE}
                       This_Player.Give('经验',14000000);
                       {$ENDIF}
                       This_NPC.NpcDialog(This_Player,
                       '这是你的奖励，请收下！\你只需要再完成1次任务，就可以完成一轮的除魔任务了！');
                       This_Player.SetV(23,23,4);
                    end;
                    2 :
                    begin
                       {$IFDEF Q130_zhenlong}
                       This_Player.Give('经验',6000000);
                       {$ELSE}
                       This_Player.Give('经验',8000000);
                       {$ENDIF}
                       This_NPC.NpcDialog(This_Player,
                       '这是你的奖励，请收下！\你只需要再完成2次任务，就可以完成一轮的除魔任务了！');
                       This_Player.SetV(23,23,3);
                    end;
                    1 :
                    begin
                       This_Player.Give('经验',5000000);
                       This_NPC.NpcDialog(This_Player,
                       '这是你的奖励，请收下！\你只需要再完成3次任务，就可以完成一轮的除魔任务了！');
                       This_Player.SetV(23,23,2);
                    end;   
                  end;
                  Clear;
               end else
               begin
                  {$IFDEF Q130_zhenlong}
                  This_Player.Give('经验',4000000);
                  {$ELSE}
                  This_Player.Give('经验',3000000);
                  {$ENDIF}
                  This_NPC.NpcDialog(This_Player,
                  '这是你的奖励，请收下！\你只需要再完成4次任务，就可以完成一轮的除魔任务了！');
                  This_Player.SetV(23,23,1);
                  Clear;
               end;
               Exit;
            end;  
         end;
      end;
   end; 
end;

Procedure _GetCMShaG;
var
  iCMRa, iCMRa01, iTemp01, iTemp02, iTod, fxh01, iYest: integer;
  sSGDialg: string;
  sTod : double;
begin
   sTod := GetNow();
   iTod := GetDateNum(sTod);
   if iTod = This_Player.GetV(23,25) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天已经完成了一轮除魔任务，请明天再来吧！');
      Exit;
   end;
   
   if This_Player.Level < 36 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你的等级没到36级，为了你的安全，我不能让你去冒险！\ \|{cmd}<返回/@main>');
      Exit;
   end;
   
   iTemp01 := 0;                                     //记录是否有任务已经杀完怪 
   iTemp02 := 0;
   iYest := This_Player.GetV(23,24);
   begin                                     //记录是否有任务已接
      if (iYest = iTod) and (This_Player.GetV(23,11) = 10) then
      begin
         iTemp01 := 11;
      end else if This_Player.GetV(23,11) = 5 then
      begin
         iTemp02 := 11;
      end else if This_Player.GetV(23,10) = 10 then
      begin
         iTemp01 := 10;
      end else if This_Player.GetV(23,10) = 5 then
      begin
         iTemp02 := 10;
      end else if This_Player.GetV(23,9) = 10 then
      begin
         iTemp01 := 9;
      end else if This_Player.GetV(23,9) = 5 then
      begin
         iTemp02 := 9;
      end else if This_Player.GetV(23,8) = 10 then
      begin
         iTemp01 := 8;
      end else if This_Player.GetV(23,8) = 5 then
      begin
         iTemp02 := 8;
      end else if This_Player.GetV(23,7) = 10 then
      begin
         iTemp01 := 7;
      end else if This_Player.GetV(23,7) = 5 then
      begin
         iTemp02 := 7;
      end else if This_Player.GetV(23,6) = 10 then
      begin
         iTemp01 := 6;
      end else if This_Player.GetV(23,6) = 5 then
      begin
         iTemp02 := 6;
      end else if This_Player.GetV(23,5) = 10 then
      begin
         iTemp01 := 5;
      end else if This_Player.GetV(23,5) = 5 then
      begin
         iTemp02 := 5;
      end else if This_Player.GetV(23,4) = 10 then
      begin
         iTemp01 := 4;
      end else if This_Player.GetV(23,4) = 5 then
      begin
         iTemp02 := 4;
      end else if This_Player.GetV(23,3) = 10 then
      begin
         iTemp01 := 3;
      end else if This_Player.GetV(23,3) = 5 then
      begin
         iTemp02 := 3;
      end else if This_Player.GetV(23,2) = 10 then
      begin
         iTemp01 := 2;
      end else if This_Player.GetV(23,2) = 5 then
      begin
         iTemp02 := 2;
      end else if This_Player.GetV(23,1) = 10 then
      begin
         iTemp01 := 1;
      end else if This_Player.GetV(23,1) = 5 then
      begin
         iTemp02 := 1;
      end;
   end;
   
   if ((iTemp01 > 11) or (iTemp02 > 11)) then
   begin
      Exit;
   end else if (iYest = iTod) and (iTemp01 > 0) then
   begin
      case iTemp01 of
        1  :  sSGDialg := '前往石墓杀死10只红野猪';
        2  :  sSGDialg := '前往骨魔洞杀死20只骷髅长枪兵';
        3  :  sSGDialg := '前往霸者大厅杀死3只白野猪';
        4  :  sSGDialg := '前往兽人古墓杀死15只骷髅';
        5  :  sSGDialg := '前往赤月峡谷杀死10只月魔蜘蛛';
        6  :  sSGDialg := '前往比奇杀死15只鸡';
        7  :  sSGDialg := '前往毒蛇山谷杀死5条虎蛇';
        8  :  sSGDialg := '前往比奇杀死8只食人花';
        9  :  sSGDialg := '前往雷炎洞穴杀死2只金杖蜘蛛';
        10 :  sSGDialg := '前往死亡棺材杀死2只邪恶钳虫';
        11 :  sSGDialg := '前往魔龙西郊杀死3只魔龙刀兵';
      end;
      This_NPC.NpcDialog(This_Player,
      '看来你已经完成了' + sSGDialg + '的任务！\ \|{cmd}<返回领取奖励/@ChuMoRDM>');
   end else if (iYest = iTod) and (iTemp02 > 0) then
   begin
      case iTemp02 of
        1  :  sSGDialg := '前往石墓杀死10只红野猪';
        2  :  sSGDialg := '前往骨魔洞杀死20只骷髅长枪兵';
        3  :  sSGDialg := '前往霸者大厅杀死3只白野猪';
        4  :  sSGDialg := '前往兽人古墓杀死15只骷髅';
        5  :  sSGDialg := '前往赤月峡谷杀死10只月魔蜘蛛';
        6  :  sSGDialg := '前往比奇杀死15只鸡';
        7  :  sSGDialg := '前往毒蛇山谷杀死5条虎蛇';
        8  :  sSGDialg := '前往比奇杀死8只食人花';
        9  :  sSGDialg := '前往雷炎洞穴杀死2只金杖蜘蛛';
        10 :  sSGDialg := '前往死亡棺材杀死2只邪恶钳虫';
        11 :  sSGDialg := '前往魔龙西郊杀死3只魔龙刀兵'; 
      end;
      This_NPC.NpcDialog(This_Player,
      '你的任务是' + sSGDialg + '，赶快去完成吧。\ \|{cmd}<好的，我这就去/@DoExit>');
   end else
   begin
      if iTod <> iYest then
      begin
         This_Player.SetV(23,24,iTod);
         for fxh01 := 1 to 23 do
         begin
            This_Player.SetV(23,fxh01,0);
         end;
      end;
      
      iCMRa := Random(11) + 1;
      This_Player.SetV(23,iCMRa,5);                                  //标记为已接打怪任务。 
      iCMRa01 := iCMRa + 11;
      This_Player.SetV(23,iCMRa01,0);                                //打怪计数任务号字段清零。 
      case iCMRa of
           1  :
           begin  
              This_NPC.NpcDialog(This_Player,
              '请你前往石墓杀死10只红野猪，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');
           end; 
           2  :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往骨魔洞杀死20只骷髅长枪兵，\完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');   
           end;
           3  :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往霸者大厅杀死3只白野猪，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');   
           end;
           4  :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往兽人古墓杀死15只骷髅，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');   
           end;
           5  :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往赤月峡谷杀死10只月魔蜘蛛，\完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');   
           end;
           6  :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往比奇杀死15只鸡，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');   
           end;
           7  :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往毒蛇山谷杀死5条虎蛇，\完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');   
           end;
           8  :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往比奇杀死8只食人花，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');
              //This_NPC.NpcDialog(This_Player,
              //'请你前往比奇杀死15只鸡，完成之后来找我领取奖励吧。\ \|{cmd}<好的，我这就去/@DoExit>');  
              //This_Player.SetV(23,6,5); 
              //This_Player.SetV(23,17,0);
              //This_Player.SetV(23,8,0); 
           end;
           9  :
           begin
              //This_NPC.NpcDialog(This_Player,
              //'请你前往雷炎洞穴杀死2只金杖蜘蛛，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>');
              This_NPC.NpcDialog(This_Player,
              '请你前往石墓杀死10只红野猪，完成之后来找我领取奖励！\ \|{cmd}<好的，我这就去/@DoExit>');
              This_Player.SetV(23,1,5); 
              This_Player.SetV(23,12,0);
              This_Player.SetV(23,9,0); 
           end;
           10 :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往死亡棺材杀死2只邪恶钳虫，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>'); 
           end;
           11 :
           begin
              This_NPC.NpcDialog(This_Player,
              '请你前往魔龙西郊杀死3只魔龙刀兵，完成之后来找我领取奖励。\ \|{cmd}<好的，我这就去/@DoExit>'); 
           end;
      end;
   end;
end; 

Procedure _ChgCMShaG;
begin
   This_NPC.NpcDialog(This_Player,
   '重新领取任务<需要花费50000金币/c=red>，你确认要重新领取任务吗？\ \ \'+
   '|{cmd}<重新领取任务/@ChgCMShaG_01>                           ^<返回/@ChuMoRDM>'); 
end;

Procedure _ChgCMShaG_01;
var
  iCMRa, iCMRa01, iGetSG, iTemp01, iTemp02, iTod, iYest: integer;
  sSGDialg: string;
  sTod : double;
begin
   sTod := GetNow();
   iTod := GetDateNum(sTod);
   iYest := This_Player.GetV(23,24);
   if iTod = This_Player.GetV(23,25) then
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天已经完成了一轮除魔任务，请明天再来吧！');
      Exit;
   end;

   if This_Player.Level < 36 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你的等级没到36级，为了你的安全，我不能让你去冒险！\ \|{cmd}<返回/@main>');
      Exit;
   end;
   
   iTemp01 := 0;                                     //记录是否有任务已经杀完怪 
   iTemp02 := 0;                                     //记录是否有任务已接
   begin                                     //记录是否有任务已接
      if This_Player.GetV(23,11) = 10 then
      begin
         iTemp01 := 11;
      end else if This_Player.GetV(23,11) = 5 then
      begin
         iTemp02 := 11;
      end else if This_Player.GetV(23,10) = 10 then
      begin
         iTemp01 := 10;
      end else if This_Player.GetV(23,10) = 5 then
      begin
         iTemp02 := 10;
      end else if This_Player.GetV(23,9) = 10 then
      begin
         iTemp01 := 9;
      end else if This_Player.GetV(23,9) = 5 then
      begin
         iTemp02 := 9;
      end else if This_Player.GetV(23,8) = 10 then
      begin
         iTemp01 := 8;
      end else if This_Player.GetV(23,8) = 5 then
      begin
         iTemp02 := 8;
      end else if This_Player.GetV(23,7) = 10 then
      begin
         iTemp01 := 7;
      end else if This_Player.GetV(23,7) = 5 then
      begin
         iTemp02 := 7;
      end else if This_Player.GetV(23,6) = 10 then
      begin
         iTemp01 := 6;
      end else if This_Player.GetV(23,6) = 5 then
      begin
         iTemp02 := 6;
      end else if This_Player.GetV(23,5) = 10 then
      begin
         iTemp01 := 5;
      end else if This_Player.GetV(23,5) = 5 then
      begin
         iTemp02 := 5;
      end else if This_Player.GetV(23,4) = 10 then
      begin
         iTemp01 := 4;
      end else if This_Player.GetV(23,4) = 5 then
      begin
         iTemp02 := 4;
      end else if This_Player.GetV(23,3) = 10 then
      begin
         iTemp01 := 3;
      end else if This_Player.GetV(23,3) = 5 then
      begin
         iTemp02 := 3;
      end else if This_Player.GetV(23,2) = 10 then
      begin
         iTemp01 := 2;
      end else if This_Player.GetV(23,2) = 5 then
      begin
         iTemp02 := 2;
      end else if This_Player.GetV(23,1) = 10 then
      begin
         iTemp01 := 1;
      end else if This_Player.GetV(23,1) = 5 then
      begin
         iTemp02 := 1;
      end;
   end;
   
   if (iTemp01 > 11) or (iTemp02 > 11) then
   begin
      Exit;
   end else if (iTod <> iYest) then
   begin
      This_NPC.NpcDialog(This_Player,
      '你今天还没有领取过任务，不能重新领取 \|{cmd}<返回领取任务/@ChuMoRDM>'); 
   end else if (iTod = iYest) and (iTemp01 > 0) then
   begin
      This_NPC.NpcDialog(This_Player,
      '你已经完成了领取的任务，为什么要重新领取任务呢？\ \|{cmd}<返回领取奖励/@ChuMoRDM>');
   end else if (iTod = iYest) and (iTemp02 <= 0) then
   begin
      This_NPC.NpcDialog(This_Player,
      '你今天还没有领取过任务，不能重新领取 \|{cmd}<返回领取任务/@ChuMoRDM>'); 
   end else
   begin
      if This_Player.GoldNum >= 50000 then
      begin
         for iGetSG := 1 to 22 do
         begin
           This_Player.SetV(23,iGetSG,0);
         end;
         if This_Player.DecGold(50000) then
         begin
            _GetCMShaG;
         end;
      end else
      begin
         This_NPC.NpcDialog(This_Player,
         '你没有50000金币，不能重新领取.'); 
      end;
   end
end;

procedure _EverydayLilian;
begin
  This_Npc.NpcDialog(This_Player,          
  '黑暗势力逐日强大,是我们玛法人一直担心的问题,\'+
  '为了提高每个玛法人抵抗黑暗势力的能力,\'+
  '我们决定让每个年轻勇士每天都有一次高强度历练机会,\'+
  '在玛法大陆的各个角落,有一批恶兽看守人,\'+
  '他们背负着玛法上古先祖遗留下的使命,\'+
  '看守着一批迷失心智的怪物,找到恶魔看守人,\ '+
  '他会给你一次历练的机会,只要你能完成他所交代的任务,\ '+
  '就能获得历练奖励！提升自身的能力\'+
  '|{cmd}<去找恶兽看守人(每日历练任务)/@StartLilian>');
end;

procedure _StartLilian;
begin
  if This_Player.GetS(22,23) = GetDateNum(GetNow) then
  begin
    if This_Player.GetS(22,22) = 2009 then
    begin
      This_Npc.NpcDialog(This_Player,          
      '今天的历练已经结束,\请明天再到我这里领取任务吧！！');
      exit;
    end
    else
    begin
      //This_Player.UpdateTaskDetail(10008,1);
    end;
  end
  else
  begin
    This_Player.SetS(22,23,GetDateNum(GetNow));
    This_Player.SetS(22,22,0);
    This_Player.SetS(22,25,0);
    This_Player.SetS(22,26,0);
    This_Player.SetS(22,27,0);
    This_Player.SetS(22,28,0);
    This_Player.SetS(22,29,0);
    This_Player.SetS(22,30,0);
    This_Player.SetS(22,31,0);
    This_Player.SetS(22,32,0);
    //This_Player.UpdateTaskDetail(10008,1);
  end;
  
  if This_Player.Level < 25 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '到了25级才能领取这个任务！！');
  end
  else if This_Player.Level < 30 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<香石墓穴的恶兽看守人(37, 30)/c=red>\'
    +'或者是<香石墓穴的恶兽看守人(84, 47)/c=red>\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 100 then
    begin
      This_Player.SetS(22,24,100);
    end;
  end
  else if This_Player.Level < 35 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<沃玛寺庙三层的恶兽看守人(46, 46)/c=red>\'
    +'或者是<沃玛寺庙三层的恶兽看守人(62, 62)/c=red>\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 200 then
    begin
      This_Player.SetS(22,24,200);
    end;
  end
  else if This_Player.Level < 40 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<地牢一层东的恶兽看守人(75, 108)/c=red>\'
    +'或者是<地牢一层东的恶兽看守人(161, 52)/c=red>\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 300 then
    begin
      This_Player.SetS(22,24,300);
    end;
  end
  else if This_Player.Level < 45 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<石墓七层的恶兽看守人(30, 72)/c=red>\'
    +'或者是<石墓七层的恶兽看守人(62, 42)/c=red>\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 400 then
    begin
      This_Player.SetS(22,24,400);
    end;
  end
  else if This_Player.Level < 50 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<祖玛神殿七层大厅的恶兽看守人(11, 13)/c=red>\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 500 then
    begin
      This_Player.SetS(22,24,500);
    end;
  end
  else if This_Player.Level < 55 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<牛魔寺庙大厅的恶兽看守人(15, 16)/c=red>\'
    +'或者是<牛魔寺庙大厅的恶兽看守人(67, 67)/c=red>\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 600 then
    begin
      This_Player.SetS(22,24,600);
    end;
  end 
  else if This_Player.Level < 60 then
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<魔龙岭的恶兽看守人(213, 117)/c=red>\'
    +'或者是<魔龙岭的恶兽看守人(84, 353)/c=red>\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 700 then
    begin
      This_Player.SetS(22,24,700);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '今日任务：\'
    +'需要你前往寻找<地下长廊的恶兽看守人(160, 172)/c=red>\'
    +'在盟重镇魔守将处使用各类组队卷轴就可单人或者组队前往地下长廊。\ \'
    +'|{cmd}<我这就去(每日历练任务)/@doexit>');
    if This_Player.GetS(22,24) < 800 then
    begin
      This_Player.SetS(22,24,800);
    end;
  end; 
end;

//============================  每日免费任务  ===========================
procedure _EverydayMitan;
var
x1 , x2 , x3 , x4 :integer;
td : double;
begin
   x2 := This_Player.GetS(13,2);
   x3 := This_Player.GetS(13,3);
   td := GetNow;
   x4 := GetDateNum(td); 
   if x3 = x4 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你今天已经帮了我不少忙了，明天再来吧！');
   end else
   begin
      if x2 = x4 then
      begin
         x1 := This_Player.GetS(13,1);
         if x1 = 3 then
         begin
            This_Npc.NpcDialog(This_Player,
            '密探就被困在地下宫殿长廊中央那里，你快去吧！');
         end else if x1 = 2 then
         begin
            This_Npc.NpcDialog(This_Player,
            '需要帮助的密探就在霸者大厅那里，你快去吧！');
         end else if x1 = 1 then
         begin
            This_Npc.NpcDialog(This_Player,
            '老吴就在紫水晶屋那边，你赶快去吧！');         
         end;
      end else
      begin
         if This_Player.Level >=51 then
         begin
            This_Npc.NpcDialog(This_Player,
            '你的等级已经超过了50级，真是一个强大的勇士！\'+
            '我这里有个任务只有你这样的勇士才能完成！\'+
            '有个密探被困地下宫殿长廊中央，你能帮忙去解救下他吗？\ \'+
            '|{cmd}<好的，我这就去/@doexit>');
            This_Player.SetS(13,2,x4);
            This_Player.SetS(13,1,3);
         end else if This_Player.Level >= 40 then
         begin
            This_Npc.NpcDialog(This_Player,
            '尊敬的勇士，有个密探在封魔谷的霸者大厅遇到了点困难，\'+
            '不知道你能去帮帮他吗？\'+
            '我相信以你的能力，一定能帮他不少忙的！\ \'+
            '|{cmd}<好的，我这就去/@doexit>');
            This_Player.SetS(13,2,x4);
            This_Player.SetS(13,1,2);
         end else
         begin
            This_Npc.NpcDialog(This_Player,
            '尊敬的勇士，紫水晶屋的老吴遇到了点困难，\'+
            '不知道你能去帮帮他吗？\'+
            '我相信以你的能力，一定能帮他不少忙的！\ \'+
            '|{cmd}<好的，我这就去/@doexit>');
            This_Player.SetS(13,2,x4);
            This_Player.SetS(13,1,1);
         end;
      end;
   end; 
end;
//============================  每日免费任务  ===========================

procedure _mission;
begin
  This_Npc.NpcDialog(This_Player,          
   '|{cmd}<玛法巡游任务/@qianming>\ \'+
   '|{cmd}<除魔任务/@ChuMoRDM>\ \'+
   '|{cmd}<每日历练任务/@EverydayLilian>\ \'+
   '|{cmd}<每日探索任务/@EverydayMitan>');
end;

procedure _activity;
begin
  This_Npc.NpcDialog(This_Player,          
   '|{cmd}<夺宝人偶活动/@PKduobao>               ^<闯关夺宝活动/@guanduobao> ');
end;

procedure _guanduobao;
begin
  This_Npc.NpcDialog(This_Player,          
  '每日的活动开放进入时间为<18点20分至18点40分/c=red>，\'
  +'每次进入需要<支付1000金币/c=red>。\ \'
  +'|{cmd}<我要闯关夺宝/@guanduobao_start>'
  ); 
end;

procedure _guanduobao_start;
begin
  if This_Player.Level >= 40 then
  begin
    if (GetHour = 18) and (GetMin >= 40) then
    begin
      This_Npc.NpcDialog(This_Player,          
      '非常的抱歉，你已经错过了本次活动的进入时间，\每日的活动开放进入时间为<18点20分至18点40分/c=red>，\请等待下次活动开启！\');
    end
    else if (GetHour = 18) and (GetMin >= 20) and (GetMin < 40) then
    begin
      This_Npc.NpcDialog(This_Player,          
      '目前夺宝战即将正式开启，请你抓紧时间尽快赶往停留地\等待活动开始，每次进入停留地都需要<支付1000金币/c=red>！\ \'
      +'|{cmd}<进入停留地/@GOONE>');
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,          
      '非常的抱歉，你已经错过了本次活动的进入时间，\每日的活动开放进入时间为<18点20分至18点40分/c=red>，\请等待下次活动开启！\');
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '非常的遗憾，只有等级达到<40级/c=red>的玩家才能参加此活动！');
  end;
end;

procedure _GOONE;
begin
  if This_Player.Level >= 40 then
  begin
    if (GetHour = 18) and (GetMin >= 20) and (GetMin < 40) then
    begin
      if This_Player.GoldNum >= 1000 then
      begin
        This_Player.DecGold(1000);
        This_Player.RandomFlyTo('0139~12');
      end
      else
      begin
        This_Npc.NpcDialog(This_Player,          
        '你好象没有足够的金币啊，那怎么行呢？');
      end;
    end
  end
  else
    exit;
end;

procedure _Alivemission;
begin
  This_Npc.NpcDialog(This_Player,          
   '活动将在<每天/c=red>的<14点/c=red>和<17点/c=red>开放！\'+
   '+开放进入时间为<13点50分/c=red>和<16点50分/c=red>。\'+
   '试炼大厅内机遇与危险是并存的，越危险的地方获得的利益也越大。\'+
   '你做好充足的准备了嘛？\如果你准备好了可以先进入休息室等待活动开始！\ \'+
   '|{cmd}<进入休息室/@gorestroom>'); 
end;

procedure _gorestroom;
var
  temp1,temp2 : integer;
begin
  if (GetHour = 14) and (GetMin < 30) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<13点50分/c=red>和<16点50分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 17) and (GetMin < 30) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '活动现在已经开始！开放进入时间为<13点50分/c=red>和<16点50分/c=red>，\'
    +'如果你错过了进入时间就只能等待下次开放！');
  end
  else if (GetHour = 13) and (GetMin >= 50) and (GetMin < 60) then
  begin
    if temp1 = -1 then
    begin
      temp1 := 0;
    end
    if temp1 = GetDateNum(GetNow) then
    begin
      This_Player.RandomFlyTo('EM002~001');
    end
    else
    begin
      temp1 := GetDateNum(GetNow);
      This_Player.RandomFlyTo('EM002~001');
      This_NPC.ClearMon('D2079~001');
      This_NPC.ClearMon('D2079~002');
      This_NPC.ClearMon('D2079~003');
      This_NPC.ClearMon('D2079~004');
      This_NPC.ClearMon('D2079~005');
      This_NPC.ClearMon('D2079~006');
    end;
  end
  else if (GetHour = 16) and (GetMin >= 50) and (GetMin < 60) then
  begin
    if temp2 = -1 then
    begin
      temp2 := 0;
    end
    if temp2 = GetDateNum(GetNow) then
    begin
      This_Player.RandomFlyTo('EM002~001');
    end
    else
    begin
      temp2 := GetDateNum(GetNow);
      This_Player.RandomFlyTo('EM002~001');
      This_NPC.ClearMon('D2079~001');
      This_NPC.ClearMon('D2079~002');
      This_NPC.ClearMon('D2079~003');
      This_NPC.ClearMon('D2079~004');
      This_NPC.ClearMon('D2079~005');
      This_NPC.ClearMon('D2079~006');
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,          
    '现在还不到时候，活动将在每天的13点50分和16点50分开放进入！\你过段时间再来吧。\ \');
  end;
end;

procedure _PKduobao;
begin
  This_Npc.NpcDialog(This_Player,          
   '你每天可以在<宫殿长廊送宝人偶(108，96)/c=red>处\参加地下夺宝活动。\ \'+
   '|活动时间为:10:30－11:00，13:30－14:00，\|15:30－16:00，20:30－21:00，23:00－23:30。');
end;
{
procedure _gomail;
begin
    if This_Player.GetV(90,1) <> 222 then  
    begin
    This_Player.SetV(90,1,222); 
    This_Player.NewFullMailEx('','新手登录可免费获得1000灵符，快叫你的兄弟一起来传奇吧' ,1,10000,0,'1000灵符礼包|1/金条|1','');
    This_NPC.CloseDialog(This_Player);
    end;
end; 

procedure _goDayMail;
var nowDay : integer;
begin
   nowDay := StrToIntDef(MirDateTimeToStr('yyyyMMdd' , GetNow) ,-1);
     if This_Player.GetV(90,2) <> nowDay then
    begin
        This_Player.SetV(90,2,nowDay);
        This_Player.NewFullMailEx('','新区每日福利:1000灵符、金条' ,1,0,0,'1000灵符礼包|1/金条|1','');
        This_NPC.CloseDialog(This_Player);
    end; 
end; 
    }
var
  JLTem, iDayWt, iChae , nowDay : integer;
  sDay : double;
  mail_str , day_Mstr : string;
Begin
  { if This_Player.GetV(90,1) <> 222 then  
   mail_str := '^<领取邮件奖励/@gomail>'
   else
   mail_str := '';
   
   nowDay := StrToIntDef(MirDateTimeToStr('yyyyMMdd' , GetNow) ,-1);
   if This_Player.GetV(90,2) <> nowDay then
   day_Mstr :=  '^<每日邮件奖励/@goDayMail>'
   else
   day_Mstr := ''; 
            }
   This_Npc.NpcDialog(This_Player,
   '为了让众多的勇士们更快获得能力的提升，比奇国王特意颁布了\'+
   '一系列的法令，以此来鼓励勇士们更快提升自己的能力。\ \'+
   '|{cmd}<每日任务/@mission>\ \' +
   '|{cmd}<每日活动/@activity>\ \'
  // +mail_str
   );
end.