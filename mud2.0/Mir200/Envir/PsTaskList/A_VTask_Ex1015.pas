{******************************************************************
* 项目名称：
* 单元名称：成长之路 
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 1015; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_SUB;
const CurrentTaskTitle = '支线任务-等级15 勇者的试炼';

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
  Tem111 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem111 := This_Player.GetV(111,15);
   if (Tem111 = 10) or (This_Player.Level >= 46) then
   begin
      Result := TASK_STATE_FINISHED;
   end else if (Tem111 = 1) or ((This_Player.Level >= 11) and (This_Player.Level <= 14)) then
   begin
      Result := Task_State_Received;
   end else
   begin
      if (This_Player.Level >= 15) and (This_Player.Level <= 45) then
      begin
         This_Player.SetV(111,15,1);
         Result := Task_State_Received;
      end else
      begin
         Result := TASK_STATE_UNRECEIVED;
      end;
   end;     
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem111_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem111_1 := This_Player.GetV(111,15);
  if (Tem111_1 = 1) and (This_Player.Level >= 15) and (This_Player.Level <= 45) then
  begin
     Result := '为了抵御半兽人军团的进攻，\'+
               '国王特别开辟勇士修炼场，\'+
               '凡15级以上，45级以下的勇士可以通过\'+
               '比奇新手引导员进入修炼。\'+
               '|{cmd}<任务/c=red>：通过比奇新手引导员进入修炼场修炼\'+
               '|{cmd}<完成任务NPC/C=red>：比奇新手引导员(333,270)';
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
begin
end; 

//本脚本中可以支持的命令 
function DoTaskCommand(const value: string): Boolean;
begin 
  Result := True;
end; 

begin
  //主函数不被调用 
end.