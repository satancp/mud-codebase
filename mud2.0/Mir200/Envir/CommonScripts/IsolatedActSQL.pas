{
/**********************************************************************
 *
 * 这个脚本是专门处理每个活动对应的全局变量
 *
/**********************************************************************
}
//根据活动号和变量编号取当前变量值
//返回-1表示无要查询的数据,其它则表示为当前要取的活动变量的返回值
//活动变量号是从1到50的范围,一个活动只能对应一个编号
function GetI(const actNo, index : Integer) : Integer;
var
  sql : string; //查询语句
  s   : string; //查询的字段名
begin
  Result := -1;
  if (index >= 1) and (index <= 50) then
  begin
    s   := 'i' + IntToStr(index);
    sql := 'select ' + s + ' from IsolatedAct where '
          + ' ActNo = ' + IntToStr(actNo) +';';
    This_DB.ExecuteQuery(sql);
    //只能有一条才对
    if (This_DB.PsRecordCount = 1) then
    begin
      This_DB.PsFirst;
      Result := This_DB.PsFieldByName(s);
    end;
  end;                  
end;

//根据活动号和变量编号设置变量值
procedure SetI(const actNo, index, value : Integer) : Integer;
var
  sql : string;   //活动全局变量更新执行语句
  s   : string;   //更新的字段名
begin
  if (index >= 1) and (index <= 50) then
  begin
    s   := 'i' + IntToStr(index);
    sql := 'update IsolatedAct set ' + s + '=' + IntToStr(value)
           + ' where actNo = ' + IntToStr(actNo) + ';'; 
    This_DB.ExecuteScript(sql);
  end;                           
end;

//开启编号为actNo的活动
procedure StartAct(const actNo : Integer);
var
  sql : string;   //开启一条记录新活动的record
begin
  sql := 'insert into IsolatedAct (actNo) values (' + IntToStr(actNo) + ');';
  This_DB.ExecuteScript(sql);
end;