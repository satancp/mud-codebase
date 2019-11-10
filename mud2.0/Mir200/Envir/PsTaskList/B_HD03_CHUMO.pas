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
const CurrentTaskID   = 10007; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_EVERYDAY;
const CurrentTaskTitle = '日常活动-除魔任务';

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
   Result := '你每天可以在<盟重活动使者(339，335)/c=red>处\领取每日除魔任务。\在一轮除魔任务（完成5次任务）中，\每次完成任务后的奖励会越来越好。\每天只能完成一轮的除魔任务\ \任务包括：\前往石墓杀死<10只红野猪/c=red>\前往骨魔洞杀死<20只骷髅长枪兵/c=red>\前往霸者大厅杀死<3只白野猪/c=red>\前往兽人古墓杀死<15只骷髅/c=red>\前往赤月峡谷杀死<10只月魔蜘蛛/c=red>\前往比奇杀死<15只鸡/c=red>\前往毒蛇山谷杀死<5条虎蛇/c=red>\前往比奇杀死<8只食人花/c=red>\前往雷炎洞穴杀死<2只金杖蜘蛛/c=red>\前往死亡棺材杀死<2只邪恶钳虫/c=red>\前往魔龙西郊杀死<3只魔龙刀兵/c=red>\ \如果你觉得领取的任务太难，\也可花费<50000金币/c=red>在<盟重活动使者(339，335)/c=red>处\重新领取任务。';
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