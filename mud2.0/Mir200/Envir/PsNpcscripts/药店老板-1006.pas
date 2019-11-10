{********************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I common.pas}
{$I WarehouseAndMbind.pas}
{$I ActiveValidateCom.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我看看你的东西。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '你想买点什么药品？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;

//******************炼药****************** 
Procedure _DoDrugNow;
Begin
   This_Npc.NpcDialog(This_Player,
   '许大夫让你来找我的是吧。放心，把你收集的秘方给我，我可以教\'+
   '你炼制那些药品。之后准备一些材料和钱，你就可以在我这里炼制\'+
   '药品了。如果炼制过程中失败了，别担心，药品残渣我是很乐意回\'+
   '收的。\ \'+ 
   '|{cmd}<了解炼药/@DoDrugNowAbout>            ^<学习炼药/@DoDrugNowLearn>\'+
   '|{cmd}<开始炼药/@DoDrugNowBegin>            ^<领取完成药品/@DoDrugNowGet>\'+
   '|{cmd}<出售材料/@DoDrugNowSell>\'
   );
end;

Procedure _DoDrugNowAbout;
Begin
   This_Npc.NpcDialog(This_Player,
   '许中医那里收藏有很多非常不错的药品秘方，包括强效太阳水秘方，\'+
   '万年雪霜秘方和疗伤药秘方。听说如果你拿药剂师的信去找他，并\'+
   '帮他完成夙愿的话，他就会把珍贵的药品秘方赠送给你。你把秘方\'+
   '交给我，我可以教你这些药品的炼制，炼药需要消耗一些材料，这\'+ 
   '些材料可以在<沃玛寺庙/c=red>或<丛林迷宫/c=red>中收集，但是我最多也只见过疗\'+
   '伤药的秘方，所以更高级的药品连我都不懂炼制。另外我要提醒你，\'+
   '即使学会秘方炼药也是有风险的，你可以通过一次又一次的炼药提\'+
   '高自己的熟练度与炼药等级，这样你的成功率也会相应提高。\'+ 
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowLearn;
Begin
   This_Npc.NpcDialog(This_Player,
   '年轻人，要学习炼制什么药品呢？\ \'+
   '|{cmd}<学习炼制强效太阳水/@DoDrugNowLearn1>（需要强效太阳水秘方，等级35级）\ \'+
   '|{cmd}<学习炼制万年雪霜/@DoDrugNowLearn2>（需要万年雪霜秘方，等级40级，传奇信用分达\'+
   '                  到30分）\'+
   '|{cmd}<学习炼制疗伤药/@DoDrugNowLearn3>（需要疗伤药秘方，等级43级,传奇信用分达到30分）\ \'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowLearn1;
Begin
   if This_Player.GetS(80,14) <> 1 then     //强效太阳水开启
   begin
     if This_Player.GetBagItemCount('强效太阳水秘方') > 0 then
     begin
       if This_Player.Level >= 35 then
       begin
       This_Player.SetS(80,14,1);
       This_Player.Take('强效太阳水秘方',1); 
       This_Npc.NpcDialog(This_Player,
       '恭喜你学会了炼制：<强效太阳水/c=red>\ \'+
       '|{cmd}<返回/@DoDrugNow>\'
       ); 
       end else
       This_Npc.NpcDialog(This_Player,
       '学习炼制炼制强效太阳水需要达到35级。\ \'+ 
       '|{cmd}<返回/@DoDrugNowLearn>\'
       );  
     end else
     This_Npc.NpcDialog(This_Player,
     '你没有强效太阳水秘方。\ \'+
     '|{cmd}<返回/@DoDrugNowLearn>\'
     );  
   end else
   This_Npc.NpcDialog(This_Player,
   '你已经学会了炼制强效太阳水。\ \'+
   '|{cmd}<返回/@DoDrugNowLearn>\'
   ); 
end;

Procedure _DoDrugNowLearn2;
Begin
   if This_Player.GetS(80,20) <> 1 then      //万年雪霜开启
   begin
     if This_Player.GetBagItemCount('万年雪霜秘方') > 0 then
     begin
       if This_Player.Level >= 40 then
       begin
         if This_Player.GetActivePoint + This_Player.GetTmpActivePoint >= 30 then 
         begin
         This_Player.SetS(80,20,1); 
         This_Player.Take('万年雪霜秘方',1);
         This_Npc.NpcDialog(This_Player,
         '恭喜你学会了炼制：<万年雪霜/c=red>\ \'+
         '|{cmd}<返回/@DoDrugNow>\'
         ); 
         end else
         This_Npc.NpcDialog(This_Player,
         '学习炼制炼制万年雪霜需要传奇信用分达到30分。\ \'+ 
         '|{cmd}<返回/@DoDrugNowLearn>\'
         );  
       end else
       This_Npc.NpcDialog(This_Player,
       '学习炼制炼制万年雪霜需要达到40级。\ \'+ 
       '|{cmd}<返回/@DoDrugNowLearn>\'
       );  
     end else
     This_Npc.NpcDialog(This_Player,
     '你没有万年雪霜秘方。\ \'+
     '|{cmd}<返回/@DoDrugNowLearn>\'
     );  
   end else
   This_Npc.NpcDialog(This_Player,
   '你已经学会了炼制万年雪霜。\ \'+
   '|{cmd}<返回/@DoDrugNowLearn>\'
   ); 
end;

Procedure _DoDrugNowLearn3;
Begin
   if This_Player.GetS(80,26) <> 1 then   //疗伤药开启 
   begin
     if This_Player.GetBagItemCount('疗伤药秘方') > 0 then
     begin
       if This_Player.Level >= 43 then
       begin
         if This_Player.GetActivePoint + This_Player.GetTmpActivePoint >= 30 then 
         begin
         This_Player.SetS(80,26,1); 
         This_Player.Take('疗伤药秘方',1);
         This_Npc.NpcDialog(This_Player,
         '恭喜你学会了炼制：<疗伤药/c=red>\ \'+
         '|{cmd}<返回/@DoDrugNow>\'
         ); 
         end else
         This_Npc.NpcDialog(This_Player,
         '学习炼制炼制疗伤药需要传奇信用分达到30分。\ \'+ 
         '|{cmd}<返回/@DoDrugNowLearn>\'
         );  
       end else
       This_Npc.NpcDialog(This_Player,
       '学习炼制炼制疗伤药需要达到43级。\ \'+ 
       '|{cmd}<返回/@DoDrugNowLearn>\'
       );  
     end else
     This_Npc.NpcDialog(This_Player,
     '你没有疗伤药秘方。\ \'+
     '|{cmd}<返回/@DoDrugNowLearn>\'
     );  
   end else
   This_Npc.NpcDialog(This_Player,
   '你已经学会了炼制疗伤药。\ \'+
   '|{cmd}<返回/@DoDrugNowLearn>\'
   ); 
end;



Procedure _DoDrugNowBegin;
var
Drug_lv1,Drug_lv2,Drug_lv3,Drug_exp1,Drug_exp2,Drug_exp3:integer;
Drug_str1,Drug_str2,Drug_str3:string;
Begin
   if This_Player.GetS(80,15) < 0 then This_Player.SetS(80,15,0);
   if This_Player.GetS(80,16) < 0 then This_Player.SetS(80,16,0);
   if This_Player.GetS(80,21) < 0 then This_Player.SetS(80,21,0);
   if This_Player.GetS(80,22) < 0 then This_Player.SetS(80,22,0);
   if This_Player.GetS(80,27) < 0 then This_Player.SetS(80,27,0);
   if This_Player.GetS(80,28) < 0 then This_Player.SetS(80,28,0);
   
   Drug_lv1:= This_Player.GetS(80,15);   //强效太阳水等级 
   Drug_lv2:= This_Player.GetS(80,21);   //万年雪霜等级
   Drug_lv3:= This_Player.GetS(80,27);   //疗伤药等级
   
   Drug_exp1:= This_Player.GetS(80,16);   //强效太阳水经验
   Drug_exp2:= This_Player.GetS(80,22);   //万年雪霜经验
   Drug_exp3:= This_Player.GetS(80,28);   //疗伤药经验
   
   if This_Player.GetS(80,14) <> 1 then Drug_str1:='未学习' else Drug_str1:='当前炼药等级为'+inttostr(Drug_lv1)+'级，熟练度'+inttostr(Drug_exp1); 
   if This_Player.GetS(80,20) <> 1 then Drug_str2:='未学习' else Drug_str2:='当前炼药等级为'+inttostr(Drug_lv2)+'级，熟练度'+inttostr(Drug_exp2); 
   if This_Player.GetS(80,26) <> 1 then Drug_str3:='未学习' else Drug_str3:='当前炼药等级为'+inttostr(Drug_lv3)+'级，熟练度'+inttostr(Drug_exp3); 
   
   This_Npc.NpcDialog(This_Player,
   '要炼制什么样的药品？\ \'+
   '|{cmd}<强效太阳水/@DoDrugNowBegin1>（'+Drug_str1+'）\ \'+
   '|{cmd}<万年雪霜/@DoDrugNowBegin2>（'+Drug_str2+'）\ \'+
   '|{cmd}<疗伤药/@DoDrugNowBegin3>（'+Drug_str3+'）\ \'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowBegin1;
Begin  
   if This_Player.GetS(80,14) = 1 then 
   begin
   This_Npc.NpcDialog(This_Player,
   '你现在背包一共有蛛果材料：  '+inttostr(This_Player.GetBagItemCount('蛛果'))+' 个\ \'+
   '|{cmd}<使用1个蛛果炼制1瓶强效太阳水/@DoDrugNowBegin1S~1>\'+
   '|{cmd}<使用10个蛛果炼制10瓶强效太阳水/@DoDrugNowBegin1S~2>\'+
   '|{cmd}<使用30个蛛果炼制30瓶强效太阳水/@DoDrugNowBegin1S~3>\'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
   end else 
   This_Npc.NpcDialog(This_Player,
   '你还没有学会炼制此种药品。\ \'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowBegin2;
Begin  
   if This_Player.GetS(80,20) = 1 then 
   begin
   This_Npc.NpcDialog(This_Player,
   '你现在背包一共有恶魔叶材料：  '+inttostr(This_Player.GetBagItemCount('恶魔叶'))+' 个\ \'+
   '|{cmd}<使用1个恶魔叶炼制1个万年雪霜/@DoDrugNowBegin2S~1>\'+
   '|{cmd}<使用10个恶魔叶炼制10个万年雪霜/@DoDrugNowBegin2S~2>\'+
   '|{cmd}<使用30个恶魔叶炼制30个万年雪霜/@DoDrugNowBegin2S~3>\'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
   end else 
   This_Npc.NpcDialog(This_Player,
   '你还没有学会炼制此种药品。\ \'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowBegin3;
Begin  
   if This_Player.GetS(80,26) = 1 then 
   begin
   This_Npc.NpcDialog(This_Player,
   '你现在背包一共有赤月莲材料：  '+inttostr(This_Player.GetBagItemCount('赤月莲'))+' 个\ \'+
   '|{cmd}<使用1个赤月莲炼制1瓶疗伤药/@DoDrugNowBegin3S~1>\'+
   '|{cmd}<使用10个赤月莲炼制10瓶疗伤药/@DoDrugNowBegin3S~2>\'+
   '|{cmd}<使用30个赤月莲炼制30瓶疗伤药/@DoDrugNowBegin3S~3>\'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
   end else 
   This_Npc.NpcDialog(This_Player,
   '你还没有学会炼制此种药品。\ \'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowBegin1S(kind:string);
var
temp_kind,time_kind,num_kind,gold_kind,Drug_lv1,Drug_exp1:integer;
Begin  
   if This_Player.GetS(80,14) <> 1 then exit;
   temp_kind:= strtointdef(kind,-1);
   if (temp_kind < 1) or (temp_kind > 3) then exit;
   if This_Player.GetS(80,15) < 0 then This_Player.SetS(80,15,0);
   if This_Player.GetS(80,16) < 0 then This_Player.SetS(80,16,0);
   
   Drug_lv1:= This_Player.GetS(80,15);   //强效太阳水等级    
   Drug_exp1:= This_Player.GetS(80,16);   //强效太阳水经验

   case temp_kind of
   1:num_kind:=1;
   2:num_kind:=10;
   3:num_kind:=30;
   end;

   case Drug_lv1 of
   0:time_kind:= 5*num_kind;
   1:time_kind:= 4*num_kind;
   2:time_kind:= 3*num_kind;
   3:time_kind:= 1*num_kind;
   end;
   gold_kind:= 1100*num_kind;
   This_Npc.NpcDialog(This_Player,
   '你将要炼制 '+inttostr(num_kind)+' 瓶强效太阳水，耗时  '+inttostr(time_kind)+' 分钟\ \'+
   '消耗金币 '+inttostr(gold_kind)+' 金币\ \'+
   '|{cmd}<开始炼制/@DoDrugNowBegin1T~'+kind+'>\'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowBegin1T(kind:string);
var
i,temp_kind,time_kind,num_kind1,num_kind,gold_kind,rand_kind,Drug_lv1,Drug_exp1:integer;
Begin  
   if This_Player.GetS(80,14) <> 1 then exit;
   temp_kind:= strtointdef(kind,-1);
   if (temp_kind < 1) or (temp_kind > 3) then exit;
   if This_Player.GetS(80,15) < 0 then This_Player.SetS(80,15,0);
   if This_Player.GetS(80,16) < 0 then This_Player.SetS(80,16,0);
   
   Drug_lv1:= This_Player.GetS(80,15);   //强效太阳水等级    
   Drug_exp1:= This_Player.GetS(80,16);   //强效太阳水经验

   case temp_kind of
   1:num_kind:=1;
   2:num_kind:=10;
   3:num_kind:=30;
   end;

   case Drug_lv1 of
   0:
   begin 
   time_kind:= 5*num_kind;
   rand_kind:=40;
   end;
   1:
   begin 
   time_kind:= 4*num_kind;
   rand_kind:=50;
   end;
   2:
   begin 
   time_kind:= 3*num_kind;
   rand_kind:=60;
   end;
   3:
   begin 
   time_kind:= 1*num_kind;
   rand_kind:=70;
   end;
   end;
   gold_kind:= 1100*num_kind;
   
   if This_Player.GetS(80,17) > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '请先取出上次炼制的药品！'
   ); 
   end else
   if This_Player.GetBagItemCount('蛛果') < num_kind then
   begin
   This_Npc.NpcDialog(This_Player,
   '缺少足够的材料：蛛果！'
   ); 
   end else
   if This_Player.GoldNum < gold_kind then
   begin
   This_Npc.NpcDialog(This_Player,
   '缺少足够的材料：金币！'
   ); 
   end else
   begin
     This_Player.Take('蛛果',num_kind);
     This_Player.DecGold(gold_kind);
     This_Player.SetS(80,17,ConvertDateTimeToDB(GetNow) div 60);   //当前时间
     This_Player.SetS(80,18,num_kind);     //炼药总数 
     This_Player.SetS(80,32,time_kind);     //炼药时间 
     This_Player.AddLogRec(9, '蛛果', 811152, num_kind, '炼药回收');
     num_kind1 := num_kind;
     for i:= 1 TO num_kind1 do
     begin
       if random(100) < rand_kind then  num_kind:= num_kind -1;
     end;
     This_Player.SetS(80,19,num_kind);     //残渣总数 
     This_Npc.NpcDialog(This_Player,
     '您的药品还有'+inttostr(time_kind)+'分钟后炼制完成，到时候再来吧。\ \'
     );
   end; 
end;

Procedure _DoDrugNowBegin2S(kind:string);
var
temp_kind,time_kind,num_kind,gold_kind,Drug_lv1,Drug_exp1:integer;
Begin  
   if This_Player.GetS(80,20) <> 1 then exit;
   temp_kind:= strtointdef(kind,-1);
   if (temp_kind < 1) or (temp_kind > 3) then exit;
   if This_Player.GetS(80,21) < 0 then This_Player.SetS(80,21,0);
   if This_Player.GetS(80,22) < 0 then This_Player.SetS(80,22,0);
   
   Drug_lv1:= This_Player.GetS(80,21);   //万年雪霜等级    
   Drug_exp1:= This_Player.GetS(80,22);   //万年雪霜经验

   case temp_kind of
   1:num_kind:=1;
   2:num_kind:=10;
   3:num_kind:=30;
   end;

   case Drug_lv1 of
   0:time_kind:= 5*num_kind;
   1:time_kind:= 4*num_kind;
   2:time_kind:= 3*num_kind;
   3:time_kind:= 2*num_kind;
   4:time_kind:= 1*num_kind;
   end;
   gold_kind:= 5000*num_kind;
   This_Npc.NpcDialog(This_Player,
   '你将要炼制 '+inttostr(num_kind)+' 个万年雪霜，耗时  '+inttostr(time_kind)+' 分钟\ \'+
   '消耗金币 '+inttostr(gold_kind)+' 金币\ \'+
   '|{cmd}<开始炼制/@DoDrugNowBegin2T~'+kind+'>\'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowBegin2T(kind:string);
var
i,temp_kind,time_kind,num_kind,num_kind1,gold_kind,rand_kind,Drug_lv1,Drug_exp1:integer;
Begin  
   if This_Player.GetS(80,20) <> 1 then exit;
   temp_kind:= strtointdef(kind,-1);
   if (temp_kind < 1) or (temp_kind > 3) then exit;
   if This_Player.GetS(80,21) < 0 then This_Player.SetS(80,21,0);
   if This_Player.GetS(80,22) < 0 then This_Player.SetS(80,22,0);
   
   Drug_lv1:= This_Player.GetS(80,21);   //万年雪霜等级    
   Drug_exp1:= This_Player.GetS(80,22);   //万年雪霜经验

   case temp_kind of
   1:num_kind:=1;
   2:num_kind:=10;
   3:num_kind:=30;
   end;

   case Drug_lv1 of
   0:
   begin 
   time_kind:= 5*num_kind;
   rand_kind:=40;
   end;
   1:
   begin 
   time_kind:= 4*num_kind;
   rand_kind:=45;
   end;
   2:
   begin 
   time_kind:= 3*num_kind;
   rand_kind:=50;
   end;
   3:
   begin 
   time_kind:= 2*num_kind;
   rand_kind:=60;
   end;
   4:
   begin 
   time_kind:= 1*num_kind;
   rand_kind:=70;
   end;
   end;
   gold_kind:= 5000*num_kind;
   
   if This_Player.GetS(80,23) > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '请先取出上次炼制的药品！'
   ); 
   end else
   if This_Player.GetBagItemCount('恶魔叶') < num_kind then
   begin
   This_Npc.NpcDialog(This_Player,
   '缺少足够的材料：恶魔叶！'
   ); 
   end else
   if This_Player.GoldNum < gold_kind then
   begin
   This_Npc.NpcDialog(This_Player,
   '缺少足够的材料：金币！'
   ); 
   end else
   begin
     This_Player.Take('恶魔叶',num_kind);
     This_Player.DecGold(gold_kind);
     This_Player.SetS(80,23,ConvertDateTimeToDB(GetNow) div 60);   //当前时间
     This_Player.SetS(80,24,num_kind);     //炼药总数 
     This_Player.SetS(80,33,time_kind);     //炼药时间 
     This_Player.AddLogRec(9, '恶魔叶', 811152, num_kind, '炼药回收');
     num_kind1 := num_kind;
     for i:= 1 TO num_kind1 do
     begin
       if random(100) < rand_kind then  num_kind:= num_kind -1;
     end;
     This_Player.SetS(80,25,num_kind);     //残渣总数 
     This_Npc.NpcDialog(This_Player,
     '您的药品还有'+inttostr(time_kind)+'分钟后炼制完成，到时候再来吧。\ \'
     );
   end; 
end;

Procedure _DoDrugNowBegin3S(kind:string);
var
temp_kind,time_kind,num_kind,gold_kind,Drug_lv1,Drug_exp1:integer;
Begin  
   if This_Player.GetS(80,26) <> 1 then exit;
   temp_kind:= strtointdef(kind,-1);
   if (temp_kind < 1) or (temp_kind > 3) then exit;
   if This_Player.GetS(80,27) < 0 then This_Player.SetS(80,27,0);
   if This_Player.GetS(80,28) < 0 then This_Player.SetS(80,28,0);
   
   Drug_lv1:= This_Player.GetS(80,27);   //疗伤药等级    
   Drug_exp1:= This_Player.GetS(80,28);   //疗伤药经验

   case temp_kind of
   1:num_kind:=1;
   2:num_kind:=10;
   3:num_kind:=30;
   end;

   case Drug_lv1 of
   0:time_kind:= 5*num_kind;
   1:time_kind:= 4*num_kind;
   2:time_kind:= 3*num_kind;
   3:time_kind:= 2*num_kind;
   4:time_kind:= 1*num_kind;
   5:time_kind:= 1*num_kind;
   end;
   gold_kind:= 20000*num_kind;
   This_Npc.NpcDialog(This_Player,
   '你将要炼制 '+inttostr(num_kind)+' 个疗伤药，耗时  '+inttostr(time_kind)+' 分钟\ \'+
   '消耗金币 '+inttostr(gold_kind)+' 金币\ \'+
   '|{cmd}<开始炼制/@DoDrugNowBegin3T~'+kind+'>\'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowBegin3T(kind:string);
var
i,temp_kind,time_kind,num_kind,num_kind1,gold_kind,rand_kind,Drug_lv1,Drug_exp1:integer;
Begin  
   if This_Player.GetS(80,26) <> 1 then exit;
   temp_kind:= strtointdef(kind,-1);
   if (temp_kind < 1) or (temp_kind > 3) then exit;
   if This_Player.GetS(80,27) < 0 then This_Player.SetS(80,27,0);
   if This_Player.GetS(80,28) < 0 then This_Player.SetS(80,28,0);
   
   Drug_lv1:= This_Player.GetS(80,27);   //疗伤药等级    
   Drug_exp1:= This_Player.GetS(80,28);   //疗伤药经验

   case temp_kind of
   1:num_kind:=1;
   2:num_kind:=10;
   3:num_kind:=30;
   end;

   case Drug_lv1 of
   0:
   begin 
   time_kind:= 5*num_kind;
   rand_kind:=40;
   end;
   1:
   begin 
   time_kind:= 4*num_kind;
   rand_kind:=45;
   end;
   2:
   begin 
   time_kind:= 3*num_kind;
   rand_kind:=50;
   end;
   3:
   begin 
   time_kind:= 2*num_kind;
   rand_kind:=60;
   end;
   4:
   begin 
   time_kind:= 1*num_kind;
   rand_kind:=65;
   end;
   5:
   begin 
   time_kind:= 1*num_kind;
   rand_kind:=70;
   end;
   end;
   gold_kind:= 20000*num_kind;
   
   if This_Player.GetS(80,29) > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '请先取出上次炼制的药品！'
   ); 
   end else
   if This_Player.GetBagItemCount('赤月莲') < num_kind then
   begin
   This_Npc.NpcDialog(This_Player,
   '缺少足够的材料：赤月莲！'
   ); 
   end else
   if This_Player.GoldNum < gold_kind then
   begin
   This_Npc.NpcDialog(This_Player,
   '缺少足够的材料：金币！'
   ); 
   end else
   begin
     This_Player.Take('赤月莲',num_kind);
     This_Player.DecGold(gold_kind);
     This_Player.SetS(80,29,ConvertDateTimeToDB(GetNow) div 60);   //当前时间
     This_Player.SetS(80,30,num_kind);     //炼药总数 
     This_Player.SetS(80,34,time_kind);     //炼药时间
     This_Player.AddLogRec(9, '赤月莲', 811152, num_kind, '炼药回收');
     num_kind1 := num_kind; 
     for i:= 1 TO num_kind1 do
     begin
       if random(100) < rand_kind then  num_kind:= num_kind -1;
     end;
     This_Player.SetS(80,31,num_kind);     //残渣总数 
     This_Npc.NpcDialog(This_Player,
     '您的药品还有'+inttostr(time_kind)+'分钟后炼制完成，到时候再来吧。\ \'
     );
   end; 
end;

Procedure _DoDrugNowGet;
var
Drug_time1,Drug_time2,Drug_time3,Drug_time:integer;
Drug_str1,Drug_str2,Drug_str3:string;
Begin   
   Drug_time := ConvertDateTimeToDB(GetNow) div 60; 
   Drug_time1:= This_Player.GetS(80,32) - (Drug_time - This_Player.GetS(80,17));   //强效太阳水剩余时间 
   Drug_time2:= This_Player.GetS(80,33) - (Drug_time - This_Player.GetS(80,23));   //万年雪霜剩余时间 
   Drug_time3:= This_Player.GetS(80,34) - (Drug_time - This_Player.GetS(80,29));   //疗伤药剩余时间 
   
   if This_Player.GetS(80,17) <= 0 then Drug_str1:='未炼制' else if Drug_time1 > 0 then Drug_str1:= inttostr(Drug_time1)+'分钟后完成' else Drug_str1:='已完成'; 
   if This_Player.GetS(80,23) <= 0 then Drug_str2:='未炼制' else if Drug_time2 > 0 then Drug_str2:= inttostr(Drug_time2)+'分钟后完成' else Drug_str2:='已完成';
   if This_Player.GetS(80,29) <= 0 then Drug_str3:='未炼制' else if Drug_time3 > 0 then Drug_str3:= inttostr(Drug_time3)+'分钟后完成' else Drug_str3:='已完成';
   
   This_Npc.NpcDialog(This_Player,
   '要领取哪样炼制完成药品呢？\ \'+
   '|{cmd}<领取强效太阳水/@DoDrugNowGet1>（'+Drug_str1+'）\ \'+
   '|{cmd}<领取万年雪霜/@DoDrugNowGet2>（'+Drug_str2+'）\ \'+
   '|{cmd}<领取疗伤药/@DoDrugNowGet3>（'+Drug_str3+'）\ \'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowGet1;
var
Drug_time,Drug_time1,Drug_num,Drug_num1,Drug_num2,Drug_lv1,Drug_exp1,Drug_exp:integer;
Begin  
   
   if This_Player.GetS(80,17) <= 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你并没有让我帮你炼制这种药品啊，没想到你年纪轻轻\'+
   '记性还不如我个老头子呢。'
   ); 
   exit;
   end;
   Drug_time := ConvertDateTimeToDB(GetNow) div 60; 
   Drug_time1:= This_Player.GetS(80,32) - (Drug_time - This_Player.GetS(80,17));   //强效太阳水剩余时间   
   if Drug_time1 > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '您的药品还有'+inttostr(Drug_time1)+'分钟后炼制完成，到时候再来吧。'
   ); 
   exit;
   end; 
   
   if This_Player.GetS(80,15) < 0 then This_Player.SetS(80,15,0);
   if This_Player.GetS(80,16) < 0 then This_Player.SetS(80,16,0); 
   Drug_lv1:= This_Player.GetS(80,15);   //强效太阳水等级    
   Drug_exp1:= This_Player.GetS(80,16);   //强效太阳水经验
    
   Drug_num:= This_Player.GetS(80,18);    //炼药总数 
   Drug_num1:= This_Player.GetS(80,19);   //残渣总数
   Drug_num2:= Drug_num - Drug_num1;      //成品总数 
   
   case Drug_lv1 of
   0: Drug_exp:= 12;
   1: Drug_exp:= 60;
   2: Drug_exp:= 200;
   3: Drug_exp:= 0;
   end; 
   
   if Drug_lv1 = 3 then
   begin
   Drug_exp:= 0;
   end else
   if Drug_exp1 + Drug_num2 >= Drug_exp then
   begin
     if (This_Player.Level >= 35) and (Drug_lv1 = 0) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 36) and (Drug_lv1 = 1) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 38) and (Drug_lv1 = 2) then
     begin
     Drug_exp:= Drug_exp - Drug_exp1;
     end else
     begin
     Drug_exp:= Drug_exp - Drug_exp1;
     end; 
   end else
   begin
   Drug_exp:= Drug_num2;
   end;
   
   This_Npc.NpcDialog(This_Player,
   '您炼制出了：\ \'+
   '|<强效太阳水x'+inttostr(Drug_num2)+'/c=red>\'+
   '|<蛛果残渣x'+inttostr(Drug_num1)+'/c=red>\'+
   '|<熟练度增加'+inttostr(Drug_exp)+'点/c=red>\ \'+
   '|{cmd}<放入背包/@DoDrugNowGet1_1>'
   ); 
end;

Procedure _DoDrugNowGet1_1;
var
Drug_time,Drug_time1,Drug_num,Drug_num1,Drug_num2,Drug_lv1,Drug_exp1,Drug_exp:integer;
Begin  
   
   if This_Player.GetS(80,17) <= 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你并没有让我帮你炼制这种药品啊，没想到你年纪轻轻\'+
   '记性还不如我个老头子呢。'
   ); 
   exit;
   end;
   Drug_time := ConvertDateTimeToDB(GetNow) div 60; 
   Drug_time1:= This_Player.GetS(80,32) - (Drug_time - This_Player.GetS(80,17));   //强效太阳水剩余时间   
   if Drug_time1 > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '您的药品还有'+inttostr(Drug_time1)+'分钟后炼制完成，到时候再来吧。'
   ); 
   exit;
   end; 
   
   if This_Player.GetS(80,15) < 0 then This_Player.SetS(80,15,0);
   if This_Player.GetS(80,16) < 0 then This_Player.SetS(80,16,0); 
   Drug_lv1:= This_Player.GetS(80,15);   //强效太阳水等级    
   Drug_exp1:= This_Player.GetS(80,16);   //强效太阳水经验
    
   Drug_num:= This_Player.GetS(80,18);    //炼药总数 
   Drug_num1:= This_Player.GetS(80,19);   //残渣总数
   Drug_num2:= Drug_num - Drug_num1;      //成品总数  
   
   
   if This_Player.FreeBagNum > Drug_num2 then 
   begin
     case Drug_lv1 of
     0: Drug_exp:= 12;
     1: Drug_exp:= 60;
     2: Drug_exp:= 200;
     3: Drug_exp:= 0;
     end; 
     
     if Drug_lv1 = 3 then
     begin
     This_Player.SetS(80,16,0);
     Drug_exp:= 0;
     end else
     if Drug_exp1 + Drug_num2 >= Drug_exp then
     begin
       if (This_Player.Level >= 35) and (Drug_lv1 = 0) then
       begin
       This_Player.SetS(80,15,Drug_lv1 + 1);
       This_Player.SetS(80,16,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 36) and (Drug_lv1 = 1) then
       begin
       This_Player.SetS(80,15,Drug_lv1 + 1);
       This_Player.SetS(80,16,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 38) and (Drug_lv1 = 2) then
       begin
       This_Player.SetS(80,15,Drug_lv1 + 1);
       This_Player.SetS(80,16,0);
       Drug_exp:= Drug_exp - Drug_exp1;
       end else
       begin
       This_Player.SetS(80,16,Drug_exp);
       Drug_exp:= Drug_exp - Drug_exp1;
       end; 
     end else
     begin
     This_Player.SetS(80,16,Drug_exp1 + Drug_num2);
     Drug_exp:= Drug_num2;
     end;
     if Drug_num2 > 0 then 
     begin
     This_Player.Give('强效太阳水',Drug_num2);
     This_Player.AddLogRec(9, '强效太阳水', 811152, Drug_num2, '炼药模块');
       if GetG(35,44) <> GetDateNum(GetNow) then
       begin
       SetG(35,44,GetDateNum(GetNow));
       SetG(35,45,GetG(35,46));
       SetG(35,47,GetG(35,48));
       SetG(35,49,GetG(35,50));
       SetG(35,46,0);
       SetG(35,48,0);
       SetG(35,50,0);
       end;
       SetG(35,50, GetG(35,50) + Drug_num2);
     end;
     if Drug_num1 > 0 then 
     begin 
     This_Player.Give('蛛果残渣',Drug_num1);
     This_Player.AddLogRec(9, '蛛果残渣', 811152, Drug_num1, '炼药模块');
     end;
     This_Player.SetS(80,17,0);
     This_Player.SetS(80,18,0);
     This_Player.SetS(80,19,0);
     This_Player.SetS(80,32,0);
     This_Npc.NpcDialog(This_Player,
     '您获得了：\ \'+
     '|<强效太阳水x'+inttostr(Drug_num2)+'/c=red>\'+
     '|<蛛果残渣x'+inttostr(Drug_num1)+'/c=red>\'+
     '|<熟练度增加'+inttostr(Drug_exp)+'点/c=red>\ \'
     ); 
   end else 
   This_Npc.NpcDialog(This_Player,
   '您的背包空间不足'+inttostr(Drug_num2 + 1)+'格，请清理背包再来\'
   ); 
end;

Procedure _DoDrugNowGet2;
var
Drug_time,Drug_time1,Drug_num,Drug_num1,Drug_num2,Drug_lv1,Drug_exp1,Drug_exp:integer;
Begin  
   
   if This_Player.GetS(80,23) <= 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你并没有让我帮你炼制这种药品啊，没想到你年纪轻轻\'+
   '记性还不如我个老头子呢。'
   ); 
   exit;
   end;
   Drug_time := ConvertDateTimeToDB(GetNow) div 60; 
   Drug_time1:= This_Player.GetS(80,33) - (Drug_time - This_Player.GetS(80,23));   //万年雪霜剩余时间   
   if Drug_time1 > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '您的药品还有'+inttostr(Drug_time1)+'分钟后炼制完成，到时候再来吧。'
   ); 
   exit;
   end; 
   
   if This_Player.GetS(80,21) < 0 then This_Player.SetS(80,21,0);
   if This_Player.GetS(80,22) < 0 then This_Player.SetS(80,22,0); 
   Drug_lv1:= This_Player.GetS(80,21);   //万年雪霜等级    
   Drug_exp1:= This_Player.GetS(80,22);   //万年雪霜经验
    
   Drug_num:= This_Player.GetS(80,24);    //炼药总数 
   Drug_num1:= This_Player.GetS(80,25);   //残渣总数
   Drug_num2:= Drug_num - Drug_num1;      //成品总数 
   
   case Drug_lv1 of
   0: Drug_exp:= 25;
   1: Drug_exp:= 120;
   2: Drug_exp:= 400;
   3: Drug_exp:= 3000;
   4: Drug_exp:= 0;
   end; 
   
   if Drug_lv1 = 4 then
   begin
   Drug_exp:= 0;
   end else
   if Drug_exp1 + Drug_num2 >= Drug_exp then
   begin
     if (This_Player.Level >= 40) and (Drug_lv1 = 0) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 41) and (Drug_lv1 = 1) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 42) and (Drug_lv1 = 2) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 43) and (Drug_lv1 = 3) then
     begin
     Drug_exp:= Drug_exp - Drug_exp1;
     end else
     begin
     Drug_exp:= Drug_exp - Drug_exp1;
     end; 
   end else
   begin
   Drug_exp:= Drug_num2;
   end;
   
   This_Npc.NpcDialog(This_Player,
   '您炼制出了：\ \'+
   '|<万年雪霜x'+inttostr(Drug_num2)+'/c=red>\'+
   '|<恶魔叶残渣x'+inttostr(Drug_num1)+'/c=red>\'+
   '|<熟练度增加'+inttostr(Drug_exp)+'点/c=red>\ \'+
   '|{cmd}<放入背包/@DoDrugNowGet2_1>'
   ); 
end;

Procedure _DoDrugNowGet2_1;
var
Drug_time,Drug_time1,Drug_num,Drug_num1,Drug_num2,Drug_lv1,Drug_exp1,Drug_exp:integer;
Begin  
   
   if This_Player.GetS(80,23) <= 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你并没有让我帮你炼制这种药品啊，没想到你年纪轻轻\'+
   '记性还不如我个老头子呢。'
   ); 
   exit;
   end;
   Drug_time := ConvertDateTimeToDB(GetNow) div 60; 
   Drug_time1:= This_Player.GetS(80,33) - (Drug_time - This_Player.GetS(80,23));   //万年雪霜剩余时间   
   if Drug_time1 > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '您的药品还有'+inttostr(Drug_time1)+'分钟后炼制完成，到时候再来吧。'
   ); 
   exit;
   end; 
   
   if This_Player.GetS(80,21) < 0 then This_Player.SetS(80,21,0);
   if This_Player.GetS(80,22) < 0 then This_Player.SetS(80,22,0); 
   Drug_lv1:= This_Player.GetS(80,21);   //万年雪霜等级    
   Drug_exp1:= This_Player.GetS(80,22);   //万年雪霜经验
    
   Drug_num:= This_Player.GetS(80,24);    //炼药总数 
   Drug_num1:= This_Player.GetS(80,25);   //残渣总数
   Drug_num2:= Drug_num - Drug_num1;      //成品总数  
   
   
   if This_Player.FreeBagNum > Drug_num2 then 
   begin
     case Drug_lv1 of
     0: Drug_exp:= 25;
     1: Drug_exp:= 120;
     2: Drug_exp:= 400;
     3: Drug_exp:= 3000;
     4: Drug_exp:= 0;
     end; 
     
     if Drug_lv1 = 4 then
     begin
     Drug_exp:= 0;
     end else
     if Drug_exp1 + Drug_num2 >= Drug_exp then
     begin
       if (This_Player.Level >= 40) and (Drug_lv1 = 0) then
       begin
       This_Player.SetS(80,21,Drug_lv1 + 1);
       This_Player.SetS(80,22,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 41) and (Drug_lv1 = 1) then
       begin
       This_Player.SetS(80,21,Drug_lv1 + 1);
       This_Player.SetS(80,22,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 42) and (Drug_lv1 = 2) then
       begin
       This_Player.SetS(80,21,Drug_lv1 + 1);
       This_Player.SetS(80,22,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 43) and (Drug_lv1 = 3) then
       begin
       This_Player.SetS(80,21,Drug_lv1 + 1);
       This_Player.SetS(80,22,0);
       Drug_exp:= Drug_exp - Drug_exp1;
       end else
       begin
       This_Player.SetS(80,22,Drug_exp);
       Drug_exp:= Drug_exp - Drug_exp1;
       end; 
     end else
     begin
     This_Player.SetS(80,22,Drug_exp1 + Drug_num2);
     Drug_exp:= Drug_num2;
     end;
     if Drug_num2 > 0 then 
     begin
     This_Player.Give('万年雪霜',Drug_num2);
     This_Player.AddLogRec(9, '万年雪霜', 811152, Drug_num2, '炼药模块');
       if GetG(35,44) <> GetDateNum(GetNow) then
       begin
       SetG(35,44,GetDateNum(GetNow));
       SetG(35,45,GetG(35,46));
       SetG(35,47,GetG(35,48));
       SetG(35,49,GetG(35,50));
       SetG(35,46,0);
       SetG(35,48,0);
       SetG(35,50,0);
       end;
       SetG(35,48, GetG(35,48) + Drug_num2);
     end;
     if Drug_num1 > 0 then 
     begin 
     This_Player.Give('恶魔叶残渣',Drug_num1);
     This_Player.AddLogRec(9, '恶魔叶残渣', 811152, Drug_num1, '炼药模块');
     end;
     This_Player.SetS(80,23,0);
     This_Player.SetS(80,24,0);
     This_Player.SetS(80,25,0);
     This_Player.SetS(80,33,0);
     This_Npc.NpcDialog(This_Player,
     '您获得了：\ \'+
     '|<万年雪霜x'+inttostr(Drug_num2)+'/c=red>\'+
     '|<恶魔叶残渣x'+inttostr(Drug_num1)+'/c=red>\'+
     '|<熟练度增加'+inttostr(Drug_exp)+'点/c=red>\ \'
     ); 
   end else 
   This_Npc.NpcDialog(This_Player,
   '您的背包空间不足'+inttostr(Drug_num2 + 1)+'格，请清理背包再来\'
   ); 
end;

Procedure _DoDrugNowGet3;
var
Drug_time,Drug_time1,Drug_num,Drug_num1,Drug_num2,Drug_lv1,Drug_exp1,Drug_exp:integer;
Begin  
   
   if This_Player.GetS(80,29) <= 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你并没有让我帮你炼制这种药品啊，没想到你年纪轻轻\'+
   '记性还不如我个老头子呢。'
   ); 
   exit;
   end;
   Drug_time := ConvertDateTimeToDB(GetNow) div 60; 
   Drug_time1:= This_Player.GetS(80,34) - (Drug_time - This_Player.GetS(80,29));   //疗伤药剩余时间   
   if Drug_time1 > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '您的药品还有'+inttostr(Drug_time1)+'分钟后炼制完成，到时候再来吧。'
   ); 
   exit;
   end; 
   
   if This_Player.GetS(80,27) < 0 then This_Player.SetS(80,27,0);
   if This_Player.GetS(80,28) < 0 then This_Player.SetS(80,28,0); 
   Drug_lv1:= This_Player.GetS(80,27);   //疗伤药等级    
   Drug_exp1:= This_Player.GetS(80,28);   //疗伤药经验
    
   Drug_num:= This_Player.GetS(80,30);    //炼药总数 
   Drug_num1:= This_Player.GetS(80,31);   //残渣总数
   Drug_num2:= Drug_num - Drug_num1;      //成品总数 
   
   case Drug_lv1 of
   0: Drug_exp:= 20;
   1: Drug_exp:= 150;
   2: Drug_exp:= 900;
   3: Drug_exp:= 3800;
   4: Drug_exp:= 5000;
   5: Drug_exp:= 0;
   end; 
   
   if Drug_lv1 = 5 then
   begin
   Drug_exp:= 0;
   end else
   if Drug_exp1 + Drug_num2 >= Drug_exp then
   begin
     if (This_Player.Level >= 43) and (Drug_lv1 = 0) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 43) and (Drug_lv1 = 1) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 44) and (Drug_lv1 = 2) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 45) and (Drug_lv1 = 3) then
     begin
     Drug_exp:= Drug_num2;
     end else
     if (This_Player.Level >= 47) and (Drug_lv1 = 4) then
     begin
     Drug_exp:= Drug_exp - Drug_exp1;
     end else
     begin
     Drug_exp:= Drug_exp - Drug_exp1;
     end; 
   end else
   begin
   Drug_exp:= Drug_num2;
   end;
   
   This_Npc.NpcDialog(This_Player,
   '您炼制出了：\ \'+
   '|<疗伤药x'+inttostr(Drug_num2)+'/c=red>\'+
   '|<赤月莲残渣x'+inttostr(Drug_num1)+'/c=red>\'+
   '|<熟练度增加'+inttostr(Drug_exp)+'点/c=red>\ \'+
   '|{cmd}<放入背包/@DoDrugNowGet3_1>'
   ); 
end;

Procedure _DoDrugNowGet3_1;
var
Drug_time,Drug_time1,Drug_num,Drug_num1,Drug_num2,Drug_lv1,Drug_exp1,Drug_exp:integer;
Begin  
   
   if This_Player.GetS(80,29) <= 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你并没有让我帮你炼制这种药品啊，没想到你年纪轻轻\'+
   '记性还不如我个老头子呢。'
   ); 
   exit;
   end;
   Drug_time := ConvertDateTimeToDB(GetNow) div 60; 
   Drug_time1:= This_Player.GetS(80,34) - (Drug_time - This_Player.GetS(80,29));   //疗伤药剩余时间   
   if Drug_time1 > 0 then
   begin
   This_Npc.NpcDialog(This_Player,
   '您的药品还有'+inttostr(Drug_time1)+'分钟后炼制完成，到时候再来吧。'
   ); 
   exit;
   end; 
   
   if This_Player.GetS(80,27) < 0 then This_Player.SetS(80,27,0);
   if This_Player.GetS(80,28) < 0 then This_Player.SetS(80,28,0); 
   Drug_lv1:= This_Player.GetS(80,27);   //疗伤药等级    
   Drug_exp1:= This_Player.GetS(80,28);   //疗伤药经验
    
   Drug_num:= This_Player.GetS(80,30);    //炼药总数 
   Drug_num1:= This_Player.GetS(80,31);   //残渣总数
   Drug_num2:= Drug_num - Drug_num1;      //成品总数  
   
   
   if This_Player.FreeBagNum > Drug_num2 then 
   begin
     case Drug_lv1 of
     0: Drug_exp:= 20;
     1: Drug_exp:= 150;
     2: Drug_exp:= 900;
     3: Drug_exp:= 3800;
     4: Drug_exp:= 5000;
     5: Drug_exp:= 0;
     end; 
     
     if Drug_lv1 = 5 then
     begin
     Drug_exp:= 0;
     end else
     if Drug_exp1 + Drug_num2 >= Drug_exp then
     begin
       if (This_Player.Level >= 43) and (Drug_lv1 = 0) then
       begin
       This_Player.SetS(80,27,Drug_lv1 + 1);
       This_Player.SetS(80,28,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 43) and (Drug_lv1 = 1) then
       begin
       This_Player.SetS(80,27,Drug_lv1 + 1);
       This_Player.SetS(80,28,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 44) and (Drug_lv1 = 2) then
       begin
       This_Player.SetS(80,27,Drug_lv1 + 1);
       This_Player.SetS(80,28,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 45) and (Drug_lv1 = 3) then
       begin
       This_Player.SetS(80,27,Drug_lv1 + 1);
       This_Player.SetS(80,28,Drug_exp1 + Drug_num2 - Drug_exp);
       Drug_exp:= Drug_num2;
       end else
       if (This_Player.Level >= 47) and (Drug_lv1 = 4) then
       begin
       This_Player.SetS(80,27,Drug_lv1 + 1);
       This_Player.SetS(80,28,0);
       Drug_exp:= Drug_exp - Drug_exp1;
       end else
       begin
       This_Player.SetS(80,28,Drug_exp);
       Drug_exp:= Drug_exp - Drug_exp1;
       end; 
     end else
     begin
     This_Player.SetS(80,28,Drug_exp1 + Drug_num2);
     Drug_exp:= Drug_num2;
     end;
     if Drug_num2 > 0 then 
     begin
     This_Player.Give('疗伤药',Drug_num2);
     This_Player.AddLogRec(9, '疗伤药', 811152, Drug_num2, '炼药模块');
       if GetG(35,44) <> GetDateNum(GetNow) then
       begin
       SetG(35,44,GetDateNum(GetNow));
       SetG(35,45,GetG(35,46));
       SetG(35,47,GetG(35,48));
       SetG(35,49,GetG(35,50));
       SetG(35,46,0);
       SetG(35,48,0);
       SetG(35,50,0);
       end;
       SetG(35,46, GetG(35,46) + Drug_num2);
     end;
     if Drug_num1 > 0 then 
     begin 
     This_Player.Give('赤月莲残渣',Drug_num1);
     This_Player.AddLogRec(9, '赤月莲残渣', 811152, Drug_num1, '炼药模块');
     end;
     This_Player.SetS(80,29,0);
     This_Player.SetS(80,30,0);
     This_Player.SetS(80,31,0);
     This_Player.SetS(80,34,0);
     This_Npc.NpcDialog(This_Player,
     '您获得了：\ \'+
     '|<疗伤药x'+inttostr(Drug_num2)+'/c=red>\'+
     '|<赤月莲残渣x'+inttostr(Drug_num1)+'/c=red>\'+
     '|<熟练度增加'+inttostr(Drug_exp)+'点/c=red>\ \'
     ); 
   end else 
   This_Npc.NpcDialog(This_Player,
   '您的背包空间不足'+inttostr(Drug_num2 + 1)+'格，请清理背包再来\'
   ); 
end;

Procedure _DoDrugNowSell;
Begin
   This_Npc.NpcDialog(This_Player,
   '有些是炼药用的珍贵材料，你真舍得卖掉吗？\ \'+
   '|{cmd}<出售背包中所有蛛果/@DoDrugNowSellAll~1>       |{cmd}<出售背包中所有蛛果残渣/@DoDrugNowSellAll~4>\'+
   '|{cmd}<出售背包中所有恶魔叶/@DoDrugNowSellAll~2>     |{cmd}<出售背包中所有恶魔叶残渣/@DoDrugNowSellAll~5>\'+
   '|{cmd}<出售背包中所有赤月莲/@DoDrugNowSellAll~3>     |{cmd}<出售背包中所有赤月莲残渣/@DoDrugNowSellAll~6>\ \'+
   '|{cmd}<返回/@DoDrugNow>\'
   );
end;

Procedure _DoDrugNowSellAll(kind:string);
var
temp_kind,Gold_kind,Num_kind:integer;
name_kind:string;
Begin
   temp_kind:= strtointdef(kind,-1);
   if (temp_kind < 1) or (temp_kind > 6) then exit;
   case temp_kind of
     1:
     begin
     name_kind:='蛛果';
     Gold_kind:=50;
     end;
     2:
     begin
     name_kind:='恶魔叶';
     Gold_kind:=100;
     end;
     3:
     begin
     name_kind:='赤月莲';
     Gold_kind:=120;
     end;
     4:
     begin
     name_kind:='蛛果残渣';
     Gold_kind:=1000;
     end;
     5:
     begin
     name_kind:='恶魔叶残渣';
     Gold_kind:=5000;
     end;
     6:
     begin
     name_kind:='赤月莲残渣';
     Gold_kind:=20000;
     end;
   end;
   Num_kind:= This_Player.GetBagItemCount(name_kind);
   if Num_kind > 0 then
   begin
     if This_Player.GoldNum + Num_kind*Gold_kind < 50000000 then 
     begin
     This_Player.Take(name_kind,Num_kind); 
     This_Player.AddGold(Num_kind*Gold_kind);
     This_Player.PlayerNotice('出售'+inttostr(Num_kind)+'个'+name_kind+'，获得：'+inttostr(Num_kind*Gold_kind)+'金币。',2);
     This_Player.AddLogRec(9, name_kind, 811152, num_kind, '金币回收');
     end else
     begin
     This_Player.PlayerNotice('可携带金币超出上限。',2);
     end;
   end else
   begin
   This_Player.PlayerNotice('没有可出售的物品。',2);
   end;   
   _DoDrugNowSell;
end;

//******************炼药****************** 

procedure _GoToBai;
begin
  if This_Player.MapName = '1006' then
  This_Player.Flyto('11',185,305); 
end;

procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //加载道具
  This_NPC.FillGoods('金创药(小量)', 200, 1);
  This_NPC.FillGoods('魔法药(小量)', 200, 1); 
  This_NPC.FillGoods('金创药(中量)', 100, 1);
  This_NPC.FillGoods('魔法药(中量)', 100, 1);
  This_NPC.FillGoods('强效金创药', 100, 1);
  This_NPC.FillGoods('强效魔法药', 100, 1);
  This_NPC.FillGoods('金创药(小)包', 100, 1);
  This_NPC.FillGoods('魔法药(小)包', 100, 1);
  This_NPC.FillGoods('金创药(中)包', 100, 1);
  This_NPC.FillGoods('魔法药(中)包', 100, 1);  
  This_NPC.FillGoods('超级金创药', 100, 1);
  This_NPC.FillGoods('超级魔法药', 100, 1);
  This_NPC.FillGoods('灰色药粉(少量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(少量)', 1, 1); 
  This_NPC.FillGoods('灰色药粉(中量)', 1, 1);
  This_NPC.FillGoods('黄色药粉(中量)', 1, 1);
  This_NPC.FillGoods('灰色药粉(大量)', 10, 1);
  This_NPC.FillGoods('黄色药粉(大量)', 10, 1);
  This_NPC.FillGoods('超级灰色药粉', 10, 1);
  This_NPC.FillGoods('超级黄色药粉', 10, 1);
  //加载stdmode  
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(25);
  This_NPC.AddStdMode(30);
  This_NPC.AddStdMode(42);
end;




Begin
   This_Npc.NpcDialog(This_Player,
   '欢迎，在这里你可以买一些常见的药品。\ \'+
   '|{cmd}<买药品/@buy> ' + addspace(' ',20) + '^<卖药品/@sell> \'+
   '|{cmd}<炼制药品/@DoDrugNow>' + addspace(' ',20) + ActiveValidateStr + '\ \'+
   '|{cmd}<退出/@doexit>' + addspace(' ',22) + '^<返回白日门/@GoToBai>'
   );
end.