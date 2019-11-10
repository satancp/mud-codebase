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

   '如果你有不要的装备，我这里可以给你兑换成经验+元宝\ \'+

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

                4 : result := '骑士手镯';

                7 : result := '力量戒指';

                2 : result := '恶魔铃铛';

                5 : result := '龙之手镯';

                8 : result := '紫碧螺';

                3 : result := '灵魂项链';

                6 : result := '三眼手镯';

                9 : result := '泰坦戒指';

                10 : result := '黑铁头盔';

				11 : result := '骨玉权杖';

				13 : result := '裁决之杖';

				12 : result := '龙纹剑';

				16 : result := '荣誉勋章43号';

				14 : result := '荣誉勋章44号';

				15 : result := '荣誉勋章45号';

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

				15 : result := '霓裳羽衣';

                16 : result := '天师长袍';

                17 : result := '圣战宝甲';

                18 : result := '天魔神甲';

                19 : result := '法神披风';

                20 : result := '天尊道袍';



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
				16 : result := '烈焰魔盔';
				20 : result := '光芒道盔';
				21 : result := '雷霆战盔';
				25 : result := '烈焰魔衣(男)';
                26 : result := '烈焰魔衣(女)';
				27 : result := '雷霆战甲(男)';
			    28 : result := '雷霆战甲(女)';
                29 : result := '光芒道袍(男)';
				30 : result := '光芒道袍(女)';
            end;

        end;

       

	   4 : 

        begin

            case ZBlvId of

                1 : result := '强化雷霆腰带';
				2 : result := '强化雷霆战靴';
				3 : result := '强化烈焰腰带';
				4 : result := '强化烈焰魔靴';
				5 : result := '强化光芒腰带';
				6 : result := '强化光芒道靴';
	            7 : result := '强化雷霆项链';
                8 : result := '强化雷霆护腕';
                9 : result := '强化雷霆战戒';
                10 : result := '强化烈焰项链';
                11 : result := '强化烈焰护腕';
				12 : result := '强化烈焰魔戒';
				13 : result := '强化光芒项链';
				14 : result := '强化光芒护腕';
				15 : result := '强化光芒道戒';
			
		   end;

		   end;

		 

		 

		  5 : 

        begin

            case ZBlvId of

				1 : result := '开天';
				2 : result := '镇天';
				3 : result := '玄天';
				4 : result := '凤天魔甲';
				5 : result := '凰天魔衣';
				6 : result := '真魂项链';
	            7 : result := '战神戒指';
                8 : result := '真魂戒指';
                9 : result := '圣魔戒指';
                10 : result := '真魂手镯';
                11 : result := '战神手镯';
				12 : result := '圣魔手镯';
				13 : result := '战神项链';
				14 : result := '圣魔项链';
				
				


		   end;

		   end;

		   



		   

		 6 : 

        begin

            case ZBlvId of

                1 : result := '星王战靴';
				2 : result := '星王腰带(战)';
				3 : result := '星王法冠';
				4 : result := '星王道盔';
				5 : result := '星王法靴';
				6 : result := '星王道靴';
	            7 : result := '星王腰带(法)';
                8 : result := '星王腰带(道)';
                9 : result := '星王战戒';
                10 : result := '星王护腕(战)';
                11 : result := '星王项链(战)';
				12 : result := '星王魔戒';
				13 : result := '星王护腕(法)';
				14 : result := '星王项链(法)';
				15 : result := '星王道戒';
				16 : result := '星王护腕(道)';
				17 : result := '星王项链(道)';
				18 : result := '星王圣剑(战)';
				19 : result := '星王圣剑(法)';
				20 : result := '星王圣剑(道)';
				21 : result := '星王圣甲(男)';
				22 : result := '星王圣甲(女)';
			
		   end;

		   end;

		   

    end;

end;



function getZexpNum(Zlv : integer) : integer;

begin

    case Zlv of

        1 : result := 10000;

        2 : result := 20000;

        3 : result := 60000;

		4 : result := 160000;

        5 : result := 600000;

        6 : result := 1280000;
		
        
		
    end;

end;





procedure _huishou;

begin

    This_NPC.NpcDialog(This_Player,

    '请选择你要回收的装备种类：\'

    +'|{cmd}<祖玛装备/@zhuangDlg~1>           ^<赤月装备/@zhuangDlg~2>\'

    +'|{cmd}<魔龙装备/@zhuangDlg~3>           ^<强化装备/@zhuangDlg~4>\'

	+'|{cmd}<战神装备/@zhuangDlg~5>           ^<星王装备/@zhuangDlg~6>'

	

	);

end;



procedure _zhuangDlg(LvidStr : string);

var ZlvId , i: integer;

DlgStr , ExpStr ,Iname,Ybstr : string;

begin

    ZlvId := strToIntDef(LvidStr,-1);

    

    ExpStr := inttostr(getZexpNum(ZlvId) div 10000) + '万';

	  Ybstr  := inttostr(getZexpNum(ZlvId) div 10000) + '个';

    DlgStr := '';

    

    for i := 1 to 39 do

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

        3 : DlgStr := DlgStr + '<一键回收魔龙装备/@tianzhichiyue_all>';

		4 : DlgStr := DlgStr + '<一键回收强化装备/@molong_all>';

		5 : DlgStr := DlgStr + '<一键回收战神装备/@tianzhimolong_all>';

		6 : DlgStr := DlgStr + '<一键回收星王装备/@kaitian_all>';



    end;

    

    This_NPC.NpcDialog(This_Player,

    '请选择装备进行回收，或者一键全部回收！ \'

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

            This_Player.Give('经验',getZexpNum(ZBid div 100));

            This_NPC.NpcDialog(This_Player,

            '恭喜你成功回收！'

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

    for i := 1 to 40 do

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

     '你的包裹中有' + inttostr(ZMnum) + '件祖玛装备，回收可获得:' + inttostr(getZexpNum(1) div 10000 * ZMnum) + '万经验，你确定回收祖玛装备吗？\|' 

    +'|{cmd}<确认回收所有祖玛装备/@ZUma_True>'

    +'|{cmd}<返回/@zhuangDlg~1>');

end;



procedure  _ZUma_True;

var ZMnum , i , j , itemNum : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

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

                This_Player.Give('经验', getZexpNum(1));
				ServerSay('玩家<' + This_Player.Name + '>在无名之地，一键回收了'+ inttostr(ZMnum) + '件祖玛装备，获得了经验！', 2);

            end;

        end; 

    end;

    This_NPC.NpcDialog(This_Player,

    '恭喜你成功回收！' 

    +'|{cmd}<返回/@zhuangDlg~1>');



end;





procedure _Chiyue_all;

var ZMnum , i : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

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

    '你的包裹中有' + inttostr(ZMnum) + '件赤月装备，回收可获得:' + inttostr(getZexpNum(2) div 40000 * ZMnum) + '万经验，你确定回收所有赤月装备吗？\|'

    +'|{cmd}<确认回收所有赤月装备/@Chiyue_True>'

    +'|{cmd}<返回/@zhuangDlg~2>');

end;





procedure  _Chiyue_True;

var ZMnum , i , j , itemNum : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

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

                This_Player.Give('经验', getZexpNum(2));
					  ServerSay('玩家<' + This_Player.Name + '>在无名之地，一键回收了'+ inttostr(ZMnum) + '件赤月装备，获得了经验！', 2);

            end;

        end; 

    end;

    This_NPC.NpcDialog(This_Player,

    '恭喜你成功回收'

    +'|{cmd}<返回/@zhuangDlg~2>');



end;



procedure _tianzhichiyue_all;

var ZMnum , i : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

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

    '你的包裹中有' + inttostr(ZMnum) + '件魔龙装备，回收可获得:' + inttostr(getZexpNum(3) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(3) div 80000 * ZMnum) + '个元宝，你确定回收所有魔龙装备吗？\|'

    +'|{cmd}<确认回收所有魔龙装备/@tianzhichiyue_True>'

    +'|{cmd}<返回/@zhuangDlg~3>');

end;



procedure  _tianzhichiyue_True;

var ZMnum , i , j , itemNum : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

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

                This_Player.Give('经验', getZexpNum(3));

                This_Player.ScriptRequestAddYBNum(getZexpNum(3) div 80000 * ZMnum);
				 ServerSay('玩家<' + This_Player.Name + '>在无名之地，一键回收了'+ inttostr(ZMnum) + '件魔龙装备，获得了经验和元宝！', 2);

            end;

        end; 

    end;

    This_NPC.NpcDialog(This_Player,

    '恭喜你成功回收！'

    +'|{cmd}<返回/@zhuangDlg~3>');



end;











procedure _molong_all;

var ZMnum , i : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

    begin

        Iname := getZBnameById(400 + i);

        if Iname <> '' then

        begin

            if This_Player.GetBagItemCount(Iname) > 0 then

            begin

                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);

            end;

        end; 

    end;

    

    This_NPC.NpcDialog(This_Player,

    '你的包裹中有' + inttostr(ZMnum) + '件强化装备，回收可获得:' + inttostr(getZexpNum(4) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(4) div 80000 * ZMnum) + '个元宝，你确定回收所有强化装备吗？\|'

    +'|{cmd}<确认回收所有强化装备/@molong_True>'

    +'|{cmd}<返回/@zhuangDlg~4>');

end;



procedure  _molong_True;

var ZMnum , i , j , itemNum : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

    begin

        Iname := getZBnameById(400 + i);

        if Iname <> '' then

        begin

            itemNum := This_Player.GetBagItemCount(Iname);

            if itemNum > 0 then

            begin

                ZMnum := ZMnum + itemNum;

                This_Player.Take(Iname, itemNum);

                

                for j := 1 to itemNum do

                This_Player.Give('经验', getZexpNum(4));

				        This_Player.ScriptRequestAddYBNum(getZexpNum(4) div 80000 * ZMnum);
						 ServerSay('玩家<' + This_Player.Name + '>在无名之地，一键回收了'+ inttostr(ZMnum) + '件强化装备，获得了获得:' + inttostr(getZexpNum(4) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(4) div 80000 * ZMnum) + '个元宝！', 2);

            end;

        end; 

    end;

    This_NPC.NpcDialog(This_Player,

    '恭喜你获得:' + inttostr(getZexpNum(4) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(4) div 80000 * ZMnum) + '个元宝！\|'

    +'|{cmd}<返回/@zhuangDlg~4>');



end;













procedure _tianzhimolong_all;

var ZMnum , i : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

    begin

        Iname := getZBnameById(500 + i);

        if Iname <> '' then

        begin

            if This_Player.GetBagItemCount(Iname) > 0 then

            begin

                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);

            end;

        end; 

    end;

    

    This_NPC.NpcDialog(This_Player,

    '你的包裹中有' + inttostr(ZMnum) + '件战神装备，回收可获得:' + inttostr(getZexpNum(5) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(5) div 64000 * ZMnum) + '个元宝，你确定回收所有战神装备吗？\|'

    +'|{cmd}<确认回收所有战神装备/@tianzhimolong_True>'

    +'|{cmd}<返回/@zhuangDlg~5>');

end;



procedure  _tianzhimolong_True;

var ZMnum , i , j , itemNum : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

    begin

        Iname := getZBnameById(500 + i);

        if Iname <> '' then

        begin

            itemNum := This_Player.GetBagItemCount(Iname);

            if itemNum > 0 then

            begin

                ZMnum := ZMnum + itemNum;

                This_Player.Take(Iname, itemNum);

                

                for j := 1 to itemNum do

                This_Player.Give('经验', getZexpNum(5));

                This_Player.ScriptRequestAddYBNum(getZexpNum(5) div 64000 * ZMnum);
				ServerSay('玩家<' + This_Player.Name + '>在无名之地，一键回收了'+ inttostr(ZMnum) + '件战神装备，获得了经验和元宝！', 2);

            end;

        end; 

    end;

    This_NPC.NpcDialog(This_Player,

    '恭喜你获得:' + inttostr(getZexpNum(5) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(5) div 64000 * ZMnum) + '个元宝！\|'

    +'|{cmd}<返回/@zhuangDlg~5>');



end;









procedure _kaitian_all;

var ZMnum , i : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

    begin

        Iname := getZBnameById(600 + i);

        if Iname <> '' then

        begin

            if This_Player.GetBagItemCount(Iname) > 0 then

            begin

                ZMnum := ZMnum + This_Player.GetBagItemCount(Iname);

            end;

        end; 

    end;

    

    This_NPC.NpcDialog(This_Player,

    '你的包裹中有' + inttostr(ZMnum) + '件星王装备，回收可获得:' + inttostr(getZexpNum(6) div 10000 * ZMnum) + '万经验，' + inttostr(getZexpNum(6) div 64000 * ZMnum) + '个元宝，你确定回收所有星王装备吗？\|'

    +'|{cmd}<确认回收所有星王装备/@kaitian_True>'

    +'|{cmd}<返回/@zhuangDlg~6>');

end;




procedure  _kaitian_True;

var ZMnum , i , j , itemNum : integer;

Iname : string;

begin

    ZMnum := 0;

    for i := 1 to 40 do

    begin

        Iname := getZBnameById(600 + i);

        if Iname <> '' then

        begin

            itemNum := This_Player.GetBagItemCount(Iname);

            if itemNum > 0 then

            begin

                ZMnum := ZMnum + itemNum;

                This_Player.Take(Iname, itemNum);

                

                for j := 1 to itemNum do

                This_Player.Give('经验', getZexpNum(6));

				This_Player.ScriptRequestAddYBNum(getZexpNum(6) div 64000 * ZMnum);
				ServerSay('玩家<' + This_Player.Name + '>在无名之地，一键回收了'+ inttostr(ZMnum) + '件星王装备，获得:' + inttostr(getZexpNum(6) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(6) div 25600 * ZMnum) + '个元宝！', 2);

            end;

        end; 

    end;

    This_NPC.NpcDialog(This_Player,

    '恭喜你获得:' + inttostr(getZexpNum(6) div 10000 * ZMnum) + '万经验！' + inttostr(getZexpNum(6) div 25600 * ZMnum) + '个元宝！\|'

    +'|{cmd}<返回/@zhuangDlg~6>');



end;





Begin

  domain;

end.