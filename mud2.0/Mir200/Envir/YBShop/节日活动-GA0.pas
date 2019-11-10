procedure giveYBprz();  //灵符和元宝抽取奖励完全一样，自定义一个方法，方便调用 ,*****自定义方法内容需要写在调用之前***** 
var rmd : integer;
itemStr : string; 
begin
    
    rmd := random(100);
    if rmd < 9 then
    begin
        This_Player.AddLF(0,5);
        itemStr := '5灵符';
    end else if rmd < 1 then
    begin
        This_Player.Give('金刚石',200);
        itemStr := '200个金刚石';    
    end else if rmd < 5 then
    begin
        This_Player.Give('金刚石',88);
        itemStr := '88个金刚石';    
    end else if rmd < 9 then
    begin
        This_Player.Give('金刚石',30);
        itemStr := '30个金刚石';
    end else if rmd < 29 then
    begin
        This_Player.MyShengwan := This_Player.MyShengwan + 20;
        itemStr := '20声望';
    end else if rmd < 69 then
    begin
       This_Player.MyShengwan := This_Player.MyShengwan + 10;
        itemStr := '10声望';
    end else if rmd < 99 then
    begin
       This_Player.MyShengwan := This_Player.MyShengwan + 5;
        itemStr := '5声望';
    end else
    begin
        
      ServerSay('恭喜“' + This_Player.Name + ' ”参加两元宝抽奖时获得了' + itemStr + '！！!',3); //系统公告红字，全服可见 
    end;  

    This_Npc.NpcDialog(This_Player,
    '你获得了：' + itemStr + '\|'+
    '{cmd}<继续使用2元宝抽奖/@RdmYBPrz>'
    ); 

end;




procedure _RdmYBPrz;
begin
    if (GetYear = 2019) and (GetMonth = 7) and (GetDay >= 1) and (GetDay <= 30) then
    begin 
        if (GetHour >= 1) and (GetHour < 23) then  //注意结束时间，19:00:00-19:59:59 GetHour均返回19 
        begin
            if This_Player.FreeBagNum >= 2 then
            begin
                if This_Player.MyLFnum >= 2 then //优先使用灵符，灵符足够直接扣除灵符并给与奖励 
                begin
                    This_Player.DecLF(0,2,false);
                    giveYBprz();    //直接调用给奖励方法 *****自定义方法内容需要写在调用之前***** 
                end else                           //灵符不足则使用元宝 
                This_Player.PsYBConsum(This_NPC,'YB_NewComeBag',20001,2,1);  //YB_NewComeBag为自定义回调函数名称， 20001为扣除编号，方便统计，2为元宝数量，1为个数（一般使用1即可） 
            end else
            This_NPC.NpcDialog(This_Player, '包裹空间不足，请整理后再来抽取奖励！');
        end else
        This_NPC.NpcDialog(This_Player, '每日抽奖时间为1:00-23:00！');
    end else
    This_NPC.NpcDialog(This_Player, '活动时间为7月1日至30日！');
end;

function YB_NewComeBag(price, num: Integer):boolean; //YB_NewComeBag为自定义回调函数名称，其余参数为固定格式 ，不可以改变 
begin
   result := true; 
   giveYBprz(); //直接调用给奖励方法 *****自定义方法内容需要写在调用之前***** 
end;

begin
     This_NPC.NpcDialog(This_Player, '为庆祝节日，国王准备了抽奖活动\|'
     +'{cmd}<2元宝抽奖/@RdmYBPrz>');
end.
