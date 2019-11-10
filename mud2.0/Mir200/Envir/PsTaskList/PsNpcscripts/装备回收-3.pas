{
/************************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
   '看来你需要我的帮助，\'+
   '我这里可以回收祖玛以上的装备。\'+
   '如果你有不要的装备，我这里可以给你兑换成灵符\ \'+
   '|{cmd}<装备回收/@ZhuangBack>\'+
   '|{cmd}<退出/@doexit>');
end;

function getZBnameById(ZBid : integer) : string;
var ZBlv , ZBlvId : integer;
begin
    ZBlv := ZBid div 100;
    ZBlvId := ZBid mod 100;
    result := '';
    case ZBlv of
        1 : 
        begin
            case ZBlvId of
                1 : result := '绿色项链';
                2 : result := '骑士手镯';
                3 : result := '力量戒指';
                4 : result := '恶魔铃铛';
                5 : result := '龙之手镯';
                6 : result := '紫碧螺';
                7 : result := '灵魂项链';
                8 : result := '三眼手镯';
                9 : result := '泰坦戒指';
                10 : result := '黑铁头盔';
                11 : result := '青铜腰带';
                12 : result := '紫绸靴';

            end;
        end;
        2 : 
        begin
            case ZBlvId of
                1 : result := '圣战头盔';
                2 : result := '圣战项链';
                3 : result := '圣战手镯';
                4 : result := '圣战戒指';
                5 : result := '法神头盔';
                6 : result := '法神项链';
                7 : result := '法神手镯';
                8 : result := '法神戒指';
                9 : result := '天尊头盔';
                10 : result := '天尊项链';
                11 : result := '天尊手镯';
                12 : result := '天尊戒指';
                13 : result := '钢铁腰带';
                14 : result := '避魂靴';
				15 : result := '法神披风';
				16 : result := '霓裳羽衣';
				17 : result := '天尊道袍';
				18 : result := '天师长袍';
				19 : result := '天魔神甲';
				20 : result := '圣战宝甲';

            end;
        end;
        3 : 
        begin
            case ZBlvId of
                1 : result := '雷霆项链';
                2 : result := '雷霆护腕';
                3 : result := '雷霆战戒';
                4 : result := '雷霆腰带';
                5 : result := '雷霆战靴';
                6 : result := '烈焰项链';
                7 : result := '烈焰护腕';
                8 : result := '烈焰魔戒';
                9 : result := '烈焰腰带';
                10 : result := '烈焰魔靴';
                11 : result := '光芒项链';
                12 : result := '光芒护腕';
                13 : result := '光芒道戒';
                14 : result := '光芒腰带';
                15 : result := '光芒道靴';
				16 : result := '光芒道盔';
				17 : result := '烈焰魔盔';
				18 : result := '雷霆战盔';
				19 : result := '雷霆战甲(男)';
				20 : result := '雷霆战甲(女)';
				21 : result := '光芒道袍(男)';
				22 : result := '光芒道袍(女)';
				23 : result := '烈焰魔袍(男)';
				24 : result := '烈焰魔袍(女)';

            end;
        end;
    end;
end;

function getZexpNum(Zlv : integer) : integer;
begin
    case Zlv of
        1 : result := 1;
        2 : result := 2;
        3 : result := 4;
    end;
end;

procedure _ZhuangBack;
begin
    This_NPC.NpcDialog(This_Player,
    '请选择你要回收的装备种类：\'
    +'|{cmd}<回收祖玛装备/@zhuangDlg~1>        ^<回收赤月装备/@zhuangDlg~2>\'
    +'|{cmd}<回收魔龙装备/@zhuangDlg~3>');
end;

procedure _zhuangDlg(LvidStr : string);
var ZlvId , i: integer;
DlgStr , ExpStr ,Iname : string;
begin
    ZlvId := strToIntDef(LvidStr,-1);
    
    ExpStr := inttostr(getZexpNum(ZlvId) div 1) + '个';
    DlgStr := '';
    
    for i := 1 to 20 do
    begin
        Iname := getZBnameById(ZlvId * 100 + i);
        if Iname <> '' then
        begin
            DlgStr := DlgStr + '<' + Iname + '/@ZhBackTrue~' + inttostr(ZlvId * 100 + i) + '>';
            if (i mod 3) = 0 then
            DlgStr := DlgStr + '|\'
            else
            DlgStr := DlgStr + '^';
        end; 
    end; 
    
    case ZlvId of
        1 : DlgStr := DlgStr + '<一键回收祖玛装备/@ZUma_all>';
        2 : DlgStr := DlgStr + '<一键回收赤月装备/@ChiYue_all>';
		3 : DlgStr := DlgStr + '<一键回收魔龙装备/@molong_all>';
    end;
    
    This_NPC.NpcDialog(This_Player,
    '回收下列装备，每件可获得'+ ExpStr +'灵符\'
    +'|{cmd}' + DlgStr
    );      
end;

procedure _ZhBackTrue(ZBidStr : string);
var ZBid : integer;
ZBname : string;
begin
    ZBid := StrToIntDef(ZBidStr,-1);
    ZBname := getZBnameById(ZBid);
    if ZBname <> '' then
    begin
        if This_Player.GetBagItemCount(ZBname) > 0 then
        begin
            This_Player.Take(ZBname,1);
            This_Player.AddLF(0,getZexpNum(ZBid div 100));
            This_NPC.NpcDialog(This_Player,
            '恭喜你获得' + inttostr(getZexpNum(ZBid div 100) div 1) + '灵符\|'
            +'|{cmd}<继续回收' + ZBname + '/@ZhBackTrue~' + inttostr(ZBid) + '>'
            +'|{cmd}<返回/@zhuangDlg~' + inttostr(ZBid div 100) + '>');
        end else
        This_NPC.NpcDialog(This_Player,
        '装备不足，无法回收！\'
        +'|{cmd}<返回/@zhuangDlg~' + inttostr(ZBid div 100) + '>'
        );  
    end;
end;

procedure _ZUma_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 20 do
    begin
        Iname := getZBnameById(100 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_NPC.NpcDialog(This_Player,
    '你的包裹中有' + inttostr(ZMnum) + '件祖玛装备，回收可获得:' + inttostr(getZexpNum(1) div 1 * ZMnum) + '灵符，你确定回收所有祖玛装备吗？\|'
    +'|{cmd}<确认回收所有祖玛装备/@ZUma_True>'
    +'|{cmd}<返回/@zhuangDlg~1>');
end;

procedure  _ZUma_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 20 do
    begin
        Iname := getZBnameById(100 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
               This_Player.AddLF(3, getZexpNum(1));
            end;
        end; 
    end;
    This_NPC.NpcDialog(This_Player,
    '恭喜你获得:' + inttostr(ZMnum) + '灵符！\|'
    +'|{cmd}<返回/@zhuangDlg~1>');

end;


procedure _Chiyue_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 20 do
    begin
        Iname := getZBnameById(200 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_NPC.NpcDialog(This_Player,
    '你的包裹中有' + inttostr(ZMnum) + '件赤月装备，回收可获得:' + inttostr(getZexpNum(2) div 1 * ZMnum) + '灵符，你确定回收所有赤月装备吗？\|'
    +'|{cmd}<确认回收所有赤月装备/@Chiyue_True>'
    +'|{cmd}<返回/@zhuangDlg~2>');
end;

procedure  _Chiyue_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 20 do
    begin
        Iname := getZBnameById(200 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.AddLF(1, getZexpNum(2));
            end;
        end; 
    end;
    This_NPC.NpcDialog(This_Player,
    '恭喜你获得:' + inttostr(getZexpNum(2) div 1 * ZMnum) + '灵符！\|'
    +'|{cmd}<返回/@zhuangDlg~2>');

end;
procedure _molong_all;
var ZMnum , i : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 25 do
    begin
        Iname := getZBnameById(300 + i);
        if Iname <> '' then
        begin
            if This_Player.GetBagItemCount(Iname) > 0 then
            begin
                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);
            end;
        end; 
    end;
    
    This_NPC.NpcDialog(This_Player,
    '你的包裹中有' + inttostr(ZMnum) + '件魔龙装备，回收可获得:' + inttostr(getZexpNum(3) div 1 * ZMnum) + '灵符，你确定回收所有魔龙装备吗？\|'
    +'|{cmd}<确认回收所有魔龙装备/@molong_True>'
    +'|{cmd}<返回/@zhuangDlg~3>');
end;

procedure  _molong_True;
var ZMnum , i , j , itemNum : integer;
Iname : string;
begin
    ZMnum := 0;
    for i := 1 to 25 do
    begin
        Iname := getZBnameById(300 + i);
        if Iname <> '' then
        begin
            itemNum := This_Player.GetBagItemCount(Iname);
            if itemNum > 0 then
            begin
                ZMnum := ZMnum + itemNum;
                This_Player.Take(Iname, itemNum);
                
                for j := 1 to itemNum do
                This_Player.AddLF(1, getZexpNum(3));
            end;
        end; 
    end;
    This_NPC.NpcDialog(This_Player,
    '恭喜你获得:' + inttostr(getZexpNum(3) div 1 * ZMnum) + '灵符！\|'
    +'|{cmd}<返回/@zhuangDlg~3>');

end;

Begin
  domain;
end.