procedure giveYBprz();  //灵符和元宝抽取奖励完全一样，自定义一个方法，方便调用 ,*****自定义方法内容需要写在调用之前***** 
var rmd : integer;
itemStr : string; 
begin
    
    rmd := random(100);
    if rmd < 99then
  
    begin
       This_Player.MyShengwan := This_Player.MyShengwan + 30;
        itemStr := '30声望';
   
    begin
        
      ServerSay('恭喜“' + This_Player.Name + ' ”使用1000元宝兑换了' + itemStr + '！！!',3); //系统公告红字，全服可见 
    end;  

    This_Npc.NpcDialog(This_Player,
    '你获得了：' + itemStr + '\|'+
    '{cmd}<继续兑换声望/@RdmYBPrz>'
    ); 
    end;
end;




procedure _RdmYBPrz;
begin
    if (GetYear = 2019) and (GetMonth = 7) and (GetDay >= 1) and (GetDay <= 30) then
    begin 
        if (GetHour >= 1) and (GetHour < 23) then  //注意结束时间，19:00:00-19:59:59 GetHour均返回19 
        begin
            if This_Player.FreeBagNum >= 2 then
            begin
                if This_Player.MyLFnum >= 1000 then //优先使用灵符，灵符足够直接扣除灵符并给与奖励 
                begin
                    This_Player.DecLF(0,1000,false);
                    giveYBprz();    //直接调用给奖励方法 *****自定义方法内容需要写在调用之前***** 
                end else                           //灵符不足则使用元宝 
                This_Player.PsYBConsum(This_NPC,'YB_NewComeBag',20001,1000,1);  //YB_NewComeBag为自定义回调函数名称， 20001为扣除编号，方便统计，2为元宝数量，1为个数（一般使用1即可） 
            end else
            This_NPC.NpcDialog(This_Player, '包裹空间不足，请整理后再来抽取奖励！');
        end else
        This_NPC.NpcDialog(This_Player, '每日抽奖时间为0:00-23:00！');
    end else
    This_NPC.NpcDialog(This_Player, '活动时间为7月1日至30日！');
end;

function YB_NewComeBag(price, num: Integer):boolean; //YB_NewComeBag为自定义回调函数名称，其余参数为固定格式 ，不可以改变 
begin
   result := true; 
   giveYBprz(); //直接调用给奖励方法 *****自定义方法内容需要写在调用之前***** 
end;

begin
     This_NPC.NpcDialog(This_Player, '为庆祝节日，国王准备了兑换声望活动\|'
     +'{cmd}<1000元宝换30声望/@RdmYBPrz>');
end.