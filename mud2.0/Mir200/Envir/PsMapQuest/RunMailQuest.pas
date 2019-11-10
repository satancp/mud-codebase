{******************************************************************

*******************************************************************}
program Mir2;


procedure PlayerCheckNewMail();
var Startday , PrzDay , P_lv , nowDay : integer;
begin    
  {if This_Player.GetV(11,11) <> 111 then
    begin
        if This_Player.Level >= 122 then
        begin
            This_Player.SetV(11,11,111);
            This_Player.NewFullMailEx('122级奖励', '屠龙+蜡烛+木剑',1,120,0,'屠龙|1/蜡烛|2/木剑|99','2016/07/26 15:30:00');
            //This_Player.NewFullMailEx('122级奖励', '屠龙+蜡烛+木剑',1,120,0,'屠龙|1/蜡烛|2/木剑|99','');
            //This_Player.PlayerNotice('邮件测试：122级奖励屠龙*1，蜡烛*2，木剑*99',2);
        end;
    end;
         }
         
    //This_Player.PlayerNotice('角色创建时间：' + floatTostr(This_Player.GetCreateTime) ,2);
    Startday := StrToIntDef(MirDateTimeToStr('yyyyMMdd' , This_Player.GetCreateTime) ,-1);
    P_lv := This_Player.Level;
    nowDay := StrToIntDef(MirDateTimeToStr('yyyyMMdd' , GetNow) ,-1);
  {  
    if This_Player.GetV(90,1) <> 222 then  
    begin
        if This_Player.Level >= 35 then
        begin
            This_Player.SetV(90,1,222); 
            This_Player.NewFullMailEx('35级奖励', '随便给点奖励看看' ,1,0,0,'金条|1','');
        end;
    end;
    
    if This_Player.GetV(90,2) <> 222 then  
    begin
        if This_Player.Level >= 40 then
        begin
            This_Player.SetV(90,2,222); 
            This_Player.NewFullMailEx('40级奖励', '40级别奖励：文本内容' ,1,100,0,'','');
        end;
    end;
    
    if This_Player.GetV(90,3) <> 222 then  
    begin
        if This_Player.Level >= 45 then
        begin
            This_Player.SetV(90,3,222); 
            This_Player.NewFullMailEx('45级奖励', '45级奖励：文本内容' ,1,0,0,'木剑|2/布衣|2','');
        end;
    end;
    
    if This_Player.GetV(90,4) <> 222 then  
    begin
        if This_Player.Level >= 50 then
        begin
            This_Player.SetV(90,4,222); 
            This_Player.NewFullMailEx('奖励预留', '一奖励预留，方便替换' ,1,250,0,'木剑|2/布衣|2','');
        end;
    end;
    
    if This_Player.GetV(90,5) <> 222 then  
    begin
        if This_Player.Level >= 55 then
        begin
            This_Player.SetV(90,5,222); 
            This_Player.NewFullMailEx('55级奖励', '啥都没有' ,1,0,0,'','');
        end;
    end;
    
    if This_Player.GetV(90,6) <> 222 then  
    begin
        if This_Player.Level >= 60 then
        begin
            This_Player.SetV(90,6,222); 
            This_Player.NewFullMailEx('60级奖励', '奖励是赠送的哦' ,1,0,0,'木剑|2|3/金条|1|3/屠龙|1|3','');     //奖励为赠 
        end;
    end;
    if This_Player.GetV(90,7) <> 222 then  
    begin
        if This_Player.Level >= 65 then
        begin
            This_Player.SetV(90,7,222); 
            This_Player.NewFullMailEx('65级奖励', '装备大赠送' ,1,0,0,'传统项链|1|3/金条|1|3/木剑|1|3','');
        end;
    end;    } 
   { 
    if This_Player.GetV(90,1) <> 111 then  
    begin
        This_Player.SetV(90,1,111);
        if Startday <= 20160731 then 
        This_Player.NewFullMailEx('建号建号奖励', '20160731前建号可领取金条，你的创建时间为' + MirDateTimeToStr('yyyy-MM-dd hh:mm:ss' , This_Player.GetCreateTime) + '',1,0,0,'金条|4','');
    end;
    
    if This_Player.GetV(90,2) <> 111 then
    begin
        
        if nowDay = 20160801 then
        begin
            This_Player.SetV(90,2,111);
            This_Player.NewFullMailEx('登录奖励', '20160801当日登录领取100w金币，过期不补偿',1,1000000,0,'','2016/08/01 00:00:00');
        end;
    end;
    
    if This_Player.GetV(90,3) <> 111 then
    begin
        if (nowDay >= 20160802) and (nowDay <= 20160830) then
        begin        
            if This_Player.GuildName <> '' then
            begin
            This_Player.SetV(90,3,111);
            This_Player.NewFullMailEx('节日奖励', '20160802-20160831有行会角色领取奖励，邮件发送时间始终未20160802 0:00:00',1,300,0,'祝福油|1/祝福罐|1/地下组队卷轴|99/祝福油|1/祝福罐|1','2016/08/01 00:00:00');
            end;
        end;
    end;
    
    if This_Player.GetV(90,4) <> 111 then
    begin
        if (nowDay >= 20160802) and (nowDay <= 20160830) then
        begin
            if This_Player.GetSkillLevelExt('狮子吼',false) >= 0 then
            begin
                //This_Player.PlayerNotice('技能符合要求',2);
            
                
                if (This_Player.Gender = 0) then
                begin  
                    //This_Player.PlayerNotice('性别符合要求',2);
                    if (This_Player.IsCastle) then
                    begin 
                        //This_Player.PlayerNotice('沙巴克符合要求',2);
                        if (This_Player.PeiouName <> '') then
                        begin
                            //This_Player.PlayerNotice('配偶符合要求',2);
                            if (This_Player.Job = 0) then
                            begin 
                                //This_Player.PlayerNotice('职业符合要求',2);
                                if (P_lv >= 25) and (P_lv <= 35) then
                                begin
                                //This_Player.PlayerNotice('等级符合要求',2);
                                This_Player.SetV(90,4,111);
                                This_Player.NewFullMailEx('特殊判断', '25-35，男，沙巴克，已婚，战士，狮子吼，哈哈啥都不给，再看看文字太多会不会换行',1,0,0,'','2016/08/01 00:00:00');
                                end;
                            end;
                        end;
                    end;
                end;
            end;  
        end;
    end;
      }
end;


begin
end.