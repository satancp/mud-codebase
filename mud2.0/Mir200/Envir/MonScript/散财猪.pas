PROGRAM Mir2;

procedure AfterScatterItems(Keys, Values: TStringArray);
var
  i: Integer; 
  Str: string;
  nGold: Integer;
  nGoldBar , goldBrick : Integer;
  str_goldPrz : array[1..3] of string;
begin
  Str := '';
  str_goldPrz[1] := '';
  str_goldPrz[2] := '';
  str_goldPrz[3] := '';
  nGold := 0;
  nGoldBar := 0;
  goldBrick := 0;
  for i := 0 to GetArrayLength(Keys) - 1 do 
  begin
    case Keys[i] of
      '金条': nGoldBar := nGoldBar + StrToIntDef(Values[i], 0);
      '金币': nGold := nGold + StrToIntDef(Values[i], 0);
      '金砖': goldBrick := goldBrick + StrToIntDef(Values[i], 0);
    else
    end;
  end;
  
  
  if nGold > 0 then
  str_goldPrz[3] := '大量金币';
  
  if nGoldBar > 0 then
  str_goldPrz[2] := IntToStr(nGoldBar) + '根金条';
  
  if goldBrick > 0 then
  str_goldPrz[1] := IntToStr(goldBrick) + '个金砖'; 
  
  Str := '恭喜：' + This_Player.Name + '找到并击杀了' + This_Animal.Name + '，爆出了：' 
  
  for i := 1 to 3 do
  begin
      if str_goldPrz[i] <> '' then
      Str := Str + str_goldPrz[i];
      
      if (i < GetArrayLength(str_goldPrz)) then
      begin
          if str_goldPrz[i + 1] <> '' then
          Str := Str + '，';
      end;  
  end;
  
  Str := Str + '！';
    
  if (nGold + nGoldBar + goldBrick) > 0 then
  begin
    RollMsg(Str);
    This_Player.PlayerNotice(Str,0);
    DebugOut(MirDateTimeToStr('yyyy-MM-dd hh:mm:ss', GetNow) + ' ' + Str);
  end;
end;
//初始化
procedure OnInitialize;
begin
  ServerAay(This_Animal.Name + '出现在' + This_Animal.MapDesc + '(' + IntToStr(This_Animal.My_X) + ',' + IntToStr(This_Animal.My_Y) + ')',0);
end;

begin

end.