{********************************************************************

*******************************************************************}

program Mir2;

var
sum:Integer;
mei:Integer;  
sum1:Integer;  
sum2:Integer;
sum3:Integer;
sum4:Integer; 
sum6:Integer;
sum7:Integer;   
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _jiangli1;    //这里领取每日充值奖励的 地方 
var today , mei: integer; 
begin
   begin
      today := GetDateNum(GetNow);// 获取当前日期        //

   if This_Player.GetV(99,98) <> today then     // 初始化 
   begin
   This_Player.SetV(99,98,today);      // 
   This_Player.SetV(99,99,0);          // 每日 初始化 将  充值的 数变为 0 次初始化  不会 初始总 充值数 
   mei := This_Player.getV(99,99);
   end else
   mei := This_Player.getV(99,99);   //赋值 mei=  This_Player.getV(99,99);  充值数量 
   
	 This_NPC.NpcDialog(This_Player,
	  '| ★★★★您今日充值金额<'+inttostr(mei)+'/c=red>元★★★★\|'  //获取 每日 充值 数量  显示    inttostr(mei)
    +'充值比例：元宝1:10\|'          //，金刚石1:1，灵符1:1！
    +'<每日充值/c=red>'+'  '+'累积充值50元可以领取'+'  '+'<领取/@lq20>\|'
	 
      );                
   end;
end;

procedure _lq20;          //领取   
var today , mei: integer;
begin 
      mei := This_Player.getV(99,99);  //直接  mei := This_Player.getV(99,99); 取值 
      today := GetDateNum(GetNow);// 获取当前日期

    if This_Player.GetV(99,1) <> today then     

        begin  
           This_Player.setV(99,1,today);
           This_Player.SetV(99,2,0);  //获取 日期  每日 重置自己的领取 次数 不充值 无法领取 

        end else  
        sum7:= This_Player.getV(99,2);
             
      if  mei >= 50 then  
      begin   
        if   sum7 < 1 then
         begin 
          if  This_Player.FreeBagNum >= 6 then  
            begin 
              
               
                   This_Player.Give('50元宝',1);
                   This_Player.Give('50声望包',1);
                   This_Player.Give('100灵符礼包',1);
                   This_Player.Give('金刚石',100);
                   This_Player.setV(99,2,sum7 + 1) ; 
                   ServerSay('玩家<' + This_Player.Name + '>领取了首冲礼包！', 2);				   
               
               
             
             end else
              This_NPC.NpcDialog(This_Player,
              '没有足够的包裹空间!\'); 
              end else
                This_NPC.NpcDialog(This_Player,
               '你已经领取了每日充值奖励!');
              end else 
                This_NPC.NpcDialog(This_Player,
               '你今日充值不够50元!');
         
end; 


          //下面是 总充值 奖励 

procedure _jiangli; 
begin
   begin 
   if  This_Player.GetV(88,88)< 1
    then  
   begin 
   This_Player.setV(88,88,0)
   sum := This_Player.getV(88,88);
   end else
   sum := This_Player.getV(88,88);
   end; 
	 This_NPC.NpcDialog(This_Player,
	  '| ★★★★您当前累积总充值<'+inttostr(sum)+'/c=red>元★★★★\|'   
    +'充值比例：元宝1:10         赠送等额充值数的:金刚石+灵符！\|' 
    +'<首充礼包/c=red>'+'  '+'累积充值50元可以领取'+'  '+'<领取/@lq5>\|'
	  +'<初级赞助/c=red>'+'  '+'累积充值200元可以领取'+'  '+'<领取/@lq1>\|'
    +'<中级赞助/c=red>'+'  '+'累积充值500元可以领取'+'  '+'<领取/@lq2>\|'
	  +'<高级赞助/c=red>'+'  '+'累积充值1000元可以领取'+'  '+'<领取/@lq3>\|'
	  +'<顶级赞助/c=red>'+'  '+'累积充值2000元可以领取'+'  '+'<领取/@lq4>\|'
      );                
end;

procedure _lq5;
begin 
    begin 
      if This_Player.getV(88,6) < 0  then 
        begin  
           This_Player.setV(88,6,0)
           sum1:= This_Player.getV(88,6);
        end else  
        sum6:= This_Player.getV(88,6);
    end;         
      if  sum >= 50 then  begin   
        if   sum6 < 1 then
         begin 
       if  This_Player.FreeBagNum >= 10 then  
            begin 
              case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('裁决之杖',1);
                   This_Player.Give('圣战项链',1);
                   This_Player.Give('圣战手镯',2);
                   This_Player.Give('圣战戒指',2);
                   if This_Player.Gender = 0 then
                   This_Player.Give('天魔神甲',1)
                   else
                   This_Player.Give('圣战宝甲',1);
                   This_Player.setV(88,6,sum6 + 1) ;  
               end;
               1 : 
               begin
                   This_Player.Give('骨玉权杖',1);
                   This_Player.Give('法神项链',1);
                   This_Player.Give('法神手镯',2);
                   This_Player.Give('法神戒指',2);
                   if This_Player.Gender = 0 then
                   This_Player.Give('法神披风',1)
                   else
                   This_Player.Give('霓裳羽衣',1);
                   This_Player.setV(88,6,sum6 + 1) ;  
               end;
               2 : 
               begin
                   This_Player.Give('龙纹剑',1);
                   This_Player.Give('天尊项链',1);
                   This_Player.Give('天尊手镯',2);
                   This_Player.Give('天尊戒指',2);

                   This_Player.GiveBindItem('超级护身符',2);
                  
                   if This_Player.Gender = 0 then//检测男女
                   This_Player.Give('天尊道袍',1)
                   else
                   This_Player.Give('天师长袍',1);
                   This_Player.setV(88,6,sum6 + 1) ;  
               end;
              end;
             
             end else
              This_NPC.NpcDialog(This_Player,
              '没有足够的包裹空间!\'); 
              end else
                This_NPC.NpcDialog(This_Player,
               '你已经领过一次了!');
              end else 
                This_NPC.NpcDialog(This_Player,
               '你充值不够50元!');
         
end; 





 
procedure _lq1;
begin 
    begin 
      if This_Player.getV(88,1) < 0  then 
        begin  
           This_Player.setV(88,1,0)
           sum1:= This_Player.getV(88,1);
        end else  
        sum1:= This_Player.getV(88,1);
    end;         
      if  sum >= 200 then  begin   
        if   sum1 < 1 then
         begin 
       if  This_Player.FreeBagNum >= 5 then  
            begin 
             case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('屠龙',1);
                   This_Player.Give('200灵符礼包', 1);
                   This_Player.Give('100元宝' , 3);
                   This_Player.Give('低级赞助斗笠' , 1);
                   This_Player.setV(88,1,sum1 + 1) ;  
                   ServerSay('玩家<' + This_Player.Name + '>领取了200元大礼包！', 2);					   
               end;
               1 : 
               begin
                   This_Player.Give('嗜魂法杖',1);
                    This_Player.Give('200灵符礼包', 1);
                     This_Player.Give('100元宝' , 3);
                     This_Player.Give('低级赞助斗笠' , 1);
                   This_Player.setV(88,1,sum1 + 1) ;
				   ServerSay('玩家<' + This_Player.Name + '>领取了200元大礼包！', 2);
               end;
               2 : 
               begin
                   This_Player.Give('逍遥扇',1);
                   This_Player.Give('200灵符礼包' , 1);
                    This_Player.Give('100元宝' , 3);
                    This_Player.Give('低级赞助斗笠' , 1);
                   This_Player.setV(88,1,sum1 + 1) ;
                   ServerSay('玩家<' + This_Player.Name + '>领取了200元大礼包！', 2);				   
               end;
              end;
             
             This_Player.setV(88,1,sum1 + 1) ;  
             end else
              This_NPC.NpcDialog(This_Player,
              '没有足够的包裹空间!\'); 
              end else
                This_NPC.NpcDialog(This_Player,
               '你已经领过一次了!');
              end else 
                This_NPC.NpcDialog(This_Player,
               '你充值不够200元!');
         
end; 
procedure _lq2;
begin
    begin 
      if This_Player.getV(88,2) < 0  then 
        begin  
           This_Player.setV(88,2,0)
           sum2:= This_Player.getV(88,2);
        end else  
        sum2:= This_Player.getV(88,2);
    end;
   
    if  sum >= 500 then 
    begin 
    if   sum2 < 1 then
         begin 
       if  This_Player.FreeBagNum >= 2 then  
            begin 
             case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('开天',1);
                   This_Player.Give('500灵符礼包' , 1);
                   This_Player.Give('中级赞助斗笠' , 1);
                    This_Player.setV(88,2,sum2 + 1) ; 
                    ServerSay('玩家<' + This_Player.Name + '>领取了500元大礼包！', 2);					
               end;
               1 : 
               begin
                   This_Player.Give('镇天',1);
                    This_Player.Give('500灵符礼包' , 1);
                    This_Player.Give('中级赞助斗笠' , 1);
                   This_Player.setV(88,2,sum2 + 1) ; 
                   ServerSay('玩家<' + This_Player.Name + '>领取了500元大礼包！', 2);				   
               end;
               2 : 
               begin
                   This_Player.Give('玄天',1);
                   This_Player.Give('500灵符礼包' , 1);
                   This_Player.Give('中级赞助斗笠' , 1);
                    This_Player.setV(88,2,sum2 + 1) ;  
					ServerSay('玩家<' + This_Player.Name + '>领取了500元大礼包！', 2);
               end;
              end;
              
             end else
              This_NPC.NpcDialog(This_Player,
              '没有足够的包裹空间!\'); 
              end else
                This_NPC.NpcDialog(This_Player,
               '你已经领过一次了!');
              end else 
                This_NPC.NpcDialog(This_Player,
               '你充值不够500元!');
end;
procedure _lq3;
begin
   begin 
      if This_Player.getV(88,3) < 0  then 
        begin  
           This_Player.setV(88,3,0)
           sum3:= This_Player.getV(88,3);
        end else  
        sum3:= This_Player.getV(88,3);
    end;

    if  sum >= 1000 then 
    begin 
    if   sum3 < 1 then
         begin 
       if  This_Player.FreeBagNum >= 2 then  
            begin 
             case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('星王圣剑(战)',1);
                   This_Player.Give('1000灵符礼包' , 2);
                   This_Player.Give('高级赞助斗笠', 1);
                   This_Player.setV(88,3,sum3 + 1) ; 
                  ServerSay('玩家<' + This_Player.Name + '>领取了1000元大礼包！', 2);				   
               end;
               1 : 
               begin
                  This_Player.Give('星王圣剑(法)',1);
                   This_Player.Give('1000灵符礼包' , 2);
                    This_Player.Give('高级赞助斗笠', 1);
                  This_Player.setV(88,3,sum3 + 1) ; 
				  ServerSay('玩家<' + This_Player.Name + '>领取了1000元大礼包！', 2);
               end;
               2 : 
               begin
                   This_Player.Give('星王圣剑(道)',1);
                   This_Player.Give('1000灵符礼包' , 2);
                    This_Player.Give('高级赞助斗笠', 1);
                   This_Player.setV(88,3,sum3 + 1) ;
                ServerSay('玩家<' + This_Player.Name + '>领取了1000元大礼包！', 2);				   
               end;
              end;
              
             end else
              This_NPC.NpcDialog(This_Player,
              '没有足够的包裹空间!\'); 
              end else
                This_NPC.NpcDialog(This_Player,
               '你已经领过一次了!');
              end else 
                This_NPC.NpcDialog(This_Player,
               '你充值不够1000元!');
end;

procedure _lq4;
begin
    begin 
      if This_Player.getV(88,4) < 0  then 
        begin  
           This_Player.setV(88,4,0)
           sum4:= This_Player.getV(88,4);
        end else  
        sum4:= This_Player.getV(88,4);
    end;
    if  sum >= 2000 then 
    begin 
    if   sum4 < 1 then
         begin 
       if  This_Player.FreeBagNum >= 7 then  
            begin 
             This_Player.SysGiveGift('终级赞助斗笠',1,true);
              This_Player.Give('书页', 1000);
             This_Player.Give('1000元宝' , 3);
             This_Player.setV(88,4,sum4 + 1) ;  
			 ServerSay('玩家<' + This_Player.Name + '>领取了2000元大礼包！', 2);
             end else
              This_NPC.NpcDialog(This_Player,
              '没有足够的包裹空间!\'); 
              end else
                This_NPC.NpcDialog(This_Player,
               '你已经领过一次了!');
              end else 
                This_NPC.NpcDialog(This_Player,
               '你充值不够2000元!');
end;


procedure _newYB(); 
begin
    if This_Player.GetV(11,10) <> 888 then
	begin
		This_Player.SetV(11,10,888);
		This_NPC.YBDealDialogShowMode(This_Player,true);
	end else
	begin
		This_NPC.YBDealDialogShowMode(This_Player,false);
	end;
end;

Procedure _GetYB;
var 
d2,d3 : integer;
s1 , td : double;
begin
	s1 := GetNow;
	d2 := This_Player.GetS(23,1);
    td := ConvertDBToDateTime(d2);
	d3 := minusDataTime(s1,td);
	if (d3 >= 300) or (This_Player.GetS(23,2) < 3) then
	begin
		This_Player.QueryAwardCode(This_Player.Name);
		This_Npc.CloseDialog(This_Player);
	end else
	   This_Npc.NpcDialog(This_Player,
	   '你操作太快，连续领取3次没有成功，将锁定5分钟！请' + inttostr(300 - d3) + '秒后再次尝试！'
	   );
end;

Procedure _YB;
var
num: integer;
begin
num := This_Player.GetS(23,2);
   This_Npc.NpcDialog(This_Player,
	   '当前充值' + inttostr(num) + '元宝！'
	   );
end;


Begin     
    This_Npc.NpcDialog(This_Player,
    '|您好，充值后，可以找我领取元宝。\ '+
    '|充值请点击下方的血球，在弹出的功能中点击充值按钮\ '+
    '|充值支持微信，支付宝等多种充值方式\ '+
    '|首充<50/c=red>元即可领取首冲大礼包，内含赤月套装\ '+
    '|累计<200/c=red>元即可领取屠龙级武器一把+低级斗笠，按职业发放 \'+
    '|累计<500/c=red>元即可领取开天级武器一把+中级斗笠，按职业发放\ '+
    '|首充<1000/c=red>元即可领取星王级武器一把+白金赞助使者(称号属性)，按职业发放\'+
    '|{cmd}<领取元宝/@GetYB>     ^<充值奖励/@jiangli>\'+
    '|{cmd}<每日充值奖励/@jiangli1> \'
 
    );

end.