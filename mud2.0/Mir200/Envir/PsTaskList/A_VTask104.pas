{******************************************************************

* 项目名称：
* 单元名称：沃玛寺庙的秘密  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 104; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-沃玛寺庙的秘密';

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
  Tem104 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem104 := This_Player.GetV(104,1);
   if This_Player.GetV(105,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem104 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem104 >= 1) and (Tem104 <= 10) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem104_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem104_1 := This_Player.GetV(104,1);
  case Tem104_1 of 
     1  :
     begin
        Result := '寻找<合家药店老板(310,83)/CMD=1>，他可是我们的\秘密探子，你去协助调查一下吧！';
     end;
     2  :
     begin
        Result := '杀死<山洞蝙蝠/c=red>，获取2份破烂的情报\后向合家药店老板报告，要小心这些蝙蝠，\不要被蝙蝠石化了。\ \刷怪地点：\<山洞蝙蝠刷新点一(42,42)/CMD=3>\<山洞蝙蝠刷新点二(68,27)/CMD=6>';
     end;
     3  :
     begin
        Result := '你已经获取2份破烂的情报，\快回去向<合家药店老板(310,83)/CMD=1>报告吧。';
     end;
     4  :
     begin
        Result := '杀死3只粪虫后向合家药店老板报告，\粪虫身上是可以获得特殊的显型药水的。\这些粪虫经常出现在<沃玛寺庙一层/c=red>和<二层/c=red>\ \刷怪地点：<沃玛寺庙一层/CMD=4>和<二层/CMD=5>';
     end;
     5  :
     begin
        Result := '你已经杀死了3只粪虫，\快回去向<合家药店老板(310,83)/CMD=1>报告吧。';
     end;
     6  :
     begin
        Result := '莫名其妙的药店老板，不知道是什么事情\需要去找<安家铺子老板(314,75)/CMD=2>。';
     end;
     7  :
     begin
        Result := '收集鸡肉2份、肉2份后\送给<安家铺子老板(314,75)/CMD=2>，如果找不到\就去收购或者交换。';
     end;
     8  :
     begin
        Result := '终于发现破解的情报了，\赶快去找到<合家药店老板(310,83)/CMD=1>探听情报。';
     end;
     9  :
     begin
        Result := '消灭沃玛战士，收集3根木料后向合家铺子老板\报告，要小心那些沃玛战士，十分危险。\ <沃玛战士/c=red>经常出现在<沃玛寺庙一层/c=red>和<二层/c=red>。\ \刷怪地点：<沃玛寺庙一层/CMD=4>和<二层/CMD=5>';
     end;
     10 :
     begin
        Result := '你已经收集到了3根木料，\快去找<合家药店老板(310,83)/CMD=1>吧。';
     end;
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
var
  DGTem, DGNum01, DGNum02, DGNum03 : integer; 
begin
   DGTem := This_Player.GetV(104,1);
   if DGTem = 2 then
   begin
      DGNum01 := This_Player.GetV(104, 2);
      if (DGNum01 > 0) and (DGNum01 < 3) then
      begin
         Result := '你已经获取了' + IntToStr(DGNum01) + '/3份破烂的情报\ \';
      end;
   end
   else if DGTem = 4 then
   begin
      DGNum02 := This_Player.GetV(104,3);
      if (DGNum02 > 0) and (DGNum02 < 3) then
      begin
         Result := '你已经杀死了' + IntToStr(DGNum02) + '/3只粪虫\ \';
      end;
   end
   else if DGTem = 9 then
   begin
      DGNum03 := This_Player.GetV(104,4);
      if (DGNum03 > 0) and (DGNum03 < 3) then
      begin
         Result := '你已经收集到了' + IntToStr(DGNum03) + '/3根木料\ \';
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
    1  : This_Player.AutoGotoMap('1',310,83);
    2  : This_Player.AutoGotoMap('1',314,75);
    3  : This_Player.AutoGotoMap('D021',42,42);
    4  : This_Player.AutoGotoMap('D022',340,358);
    5  : This_Player.AutoGotoMap('D023',199,196);
    6  : This_Player.AutoGotoMap('D021',68,27);
  end;
end; 

begin
  //主函数不被调用 
end.