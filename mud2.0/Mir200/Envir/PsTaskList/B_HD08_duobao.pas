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
const CurrentTaskID   = 10011; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_EVERYDAY;
const CurrentTaskTitle = '日常活动-闯关夺宝(每日18：30-19：00)';

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
   Result := '你每天可以在<盟重活动使者(339，335))/c=red>处\参与闯关夺宝。\ \活动内容：\40级以上角色，每天可以递交1000金币参与\活动时间为每日的<18:30-19:00/c=red>，\闯关共有7层，必须消灭该层的所有怪物，\然后点击每一层的<看守人/c=red>才可以进入下一层。\'
             +'第7层为夺宝地图，\活动时间结束前的5分钟宝物会出现在夺宝地图中，\宝物出现后2分钟既可获得。\ \有几率爆出以下宝物：\<40级重装等高级装备/c=red>\<白金积分，热血积分/c=red>\<全系列藏宝图/c=red>\<47级新技能书，道士驯兽术/c=red>\ \'
             +'看守人位置：\一层看守人：(101,161)\二层看守人：(102,94)\三层看守人：(104,121)\四层看守人：(48,84)\五层看守人：(52,51)\六层看守人：(51,50)\七层送宝人偶：(37,52)';
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