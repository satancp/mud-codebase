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
const CurrentTaskID   = 102; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-如何成为玛法勇士';

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
  Tem102 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem102 := This_Player.GetV(102,1);
   if This_Player.GetV(103,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem102 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem102 >= 1) and (Tem102 <= 13) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem102_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem102_1 := This_Player.GetV(102,1);
  case Tem102_1 of 
     1  :
     begin
        Result := '学习历练第一步，帮助杂货店老板（<比奇(376,300)/CMD=1>或\<边界村(292,649)/CMD=2>或<银杏山谷(645,607)/CMD=3>）。';
     end;
     2  :
     begin
        Result := '杂货店老板托付你送口信给服装店老板\（<比奇(18,6)/CMD=4>或<边界村(300,606)/CMD=5>或\<银杏山谷(644,603)/CMD=6>），路上小心。';
     end;         
     3  :
     begin
        Result := '帮服装店老板去找武器店老板（<比奇(19,20)/CMD=7>或\<边界村(294,614)/CMD=8>或<银杏山谷(647,605)/CMD=9>），请他\加快赶制一些针，给战士做盔甲急需这些针。';
     end;
     4  :
     begin
        Result := '武器店老板托付你去请药店老板（<比奇(7,9)/CMD=10>或\<边界村(290,613)/CMD=11>或<银杏山谷(647,615)/CMD=12>）过来帮\受伤的伙计治疗，一定要快。';
     end;
     5  :
     begin        
        Result := '药店老板答应过一会将亲自去治伤，并带来了\新手引导员的消息，现在去找找新手引导员\（<比奇(332,269)/CMD=13>或<边界村(282,618)/CMD=14>或\<银杏山谷(643,626)/CMD=15>）吧。';
     end;
     6  :
     begin
        Result := '引导员耐心指导你如何使用技能，但是只有\<比奇书店老板(324,251)/CMD=16>，才能教你学会\更多的技能。';
     end;
     7  :
     begin
        Result := '|{cmd}<比奇书店老板(324,251)/CMD=16>还想告诉你一些事情，\你快去找他。';
     end;
     8  :
     begin
        Result := '接受考验，前往城外杀<10个稻草人/c=red>，\完成之后再回来向书店老板报告。\ \刷怪地点：\<稻草人刷新点一/CMD=17>\ \|{cmd}<稻草人刷新点二/CMD=20>';
     end;
     9  :
     begin
        Result := '你已经杀死了10个稻草人，快去\找<比奇书店老板(324,251)/CMD=16>。';
     end;
     10 :
     begin
        Result := '|{cmd}<仓库保管员(302,258)/CMD=18>遇到了一点麻烦，\赶快去帮他解决这些问题吧！';
     end;
     11 :
     begin
        Result := '半兽人实在是太让人心烦了，还是\去城外杀<15个半兽人/c=red>，完成后回来找\仓库保管员报告。\ 刷怪地点：\<半兽人刷新点一/CMD=19>\ \|{cmd}<半兽人刷新点二/CMD=21>';
     end;
     12 :
     begin
        Result := '你已经杀死了15个半兽人，\快回去找<仓库保管员(302,258)/CMD=18>。';
     end;
     13 :
     begin
        Result := '|{cmd}<仓库保管员(302,258)/CMD=18>还在等着你呢，别急着走。';
     end;
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
var
  DGTem, DGNum01, DGNum02 : integer; 
begin
   DGTem := This_Player.GetV(102,1);
   if DGTem = 8 then
   begin
      DGNum01 := This_Player.GetV(102, 2);
      if (DGNum01 > 0) and (DGNum01 < 2) then
      begin
         Result := '你已经杀死了' + IntToStr(DGNum01) + '/10个稻草人\ \';
      end;
   end
   else if DGTem = 11 then
   begin
      DGNum02 := This_Player.GetV(102, 3);
      if (DGNum02 > 0) and (DGNum02 < 2) then
      begin
         Result := '你已经杀死了' + IntToStr(DGNum02) + '/15个半兽人\ \';
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
    1  : This_Player.AutoGotoMap('0',376,300);
    2  : This_Player.AutoGotoMap('0',292,649);
    3  : This_Player.AutoGotoMap('0',645,607);
    4  : This_Player.AutoGotoMap('0106',18,6);
    5  : This_Player.AutoGotoMap('0',300,606);
    6  : This_Player.AutoGotoMap('0',644,603);
    7  : This_Player.AutoGotoMap('0103',19,20);
    8  : This_Player.AutoGotoMap('0',294,614);
    9  : This_Player.AutoGotoMap('0',647,605);
    10 : This_Player.AutoGotoMap('0108',7,9);
    11 : This_Player.AutoGotoMap('0',290,613);
    12 : This_Player.AutoGotoMap('0',647,615);
    13 : This_Player.AutoGotoMap('0',332,269);
    14 : This_Player.AutoGotoMap('0',282,618);
    15 : This_Player.AutoGotoMap('0',643,626);
    16 : This_Player.AutoGotoMap('0',324,251);
    18 : This_Player.AutoGotoMap('0',302,258);
    17 : This_Player.AutoGotoMap('0',242,181);      //刷怪：神秘稻草人
    20 : This_Player.AutoGotoMap('0',415,345);      //刷怪：神秘稻草人 
    19 : This_Player.AutoGotoMap('0',406,376);      //刷怪：神秘蛤蟆
    21 : This_Player.AutoGotoMap('0',265,147);      //刷怪：神秘蛤蟆
  end;
end; 

begin
  //主函数不被调用 
end.