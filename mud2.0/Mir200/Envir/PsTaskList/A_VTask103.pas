{******************************************************************

* 项目名称：
* 单元名称：如何成为玛法勇士(10级)  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 103; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-探索';

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
  Tem103 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem103 := This_Player.GetV(103,1);
   if This_Player.GetV(104,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem103 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem103 >= 1) and (Tem103 <= 9) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem103_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem103_1 := This_Player.GetV(103,1);
  case Tem103_1 of 
     1  :
     begin
        Result := '请你去沃玛森林入口处找一下<流浪者(330,46)/CMD=1>，\了解一下沃玛森林的情况，听说沃玛森林的怪物\最近变的更加可怕了，这实在不是个好消息。';
     end;
     2  :
     begin
        Result := '做好充足的准备之后进入洞穴，尽快\找到<拾荒者(242,262)/CMD=2>，要小心路上那些\疯狂的骷髅。';
     end;
     3  :
     begin
        Result := '救援陷入困境的拾荒者，杀死<10个骷髅/c=red>。\完成后回去解救拾荒者。\ \刷怪地点：\<骷髅刷新点一/CMD=6>\<骷髅刷新点二/CMD=8>';
     end;
     4  :
     begin
        Result := '你已经杀死了10个骷髅，快回去找\<拾荒者(242,262)/CMD=2>。';
     end;
     5  :
     begin
        Result := '请你去沃玛森林的深处寻找\<安家铺子老板(314,75)/CMD=3>，彻底了解一下\黑暗势力的影响，注意不要在路途中迷失了心智。';
     end;
     6  :
     begin
        Result := '还是先帮助安家铺子老板，杀死<10个僵尸/c=red>，\确保安家铺子老板的安全。\ \刷怪地点：\<僵尸刷新点一/CMD=7>\<僵尸刷新点二/CMD=9>';
     end;
     7  :
     begin
        Result := '你已经杀死了10个僵尸，\快回去找<安家铺子老板(314,75)/CMD=3>。';
     end;
     8  :
     begin
        Result := '用最快的速度回到比奇去找<任务使者(332,262)/CMD=4>，\将探索的情况汇报给他，叮嘱他一定要\尽快加紧防御工事的修建。';
     end;
     9  :
     begin
        Result := '当你的等级达到23级时，\可前往<比奇老兵(330,272)/CMD=5>处领取新的任务。';
     end;
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
var
  DGTem, DGNum01, DGNum02 : integer; 
begin
   DGTem := This_Player.GetV(103,1);
   if DGTem = 3 then
   begin
      DGNum01 := This_Player.GetV(103, 2);
      if (DGNum01 > 0) and (DGNum01 < 3) then
      begin
         Result := '你已经杀死了' + IntToStr(DGNum01) + '/10个骷髅\ \';
      end;
   end
   else if DGTem = 6 then
   begin
      DGNum02 := This_Player.GetV(103,3);
      if (DGNum02 > 0) and (DGNum02 < 3) then
      begin
         Result := '你已经杀死了' + IntToStr(DGNum02) + '/10个僵尸\ \';
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
    1  : This_Player.AutoGotoMap('0',330,46);
    2  : This_Player.AutoGotoMap('D011',242,262);
    3  : This_Player.AutoGotoMap('1',314,75);
    4  : This_Player.AutoGotoMap('0',332,262);
    5  : This_Player.AutoGotoMap('0',330,272);
    6  : This_Player.AutoGotoMap('D011',209,190);
    7  : This_Player.AutoGotoMap('D401',45,60);
    8  : This_Player.AutoGotoMap('D011',117,323);
    9  : This_Player.AutoGotoMap('D401',136,137);
  end;
end; 

begin
  //主函数不被调用 
end.