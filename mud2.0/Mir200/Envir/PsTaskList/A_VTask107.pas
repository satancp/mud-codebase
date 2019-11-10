{******************************************************************

* 项目名称：
* 单元名称：盟重指挥官的试炼  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 107; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-盟重指挥官的试炼';

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
  Tem107 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem107 := This_Player.GetV(107,1);
   if This_Player.GetV(108,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem107 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem107 >= 1) and (Tem107 <= 12) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem107_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem107_1 := This_Player.GetV(107,1);
  case Tem107_1 of      
        1  : Result := '武馆教头将你推荐给了<盟重指挥官(336,331)/CMD=10701>，\你快去找他吧。';
     
        2  : Result := '在地牢一层西驻守15分钟，时间结束后你会\被直接送回盟重，时间内离开该地图\则任务失败。注意，接受任务后会被\直接传送过去。';
     
        3  : Result := '你已经在地牢一层西成功驻守了15分钟，\快回去找<盟重指挥官(336,331)/CMD=10701>报告。';
     
        4  : Result := '在地牢一层北驻守15分钟，时间结束后你会\被直接送回盟重，时间内离开该地图\则任务失败。';
     
        5  : Result := '你已经在地牢一层北成功驻守了15分钟，\快回去找<盟重指挥官(336,331)/CMD=10701>报告。';
     
        6  : Result := '在恐怖空间驻守15分钟，时间结束后你会\被直接送回盟重，时间内离开该地图\则任务失败。';
     
        7  : Result := '你已经在恐怖空间成功驻守了15分钟，\快回去找<盟重指挥官(336,331)/CMD=10701>报告。';
     
        8  : Result := '在一线天驻守15分钟，时间结束后你会\被直接送回盟重，时间内离开该地图\则任务失败。';
     
        9  : Result := '你已经在一线天成功驻守了15分钟，\快回去找<盟重指挥官(336,331)/CMD=10701>报告。';
     
        10 : Result := '快去找<比奇国王(27,33)/CMD=10702>，盟重指挥官把你推荐给了国王。';
     
        11 : Result := '请你尝试去加入一个行会，\然后回去找<比奇国王(27,33)/CMD=10702>。';
     
        12 : Result := '告诉<盟重指挥官/CMD=10701>你已经通过了考验，\让他提携你！';
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
begin
end;  

//本脚本中可以支持的命令 
function DoTaskCommand(const value: string): Boolean;
var
  FiStr : integer;
begin 
   Result := True;
   FiStr := StrToIntDef(value,-1); 
   case FiStr of
    10701  : This_Player.AutoGotoMap('3',336,331);
    10702  : This_Player.AutoGotoMap('0122',27,33);
   end;
end; 

begin
  //主函数不被调用 
end.