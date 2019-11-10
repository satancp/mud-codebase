{******************************************************************

* 项目名称：
* 单元名称：英雄  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 106; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-强者之路';

//该段不做任何修改 
//********************************************************************
//当前任务的编号 
function GetTaskID(): Integer;
begin
  Result := CurrentTaskID;   
end; 

//当前任务的类型
function GetTaskType(): Integer;
begin
  Result := CurrentTaskType;
end; 

//当前任务的标题
function GetTaskTitle(): string;
begin
  Result := CurrentTaskTitle; 
end; 
//********************************************************************


//判断当前任务对于玩家对象属于哪种状态
function GetTaskState(): Integer;
var
  Tem106 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem106 := This_Player.GetV(106,1);
   if This_Player.GetV(107,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem106 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem106 >= 1) and (Tem106 <= 19) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem106_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem106_1 := This_Player.GetV(106,1);
  case Tem106_1 of      
     1  : Result := '找到<盟重土城老兵(325,326)/CMD=10601>。';
     
     2  : Result := '找到<紫水晶屋的布店老板(29,24)/CMD=10602>。';
     
     3  : Result := '杀死<蜈蚣洞里的跳跳蜂5只/c=red>之后\报告给紫水晶屋的布衣店老板。\刷怪地点：<蜈蚣洞(34,196)/CMD=10611>';
     
     4  : Result := '你已经消灭了5只跳跳蜂，快回去\向<紫水晶屋的布店老板(29,24)/CMD=10602>说明情况。';
     
     5  : Result := '盟重药店老板需要对抗兽人的毒药，\请你杀死<蜈蚣洞里的3只蜈蚣/c=red>，收集毒囊\之后去找盟重药店老板。';
     
     6  : Result := '你已经杀死了3只蜈蚣，收集到了毒囊，\快去找<盟重药店老板(360,337)/CMD=10604>。';
     
     7  : Result := '张家布店老板的战争物资筹备出了点\小问题，大家正在帮她想办法，你去\找<盟重药店老板(360,337)/CMD=10604>问问情况。';
     
     8  : Result := '盟重<张家布店老板(20,23)/CMD=10605>想为\紫水晶屋的布店老板做点事，你去看看\有什么需要帮忙的。';
     
     9  : Result := '你去帮张家布料店老板收集<3块巨型蠕虫的皮/c=red>，\在<蜈蚣洞/C=red>里面有很多巨型蠕虫。\ \刷怪地点：<蜈蚣洞(142,93)/CMD=10606>';
     
     10 : Result := '你已经收集到了3块巨型蠕虫的皮，\快把它们交给<张家布店老板(20,23)/CMD=10605>。';
     
     11 : Result := '<盟重铁匠(6,13)/CMD=10607>也陷入了材料不足的困境，\你去看看能不能帮他。';
     
     12 : Result := '杀死<5只蜈蚣洞的钳虫/c=red>之后找到盟重铁匠。\ \刷怪地点：<蜈蚣洞(142,93)/CMD=10606>';
        
     13 : Result := '你已经杀死了5只钳虫，\快回去找<盟重铁匠(6,13)/CMD=10607>。';
        
     14 : Result := '安家铺子老板希望你还能帮帮他，\请你去<蜈蚣洞/c=red>帮他杀死<5个黑色恶蛆/c=red>。';
        
     15 : Result := '你已经杀死了5个黑色恶蛆，\<安家铺子老板(314,75)/CMD=10608>正在等着感谢你呢。';
        
     16 : Result := '请你去找到<安家铺子老板(314,75)/CMD=10608>。';
        
     17 : Result := '消灭<暗黑战士/c=red>，并向比奇武馆教头报告。\暗黑战士经常出现在<沃玛寺庙的深处/c=red>';
        
     18 : Result := '你已经消灭了暗黑战士，\快去向<比奇武馆教头(329,260)/CMD=10609>报告。';
        
     19 : Result := '你是消灭暗黑战士的勇士，\<比奇武馆教头(329,260)/CMD=10609>一定还有很多话跟你说，\快去找他吧。';
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
var
  DGTem, DGNum01, DGNum02, DGNum03 : integer; 
begin
   DGTem := This_Player.GetV(106,1);
   if DGTem = 4 then
   begin
      DGNum01 := This_Player.GetV(106, 2);
      if (DGNum01 > 0) and (DGNum01 < 5) then
        Result := '你已经消灭了' + IntToStr(DGNum01) + '/5个跳跳蜂\ \';
   end else if DGTem = 5 then
   begin
      DGNum02 := This_Player.GetV(106,3);
      if (DGNum02 > 0) and (DGNum02 < 3) then
        Result := '你已经获得了' + IntToStr(DGNum02) + '/3个蜈蚣的毒囊\ \';
   end else if DGTem = 9 then
   begin
      DGNum03 := This_Player.GetV(106,4);
      if (DGNum03 > 0) and (DGNum03 < 3) then
        Result := '你已经获得了' + IntToStr(DGNum03) + '/3张蠕虫皮\ \';
   end else if DGTem = 12 then
   begin
      DGNum03 := This_Player.GetV(106,5);
      if (DGNum03 > 0) and (DGNum03 < 5) then
        Result := '你已经杀死了' + IntToStr(DGNum03) + '/5只蜈蚣洞的钳虫\ \';
   end else if DGTem = 14 then
   begin
      DGNum03 := This_Player.GetV(106,6);
      if (DGNum03 > 0) and (DGNum03 < 5) then
        Result := '你已经杀死了' + IntToStr(DGNum03) + '/5只黑色恶蛆\ \';
   end;
end;  

//本脚本中可以支持的命令 
function DoTaskCommand(const value: string): Boolean;
var
  FiStr : integer;
begin 
   Result := True;
   FiStr := StrToIntDef(value,-1); 
   case FiStr of
    10601  : This_Player.AutoGotoMap('3',325,326);
    10602  : This_Player.AutoGotoMap('D608',29,24);
    //10603  : This_Player.AutoGotoMap('',,);
    10604  : This_Player.AutoGotoMap('3',360,337);
    10605  : This_Player.AutoGotoMap('0149',20,23);
    10606  : This_Player.AutoGotoMap('3',142,93);
    10607  : This_Player.AutoGotoMap('3',329,316);
    10608  : This_Player.AutoGotoMap('1',312,76);
    10609  : This_Player.AutoGotoMap('0',329,260);
    10610  : This_Player.AutoGotoMap('3',336,331);
    10611  : This_Player.AutoGotoMap('D603',34,196);
   end;
end; 

begin
  //主函数不被调用 
end.