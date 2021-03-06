{******************************************************************

* 项目名称：
* 单元名称：流浪汉的心碎往事  
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}

program Mir2;
{$I common.pas}

//本任务的任务编号,每个任务对应不同的任务编号，这个不可以重复 
const CurrentTaskID   = 108; 
//TASK_TYPE_MAIN      任务类型为主线
//TASK_TYPE_SUB       任务类型为支线
//TASK_TYPE_EVERYDAY  任务类型为每日
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = '主线任务-流浪汉的心碎往事';

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
  Tem108 : integer;
begin
   //这个函数中可以使用 This_Player
   //TASK_STATE_UNRECEIVED   //任务状态为未接当前任务
   //TASK_STATE_RECEIVED     //任务状态为已接当前任务
   //TASK_STATE_FINISHED     //任务状态为已完成当前任务
   Tem108 := This_Player.GetV(108,1);
   if This_Player.GetV(109,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem108 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem108 >= 1) and (Tem108 <= 19) then
   begin
      Result := Task_State_Received;
   end; 
end;

//当前任务的详细描述
function GetTaskDetail(): string;
var
  Tem108_1 : integer;
begin
  //这个函数中可以使用 This_Player
  Tem108_1 := This_Player.GetV(108,1);
  case Tem108_1 of      
    1  : Result := '去见见<流浪汉(347,335)/CMD=10801>吧！\相信你应该有实力帮助他解决困难的。';
     
    2  : Result := '前往<石墓一层/c=red>，杀掉<5只红野猪/c=red>后向流浪汉报告。\ \刷怪地点：\<石墓一层刷新点一/CMD=10802>\ \|{cmd}<石墓一层刷新点二/CMD=10812>';
     
    3  : Result := '你现在已经杀死了5红野猪，\赶快回去找盟重的<流浪汉(347,335)/CMD=10801>吧。';
     
    4  : Result := '前往<石墓一层/c=red>，杀掉<5只黑野猪/c=red>后向流浪汉报告。\ \刷怪地点：\<石墓一层刷新点一/CMD=10802>\ \|{cmd}<石墓一层刷新点二/CMD=10812>';
     
    5  : Result := '你现在已经杀死了5黑野猪，\赶快回去找盟重的<流浪汉(347,335)/CMD=10801>吧。';
     
    6  : Result := '深入<石墓二层/c=red>，在黑色恶蛆的身上寻找流浪汉\亲人的遗�   \刷怪地点：\<石墓二层刷新点一/CMD=10803>\ \|{cmd}<石墓二层刷新点二/CMD=10813>';
     
    7  : Result := '你已经在黑色恶蛆的身上找到了遗骸，\赶快回去找盟重的<流浪汉(347,335)/CMD=10801>吧！';
     
    8  : Result := '深入<石墓三层/c=red>，在红野猪身上找寻剩下的骸骨。\ \刷怪地点：\<石墓三层刷新点一/CMD=10804>\<石墓三层刷新点二/CMD=10814>';
     
    9  : Result := '你已经在红野猪的身上找到了剩下的骸骨，\赶快回去找盟重的<流浪汉(347,335)/CMD=10801>吧。';
     
    10 : Result := '将流浪汉的信安全地\送达<盟重指挥官(336,331)/CMD=10805>处。';
     
    11 : Result := '再次前往石墓阵，寻找孤身深入\石墓阵中的<武器店老板(23,27)/CMD=10806>。';
     
    12 : Result := '武器店老板托付你把消息带给石墓阵中\的<衣服店老板(23,27)/CMD=10807>。';
        
    13 : Result := '前往<石墓五层/c=red>，杀死楔蛾，\获取完整的蛾翼带回给石墓阵中的衣服店老板。\ \刷怪地点：\<石墓五层刷新点一/CMD=10808>\<石墓五层刷新点二/CMD=10815>';
        
    14 : Result := '你已经在石墓五层获取了完整的蛾翼，\快把它带回去交给石墓阵中的<衣服店老板(23,27)/CMD=10807>。';
        
    15 : Result := '把消息传递给石墓阵中的\<首饰店保管员(23,27)/CMD=10809>吧，\也让他了却一桩心愿';
        
    16 : Result := '尽快返回盟重，告诉<流浪汉(347,335)/CMD=10801>石墓里的消息。';
        
    17 : Result := '深入蜈蚣洞的<死亡棺材/c=red>，杀死一只\<邪恶钳虫(100,100)/c=red>，获得钳虫角之后送给流浪汉。\ \刷怪地点：\<死亡棺材刷新点一/CMD=10810>\<死亡棺材刷新点二/CMD=10816>';
        
    18 : Result := '你已经杀死邪恶钳虫，获得了钳虫角，\赶快回盟重土城找<流浪汉(347,335)/CMD=10801>吧！';
        
    19 : Result := '带着流浪汉的推荐信去找到<宗师(323,338)/CMD=10811>。';
  end;
end;

//当前任务的进度
function GetTaskProgress(): string;
var
  DGTem, DGNum01, DGNum02, DGNum03 : integer; 
begin
   DGTem := This_Player.GetV(108,1);
   if DGTem = 2 then
   begin
      DGNum01 := This_Player.GetV(108, 2);
      if (DGNum01 > 0) and (DGNum01 < 5) then
      begin
         Result := '你已经消灭了' + IntToStr(DGNum01) + '/5只红野猪\ \';
      end;
   end
   else if DGTem = 4 then
   begin
      DGNum02 := This_Player.GetV(108,3);
      if (DGNum02 > 0) and (DGNum02 < 5) then
      begin
         Result := '你已经消灭了' + IntToStr(DGNum02) + '/5只黑野猪\ \';
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
    10801 : This_Player.AutoGotoMap('3',347,335);
    10802 : This_Player.AutoGotoMap('D711',201,203);
    10803 : This_Player.AutoGotoMap('D712',367,225);
    10804 : This_Player.AutoGotoMap('D713',34,190);
    10805 : This_Player.AutoGotoMap('3',336,331);
    10806 : This_Player.AutoGotoMap('D71650',20,30);
    10807 : This_Player.AutoGotoMap('D71651',20,30);
    10808 : This_Player.AutoGotoMap('D715',32,343);
    10809 : This_Player.AutoGotoMap('D71652',20,30);
    10810 : This_Player.AutoGotoMap('D606',13,28);
    10811 : This_Player.AutoGotoMap('3',323,338); 
    10812 : This_Player.AutoGotoMap('D711',251,41);
    10813 : This_Player.AutoGotoMap('D712',251,41);
    10814 : This_Player.AutoGotoMap('D713',251,41);
    10815 : This_Player.AutoGotoMap('D715',291,114);
    10816 : This_Player.AutoGotoMap('D606',67,76);
   end;
end; 

begin
  //主函数不被调用 
end.