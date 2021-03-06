{
*******************************************************************}

program Mir2;



procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//*******************锻造金刚石*********************** 
procedure _ForgeDiamond;
begin
  This_Npc.NpcDialog(This_Player,
  '锻造金刚石需要用强大的意志力，并且等级达到15级，一旦开始\'+
  '锻不管是否在线都将持续进行5分钟，期间不能被终止。锻造5\'+ 
  '分钟后可领取锻造的金刚石，并且有几率获得额外奖励。\ \'+
  '|{cmd}<我要开始金刚石锻造/@ForgeDiamondStart>\'+
  '|{cmd}<领取锻造完成的金刚石/@ForgeDiamondGet>\' +
  '|{cmd}<查询金刚石锻造规则/@ForgeDiamondRule>'
  );
end;

procedure _ForgeDiamondRule;
begin
  This_Npc.NpcDialog(This_Player,
  '1.开始锻造5分钟后才可领取锻造完成的金刚石。\'+
  '2.当前锻造未完成不能申请下次锻造。\'+
  '3.每天只能选择1种方式进行1次锻造。\'+
  '4.每次领取锻造完成的金刚石时都可获得额外奖励。\'+
  '5.只有15级以上的勇士才可进行锻造。\ \'+
  '|{cmd}<已了解金刚石锻造规则，返回/@ForgeDiamond>'
  );
end;

procedure _ForgeDiamondStart;
begin
  if This_Player.Level < 15 then
  begin
  This_Npc.NpcDialog(This_Player,
  '你的等级不满15级，不可锻造金刚石。'
  ); 
  end else
  This_Npc.NpcDialog(This_Player,
  '一旦开始锻造，不管是否在线都将持续1小时，且不可被终止。\'+
  '|每天只能选择1种方式进行1次锻造，每次锻造都可获得额外奖励。\ \'+
  '|{cmd}<使用10元宝锻造30颗金刚石/@ForgeDiamondStart_YB1>\'+
  '|{cmd}<使用30元宝锻造90颗金刚石/@ForgeDiamondStart_YB2>\'+
  '|{cmd}<使用50元宝锻造150颗金刚石/@ForgeDiamondStart_YB3>\'
  );
end;

function ForgeDiaYB(price, num: Integer):boolean;
begin
  This_Player.SetS(73,45,GetDateNum(GetNow));
  This_Player.SetS(73,46,ConvertDateTimeToDB(GetNow));
  This_Player.SetS(73,47,price);
  This_Npc.NpcDialog(This_Player,
  '你已经成功开始金刚石锻造，请1小时后领取锻造完成的金刚石。'
  );
  result := true;
end;

procedure _ForgeDiamondStart_YB1;
var
temp:integer;
begin  
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20146,10,1); 
   end;  
end;

{procedure _ForgeDiamondStart_JD1;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 100 then 
      begin
        if This_Player.DecGloryPoint(30078,100,1,false,'金刚石锻造') then
        begin
          ForgeDiaYB(1,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      '你的金锭不足！\' );
      end;      
   end;  
end;
        }
procedure _ForgeDiamondStart_YB2;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20147,30,1); 
   end;  
end;
{
procedure _ForgeDiamondStart_JD2;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 500 then 
      begin
        if This_Player.DecGloryPoint(30079,500,1,false,'金刚石锻造') then
        begin
          ForgeDiaYB(5,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      '你的金锭不足！\' );
      end;      
   end;  
end;
   }
procedure _ForgeDiamondStart_YB3;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20148,50,1); 
   end;  
end;
{
procedure _ForgeDiamondStart_JD3;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 1000 then 
      begin
        if This_Player.DecGloryPoint(30080,1000,1,false,'金刚石锻造') then
        begin
          ForgeDiaYB(10,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      '你的金锭不足！\' );
      end;      
   end;  
end;
   } 
    {
procedure _ForgeDiamondStart_YB4;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20149,30,1); 
   end;  
end;

procedure _ForgeDiamondStart_JD4;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   '你的等级不满15级，不可锻造金刚石。'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   '你今天已经进行过金刚石锻造了，请明天再来吧！'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      '你尚有未领取的金刚石，请先领取后再来锻造！'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次的锻造还未完成，不可再次进行锻造。'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 3000 then 
      begin
        if This_Player.DecGloryPoint(30081,3000,1,false,'金刚石锻造') then
        begin
          ForgeDiaYB(30,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      '你的金锭不足！\' );
      end;      
   end;  
end;
   }
   
function getZDJZname():string;
begin
    result := '';
    case random(5) of
        0:result :='矿洞组队卷轴';
        1:result :='神殿组队卷轴';
        2:result :='邪窟组队卷轴';
        3:result :='地穴组队卷轴';
        4:result :='石墓组队卷轴';
    end;
end;

function getExpnum() : integer;
var P_LV : integer;
begin
    P_LV := This_Player.Level;
   if P_LV <  1  then result := 0
   else if (P_LV >=  1 ) and (P_LV <=  7 ) then   result  := 57000
   else if (P_LV >=  8 ) and (P_LV <=  14 ) then   result  := 75000
   else if (P_LV >=  15 ) and (P_LV <=  18 ) then   result  := 90000
   else if (P_LV >=  19 ) and (P_LV <=  21 ) then   result  := 105000
   else if (P_LV >=  22 ) and (P_LV <=  24 ) then   result  := 120000
   else if (P_LV >=  25 ) and (P_LV <=  27 ) then   result  := 135000
   else if (P_LV >=  28 ) and (P_LV <=  30 ) then   result  := 150000
   else if (P_LV >=  31 ) and (P_LV <=  34 ) then   result  := 180000
   else if (P_LV >=  35 ) and (P_LV <=  37 ) then   result  := 210000
   else if (P_LV >=  38 ) and (P_LV <=  40 ) then   result  := 240000
   else if (P_LV >=  41 ) and (P_LV <=  42 ) then   result  := 270000
   else if (P_LV >=  43 ) and (P_LV <=  44 ) then   result  := 285000
   else if (P_LV >=  45 ) and (P_LV <=  45 ) then   result  := 300000
   else if (P_LV >=  46 ) and (P_LV <=  46 ) then   result  := 330000
   else if (P_LV >=  47 ) and (P_LV <=  48 ) then   result  := 345000
   else if (P_LV >=  49 ) and (P_LV <=  50 ) then   result  := 360000
   else if (P_LV >=  51 ) and (P_LV <=  52 ) then   result  := 375000
   else if (P_LV >=  53 ) and (P_LV <=  54 ) then   result  := 390000
   else if (P_LV >=  55 ) and (P_LV <=  56 ) then   result  := 405000
   else if (P_LV >=  57 ) and (P_LV <=  58 ) then   result  := 420000
   else result := 450000;
end;

function getdZprz():string;
begin
   result := '';
   case random(20) of
      0 : result := '骑士手镯';
      1 : result := '绿色项链';
      2 : result := '金砖';
      3 : result := '龙之手镯';
      4 : result := '祝福油';
      5 : result := '泰坦戒指';
      6 : result := '灵魂项链';
      7 : result := '紫碧螺';
      8 : result := '祝福油';
      9 : result := '恶魔铃铛';
      10 : result := '黑铁头盔';
      11 : result := '祝福油';
      12 : result := '力量戒指';
      13 : result := '祝福油';
      14 : result := '荣誉勋章15号';
      15 : result := '荣誉勋章14号';
      16 : result := '荣誉勋章13号';
      17 : result := '荣誉勋章25号';
      18 : result := '荣誉勋章24号';
      19 : result := '荣誉勋章23号';
   end;
   
   
end;
 
procedure _ForgeDiamondGet;
var
i,temp,num,expnum,FreeBagNum:integer;
JZname , JZstr , morePrz : string;
begin
   JZname := '';
   JZstr := '';
   morePrz := '';
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
        num:= This_Player.GetS(73,47);
        case num of
          10:FreeBagNum:=1;
          30:FreeBagNum:=3;
          50:FreeBagNum:=6;
        end; 
        if This_Player.FreeBagNum > FreeBagNum then
        begin
          
          This_Player.SetS(73,46,0);
          This_Player.SetS(73,47,0); 
          This_Player.Give('金刚石',num*3);
          
          for i:=1 to (num div 10) do
          begin
            JZname := getZDJZname;
            This_Player.Give(JZname,1);
            JZstr := JZstr + JZname;
            if i < (num div 10) then
            JZstr := JZstr + '、';
          end;
          
          expnum := getExpnum * num; 
          expnum := expnum - Random(expnum div 5) + (expnum div 10);
          
          This_Player.Give('经验',expnum);
          
          if num = 50 then
          begin
             morePrz := getdZprz();
             This_Player.Give(morePrz,1);
             
             morePrz := '|额外奖励:' + morePrz;
          end else
          morePrz := '';
          
          
          This_Npc.NpcDialog(This_Player,
          '恭喜你获得了锻造完成的奖励:'
          +'|金刚石:'+inttostr(num*3)+'颗，经验:'+inttostr(expnum)+'\'+
          '|卷轴:' + JZstr
          +morePrz 
          );  
        end else
        This_Npc.NpcDialog(This_Player,
        '你的包裹太满了，先整理一下吧。'
        );  
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次锻造的金刚石尚未完成，不可领取金刚石。\'+
      '请'+inttostr(5-temp)+'分钟后再来领取�'
      ); 
   end else
   This_Npc.NpcDialog(This_Player,
   '你还未进行金刚石锻造，不可领取金刚石。'
   );     
end;




begin    
   
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<金刚石锻造/@ForgeDiamond>                    \ \' 
  );
end.  