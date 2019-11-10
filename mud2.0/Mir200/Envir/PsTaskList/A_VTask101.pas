{******************************************************************

* 项目名称：
* 单元名称：生存的诀窍(1级)  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 101; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-生存的诀窍';

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
  Tem101 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem101 := This_Player.GetV(101,1);
   if This_Player.GetV(102,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if (Tem101 <= 4) and (Tem101 >= 1) then
   begin
      Result := Task_State_Received;
   end
   else if (Tem101 < 1) and (This_Player.Level <= 35) then
   begin
      Result := Task_State_Received;
   end
   else
   begin
      Result := TASK_STATE_UNRECEIVED;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem101_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem101_1 := This_Player.GetV(101,1);
  if Tem101_1 < 1 then
  begin
     Result := '半兽人的贪婪和凶残打破了我们宁静的生活。\战火蔓延到玛法大陆的每个角落。\我们渴望驱除侵略者，我们期待重建家园。\勇士，在这生死存亡的危机时刻， 我们要团结\在一起。为了帮助你成长，快去找你旁边\的任务使者（<比奇(333,262)/CMD=4>或<边界村(287,614)/CMD=5>或\<银杏山谷(647,623)/CMD=6>）吧！'; 
  end
  else if Tem101_1 = 1 then
  begin
     Result := '杀死城外的鸡、羊、鹿。通过使用ALT+左键\挖取它们身上的肉，然后卖给屠夫\（<比奇(314,272)/CMD=1>或<边界村(290,601)/CMD=2>或\<银杏山谷(649,593)/CMD=3>），获取100金币后，支付给\任务使者（<比奇(333,262)/CMD=4>或<边界村(287,614)/CMD=5>或\<银杏山谷(647,623)/CMD=6>）。'; 
  end
  else if Tem101_1 = 2 then
  begin
     Result := '请你去找去新手引导员（<比奇(332,269)/CMD=7>或\<边界村(282,618)/CMD=8>或<银杏山谷(643,626)/CMD=9>）那儿\瞧瞧吧！说不定他会有好东西给你。';
  end
  else if (Tem101_1 = 3) or (Tem101_1 = 4) then
  begin
     Result := '请你学习完初始技能后，\去找任务使者（<比奇(333,262)/CMD=4>或<边界村(287,614)/CMD=5>或\<银杏山谷(647,623)/CMD=6>）学习历练课程。';
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
    1 : This_Player.AutoGotoMap('0',314,272);
    2 : This_Player.AutoGotoMap('0',290,601);
    3 : This_Player.AutoGotoMap('0',649,593);
    4 : This_Player.AutoGotoMap('0',333,262);
    5 : This_Player.AutoGotoMap('0',287,614);
    6 : This_Player.AutoGotoMap('0',647,623);
    7 : This_Player.AutoGotoMap('0',332,269);
    8 : This_Player.AutoGotoMap('0',282,618);
    9 : This_Player.AutoGotoMap('0',643,626);
  end;
end; 

begin
  //主函数不被调用 
end.