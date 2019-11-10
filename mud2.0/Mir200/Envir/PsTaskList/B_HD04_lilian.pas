{******************************************************************

* 项目名称：
* 单元名称：除魔任务面板内容  
* 单元作者： 
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 10008; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_EVERYDAY;
const CurrentTaskTitle = '日常活动-历练任务';

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
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Result := Task_State_Received; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
begin
   Result := '你每天可以在<盟重活动使者(339，335)/c=red>处\领取每日历练任务。\按照指示前往各地找到恶魔看守人，支付一定金币后，\杀死指定的怪物即可完成历练任务领取奖励。\每天只能完成一次历练任务\ \任务包括：\25-29级：前往香石墓穴，杀死<10只恶魔野猪/c=red>\香石墓穴恶魔看守人(37,30),(84,47)\任务奖励：500000经验\ \30-34级：前往沃玛寺庙三层，杀死<10只恶魔沃玛/c=red>\沃玛寺庙恶魔看守人(46,46),(62,62)\任务奖励：600000经验\ \35-39级：前往地牢一层东，杀死<10只恶魔蜈蚣/c=red>\地牢一层恶魔看守人(75,108),(161,52)\任务奖励：800000经验\ \40-44级：前往石墓七层，杀死<10只恶魔楔蛾/c=red>\石墓恶魔看守人(30,72),(62,42)\任务奖励：1000000经验\ \45-49级：前往祖玛七层大厅，杀死<10只恶魔祖玛/c=red>\祖玛神殿恶魔看守人(11,13)\任务奖励：1200000经验\ \50-54级：前往牛魔寺庙大厅，杀死<10只恶魔牛魔/c=red>\牛魔寺庙恶魔看守人(15,16),(67,67)\任务奖励：1200000经验\ \55-59级：前往魔龙岭，杀死<10只恶魔魔龙/c=red>\魔龙岭恶魔看守人(213,117),(84,353)\任务奖励：1500000经验\ \'
   +'60-70级：前往地下长廊，杀死<10只地下长廊恶魔/c=red>\地下长廊恶魔看守人(160,172)\任务奖励：1500000经验';
end;

//当前任务的进度
function GetTaskProgress(): string;
begin
end; 

//本脚本中可以支持的命令 
function DoTaskCommand(const value: string): Boolean;
begin 
end; 

begin
  //主函数不被调用 
end.