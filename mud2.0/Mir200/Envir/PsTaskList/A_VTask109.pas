{******************************************************************

* 项目名称：
* 单元名称：内功的秘密  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 109; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-宗师的秘密';

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
  Tem109 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem109 := This_Player.GetV(109,1);
   if This_Player.GetV(110,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem109 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem109 >= 1) and (Tem109 <= 10) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem109_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem109_1 := This_Player.GetV(109,1);
  case Tem109_1 of      
    1  : Result := '|{cmd}<宗师(323,338)/CMD=10901>想知道你对技能的\熟悉程度，你快去盟重土城找找他。';
     
    2  : Result := '进入藏宝阁，如果可能，请为宗师带回一个\乾坤令。';
     
    3  : Result := '进入藏宝阁，如果可能，请为宗师带回一个\乾坤令。';
     
    4  : Result := '去见见<盟重铁匠(5,10)/CMD=10902>吧，\他会给你介绍个老朋友认识。';
     
    5  : Result := '将盟重铁匠给你的武器送到<沙巴克铁匠铺(6,19)/CMD=10903>。';
     
    6  : Result := '将铁匠的货物单据送去<沙巴克布店老板(13,7)/CMD=10904>处。';
     
    7  : Result := '再跑一次<沙巴克铁匠铺(6,19)/CMD=10903>，\将布店老板的黑铁矿送过去给铁匠铺。';
     
    8  : Result := '去找<盟重指挥官(336,331)/CMD=10905>吧，\他有重要的信息要告诉你。';
    
    9  : Result := '请你一定要去加入一个行会，然后\<盟重指挥官(336,331)/CMD=10905>会告诉你重要的消息。';
    
    10 : Result := '恭喜你已经完成了指挥官交给你的任务。'; 
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
    10901 : This_Player.AutoGotoMap('3',323,338);
    10902 : This_Player.AutoGotoMap('3',329,315);
    10903 : This_Player.AutoGotoMap('0151',6,19);
    10904 : This_Player.AutoGotoMap('0155',11,14);
    10905 : This_Player.AutoGotoMap('3',336,331);
   end;
end; 

begin
  //主函数不被调用 
end.