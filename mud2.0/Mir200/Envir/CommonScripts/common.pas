{
/*******************************************************************************

/*******************************************************************************
}

{$IFDEF Q130_tehui}
const   VERSION_VALUE = 130;
{$ELSE}
  {$IFDEF Q106_tehui}
  const   VERSION_VALUE = 106;
  {$ELSE}
  const   VERSION_VALUE = 105;
  {$ENDIF}
{$ENDIF}

//bool到字符串
function BoolToStr( bool : Boolean) : string;
begin
  if bool then
  	Result := '是'
  else
  	Result := '否';
end;

//从一个字符串中提取出以空格分割的字符串和数字
//返回提取出的字符串，数字以参数形式传出
function GetStrAndNum( s : string; var n : Integer ) : string;
var
  i, len : Integer;
  tempStr : string;
begin
  n := 1;
  Result := s;
  len := Length(s);
  for i:=1 to Len do
  begin
    if s[i] = ' ' then
      break;
  end;
  
  if i < len then
  begin
    Result := copy(s, 1, i-1);
    tempStr := copy(s, i+1, len-i);
    n := StrToInt(tempStr);
  end; 
end;

//用空格补充字符串到指定长度
function addSpace( s : string; needLen : Integer ) : string;
var
  i, j : Integer;
begin
  i := Length(s);
  if i < needLen then
  begin
    j := needLen - i;
    for i:=0 to j do
    begin
      s := s + ' ';
    end;
  end;
  Result := s;
end;

//任务列表中用的一些常量
const TASK_TYPE_MAIN      = 1;    //任务类型为主线
const TASK_TYPE_SUB       = 2;    //任务类型为支线
const TASK_TYPE_EVERYDAY  = 3;    //任务类型为每日
const TASK_TYPE_TITLE     = 4;    //任务类型为封号 

const TASK_STATE_UNRECEIVED = 1;  //任务状态为未接当前任务
const TASK_STATE_RECEIVED   = 2;  //任务状态为已接当前任务
const TASK_STATE_FINISHED   = 3;  //任务状态为已完成当前任务  