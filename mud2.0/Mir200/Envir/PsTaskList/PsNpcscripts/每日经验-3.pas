
PROGRAM Mir2;
 var

px, py :Integer;
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _FULI; //每日福利 
var 
sum1:Integer;
today:Integer;
begin
today := GetDateNum(GetNow);

    if This_Player.GetV(52,1) <> today then //此段为每天都能领一次的设置    
    begin
       This_Player.SetV(52,1,today);
         This_Player.setV(50,1,0) ;
    end;
    sum1 := This_Player.GetV(50,1); 
    if   sum1 < 1 then
    begin 
            if  This_Player.FreeBagNum >= 2 then  
            begin 
               This_Player.Give('经验' , 500000); //给予经验50万的设置   
               This_Player.PlayerDialog(
             '经验已加在你身上!');
             This_Player.setV(50,1,sum1 + 1) ;
      
              end else
              This_Player.PlayerDialog(
              '没有足够的包裹空间!\'	);       
               end else
               This_Player.PlayerDialog(
               '你已经领过一次了,请明天再来!\');
 end;

begin   
This_NPC.NpcDialog(This_Player,
   '每日福利 ：\|'
   +'为了提高新人的升级速度.\|'
   +'在我这里每天可以都可以领取一次经验.\|'
   +'领取不限等级哟.\|'
   +'|{cmd}<◆领取经验/@FULI>');
end.     