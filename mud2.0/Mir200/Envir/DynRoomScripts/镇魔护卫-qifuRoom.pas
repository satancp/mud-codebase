program Mir2;

var
  diceNum, diceCount : Integer;
  diceStr : string;

function isInFuMoRoom: Boolean;
begin
  if compareText(This_Player.DynRoomName, 'qifuRoom') = 0 then 
    Result := True
  else
    Result := False;
end;

function ifKillAllMon: Boolean;
begin
  if This_Npc.CheckCurrMapMon = 0 then
    Result := True
  else
    Result := False;
end;

function calcMaxRandom(dn, dc: Integer) : Integer;
begin
  Result := -1;
  if dc = 1 then
  begin
    case dn of
    1, 2:
      Result := 5;
    3, 4:
      Result := 10;
    5:
      Result := 20;
    6:
      Result := 30;
    end;
  end;
  
  if dc = 2 then
  begin
    case dn of
    2:
      Result := 5;
    3, 4:
      Result := 10;
    5:   
      Result := 15;
    6:   
      Result := 20;
    7, 8:
      Result := 30;
    9:   
      Result := 35;
    10:  
      Result := 45;
    11:  
      Result := 50;
    12:  
      Result := 60;  
    end;
  end;
  
  if dc = 3 then
  begin
    case dn of
    3, 4:
      Result := 10;
    5:
      Result := 15;
    6:
      Result := 20;
    7, 8:
      Result := 30;
    9, 10:
      Result := 35;
    11, 12:
      Result := 40;
    13, 14:
      Result := 45;
    15:
      Result := 55;
    16:
      Result := 60;
    17:
      Result := 70;
    18:
      Result := 90;     
    end;
  end;
end;

procedure _AfterDice;
var
  maxValue, randomValue : Integer;
begin
  if not (isInFuMoRoom and (diceNum>0))then
    Exit;
  
  maxValue := calcMaxRandom(diceNum, diceCount);
  randomValue := random(100);
  
  This_Npc.NpcDialog(This_Player,
    '骰子点数是'+ diceStr + ' 祝您好运!'
  );
  
  if randomValue < maxValue then
  begin
    This_Npc.CreateMon('', 14, 16, 3, '魔龙力士10', 4);
    This_Npc.CreateMon('', 14, 16, 3, '魔龙力士101', 1);
  end else
    This_Npc.CreateMon('', 14, 16, 3, '魔龙力士10', 5);     
  
  diceNum := 0; //重新设置为0，防止刷脚本@AfterDice  
  diceCount := 0;
end;

procedure DoPlayDice(n: Integer);
var
  i : Integer;
  diceArr : array[1..3] of Integer;  
begin
  if (n > 3) or (n < 1) then
    Exit;
  diceStr := '';  
  for i:=1 to n do
  begin
    diceArr[i] := random(6) + 1;
    This_Player.SetV(0, i, diceArr[i]);
    diceNum := diceNum + diceArr[i];
    diceStr := diceStr + IntToStr(diceArr[i]) + ', ';
  end;
  
  This_Npc.NpcDialog(This_Player,
    '嗯，那我们开始了!'
  );

  This_Npc.PlayDice(This_Player, n, '@AfterDice');  
end;

procedure giveQifu(n: Integer);
var
  diceNum : Integer;
begin
  if not isInFuMoRoom then
    Exit;
  
  if ifKillAllMon then
  begin
    if This_Player.GetBagItemCount('祈福凭证') >= n then
    begin
      case n of
        1: diceCount := 1;
        3: diceCount := 2;
        5: diceCount := 3;
      else
        Exit;
      end;      
      This_Player.Take('祈福凭证', n);
    end else
      This_Npc.NpcDialog(This_Player,
        '您好像没有足够的祈福凭证啊!'
      );
    DoPlayDice(diceCount);
  end
  else
    This_Npc.NpcDialog(This_Player,
      '怪物还没有完全消灭，还是等你消灭完了再来找我吧。\' +
      '|{cmd}<关闭/@exit>'
    );  
end;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _goback;
begin
  if isInFuMoRoom then   
    This_Player.Flyto('3', 327, 333);
end;

procedure _onlyone;
begin
  giveQifu(1);
end;

procedure _giveThree;
begin
  giveQifu(3);
end;

procedure _giveFive;
begin
  giveQifu(5);
end;

procedure OnInitialize;
begin
  DiceNum := 0;
  DiceCount := 0;
end;

begin
  This_Npc.NpcDialog(This_Player,
    '既然你拥有了祈福凭证，就可以到我这里接受考验，\' +
    '我这里有三个骰子，使用不同数量的凭证可以使用不同数量的骰子，\' +
    '1个凭证可以使用1个骰子，3个凭证可以用2个骰子，\' +
    '5个凭证可以使用3个骰子，骰子越多，怪物越有可能携带伏魔令。\' +
    '一切的命运就都掌握在您自己手里了，好好把握吧，英雄！\' +
    '您只有20分钟的时间，时间到，将会自动返回盟重。\' +
    '|{cmd}<交一张凭证/@onlyone>    ^<交三张凭证/@giveThree>     ^<交五张凭证/@giveFive>\ \' +
    '|{cmd}<返回盟重/@goback>                       ^<关闭/@exit>'
  );
end.
