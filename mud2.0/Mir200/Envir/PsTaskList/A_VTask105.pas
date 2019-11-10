{******************************************************************

* 项目名称：
* 单元名称：舍生取义  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 105; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-舍生取义';

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
  Tem105 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem105 := This_Player.GetV(105,1);
   if This_Player.GetV(106,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem105 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem105 >= 1) and (Tem105 <= 10) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem105_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem105_1 := This_Player.GetV(105,1);
  if ( Tem105_1 <= 1 ) and ( This_Player.GetV(104,1) = 100 )  then
  begin
     Result := '深入沃玛寺庙的深处，寻找到一直\坚守岗位的<白日门门徒(52,53)/CMD=101>。';
  end else
  begin
     case Tem105_1 of      
        1  : Result := '在<沃玛寺庙二层/c=red>驻守<10分钟/c=red>，时间一到你\会被送回安全的比奇，要确保自己的安全。\ \驻守地点：<沃玛寺庙二层/CMD=105>';
     
        2  : Result := '你已经完成了驻守任务，快去找<比奇老兵(331,268)/CMD=106>。';
     
        3  : Result := '回沃玛寺庙找到<白日门门徒(52,53)/CMD=101>，\在凶险的寺庙里将其救出来。';
     
        4  : Result := '伤重的门徒行动不便，必须消灭冲锋\的<沃玛勇士3个/c=red>。\ \';
     
        5  : Result := '你已经消灭了3个沃玛勇士，\快去找<白日门门徒(52,53)/CMD=101>。';
     
        6  : Result := '保护身后的白日门门徒，\消灭第二波冲锋的<沃玛战将3个/c=red>。';
     
        7  : Result := '你已经消灭了3个沃玛战将，\快去找<白日门门徒(52,53)/CMD=101>。';
     
        8  : Result := '最后一波冲锋的怪物来了，\一定要坚持消灭<火焰沃玛3个/c=red>。';
     
        9  : Result := '你已经消灭了3个火焰沃玛，\快回去找<白日门门徒(52,53)/CMD=101>。';
     
        10 : Result := '请你马上行动，将白日门信物\交给<白日门的天尊(223,274)/CMD=102>。';
     end;
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
var
  DGTem, DGNum01, DGNum02, DGNum03 : integer; 
begin
   DGTem := This_Player.GetV(105,1);
   if DGTem = 4 then
   begin
      DGNum01 := This_Player.GetV(105, 2);
      if (DGNum01 > 0) and (DGNum01 < 3) then
      begin
         Result := '你已经消灭了' + IntToStr(DGNum01) + '/3个沃玛勇士\ \';
      end;
   end
   else if DGTem = 6 then
   begin
      DGNum02 := This_Player.GetV(105,3);
      if (DGNum02 > 0) and (DGNum02 < 3) then
      begin
         Result := '你已经消灭了' + IntToStr(DGNum02) + '/3个沃玛战将\ \';
      end;
   end
   else if DGTem = 8 then
   begin
      DGNum03 := This_Player.GetV(105,4);
      if (DGNum03 > 0) and (DGNum03 < 3) then
      begin
         Result := '你已经消灭了' + IntToStr(DGNum03) + '/3个火焰沃玛\ \';
      end;
   end; 
end;  

//本脚本中可以支持的命令 
function DoTaskCommand(const value: string): Boolean;
var
  FiStr : integer;
begin 
   Result := True;
   FiStr := StrToIntDef(value,-1); 
   case FiStr of
    101  : This_Player.AutoGotoMap('D024',52,53);
    102  : This_Player.AutoGotoMap('11',223,274);
    103  : This_Player.AutoGotoMap('D024',22,23);
    104  : This_Player.AutoGotoMap('D022',246,202);
    105  : This_Player.AutoGotoMap('D023',48,362);
    106  : This_Player.AutoGotoMap('0',331,268);
  end;
end; 

begin
  //主函数不被调用 
end.