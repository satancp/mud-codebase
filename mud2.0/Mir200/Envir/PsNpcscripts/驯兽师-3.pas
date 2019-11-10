{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

function getMonNameByid(Mid : integer) : string;
begin
    case Mid of
        1 : result := '蜈蚣';
        2 : result := '黑色恶蛆';
        3 : result := '半兽勇士';
        4 : result := '钳虫';
        5 : result := '楔蛾';
        6 : result := '牛头魔';
        7 : result := '巨型多角虫';
        8 : result := '虎卫';
        9 : result := '鹰卫';
        10 : result := '天狼蜘蛛';
        11 : result := '花吻蜘蛛';
        12 : result := '半兽勇士';
		13 : result := '神兽';

        else  result := '';
    end;
end;

function getMonTrueNameByid(Mid : integer) : string;
begin
    case Mid of
        1 : result := '蜈蚣';
        2 : result := '黑色恶蛆';
        3 : result := '半兽勇士';
        4 : result := '钳虫';
        5 : result := '楔蛾';
        6 : result := '牛头魔';
        7 : result := '巨型多角虫1';
        8 : result := '虎卫';
        9 : result := '鹰卫';
        10 : result := '天狼蜘蛛';
        11 : result := '花吻蜘蛛';
        12 : result := '半兽勇士1';
		13 : result := '神兽';

        else  result := '';
    end;
end;

function getMonLvbyId(Mid : integer) : integer;
begin
    case Mid of
        1 : result := 24;
        2 : result := 26;
        3 : result := 26;
        4 : result := 29;
        5 : result := 29;
        6 : result := 30;
        7 : result := 25;
        8 : result := 13;
        9 : result := 13;
        10 : result := 35;
        11 : result := 40;
        12 : result := 45;
		13 : result := 48;

        else  result := 0;

    end;
end; 

function getMonGoldbyId(Mid : integer) : integer;
begin
    case Mid of
        1 : result := 5000;
        2 : result := 5000;
        3 : result := 5000;
        4 : result := 8000;
        5 : result := 8000;
        6 : result := 15000;
        7 : result := 200000;
        8 : result := 1000000;
        9 : result := 800000;
        10 : result := 50000;
        11 : result := 100000;
        12 : result := 2000000;
		13 : result := 10000000;

        else  result := 0;

    end;
end; 

function getMonMaxNumbyId(Mid : integer) : integer;
begin
    case Mid of
        1 : result := 0;
        2 : result := 0;
        3 : result := 0;
        4 : result := 0;
        5 : result := 0;
        6 : result := 0;
        7 : result := 0;
        8 : result := 0;
        9 : result := 0;
        10 : result := 0;
        11 : result := 0;
        12 : result := 0;
		13 : result := 0;

        else  result := -1;
    end;
end; 

function getMonNextTime(Mid : integer) : integer;
begin
    case Mid of 
        1 : result := 0;
        2 : result := 0;
        3 : result := 0;
        4 : result := 0;
        5 : result := 0;
        6 : result := 0;
        7 : result := 0; //g15,2
        8 : result := 0; //g15,3
        9 : result := 0;//g15,4
        10 : result := 0;
        11 : result := 0;
        12 : result := 0; //g15,5
		13 : result := 0;

        else  result := -1;
    end;

end;
procedure setgTask(Ntime : integer);
var intG , i:integer; 
begin
    
    if GetG(15,1) <> Ntime then
    begin
        SetG(15,1,Ntime);
        for i := 2 to 5 do
        begin
            if GetG(15,i) < 0 then
            SetG(15,i,0);
            intG := GetG(15,i);
            SetG(15,i, intG + 1);    
        end; 
    end;
end;
//GetG(15,1...20 使用  
function getMonNum(Mid , decNum : integer) : integer;
var needG , intG , Mnum : integer; 
begin
    
    if getMonNextTime(Mid) > 0 then
    begin
        case Mid of
            7 : needG := 2;
            8 : needG := 3;
            9 : needG := 4;
            12 : needG := 5;
        end;
        intG := GetG(15,needG);  //每分钟+1  除以时间间隔为可刷新数量 
        
        Mnum := intG div getMonNextTime(Mid);
        if Mnum > getMonMaxNumbyId(Mid) then
        begin
         
           SetG(15,needG, getMonMaxNumbyId(Mid) * getMonNextTime(Mid));   
           result := getMonMaxNumbyId(Mid);
        end else
        result := Mnum;
        
        if decNum > 0 then
        begin
           intG := GetG(15,needG); 
           SetG(15,needG, intG - getMonNextTime(Mid));
        end;
    end else
    result := 0;

end;

procedure _GoldCallmob();
var Monstr : string; 
i : integer;
begin
    Monstr := '';
    for i:=1 to 13 do
    begin
        Monstr := Monstr + '<' + getMonNameByid(i) + '/@MonDialog~' + inttostr(i) + '>        ';
        case i of
            3,6,9,12  : Monstr := Monstr + '|\'; 
        end;
        
         
    end;
    This_Npc.NpcDialog(This_Player,          
    '请选择你要召唤的怪物！|\{cmd}'
    + Monstr 
    +'<返回/@main>');

end;

function getMonNumStr(Mid : integer) : string;
begin
    if getMonMaxNumbyId(Mid) = 0 then
    result := '还有很多'
    else
    result := inttostr(getMonNum(Mid , 0)); 
end;


procedure _MonDialog(MidStr : string);
var Mid : integer;
begin
    Mid := StrToIntDef(MidStr,0);
     
    This_Npc.NpcDialog(This_Player, 
   // '你已召唤怪物：' + inttostr(This_Player.RegisterMethod('')) + '/5:\|'     
    +'召唤怪物：' + getMonNameByid(Mid) + '\|'
    +'召唤等级：' + inttostr(getMonLvbyId(Mid)) + '级\|' 
    +'需要金币：' + inttostr(getMonGoldbyId(Mid)) + '\|' 
    +'剩余数量：' + getMonNumStr(Mid) + '\|'  
    +'{cmd}<我要召唤/@CallmobNow~' + MidStr + '>');
end;

procedure CallMobTrue(Mid : integer);
var needGold : integer;
MName : string;
begin
    needGold := getMonGoldbyId(Mid);
    MName := getMonNameByid(Mid);
    if This_Player.GoldNum >= needGold then
    begin
        This_Player.DecGold(needGold);
        This_Player.MakeSlaveEx(getMonTrueNameByid(Mid) , 1 ,0);
        getMonNum(Mid , 1)
         This_Npc.NpcDialog(This_Player,          
        MName + '我已帮你召唤了，还有什么事吗？|\'
        +'{cmd}<继续召唤' + MName + '/@CallmobNow~' + inttostr(Mid) + '>      ^<返回/@GoldCallmob>');  
    end else
    This_Npc.NpcDialog(This_Player, 
    '没钱我也没办法！');
end; 

procedure _CallmobNow(MidStr : string);
var Mid : integer;
begin
    Mid := StrToIntDef(MidStr,0);
    
    if This_Player.Job = 1 then
    begin
        if This_Player.Level >= getMonLvbyId(Mid) then
        begin 
            if This_Player.GetSlaveCount('') < 5 then
            begin
                if getMonMaxNumbyId(Mid) < 0 then
                exit
                else if getMonMaxNumbyId(Mid) = 0 then
                CallMobTrue(Mid)
                else if getMonNum(Mid , 0) > 0 then
                CallMobTrue(Mid) else
                This_Npc.NpcDialog(This_Player,          
                '我已体力不支，无法召唤' + getMonNameByid(Mid) + '了！');
            end else 
            This_Npc.NpcDialog(This_Player,          
            '每人最多只能召唤5个怪物！');
        end else
        This_Npc.NpcDialog(This_Player,          
        '请修炼到' + inttostr(getMonLvbyId(Mid)) + '级再尝试召唤' + getMonNameByid(Mid)  + '吧！');  
    end else
    This_Npc.NpcDialog(This_Player,          
    '法师才可以在我这里召唤怪物！');
end;

procedure Execute;
var nowTime : integer;
begin
    nowTime := (GetHour * 100) + GetMin;
    setgTask(nowTime);
end;

begin

    This_Npc.NpcDialog(This_Player,          
    '我已驯养了一些法师可以召唤怪物，如果你需要的话我可以直接给你看，但你要付我一定的费用，我能力有限，有些怪物我隔一段时间才能获得到，数量有限，先到先得！\'
    +'|{cmd}<金币召唤怪物/@GoldCallmob>');
  //  _MonDialog('2');
end.