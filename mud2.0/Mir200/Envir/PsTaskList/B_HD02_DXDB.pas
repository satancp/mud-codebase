{******************************************************************

* 项目名称：
* 单元名称：生存的诀窍(1级)  
* 单元作者：
* 摘    要：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 10006; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_EVERYDAY;
const CurrentTaskTitle = '日常活动-地下夺宝';

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
   Result := '你每天可以在<宫殿长廊送宝人偶(108，96)/c=red>处\参加地下夺宝活动。\ \活动时间为：\10：30－11：00\13：30－14：00\15：30－16：00\20：30－21：00\23：00－23：30\ \活动细则：\以上活动时间段内,通过<盟重镇魔守将(322,342)/c=red>处\携带地下组队卷轴选择单人或组队进入地下宫殿后\点击送宝人偶，进入夺宝地图，\活动时间结束前的5分钟宝物会出现在夺宝地图中，\宝物出现后2分钟既可获得。\ \有几率爆出以下宝物：\<40级重装等高级装备/c=red>\<白金积分，热血积分/c=red>\<全系列藏宝图/c=red>\<47级新技能书，道士驯兽术/c=red>';
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