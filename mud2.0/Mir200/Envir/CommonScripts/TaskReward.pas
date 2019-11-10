{
/*******************************************************************************
/*  脚本内容 :
/*  描述： 一些公用脚本函数
/*  修订记录 :
/*
/*******************************************************************************
}

procedure getMainTaskPrzById(Mid : integer;var Prz_str : string;var bagnum : integer);
begin
    Prz_str := '';
    bagnum := 0;
    
    case Mid of
        1001 : 
        begin
            Prz_str := '金币:1/金条:2'; 
            bagnum := 2; 
        end;
        1002 : 
        begin
           case This_Player.Job of
              0: Prz_str := '基本剑术:1/古铜戒指:1/金创药中包(赠):1'; 
              1: Prz_str := '火球术:1/六角戒指:1/金创药中包(赠):1'; 
              2: Prz_str := '治愈术:1/玻璃戒指:1/金创药中包(赠):1'; 
           end; 
            bagnum := 3; 
        end;
    end;
end;


function giveMainPrz(Mid : integer):boolean; 
var Prz_str : string;
bagnum : integer;
Str, TempStr, SubTempStr: string;
begin
    result := false;
    getMainTaskPrzById(Mid,Prz_str,bagnum);
    
    if This_Player.FreeBagNum >= bagnum then
    begin
        Str := Prz_str;
        while Str <> '' do
        begin
          Str := GetValidStr(Str, TempStr, '/');
          if TempStr <> '' then
          begin
            TempStr := GetValidStr(TempStr, SubTempStr, ':');
            
            case  SubTempStr of
              '金币','经验' : This_Player.Give(SubTempStr, StrToIntDef(TempStr, 0)); 
              else
              This_Player.GiveBindItem(SubTempStr, StrToIntDef(TempStr, 0));
            end;
          end;
        end;
  
        Result := True; 
    end else
    begin
        This_Player.PlayerNotice('包裹空间不足，请至少保留' + inttostr(bagnum) + '个包裹空位！',0);
        result := false;
    end;
end;

function getMainTaskStr(Mid , strKind : integer) : string;
var Prz_str , result_str: string;
bagnum : integer;
Str, TempStr, SubTempStr: string;
begin
    getMainTaskPrzById(Mid,Prz_str,bagnum);
    result_str := '';

    Str := Prz_str;
    while Str <> '' do
    begin
      Str := GetValidStr(Str, TempStr, '/');
      if TempStr <> '' then
      begin
        TempStr := GetValidStr(TempStr, SubTempStr, ':');
        
        case  strKind of
          1 : result_str := result_str + '1<' + SubTempStr + '>：' + TempStr; 
          2 : result_str := result_str + '2<' + SubTempStr + '>：' + TempStr; 
        end;
      end;
    end;

    result := result_str;   
end;