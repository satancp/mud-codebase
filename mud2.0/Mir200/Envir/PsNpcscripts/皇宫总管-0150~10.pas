PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
    '欢迎来到笑傲武林传奇,清空当前地图怪物并最终杀死国王的玩家可以在我这里领取奖励，\'
	+'有一定几率获得极品限时武器！领取时间为15:20-15：25及19:20-19:25！\'
    +'|{cmd}<领取奖励/@lqjl>\');
end;

procedure _lqjl; 

begin
if This_Npc.CheckCurrMapMon = 0 then //当期怪物是否清空
    begin  
    if  ((GetHour = 15) and (GetMin > 20) and (GetMin < 25)) or 
((GetHour = 19) and (GetMin > 20) and (GetMin < 25)) then begin//领取奖励时间
      if  This_Player.GetV(71,10) = 10 then begin //  杀死国王的玩家私有变量
   if random(100) < 10 then    
        begin
            if  This_Player.FreeBagNum >= 2 then  
             case   This_Player.Job   of              //按职业10%机会获得武器
                0 : begin
                   This_Player.Give('开天',1);
                   This_NPC.NpcDialog(This_Player,
                '武器已经已放入您的包裹!'); 
                	This_Player.SetV(71,10,0) ;//清空变量防止无效刷
                    end;
                1  :  begin 
                   This_Player.Give('镇天',1);
			                This_NPC.NpcDialog(This_Player,
                      '武器已放入您的包裹!');
                      	This_Player.SetV(71,10,0) ;
			                end;
                 2 :  
                   begin 
                   This_Player.Give('玄天',1);
			                This_NPC.NpcDialog(This_Player,
                      '武器已放入您的包裹!') ;
                      	This_Player.SetV(71,10,0) ;
                   end; 
               else
              This_NPC.NpcDialog(This_Player,
              '没有足够的包裹空间!');  
  end else This_Player.ScriptRequestAddYBNum(200);  //90%机会获得元宝1000
	This_Player.SetV(71,10,0) ;    //清空变量防止无效刷
	end else
  This_Npc.NpcDialog(This_Player,
        '国王非你所杀!');
	end else
  This_Npc.NpcDialog(This_Player,
        '不在领取时间!');
	end else
  This_Npc.NpcDialog(This_Player,
        '您好像没有消灭所有的怪物!');
    end;
 end;

procedure Execute;
 begin
if  ((GetHour = 14) and (GetMin = 0)) or 
((GetHour = 18) and (GetMin=0)) then begin           //定时刷怪时间点
This_NPC.CreateMon('3~1',632,278,5,'守城法师',10);
This_NPC.CreateMon('3~1',649,258,5,'守城战士',10);
This_NPC.CreateMon('3~1',636,292,5,'守城道士',10);
This_NPC.CreateMon('0150~10',11,16,5,'守城道士',3);
This_NPC.CreateMon('0150~10',11,16,5,'守城战士',3);
This_NPC.CreateMon('0150~10',11,16,5,'守城法师',3);
This_NPC.CreateMon('0150~10',11,16,5,'守城将军',1);
This_NPC.CreateMon('0150~10',11,16,5,'守城太尉',1);
This_NPC.CreateMon('0150~10',11,16,5,'守城国王',1);
This_NPC.NpcNotice('模拟攻沙开始，请各位勇士从盟重模拟攻沙处进入战斗');
end else if  ((GetHour = 14) and (GetMin = 59)) or   //定时清空地图怪物时间
((GetHour = 18) and (GetMin=59)) then begin        
This_NPC.ClearMon('3~1');
This_NPC.ClearMon('0150~10');
This_NPC.NpcNotice('模拟攻沙结束，请各位勇士下次再来'); 
 end;
 end; 
 
 
Begin
  domain;
  
end.