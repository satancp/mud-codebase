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
const CurrentTaskID   = 10012; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_EVERYDAY;
const CurrentTaskTitle = '日常活动-每日探索任务';

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
   Result := '你每天可以在<盟重活动使者(339，335))/c=red>处\参与每日探索。\ \活动内容：\1-39级：\前往<紫水晶屋老吴(26,27)/c=red>处递交1000金币\任务奖励：200000经验\ \40-50级：\前往<封魔谷霸者大厅密探(32,22)/c=red>处，杀死<5只白野猪/c=red>\任务奖励：500000经验\ \51-70级：前往地下宫殿长廊密探(101,89)处\任务奖励：800000经验';
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