{******************************************************************

*******************************************************************}

program Mir2;

{$I common.pas}


//OnInit时给GS
const
  REPAIRDOORGOLD    = 2000000;
  REPAIRWALLGOLD    = 500000;
  GUARDFEE          = 300000;
  ARCHERFEE         = 300000;





//;城门的规则

procedure _treatdoor;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     This_Npc.NpcDialog(This_Player,
     '当前大门是 ' + This_Npc.GetCastleDoorState + '.\ \' +
     '|{cmd}<关闭大门./@closemaindoor>\' +
     '|{cmd}<打开大门./@openmaindoor>\' +
     '|{cmd}<返回/@main>\');
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end;
end;

procedure _openmaindoor;
begin
  This_Npc.OpenCastleDoor(True);
  This_Npc.NpcDialog(This_Player,
    '大门被打开了.\ \' +
    '|{cmd}<返回/@treatdoor>\');
end;

procedure _closemaindoor;
begin
  This_Npc.OpenCastleDoor(False);
  This_Npc.NpcDialog(This_Player,
    '大门被关闭了.\ \' +
    '|{cmd}<返回/@treatdoor>\');
end;

//;关于维护

procedure _repaircastle;
begin
  This_Npc.NpcDialog(This_Player,
    '你想去哪里修理 ？\ \' +
    '|{cmd}<修理大门./@repairdoor>\' +
    '|{cmd}<修理城墙./@repairwalls>\' +
    '|{cmd}<返回/@main>\');
end;

procedure _repairdoor;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     This_Npc.NpcDialog(This_Player,
     '如果你要加强城堡大门的话，你必须要支付一定的 ' + IntToStr(REPAIRDOORGOLD) + ' 金币 .\ \' +
     '|{cmd}<加强大门建筑./@repairdoornow>\' +
     '|{cmd}<返回/@repaircastle>\');
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end;
end;

procedure _repairdoornow;
begin
  This_Npc.Click_RepairDoor(This_Player);
end;

procedure _repairwalls;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     This_Npc.NpcDialog(This_Player,
     '如果你要加强城堡的城墙的话，也是需要支付一定的 ' + IntToStr(REPAIRWALLGOLD) + ' 金币.\ \' +
     '|{cmd}<修理左城墙./@repairwallnow1>\' +
     '|{cmd}<修理中城墙./@repairwallnow2>\' +
     '|{cmd}<修理右城墙./@repairwallnow3>\' +
     '|{cmd}<返回/@repaircastle>\');
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end;  
end;

procedure _repairwallnow1;
begin
  This_Npc.Click_RepairWall(This_Player, 1);
end;

procedure _repairwallnow2;
begin
  This_Npc.Click_RepairWall(This_Player, 2);
end;

procedure _repairwallnow3;
begin
  This_Npc.Click_RepairWall(This_Player, 3);
end;

//;关于卫士

procedure _guardcmd;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     This_Npc.NpcDialog(This_Player,
     '请对卫士指定你的命令.\ \' +
     //    '; <雇佣卫士./@hireguards>\'+
     '|{cmd}<雇佣弓箭手./@hirearchers>\' +
     //    '|{cmd}<改变攻击命令./@commandorder>\' +
     '|{cmd}<返回/@main>\');
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end; 
end;

procedure _hireguards;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     This_Npc.NpcDialog(This_Player,
    '你想要把你雇佣的卫士放在什么地方？\' +
    '你必须要向每个卫士<$GUARDFEE>支付金币.\ \' +
    '|大门前<左门为/@hireguardnow1>, ^<右门卫/@hireguardnow2>\' +
    '|城墙前<左卫士/@hireguardnow3>, ^<右卫士/@hireguardnow4>\' +
    '|{cmd}<返回/@guardcmd>\');
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end; 
end;

procedure _hirearchers;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     This_Npc.NpcDialog(This_Player,
    '你想要把你雇佣的弓箭手方在什么地方？?\' +
    '你必须要向每个弓箭手' + IntToStr(ARCHERFEE) + '支付金币.\ \' +
    '|左城墙 <左弓箭手/@hirearchernow1>, ^<中弓箭手/@hirearchernow2>, |{cmd}<右弓箭手/@hirearchernow3>\' +
    '^城内弓箭手<左弓箭手/@hirearchernow4>, |{cmd}<中弓箭手/@hirearchernow5>,' +
    '|{cmd}<右弓箭手/@hirearchernow6>\' +
    '|城内的第二层<左弓箭手/@hirearchernow7>, ^<右弓箭手/@hirearchernow8>\' +
    '|放置在门前<左弓箭手/@hirearchernow9>, ^<右弓箭手/@hirearchernow10>\' +
    '|放置在大门右边<左弓箭手/@hirearchernow11>, ^<右弓箭手/@hirearchernow12>\' +
    '|{cmd}<返回/@guardcmd>\');
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end; 
end;

procedure _hirearchernow1;
begin
  This_Npc.Click_HireArcher(This_Player, 1);
end;

procedure _hirearchernow2;
begin
  This_Npc.Click_HireArcher(This_Player, 2);
end;

procedure _hirearchernow3;
begin
  This_Npc.Click_HireArcher(This_Player, 3);

end;

procedure _hirearchernow4;
begin
  This_Npc.Click_HireArcher(This_Player, 4);
end;

procedure _hirearchernow5;
begin
  This_Npc.Click_HireArcher(This_Player, 5);
end;

procedure _hirearchernow6;
begin
  This_Npc.Click_HireArcher(This_Player, 6);
end;

procedure _hirearchernow7;
begin
  This_Npc.Click_HireArcher(This_Player, 7);
end;

procedure _hirearchernow8;
begin
  This_Npc.Click_HireArcher(This_Player, 8);
end;

procedure _hirearchernow9;
begin
  This_Npc.Click_HireArcher(This_Player, 9);
end;

procedure _hirearchernow10;
begin
  This_Npc.Click_HireArcher(This_Player, 10);
end;

procedure _hirearchernow11;
begin
  This_Npc.Click_HireArcher(This_Player, 11);
end;

procedure _hirearchernow12;
begin
  This_Npc.Click_HireArcher(This_Player, 12);
end;

procedure _commandorder;
begin
  This_Npc.NpcDialog(This_Player,
    '当前卫士的命令.\' +                //<$GUARDRULE>
    '你需要怎样改变?\ \' +
    '|{cmd}<一般卫士命令/@guardrule_normalnow>\' +
    '|{cmd}<攻击卫士命令/@guardrule_pkattack>\' +
    '|{cmd}<返回/@guardcmd>\');
end;  



procedure _Doselect;
var
  str : string; 
begin
  with This_DB do
  begin
    if ExecuteQuery('select idx from usertask;') <> -1 then
    begin
      PsFirst;
      while not PsEof do
      begin
        str := str + '  '+PsFieldByName('idx');
        PsNext;
      end;
    end;

    This_Npc.NpcDialog(This_Player, str);
  end;
end;



procedure _lin;
var
  temp1,temp2 : integer;
begin
  if (GetHour = 22) and (GetMin >= 01) and (GetMin < 30) then
  begin
    This_Npc.NpcDialog(This_Player,          
    '<恭喜你的行会占领了沙巴克，可以在我这里领取奖励</c=red>，\'
    +'|{cmd}<领取今日攻沙奖励/@linjiang>\');
  end
  else 
  begin
    This_Npc.NpcDialog(This_Player,          
    '现在还不是领奖时间<22点01分/c=red>和<22点30分/c=red>，');
  
  end ;
 end ;


procedure _linjiang; 
var today , num: integer;//局部语法变量声明
Snum : integer;

begin
    today := GetDateNum(GetNow);
    if This_Player.GetV(13,3) <> today then
    begin
       This_Player.SetV(13,3,today);
       This_Player.SetV(13,4,0);
    end;

   if GetG(3,1) <> today then
   begin
       SetG(3,1,today);
       SetG(3,2,0);
   end;
   Snum := GetG(3,2)
   num := This_Player.GetV(13,4);
   
    if Snum < 1 then
    begin 
        if num < 2 then
        begin
            if This_Player.FreeBagNum >= 1 then
            begin 
                This_Player.Give('金刚石' , 5000);
                This_Player.Give('1000元宝' , 3);
                ServerSay('伟大的★★★【' + This_Player.Name + '】★★★领取了攻沙奖励',3); 
                This_Player.SetV(13,4, num + 1);
                SetG(3,2,Snum + 1); 
               
                
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹已满') 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了攻沙奖励');
    end else
    This_NPC.NpcDialog(This_Player,'攻沙奖励已被领取！');
end;

 







procedure DoMain;
begin
     if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
   begin
    This_Npc.NpcDialog(This_Player, 
   '占领沙巴克是实力的象征、勇者的荣耀。\'
   +'当前沙巴克行会是“' + This_NPC.GetCastleGuildName + '”。\'
   +'|{cmd}<领取今日攻沙奖励/@lin>\'
   +'|{cmd}<管理沙巴克/@sabuk_Manage>\' 
   +'|{cmd}<返回毒蛇山谷/@godu>' + addSpace('', 22) + '\' 
   +'|{cmd}<前往庄园/@gozhuang>'
    );
    end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克城主才能进行操作！');
  end; 
end;

procedure _godu;
begin
  if compareText(This_Player.MapName, '0150') = 0 then
    This_Player.FlyTo('3', 521, 764);
end;

procedure _gozhuang;
begin
  if This_Player.Level >= 8 then
  begin
    if compareText(This_Player.MapName, '0150') = 0 then
    begin
       This_Player.FlyTo('GA0', 71, 73)
    end;
  end else
    This_Npc.NpcDialog(This_Player, '你的能力不够，我不能送你去那里');
end;

procedure _sabuk_Manage;
begin
    if This_Player.IsCastle and This_Player.IsGuildLord then
    begin
    This_Npc.NpcDialog(This_Player, 
    '这个城堡的现有资金是 ' + IntToStr(This_Npc.GetCastleTotalGold) + '金币, \' +
    '今天的收入是' + IntToStr(This_Npc.GetCastleTodayIncome) + '金币.\' +
    '|{cmd}<取回资金/@GetMoney>\' + 
    '|{cmd}<存储资金/@SaveMoney>\' +
    '|{cmd}<城门的规章制度命令/@treatdoor>\' +
    '|{cmd}<简单维护的命令/@repaircastle>\' +
    '|{cmd}<门卫的命令/@guardcmd>\' 
    );
    end else
    This_Npc.NpcDialog(This_Player, 
    '对不起，你不是沙巴克会长，不能使用！'
    ); 
end;

procedure _GetMoney;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     // 0 = input yes|no dlg; 101 回调P101用的命令字，注意word类型
     This_Npc.InputDialog(This_Player, '请输入取金币数量：', 0, 101);
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end;
end;

procedure P101;
begin
  if This_Npc.InputOk then
  begin
    This_Npc.Click_TakeOutGold(This_Player, This_Npc.InputStr);
    DoMain;
  end;

end;

procedure _SaveMoney;
begin
  if ( This_Player.IsCastle ) and  ( This_Player.IsGuildLord ) then
  begin
     This_Npc.InputDialog(This_Player, '请输入存金币数量：', 0, 102);
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '只有沙巴克会长才能进行操作！');
  end;
end;

procedure P102;
begin
  if This_Npc.InputOk then
  begin
    This_Npc.Click_SaveGold(This_Player, This_Npc.InputStr);  
    DoMain;
  end;
end;

procedure OnInitialize;
begin
  This_Npc.RepDoorGold := REPAIRDOORGOLD;
  This_Npc.RepWallGold := REPAIRWALLGOLD;
  This_Npc.HireGuardGold := GUARDFEE;
  This_Npc.HireArcherGold := ARCHERFEE;
end;

//var
//  LastRunCount : Integer;

procedure Execute;
begin
  //禁止用This_Player  This_Npc.ExecCount只读，每10秒+1
//  if This_Npc.ExecCount > LastRunCount then
//  begin
//    LastRunCount := This_Npc.ExecCount;
    This_DB.ExecuteQuery('select 1');
//  end;
end;

begin
  DoMain;
end.