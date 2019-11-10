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
const CurrentTaskID   = 10009; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_EVERYDAY;
const CurrentTaskTitle = '日常活动-每日巡游任务';

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
   Result := '你每天可以在<庄园玛法旅行家(111，118)/c=red>处\领取每日巡游任务。\务必依照旅行家的提醒<依次/c=red>进行旅行\如果组队巡游，\您将获得额外奖励——经验、巡游手记\有些旅行家会有些特殊要求，\完成要求，能够获得额外的奖励\巡游结束后，可以到庄园的玛法旅行家处<重新开始/c=red>\每位旅行家都撰写了自己的<巡游手记/c=red>，\如果能够收集齐，\可以到任意一个巡游者处兑换一份意外的奖励。\ \每天的0点、12点、20点、22点，\可以展开<巡游竞赛/c=red>';
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