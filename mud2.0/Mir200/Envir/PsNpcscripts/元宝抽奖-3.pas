{元宝抽奖
作者：开心就好
内容：全服每天限制为300次，个人一天只能抽20次，每抽奖一次需要1元宝
}



PROGRAM Mir2;

{$I common.pas}
var
today:integer; 
num:integer;
Snum :integer; 
Snum0 :string ;
num0 :string ;
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;

begin
    Snum0 :=inttostr(200-Snum);//全服剩余抽奖次数
    num0 :=inttostr(20-Snum);//个人剩余抽奖次数
    This_NPC.NpcDialog(This_Player,
       '☆☆☆欢迎光临【笑傲武林】抽奖中心☆☆☆\|'
      +'          '+'每抽奖一次需要<10元宝/c=red>！|\'
	+'         '+'全服每天限制为200次'+' '+'<还剩/C=red>'+snum0+'<个/C=red>\|'
    +'          '+'个人一天只能抽20次'+' '+'<还剩/C=red>'+num0+'<个/C=red>\|'
     +' 本服里所有装备和物品等都可以在抽奖中获得\|'
	 +' 搏一搏，单车变摩托\|'
     +' ☆☆奖品绝对物有所值 心动不如行动哦☆☆\|'
     +'               '+'{cmd}<我要抽奖/@cj>\');
end;

procedure _cj;
var 
Rdm_int : integer; 
WpName : string;

begin
    today := GetDateNum(GetNow);
    if This_Player.GetV(63,3) <> today then
    begin
       This_Player.SetV(63,3,today);
       This_Player.SetV(63,4,0);
    end;

   if GetG(65,1) <> today then
   begin
       SetG(65,1,today);
       SetG(65,2,0);
   end;
   Snum := GetG(65,2)
   num := This_Player.GetV(63,4);
   
    if Snum < 200 then//可以更改全服抽奖次数上限，上面的显示项目最好同时修改
    begin 
        if num < 20 then//更改个人抽奖次数上限
begin
     Rdm_int := random(100);
     if This_Player.YBNum > 0 then   
     begin 
       if This_Player.FreeBagNum >= 2 then  
       begin
	   if Rdm_int < 1 then  
                begin
                case random(18) of
                    0 : WpName := '攻击神水';
                    1 : WpName := '倚天剑';
                    2 : WpName := '赤血魔剑';
					3 : WpName := '圣战头盔';
					4 : WpName := '光芒项链';
                    5 : WpName := '光芒手镯';
                    6 : WpName := '光芒戒指';
					7 : WpName := '烈焰戒指';
                    8 : WpName := '烈焰项链';
                    9 : WpName := '烈焰手镯';
					10: WpName := '雷霆项链';
                    11 :WpName := '雷霆手镯';
					12: WpName := '天师长袍';
					13 :WpName := '天尊道袍';
					14: WpName := '霓裳羽衣';
                    15 :WpName := '法神披风';
                    16 :WpName := '圣战宝甲';
					17: WpName := '天魔神甲';
					
                end;
            end else if Rdm_int < 5 then  
                begin
                case random(12) of
                    1 : WpName := '修罗';
					2 : WpName := '圣战项链';
                    3 : WpName := '圣战手镯';
                    4 : WpName := '天尊戒指';
					5 : WpName := '圣战戒指';
                    6 : WpName := '天尊项链';
                    7 : WpName := '天尊手镯';
					8 : WpName := '法神项链';
					9  :WpName := '法神戒指';
					10 : WpName := '圣战戒指';
                    11 :WpName := '法神手镯';
							
                end;
            end else if Rdm_int < 20 then 
                begin
                case random(10) of
                    0 : WpName := '青铜腰带';
                    1 : WpName := '炼狱';
                    2 : WpName := '龙纹剑';
					3 : WpName := '井中月';
                    4 : WpName := '黑铁头盔';
                    5 : WpName := '恶魔铃铛';
                    6 : WpName := '三眼手镯';
                    7 : WpName := '泰坦戒指';
                    8 : WpName := '力量戒指';
                    9 : WpName := '天尊头盔';
                end;
            end else if Rdm_int < 100 then 
                begin
                case random(7) of
                    0 : WpName := '裁决之杖';
                    1 : WpName := '骨玉权杖';
                    2 : WpName := '无极棍';
					3 : WpName := '5灵符礼包';
                    4 : WpName := '祝福油';
                    5 : WpName := '金刚石';
					6 : WpName := '金条';
                end;
       end;
            
            This_Player.PsYBConsum(This_NPC,'xin',20001,10,1);//1为扣除元宝个数
            This_Player.Give(WpName , 1);
			 setG(65,2,Snum + 1);
           This_Player.setV(63,4, num + 1);
            This_NPC.NpcDialog(This_Player,
            WpName + '已放入您的包裹!\|'
            +'{cmd}<继续使用10元宝抽取装备/@cj>');
        end else
        This_NPC.NpcDialog(This_Player,
        '没有足够的包裹空间!\|'
        +'{cmd}<返回/@main>');
         end else
         This_NPC.NpcDialog(This_Player,
        '没有足够的元宝，不可抽取\|'
        +'{cmd}<返回/@main>');
		end else
        This_NPC.NpcDialog(This_Player,'你今天已抽奖20次！');
    end else
    This_NPC.NpcDialog(This_Player,'今日服务器200次限额抽奖已经抽完！');
end;
function xin(price, num: Integer):boolean; 
begin
   result := true; 
 
end;

Begin
  domain;
end.