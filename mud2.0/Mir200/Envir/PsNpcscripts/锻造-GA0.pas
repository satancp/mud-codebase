{********************************************************************

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
  '锻不管是否在线都将持续进行1个小时，期间不能被终止。锻造1\'+ 
  '小时后可领取锻造的金刚石，并且有几率获得额外奖励。\ \'+
  '|{cmd}<我要开始金刚石锻造/@ForgeDiamondStart>\'+
  '|{cmd}<领取锻造完成的金刚石/@ForgeDiamondGet>\' +
  '|{cmd}<查询金刚石锻造规则/@ForgeDiamondRule>'
  );
end;

procedure _ForgeDiamondRule;
begin
  This_Npc.NpcDialog(This_Player,
  '1.开始锻造1小时后才可领取锻造完成的金刚石。\'+
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
  '使用100元宝可锻造5颗金刚石，使用500元宝可锻造25颗金刚石，\'+
  '使用1000元宝可锻造50颗金刚石，使用3000元宝可锻造150颗金刚石，\'+
  '每天只能选择1种方式进行1次锻造，每次锻造都可获得额外奖励。\ \'+
  '|{cmd}<使用100元宝锻造5颗金刚石/@ForgeDiamondStart_YB1>\'+
  '|{cmd}<使用500元宝锻造25颗金刚石/@ForgeDiamondStart_YB2>\'+
  '|{cmd}<使用1000元宝锻造50颗金刚石/@ForgeDiamondStart_YB3>\'+
  '|{cmd}<使用3000元宝锻造150颗金刚石/@ForgeDiamondStart_YB4>\'
  );
end;

function ForgeDiaYB(price, num: Integer):boolean;
begin
  This_Player.SetS(73,45,GetDateNum(GetNow));
  This_Player.SetS(73,46,ConvertDateTimeToDB(GetNow));
  This_Player.SetS(73,47,price div 100);
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
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20146,100,1); 
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
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20147,500,1); 
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
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20148,1000,1); 
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
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20149,3000,1); 
   end;  
end;
{
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
procedure _ForgeDiamondGet;
var
temp,num,expnum:integer;
begin
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
        if This_Player.FreeBagNum > 0 then
        begin
          num:= This_Player.GetS(73,47);
          This_Player.SetS(73,46,0);
          This_Player.SetS(73,47,0); 
          This_Player.Give('金刚石',num*5);
          case num of
          1:expnum:=random(40001)+10000;
          5:expnum:=random(50001)+30000;
          10:expnum:=random(50001)+50000;
          30:expnum:=random(100001)+100000;
          end;
          This_Player.Give('经验',expnum);
          This_Player.Give('声望',2); 
          This_Npc.NpcDialog(This_Player,
          '恭喜你获得了锻造完成的奖励：'+inttostr(num*5)+'颗金刚石。\'+
          '恭喜你获得了额外的奖励：'+inttostr(expnum)+'经验和2点声望。'
          );  
        end else
        This_Npc.NpcDialog(This_Player,
        '你的包裹太满了，先整理一下吧。'
        );  
      end else 
      This_Npc.NpcDialog(This_Player,
      '你上次锻造的金刚石尚未完成，不可领取金刚石。\'+
      '请'+inttostr(60-temp)+'分钟后再来领取。'
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