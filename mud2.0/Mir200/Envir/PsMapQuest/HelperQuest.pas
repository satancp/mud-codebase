

 {    ANGc63
活力值系统
精力值系统
背包系统
商铺系统
挂机系统
设置系统



组队系统
行会系统
好友系统
邮件系统
排行系统


祝福油系统
武器升级
摆摊系统
交易系统
 }
{$I common.pas} 
function GetMapStrNameById(mapId :integer) : string;
begin
    case mapId of
        1 : result := '兽人古墓';  
        2 : result := '洞穴'; 
        3 : result := '沃玛寺庙';  
        4 : result := '比奇废矿';  
        5 :  result := '毒蛇矿区';
        6 : result := '祖玛寺庙';
        7 :result := '石墓';
        8 : result := '地牢';
        9 : result := '封魔矿区';
        10 : result := '封魔殿';
        11 : result := '尸魔洞';
        12 : result := '骨魔洞';
        13 : result := '牛魔洞';
        14 : result := '赤月峡谷';
        15 : result := '魔龙西郊'; 
        16 : result := '魔龙东郊'; 
    end;
end;

procedure GetMapMsgStrByName(mapName : string; var MapMinLv , MapMaxLv :integer; var Map_str : string;var mapX , MapY : integer;var mapItemStr , mapBoss , mapJY : string);
begin
    case mapName of
        '兽人古墓' :  
        begin 
             
            MapMinLv := 7; 
            MapMaxLv := 21; 
            Map_str := '0'; 
            mapX := 147; 
            MapY := 33; 
            mapItemStr := '初级装备与22级以下书籍'; 
            mapBoss := '骷髅精灵'; 
            mapJY := ''; 
        end; 
        '洞穴' :  
        begin 
             
            MapMinLv := 7; 
            MapMaxLv := 21; 
            Map_str := '0'; 
            mapX := 41; 
            MapY := 108; 
            mapItemStr := '初级装备与22级以下书籍'; 
            mapBoss := '骷髅精灵'; 
            mapJY := ''; 
        end; 
        '沃玛寺庙' :  
        begin 
             
            MapMinLv := 22; 
            MapMaxLv := 40; 
            Map_str := '1'; 
            mapX := 84; 
            MapY := 277; 
            mapItemStr := '炼狱，银蛇，魔杖，沃玛首饰，沃玛号角'; 
            mapBoss := '沃玛教主'; 
            mapJY := '沃玛卫士'; 
        end; 
        '比奇废矿':  
        begin 
             
            MapMinLv := 15; 
            MapMaxLv := 28; 
            Map_str := '0'; 
            mapX := 664; 
            MapY := 212; 
            mapItemStr := '35级以下技能书籍'; 
            mapBoss := '尸王'; 
            mapJY := ''; 
        end; 
        '毒蛇矿区' :  
        begin 
             
            MapMinLv := 15; 
            MapMaxLv := 28; 
            Map_str := '2'; 
            mapX := 564; 
            MapY := 169; 
            mapItemStr := '35级以下技能书籍'; 
            mapBoss := '尸王'; 
            mapJY := ''; 
        end; 
        '祖玛寺庙' :  
        begin 
             
            MapMinLv := 26; 
            MapMaxLv := 45; 
            Map_str := '3'; 
            mapX := 862; 
            MapY := 174; 
            mapItemStr := '裁决之杖，骨玉权杖，龙纹剑，祖玛首饰，祖玛头像'; 
            mapBoss := '祖玛教主'; 
            mapJY := '祖玛卫士，祖玛雕像，祖玛弓箭手'; 
        end; 
        '石墓' :  
        begin 
             
            MapMinLv := 28; 
            MapMaxLv := 42; 
            Map_str := '3'; 
            mapX := 306; 
            MapY := 322; 
            mapItemStr := '裁决之杖，骨玉权杖，龙纹剑，紫碧螺，龙之手镯，恶魔铃铛，力量戒指，骑士手镯，绿色项链，泰坦戒指，三眼手镯，灵魂项链'; 
            mapBoss := '石墓尸王'; 
            mapJY := '白野猪，邪恶毒蛇'; 
        end; 
        '地牢' :  
        begin 
             
            MapMinLv := 22; 
            MapMaxLv := 40; 
            Map_str := '3'; 
            mapX := 139; 
            MapY := 85; 
            mapItemStr := '炼狱，银蛇，魔杖，红宝石戒指，思贝儿手镯，生命项链，龙之戒指，幽灵手套，幽灵项链，铂金戒指，心灵手镯，天珠项链'; 
            mapBoss := '触龙神'; 
            mapJY := '邪恶钳虫'; 
        end; 
        '封魔矿区' :  
        begin 
             
            MapMinLv := 15; 
            MapMaxLv := 45; 
            Map_str := '4'; 
            mapX := 56; 
            MapY := 66; 
            mapItemStr := '裁决之杖，骨玉权杖，龙纹剑，紫碧螺，龙之手镯，恶魔铃铛，力量戒指，骑士手镯，绿色项链，泰坦戒指，三眼手镯，灵魂项链'; 
            mapBoss := '虹魔教主'; 
            mapJY := '白野猪，邪恶毒蛇，虹魔猪卫，虹魔蝎卫'; 
        end; 
        '封魔殿' :  
        begin 
             
            MapMinLv := 15; 
            MapMaxLv := 45; 
            Map_str := '4'; 
            mapX := 140; 
            MapY := 67; 
            mapItemStr := '裁决之杖，骨玉权杖，龙纹剑，紫碧螺，龙之手镯，恶魔铃铛，力量戒指，骑士手镯，绿色项链，泰坦戒指，三眼手镯，灵魂项链'; 
            mapBoss := '虹魔教主'; 
            mapJY := '白野猪，邪恶毒蛇，虹魔猪卫，虹魔蝎卫'; 
        end; 
        '尸魔洞' :  
        begin 
             
            MapMinLv := 22; 
            MapMaxLv := 40; 
            Map_str := '5'; 
            mapX := 527; 
            MapY := 610; 
            mapItemStr := '35级以下技能书籍'; 
            mapBoss := ''; 
            mapJY := ''; 
        end; 
        '骨魔洞' :  
        begin 
             
            MapMinLv := 22; 
            MapMaxLv := 40; 
            Map_str := '5'; 
            mapX := 549; 
            MapY := 126; 
            mapItemStr := '裁决之杖，骨玉权杖，龙纹剑，紫碧螺，龙之手镯，恶魔铃铛，力量戒指，骑士手镯，绿色项链，泰坦戒指，三眼手镯，灵魂项链'; 
            mapBoss := '黄泉教主'; 
            mapJY := ''; 
        end; 
        '牛魔洞' :  
        begin 
             
            MapMinLv := 35; 
            MapMaxLv := 45; 
            Map_str := '5'; 
            mapX := 655; 
            MapY := 458; 
            mapItemStr := '裁决之杖，骨玉权杖，龙纹剑，紫碧螺，龙之手镯，恶魔铃铛，力量戒指，骑士手镯，绿色项链，泰坦戒指，三眼手镯，灵魂项链，靴子，腰带，龙牙，怒斩，逍遥扇'; 
            mapBoss := '牛魔王，暗之牛魔王'; 
            mapJY := ''; 
        end; 
        '赤月峡谷' :  
        begin 
             
            MapMinLv := 35; 
            MapMaxLv := 45; 
            Map_str := '11'; 
            mapX := 349; 
            MapY := 239; 
            mapItemStr := '法神套装，圣战套装，天尊套装'; 
            mapBoss := '双头金刚，双头血魔，赤月恶魔'; 
            mapJY := ''; 
        end; 
        '魔龙西郊' :  
        begin 
             
            MapMinLv := 35; 
            MapMaxLv := 70; 
            Map_str := '6'; 
            mapX := 460; 
            MapY := 66; 
            mapItemStr := '狮子吼，灭天火，寒冰掌，无极真气，气功波，靴子，腰带，雷霆，烈焰，光芒套装'; 
            mapBoss := '魔龙教主'; 
            mapJY := '魔龙力士，魔龙战将，魔龙巨蛾'; 
        end; 
        '魔龙东郊' :  
        begin 
             
            MapMinLv := 35; 
            MapMaxLv := 70; 
            Map_str := '6'; 
            mapX := 471; 
            MapY := 375; 
            mapItemStr := '狮子吼，灭天火，寒冰掌，无极真气，气功波，靴子，腰带，雷霆，烈焰，光芒套装'; 
            mapBoss := '魔龙教主'; 
            mapJY := '魔龙力士，魔龙战将，魔龙巨蛾'; 
        end; 
    end;
end;

function getMoveNpcName() : string;
begin
    if This_Player.MapName = '11' then     
    result := '向导'
    else
    result := '老兵';
end;

procedure _help_1;
var temp_lv , i , j : integer;
Dlg_Str , XX_Str : string;
mapId :integer; mapName : string; 
MapMinLv , MapMaxLv :integer; 
Map_str : string;
mapX , MapY : integer;
mapItemStr , mapBoss , mapJY : string;
begin
    temp_lv := This_Player.Level;

    Dlg_Str := '';
    XX_Str := '';
    j := 0; 
    for i := 1 to 16 do
    begin
        mapName := GetMapStrNameById(i);
        GetMapMsgStrByName(mapName , MapMinLv , MapMaxLv, Map_str , mapX , MapY , mapItemStr , mapBoss , mapJY);


        if temp_lv >= MapMinLv then
        begin
            if temp_lv <= MapMaxLv then
            begin
                if Dlg_Str <>  '' then
                Dlg_Str := Dlg_Str + '，';
                
                Dlg_Str := Dlg_Str + mapName;
                j := j + 1;
                
                XX_Str :=  XX_Str + '<' + mapName + '/@goMonMap~' + inttostr(i) + '>     ';
                
                if (j mod 2) = 0 then
                XX_Str :=  XX_Str + '\|'
                else
                XX_Str :=  XX_Str + '^'; 
                
            end;
        end;
    end;
    if temp_lv < 7 then
    This_Player.HelperDialog(
    '你的等级为：' + inttostr(temp_lv) + '级，适合练级地图：\'
    +'|比奇野外。'
    +'|{cmd}<返回/@main>'
    ) 
    else
    This_Player.HelperDialog(
    '你的等级为：' + inttostr(temp_lv) + '级，适合练级地图：\'
    //+'相应地图老兵可直接传送到洞穴门口。\ \'
    +'' + Dlg_Str
    +'{cmd}|<带我去找' + getMoveNpcName() + '/@goLaobin>|\'
    + XX_Str
    +'<返回/@main>'
    );
end;

function getMapStrNameByMname(Mname : string) : string;
begin
    case Mname of
        '0' : result := '比奇';
        '1' : result := '沃玛森林';
        '2' : result := '毒蛇山谷';
        '3' : result := '盟重';
        '4' : result := '封魔谷';
        '5' : result := '苍月岛';
        '6' : result := '魔龙城';
        '11' : result := '白日门';
        
        
    end;
end;

procedure _goMonMap(MapIdStr : string);
var mapId :integer; mapName : string; 
MapMinLv , MapMaxLv :integer; 
Map_str : string;
mapX , MapY : integer;
mapItemStr , mapBoss , mapJY : string;
begin
    mapId := StrToIntDef(MapIdStr , -1);
    
    mapName := GetMapStrNameById(mapId);
    GetMapMsgStrByName(mapName , MapMinLv , MapMaxLv, Map_str , mapX , MapY , mapItemStr , mapBoss , mapJY);
    
    if mapBoss <> '' then
    mapBoss := '|Boss：' + mapBoss; 
    
    if mapJY <> '' then
    mapJY := '|精英：' + mapJY; 
    
    This_Player.HelperDialog(
    mapName + '：\'
    +'|入口：' + getMapStrNameByMname(Map_str) + '：' + inttostr(mapX) + ',' + inttostr(mapY) + '，\'
    +'|地图产出：' + mapItemStr + '\' 
    + mapBoss +'。\\'
    + mapJY
    +'{cmd}|<去' + mapName + '/@MapMoveMonmap~' + MapIdStr + '>         ^<找' + getMoveNpcName() + '传送/@goLaobin>\'
    +'{cmd}|<返回/@help_1>' 
    );
end;

procedure _goLaobin;
begin
   case This_Player.MapName of
        '0' : This_Player.AutoGotoMap('0',333,274); 
      //  '1' : result := '沃玛森林';
        '2' : This_Player.AutoGotoMap('2',500,485);
        '3' : This_Player.AutoGotoMap('3',334,326);
        '4' : This_Player.AutoGotoMap('4',240,200);
        '5' : This_Player.AutoGotoMap('5',140,330);
        '6' : This_Player.AutoGotoMap('6',121,154);
        '11' : This_Player.AutoGotoMap('11',184,300);
        else
        This_Player.HelperDialog(
        '先使用回城，然后再寻找' + getMoveNpcName() + '！'
        ); 
   end; 
end;

procedure _MapMoveMonmap(MapIdStr : string);
var mapId :integer; mapName : string; 
MapMinLv , MapMaxLv :integer; 
Map_str : string;
mapX , MapY : integer;
mapItemStr , mapBoss , mapJY : string;
begin
    mapId := StrToIntDef(MapIdStr , -1);
    mapName := GetMapStrNameById(mapId);
    GetMapMsgStrByName(mapName , MapMinLv , MapMaxLv, Map_str , mapX , MapY , mapItemStr , mapBoss , mapJY);
    This_Player.AutoGotoMap(Map_str , mapX , MapY); 
end;

procedure _help_2;
begin
    This_Player.HelperDialog(
    '装备提升：\\'
    +'|游戏中您可以通过以下方式提升您的装备。'
    +'{cmd}|<装备合成/@help_2_1>        ^<锻造武器/@help_2_2>\'
    +'{cmd}|<祝福油/@help_2_3>          ^<武器升级/@help_2_4>\'
    +'{cmd}|<祝福油/@help_2_5>\'
    +'{cmd}|<返回/@main>' 
    );
end;

procedure _help_2_1;
begin
    This_Player.HelperDialog(
     '装备合成：|边界城首饰店里有一位神秘的锻造师，他研究出了将低级装备合成高\'
    +'级装备的方式，据说最少只要2件相同装备就能合成了，\'
    +'具体情况你可以去问问他。\ \'
    +'{cmd}|<返回/@help_2>' 
    );
end;

procedure _help_2_2;
begin
    This_Player.HelperDialog(
     '锻造武器：|在边界城有一位炼金师，能够帮你炼出金刚石。\'
    +'带着金刚石去找边界城武器店里云游的锻造师，\'
    +'只需要10颗就可以锻造出一把武器。锻造出不理想的武器还可以熔炼\'
    +'回金刚石或金币。\ \'
    +'{cmd}|<返回/@help_2>' 
    );
end;

procedure _help_2_3;
begin
    This_Player.HelperDialog(
    '祝福油：|\'
    +'双击使用祝福油有几率提升武器的幸运值，幸运值直接影响了武器能否发挥最佳属性。除了打怪和玩家交易，盟重城内有一位流浪汉，还有大量满装的祝福罐出售哦。'
    +'{cmd}|<返回/@help_2>' 
    );
end;

procedure _help_2_3_1;
begin
    This_Player.HelperDialog(
    '双击祝福油即有几率武器的幸运值，当然也有可能无效或是被诅咒。 \'
    +'|布局中有祝福油快捷栏，可快速使用祝福油'
    +'{cmd}|<返回/@help_2_3>' 
    );
end;

procedure _help_2_3_2;
begin
    This_Player.HelperDialog(
    '武器的幸运属性越高，发挥自身攻击、魔法、道术上限的机率就越大。'
    +'{cmd}|<返回/@help_2_3>' 
    );
end;

procedure _help_2_3_3;
begin
    This_Player.HelperDialog(
    '在商城可以购买到祝福罐。祝福罐最多可以储存50瓶祝福油。祝福油可以被拖拽放入祝福罐，双击祝福罐每次放出一瓶祝福油。'
    +'{cmd}|<返回/@help_2_3>' 
    );
end;

procedure _help_2_4;
begin
    This_Player.HelperDialog(
    '武器升级：|能人异士都去边界城了，只有他还坚守在沙巴克武器店里。兵器店老板能够帮助你进行武器升级，只需要少量金币、黑铁矿石和饰品。具体的细节你可以去问问他。'
    +'{cmd}|<返回/@help_2>' 
    );
end;

procedure _help_2_5;
begin
    This_Player.HelperDialog(
    '项链鉴定：|虽然项链不能够通过祝福油获得幸运值，但边界城首饰店里云游的鉴宝师，能够帮你琢磨白色虎齿项链和灯笼项链，有几率让它们获得更佳的属性。'
    +'{cmd}|<返回/@help_2>' 
    );
end;

procedure _help_4;
begin
    This_Player.HelperDialog(
    '交易方式：\ \'
    +'{cmd}|<元宝交易/@help_4_1>             ^<摆摊/@help_4_2>\'
    +'{cmd}|<与玩家直接交易/@help_4_3>\'
    +'{cmd}|<返回/@main>' 
    );
end;

procedure _help_4_1;
begin
    This_Player.HelperDialog(
    '元宝交易：|在边界城的元宝使者处，您可以向指定玩家下单、接单，使用元宝交易物品。\ \'
    +'{cmd}|<返回/@help_4>' 
    );
end;

procedure _help_4_2;
begin
    This_Player.HelperDialog(
    '摆摊：|所有人在边界城中都可以进行摆摊，店小二会帮你看管摊位，即便您不在边界城内，其他玩家仍可以光顾您的摊位购买物品。\'
    +'{cmd}|<返回/@help_4>' 
    );
end;

procedure _help_4_3;
begin
    This_Player.HelperDialog(
    '与玩家直接交易：|和其他玩家面对面时，可以点击交易进行直接交易。'
    +'{cmd}|<返回/@help_4>' 
    );
end;


procedure _helperSkill; 
begin
    This_Player.HelperDialog(
    '你想了解那种职业的技能？\\'
    +'{cmd}|<战士/@helperSkillJob~0>    ^<法师/@helperSkillJob~1>    ^<道士/@helperSkillJob~2>\\'
    +'{cmd}|<返回/@main>' 
    );
end;

function getSkillIdByStr(SkillName : string) : integer;
begin
    case SkillName of
        '基本剑术' : result := 3;
        '攻杀剑术' : result := 7;
        '刺杀剑术' : result := 12;
        '半月弯刀' : result := 25;
        '野蛮冲撞' : result := 27;
        '烈火剑法' : result := 26;
        '狮子吼' : result := 43;
        '逐日剑法' : result := 58;
        '火球术' : result := 1;
        '抗拒火环' : result := 8;
        '诱惑之光' : result := 20;
        '地狱火' : result := 9;
        '雷电术' : result := 11;
        '瞬息移动' : result := 21;
        '大火球' : result := 5;
        '爆裂火焰' : result := 23;
        '火墙' : result := 22;
        '疾光电影' : result := 10;
        '地狱雷光' : result := 24;
        '魔法盾' : result := 31;
        '圣言术' : result := 32;
        '冰咆哮' : result := 33;
        '寒冰掌' : result := 39;
        '灭天火' : result := 35;
        '流星火雨' : result := 59;
        '治愈术' : result := 2;
        '精神力战法' : result := 4;
        '施毒术' : result := 6;
        '灵魂火符' : result := 13;
        '召唤骷髅' : result := 17;
        '隐身术' : result := 18;
        '集体隐身术' : result := 19;
        '幽灵盾' : result := 14;
        '神圣战甲术' : result := 15;
        '心灵启示' : result := 28;
        '困魔咒' : result := 16;
        '群体治愈术' : result := 29;
        '召唤神兽' : result := 30;
        '气功波' : result := 37;
        '无极真气' : result := 36;
        '噬血术' : result := 48;
        else
        result := -1;
    end;
end;

function getSkillNameByJob(JobId , SkillId : integer) : string;
begin
    result := '';
    case JobId of
        0 : 
        begin
            case SkillId of
                1 : result := '基本剑术';
                2 : result := '攻杀剑术';
                3 : result := '刺杀剑术';
                4 : result := '半月弯刀';
                5 : result := '野蛮冲撞';
                6 : result := '烈火剑法';
                7 : result := '狮子吼';
                8 : result := '逐日剑法';

            end;
        end;
        1 : 
        begin
            case SkillId of
                1 : result := '地狱火';
                2 : result := '雷电术';
                3 : result := '瞬息移动';
                4 : result := '大火球';
                5 : result := '爆裂火焰';
                6 : result := '火墙';
                7 : result := '疾光电影';
                8 : result := '地狱雷光';
                9 : result := '魔法盾';
                10 : result := '圣言术';
                11 : result := '冰咆哮';
                12 : result := '寒冰掌';
                13 : result := '灭天火';
                14 : result := '流星火雨';

            end;
        end;
        2 : 
        begin
            case SkillId of
                1 : result := '灵魂火符';
                2 : result := '召唤骷髅';
                3 : result := '隐身术';
                4 : result := '集体隐身术';
                5 : result := '幽灵盾';
                6 : result := '神圣战甲术';
                7 : result := '心灵启示';
                8 : result := '困魔咒';
                9 : result := '群体治愈术';
                10 : result := '召唤神兽';
                11 : result := '气功波';
                12 : result := '无极真气';
                13 : result := '噬血术';

            end;
        end;
    end;
end;

function getSkillStr(Sid : integer) : string;
begin
    case Sid of
        3 : result := '7级可以学习基本剑术，这是被动技能等级，可以增加你的准确属性。';
        7 : result := '19级可以学习攻杀剑术，可以提高攻击的伤害，技能等级提升还能增加准确。';
        12 : result := '25级可以学习刺杀剑术，它能对隔位的敌人造成伤害，不过你得学会如何走位。';
        25 : result := '28级就可以学习半月弯刀，它可以同时攻击环绕在你周围的所有敌人。';
        27 : result := '30级可以练习野蛮冲撞，撞开级别低于你的敌人。你可要小心别撞到障碍物上。';
        26 : result := '达到35级就可以学习烈火剑法了。这是战士重要的伤害技能，有7秒的冷却时间。';
        43 : result := '达到38级就可以学习狮子吼了，使用它能让怪物暂时麻痹。';
        58 : result := '47级可以学习战士高级技能逐日剑法，它能攻击直线上4格的敌人，有10秒的冷却时间。';
        1 : result := '火球术7级就能学习，是法师的基础法术，能对远处的敌人造成单体伤害。';
        8 : result := '12级可以学习抗拒火环，可以推开四周的敌人，前提是他们级别比你低。';
        20 : result := '13级可以学习诱惑之光。你能干扰怪物使他们无法动弹，甚至能诱惑他们成为你的宝宝。';
        9 : result := '16级可以学习地狱火，这是法师第一个群攻技能，可以对前排5格的敌人造成伤害。';
        11 : result := '17级可以学习法师的核心技能雷电术，可以造成强大的单体伤害。';
        21 : result := '19级可以学习瞬息移动，使用技能会随机飞到上次路过的主城所在的地图。';
        5 : result := '19级能够学习大火球，这可比小火球厉害多了。';
        23 : result := '22级可以学习爆裂火焰，它能对3X3的范围造成伤害。';
        22 : result := '24级可以学习火墙，释放之后会持续燃烧，火墙中的敌人会受到持续伤害。';
        10 : result := '26级可以学习疾光电影，能够对对直线上的敌人造成伤害。';
        24 : result := '30级可以学习地狱雷光，这个技能能够对四周多个不死系敌人造成伤害。';
        31 : result := '31级能够学习魔法盾，这是法师最重要的防御技能。';
        32 : result := '32级可以学习圣言术，有一定几率能够秒杀不死系怪物。';
        33 : result := '35级就能学习冰咆哮了，它能对3X3范围的敌人造成极大的伤害。';
        39 : result := '36级可以学习寒冰掌，它不能能够造成伤害，还有几率推动级别低于你的敌人。';
        35 : result := '38级可以学习灭天火，它不能能够造成伤害，还能够灼烧敌人的魔法值。';
        59 : result := '47级可以学习法师高级技能流星火雨。高伤害、3X3的范围，群体技能的不二之选。';
        2 : result := '7级就能学习治愈术，这样就可以给自己和队友回复血量了。';
        4 : result := '9级开始学习精神力战法，这是被动技能，它能够大幅提高你的准确。';
        6 : result := '14级可以学习施毒术，不过使用技能时必须佩戴红毒或者绿毒。';
        13 : result := '18级可以学习灵魂火符，这使你能够远程攻击敌人，别忘了佩戴护身符。';
        17 : result := '19级可以学习召唤骷髅，技能等级越高，骷髅宝宝的等级也会越高。';
        18 : result := '20级可以学习隐身术，使用技能能够使大部分怪物都无法洞察你。';
        19 : result := '21级可以学习集体隐身术，这样你也可以帮助队友实现隐身效果了。';
        14 : result := '22级可以学习幽灵盾，能够帮助范围内队友提高魔御。';
        15 : result := '25级可以学习神圣战甲术，能够帮助范围内队友提高防御。';
        28 : result := '26级可以学习利用心灵启示，这个技能让你在一定时间内查看目标的体力值。';
        16 : result := '28级可以学习困魔咒，能困住范围内的怪物，升级后还可以对付更加强力的怪物。';
        29 : result := '33级可以学习群体治愈术，可恢复施放范围内所有玩家的体力值。';
        30 : result := '35级可以学习召唤神兽，神兽宝宝非常强大。';
        37 : result := '29级就能学习气功波了，只要是等级不比你高的敌人，你就能推开。';
        36 : result := '36级可以学习无极真气，使用后在6秒内大幅提高自身的道术。';
        48 : result := '47级可以学习道士高级技能噬血术。无视地形对敌人造成伤害，同时还有吸血效果。';

    end;
end;

function getSBookMSGstr(Sname : string):string;
begin
    case Sname of
        '火球术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '治愈术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '基本剑术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '精神力战法' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '大火球' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '施毒术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '攻杀剑术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '抗拒火环' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '地狱火' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '疾光电影' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '雷电术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '刺杀剑术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '灵魂火符' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '幽灵盾' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '神圣战甲术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '困魔咒' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '召唤骷髅' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '隐身术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '集体隐身术' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '诱惑之光' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '瞬息移动' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '火墙' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '爆裂火焰' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '地狱雷光' : result := '商店购买，尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '半月弯刀' : result := '商店购买，尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '烈火剑法' : result := '商店购买，尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '野蛮冲撞' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '心灵启示' : result := '商店购买，僵尸系列、骷髅精灵、巨型多角虫怪物有概率爆出';
        '群体治愈术' : result := '商店购买，尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '召唤神兽' : result := '商店购买，尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '魔法盾' : result := '商店购买，尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '圣言术' : result := '商店购买，尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '冰咆哮' : result := '尸王、白野猪、极品祖玛怪物怪物有概率爆出';
        '灭天火' : result := '魔龙力士、魔龙巨蛾、魔龙战将、魔龙教主、暗之魔龙教主怪物有概率爆出';
        '无极真气' : result := '魔龙力士、魔龙巨蛾、魔龙战将、魔龙教主、暗之魔龙教主怪物有概率爆出';
        '气功波' : result := '魔龙力士、魔龙巨蛾、魔龙战将、魔龙教主、暗之魔龙教主怪物有概率爆出';
        '寒冰掌' : result := '魔龙力士、魔龙巨蛾、魔龙战将、魔龙教主、暗之魔龙教主怪物有概率爆出';
        '狮子吼' : result := '魔龙力士、魔龙巨蛾、魔龙战将、魔龙教主、暗之魔龙教主怪物有概率爆出';
        '噬血术' : result := '使用书页在皇家大学士处可兑换技能书';
        '逐日剑法' : result := '使用书页在皇家大学士处可兑换技能书';
        '流星火雨' : result := '使用书页在皇家大学士处可兑换技能书';
    end;
end;

procedure _helperSkillJob(JobSId : string);
var i , jobId : integer;
str , SName : string;
begin
    str := '';
    jobId := StrToIntDef(JobSId , -1);
    
    for i := 1 to 14 do
    begin
        SName := getSkillNameByJob(jobId , i);
        if SName <> '' then
        begin
            str := str + '<' + SName + '/@@helper.call("skill",' + inttostr(getSkillIdByStr(SName)) + ')@SkillStrDlg~' + inttostr(getSkillIdByStr(SName) * 100 + jobId) + '>';
            
            if i mod 2 = 1 then
            str := str + addSpace(' ', 16 - length(SName)) + '^'
            else
            str := str + '|\'; 
        end else
        break;
    end;
    
    This_Player.HelperDialog(
    '请选择你需要了解的技能：\'
    +'{cmd}|' +str
    +'<返回/@helperSkill>')
end;

procedure _SkillStrDlg(SJidStr : string);
var sjId , Sid , Jid : integer;
begin
    sjId := StrToIntDef(SJidStr , -1);
    Sid := sjId div 100;
    Jid := sjId mod 100;
    
    This_Player.HelperDialog(
    getSkillStr(Sid) + '\'
    +'{cmd}|<返回/@helperSkillJob~' + inttostr(Jid) + '>');
end;

procedure _help_8;
var str_Job , Skill_XX , Skill_name : string; 
i , j , temp_job : integer;
begin
    temp_job := This_Player.Job;
    Skill_XX := '';
    j := 0;
    case temp_job of
        0 : str_Job := '战士';
        1 : str_Job := '法师';
        2 : str_Job := '道士';
    end;
    
    for i := 1 to 14 do
    begin
        Skill_name :=  getSkillNameByJob(temp_job , i);
        if Skill_name <> '' then
        begin
          //  if This_Player.GetSkillLevelExt(Skill_name,false) >= 0 then
          //  Skill_XX := Skill_XX + '<' + Skill_name  + '/c=green>    '
          //  else
            if This_Player.GetSkillLevelExt(Skill_name,false) < 0 then
            begin
              Skill_XX := Skill_XX + '<' + Skill_name  + '/@@helper.call("skill",' + inttostr(getSkillIdByStr(Skill_name)) + ')@LookSelfSkill~' + Skill_name + '>    ';
              j := j + 1;
              if (j mod 2) = 1 then
              Skill_XX := Skill_XX + '^'
              else
              Skill_XX := Skill_XX + '|';
            end;           
            
        end
        else
        break;
        
    end;
    
    if (j mod 2) = 1 then
    Skill_XX := Skill_XX + '|';
    
    
    This_Player.HelperDialog(
    '你还可以学习的技能有：\\'
    +'{cmd}|' + Skill_XX
    +'<查看所有职业技能/@helperSkill>\'
    +'|<返回/@main>'
    );
end;

procedure _LookSelfSkill(Sname : string);
begin
    This_Player.HelperDialog(
    Sname + '：'
    +'|技能介绍：' + getSkillStr(getSkillIdByStr(Sname))
    +'|产出方式：' + getSBookMSGstr(Sname)
    +'{cmd}|<返回/@help_8>'
    );
end;


procedure _helpEquip;
begin
    This_Player.HelperDialog(
    '你想了解那种职业的装备？\\'
    +'{cmd}|<战士/@helpEquipJob~0>    ^<法师/@helpEquipJob~1>    ^<道士/@helpEquipJob~2>||\\'
    +'<返回/@main>' 
    );
end;

function getEquipIdByName(Ename : string;JobId : integer) : integer;
var tempEid : integer; 
IsTwoGender : boolean;
begin

    IsTwoGender := true;
    tempEid := 0;
    case Ename of
        '八荒' : tempEid := 5;
        '凌风' : tempEid := 13;
        '斩马刀' : tempEid := 15;
        '修罗' : tempEid := 17;
        '凝霜' : tempEid := 31;
        '炼狱' : tempEid := 33;
        '井中月' : tempEid := 39;
        '裁决之杖' : tempEid := 51;
        '命运之刃' : tempEid := 53;
        '屠龙' : tempEid := 59;
        '怒斩' : tempEid := 71;
        '开天' : tempEid := 81;
        '海魂' : tempEid := 9;
        '偃月' : tempEid := 21;
        '魔杖' : tempEid := 37;
        '血饮' : tempEid := 43;
        '骨玉权杖' : tempEid := 57;
        '嗜魂法杖' : tempEid := 63;
        '龙牙' : tempEid := 73;
        '镇天' : tempEid := 85;
        '半月' : tempEid := 7;
        '降魔' : tempEid := 19;
        '银蛇' : tempEid := 35;
        '无极棍' : tempEid := 41;
        '龙纹剑' : tempEid := 55;
        '逍遥扇' : tempEid := 61;
        '玄天' : tempEid := 83;
        '轻型盔甲' : tempEid := 3;
        '中型盔甲' : tempEid := 11;
        '重盔甲' : tempEid := 23;
        '战神盔甲' : tempEid := 45;
        '天魔神甲' : 
        begin
        tempEid := 65;
        IsTwoGender := false;
        end;
        '圣战宝甲' : 
        begin
        tempEid := 66;
        IsTwoGender := false;
        end;
        '雷霆战甲' : tempEid := 75;
        '轻型盔甲' : tempEid := 3;
        '中型盔甲' : tempEid := 11;
        '魔法长袍' : tempEid := 27;
        '恶魔长袍' : tempEid := 49;
        '法神披风' : tempEid := 69;
        '霓裳羽衣' : 
        begin
        tempEid := 70;
        IsTwoGender := false;
        end;
        '烈焰魔衣' : 
        begin
        tempEid := 79;
        IsTwoGender := false;
        end;
        '轻型盔甲' : tempEid := 3;
        '中型盔甲' : tempEid := 11;
        '灵魂战衣' : tempEid := 25;
        '幽灵战衣' : tempEid := 47;
        '天尊道袍' :
        begin
        tempEid := 67;
        IsTwoGender := false;
        end;
        '天师长袍' :
        begin
        tempEid := 68;
        IsTwoGender := false;
        end;
        '光芒道袍' : tempEid := 77;
        '凤天魔甲' : 
        begin
            case JobId of
                0 : tempEid := 87;
                1 : tempEid := 89;
                2 : tempEid := 91;
            end;
            IsTwoGender := false;
        end;
        '凰天魔衣' :
        begin
            case JobId of
                0 : tempEid := 88;
                1 : tempEid := 90;
                2 : tempEid := 92;
            end;
            IsTwoGender := false;
        end;
    end;
    
    if IsTwoGender then
    begin
       if This_Player.Gender = 0 then
       result := tempEid
       else
       result := tempEid + 1;
    end else
    result := tempEid;
end;

function getWPnameById(jobId , WpId : integer) : string; 
begin
    result := '';
    case jobId of
        0 :
        begin
            case WpId of
                1 : result := '八荒';
                2 : result := '凌风';
                3 : result := '斩马刀';
                4 : result := '修罗';
                5 : result := '凝霜';
                6 : result := '炼狱';
                7 : result := '井中月';
                8 : result := '裁决之杖';
                9 : result := '命运之刃';
                10 : result := '屠龙';
                11 : result := '怒斩';
                12 : result := '开天';

            end;
        end;
        1 :
        begin
            case WpId of
                1 : result := '海魂';
                2 : result := '偃月';
                3 : result := '魔杖';
                4 : result := '血饮';
                5 : result := '骨玉权杖';
                6 : result := '嗜魂法杖';
                7 : result := '龙牙';
                8 : result := '镇天';

            end;
        end;
        2 :
        begin
            case WpId of
                1 : result := '半月';
                2 : result := '降魔';
                3 : result := '银蛇';
                4 : result := '无极棍';
                5 : result := '龙纹剑';
                6 : result := '逍遥扇';
                7 : result := '玄天';

            end;
        end;
    end;
end;

function getYFnameById(jobId , YFId : integer) : string; 
begin
    result := '';
    case jobId of
        0 :
        begin
            case YFId of
                1 : result := '轻型盔甲';
                2 : result := '中型盔甲';
                3 : result := '重盔甲';
                4 : result := '战神盔甲';
                5 : result := '天魔神甲';
                6 : result := '圣战宝甲';
                7 : result := '雷霆战甲';
                8 : result := '凤天魔甲';
                9 : result := '凰天魔衣';


            end;
        end;
        1 :
        begin
            case YFId of
                1 : result := '轻型盔甲';
                2 : result := '中型盔甲';
                3 : result := '魔法长袍';
                4 : result := '恶魔长袍';
                5 : result := '法神披风';
                6 : result := '霓裳羽衣';
                7 : result := '烈焰魔衣';
                8 : result := '凤天魔甲';
                9 : result := '凰天魔衣';

            end;
        end;
        2 :
        begin
            case YFId of
                1 : result := '轻型盔甲';
                2 : result := '中型盔甲';
                3 : result := '灵魂战衣';
                4 : result := '幽灵战衣';
                5 : result := '天尊道袍';
                6 : result := '天师长袍';
                7 : result := '光芒道袍';
                8 : result := '凤天魔甲';
                9 : result := '凰天魔衣';

            end;
        end;
    end;
end;

function getEquipStr(Eid : integer) : string;
begin
    case Eid of
        1 : result := '鹤嘴锄可以在用来比奇国王许可的地图挖矿，11级就能使用。';
        2 : result := '鹤嘴锄可以在用来比奇国王许可的地图挖矿，11级就能使用。';
        3 : result := '轻型盔甲11级就能穿戴，可以帮助你顺利渡过前期。防御3-3魔御1-2，比布衣好多了。';
        4 : result := '轻型盔甲11级就能穿戴，可以帮助你顺利渡过前期。防御3-3魔御1-2，比布衣好多了。';
        5 : result := '15级拿上八荒，才算成为战士了。攻击4-12能够让你面对骷髅时毫无惧色。';
        6 : result := '15级拿上八荒，才算成为战士了。攻击4-12能够让你面对骷髅时毫无惧色。';
        7 : result := '半月是获得道术的第一把武器，15级可以使用，攻击5-10道术1-1。';
        8 : result := '半月是获得道术的第一把武器，15级可以使用，攻击5-10道术1-1。';
        9 : result := '海魂魔法1-2，是法师前期的得力武器，15级可以使用。';
        10 : result := '海魂魔法1-2，是法师前期的得力武器，15级可以使用。';
        11 : result := '16级可以穿中型盔甲了，防御3-5魔御1-2，能够帮你抵御更多的伤害。';
        12 : result := '16级可以穿中型盔甲了，防御3-5魔御1-2，能够帮你抵御更多的伤害。';
        13 : result := '凌风是一把如风般迅捷的武器，穿戴需求等级19，攻击6-12。';
        14 : result := '凌风是一把如风般迅捷的武器，穿戴需求等级19，攻击6-12。';
        15 : result := '长刀所向，无往不利。斩马刀攻击5-15，穿戴需要等级20。';
        16 : result := '长刀所向，无往不利。斩马刀攻击5-15，穿戴需要等级20。';
        17 : result := '修罗，这把武器和它名字一样危险。攻击力0-20，需要等级22。';
        18 : result := '修罗，这把武器和它名字一样危险。攻击力0-20，需要等级22。';
        19 : result := '降魔，名字本身就代表了道士的责任。穿戴需要等级20，攻击6-11道术1-2。';
        20 : result := '降魔，名字本身就代表了道士的责任。穿戴需要等级20，攻击6-11道术1-2。';
        21 : result := '偃月能够增加1-3的魔法，穿戴需要等级20，好好使用它。 ';
        22 : result := '偃月能够增加1-3的魔法，穿戴需要等级20，好好使用它。 ';
        23 : result := '22级能够穿上重盔甲，成为真正的战士。重盔甲防御4-7魔御2-3。';
        24 : result := '22级能够穿上重盔甲，成为真正的战士。重盔甲防御4-7魔御2-3。';
        25 : result := '22级能够穿上灵魂战衣，成为真正的道士。灵魂战衣防御3-6魔御3-3道术0-2。';
        26 : result := '22级能够穿上灵魂战衣，成为真正的道士。灵魂战衣防御3-6魔御3-3道术0-2。';
        27 : result := '22级能够穿上魔法长袍，成为真正的道士。魔法长袍防御3-5魔御3-4魔法0-2。';
        28 : result := '22级能够穿上魔法长袍，成为真正的道士。魔法长袍防御3-5魔御3-4魔法0-2。';
        29 : result := '22级能够穿上重盔甲，拿起修罗，成为真正的战士。';
        30 : result := '22级能够穿上重盔甲，拿起修罗，成为真正的战士。';
        31 : result := '凝霜攻击10-13，有着稳定的发挥，穿戴需要等级25。';
        32 : result := '凝霜攻击10-13，有着稳定的发挥，穿戴需要等级25。';
        33 : result := '炼狱攻击0-25，穿戴需要等级26。这把巨大的战斧，是战士进阶的标志。';
        34 : result := '炼狱攻击0-25，穿戴需要等级26。这把巨大的战斧，是战士进阶的标志。';
        35 : result := '银蛇攻击7-14道术1-3准确+1，穿戴需要等级26。这是道士进阶的标志。';
        36 : result := '银蛇攻击7-14道术1-3准确+1，穿戴需要等级26。这是道士进阶的标志。';
        37 : result := '魔杖能提供2-5的魔法，穿戴需要等级26。是法师进阶的标志。';
        38 : result := '魔杖能提供2-5的魔法，穿戴需要等级26。是法师进阶的标志。';
        39 : result := '这把武器刀型如月，奇利无比。顾名：井中月。';
        40 : result := '这把武器刀型如月，奇利无比。顾名：井中月。';
        41 : result := '看似平凡的造型，却蕴含了无限的灵气，这就是无极棍。';
        42 : result := '看似平凡的造型，却蕴含了无限的灵气，这就是无极棍。';
        43 : result := '血饮有着很高的准确，然而它如此受法师欢迎，似乎还有别的原因。';
        44 : result := '血饮有着很高的准确，然而它如此受法师欢迎，似乎还有别的原因。';
        45 : result := '战神盔甲防御5-9魔御3-5，穿戴需要攻击力46，而且，你的负重要足够。';
        46 : result := '战神盔甲防御5-9魔御3-5，穿戴需要攻击力46，而且，你的负重要足够。';
        47 : result := '幽灵战衣防御4-7魔御3-4道术1-4穿戴需要道术27，而且，你的负重要足够。';
        48 : result := '幽灵战衣防御4-7魔御3-4道术1-4穿戴需要道术27，而且，你的负重要足够。';
        49 : result := '恶魔长袍防御4-7 魔御3-4 魔法1-4穿戴需要魔法28，而且，你的负重要足够。';
        50 : result := '恶魔长袍防御4-7 魔御3-4 魔法1-4穿戴需要魔法28，而且，你的负重要足够。';
        51 : result := '裁决世间不平事，挥断尘世不了情。裁决之杖，攻击0-30，是战士身份的象征。';
        52 : result := '裁决世间不平事，挥断尘世不了情。裁决之杖，攻击0-30，是战士身份的象征。';
        53 : result := '掌握住自己的命运，才能主宰他人的命运，你可要拿好了。攻击12-16，还算不错的属性。';
        54 : result := '掌握住自己的命运，才能主宰他人的命运，你可要拿好了。攻击12-16，还算不错的属性。';
        55 : result := '很少有人知道龙纹剑的来历,但很多人都听说过它的威名。这是道士身份的象征。';
        56 : result := '很少有人知道龙纹剑的来历,但很多人都听说过它的威名。这是道士身份的象征。';
        57 : result := '骨玉权杖既有骨的质感，又有玉的灵气，这是法师身份的象征。';
        58 : result := '骨玉权杖既有骨的质感，又有玉的灵气，这是法师身份的象征。';
        59 : result := '武林至尊，宝刀屠龙，号令天下，莫敢不从。这把武器是所有战士梦寐以求之物。';
        60 : result := '武林至尊，宝刀屠龙，号令天下，莫敢不从。这把武器是所有战士梦寐以求之物。';
        61 : result := '逍遥扇是天尊留下的遗物，玛法大陆能有几人有资格拿起它。这把武器是所有道士梦寐以求之物。';
        62 : result := '逍遥扇是天尊留下的遗物，玛法大陆能有几人有资格拿起它。这把武器是所有道士梦寐以求之物。';
        63 : result := '嗜魂法杖能够吸取万物之魂，唯有至高的魔力才能够驾驭它。这把武器是所有法师梦寐以求之物。';
        64 : result := '嗜魂法杖能够吸取万物之魂，唯有至高的魔力才能够驾驭它。这把武器是所有法师梦寐以求之物。';
        65 : result := '天魔神甲是男战士专属的40级战衣，威风八面，谁不想穿上它呢？';
        66 : result := '圣战宝甲是女战士专属的40级战衣，威风八面，谁不想穿上它呢？';
        67 : result := '天尊道袍是男道士专属的40级战衣，风度翩翩，谁不想穿上它呢？';
        68 : result := '天师长袍是女道士专属的40级战衣，风度翩翩，谁不想穿上它呢？';
        69 : result := '法神披风是男法师专属的40级战衣，优雅华丽，谁不想穿上它呢？';
        70 : result := '法神披风是女法师专属的40级战衣，优雅华丽，谁不想穿上它呢？';
        71 : result := '怒斩攻击12-26准确+3，有了这把武器，无论什么样的敌人都无处躲藏。';
        72 : result := '怒斩攻击12-26准确+3，有了这把武器，无论什么样的敌人都无处躲藏。';
        73 : result := '据说这把武器是上古巨龙的牙齿，还残留着龙的力量。';
        74 : result := '据说这把武器是上古巨龙的牙齿，还残留着龙的力量。';
        75 : result := '穿上雷霆战甲，会感受到一股雷霆之力鼓动着你勇往直前，这也是顶尖战士的责任。';
        76 : result := '穿上雷霆战甲，会感受到一股雷霆之力鼓动着你勇往直前，这也是顶尖战士的责任。';
        77 : result := '穿上光芒道袍，你走到哪都能照亮黑暗的阴霾，这也是顶级道士的荣耀。';
        78 : result := '穿上光芒道袍，你走到哪都能照亮黑暗的阴霾，这也是顶级道士的荣耀。';
        79 : result := '穿上烈焰魔衣，无穷无尽的烈焰就会灼烧你一生，这也是顶级法师的宿命。';
        80 : result := '穿上烈焰魔衣，无穷无尽的烈焰就会灼烧你一生，这也是顶级法师的宿命。';
        81 : result := '开天是玛法三大神兵之一，能够拿起它的必定是最伟大的战士，胸怀天地，志存玛法。';
        82 : result := '开天是玛法三大神兵之一，能够拿起它的必定是最伟大的战士，胸怀天地，志存玛法。';
        83 : result := '玄天是玛法三大神兵之一，能够拿起它的必定是最伟大的道士，胸怀天地，志存玛法。';
        84 : result := '玄天是玛法三大神兵之一，能够拿起它的必定是最伟大的道士，胸怀天地，志存玛法。';
        85 : result := '镇天是玛法三大神兵之一，能够拿起它的必定是最伟大的法师，胸怀天地，志存玛法。';
        86 : result := '镇天是玛法三大神兵之一，能够拿起它的必定是最伟大的法师，胸怀天地，志存玛法。';
        87 : result := '凤天魔甲融合了凤凰之力，最厉害的勇士也需经历浴火涅槃重生才有资格穿起它。';
        88 : result := '凰天魔衣融合了凤凰之力，最厉害的勇士也需经历浴火涅槃重生才有资格穿起它。';
        89 : result := '凤天魔甲融合了凤凰之力，最厉害的勇士也需经历浴火涅槃重生才有资格穿起它。';
        90 : result := '凰天魔衣融合了凤凰之力，最厉害的勇士也需经历浴火涅槃重生才有资格穿起它。';
        91 : result := '凤天魔甲融合了凤凰之力，最厉害的勇士也需经历浴火涅槃重生才有资格穿起它。';
        92 : result := '凰天魔衣融合了凤凰之力，最厉害的勇士也需经历浴火涅槃重生才有资格穿起它。';

    end;
end;

procedure _helpEquipJob(JobSid : string); 
var JobId , i , j , k : integer;
str , str_1 , str_2 , wpName , YFname : string;
begin
    JobId := StrToIntDef(JobSid , -1);
    str := '';
    str_1 := '';
    str_2 := '';
    j := 0;
    k := 0;
    for i := 1 to 12 do
    begin
        wpName := getWPnameById(JobId , i);
        YFname := getYFnameById(JobId , i);
        
        if wpName <> '' then
        begin
            j := j + 1;
            str_1 := '{cmd}|<' + wpName + '/@@helper.call("equip",' + inttostr(getEquipIdByName(wpName,JobId)) + ')@EquipStrDlg~' + inttostr(getEquipIdByName(wpName,JobId) * 100 + JobId) + '>'  + addSpace(' ', 16 - length(wpName));
        end else
        str_1 := '';
        
        if YFname <> '' then
        begin
            k := k + 1;
            
            if k > j then
            str_2 := '|</@helpEquip> ^' + '<' + YFname + '/@@helper.call("equip",' + inttostr(getEquipIdByName(YFname,JobId)) + ')@EquipStrDlg~' + inttostr(getEquipIdByName(YFname,JobId) * 100 + JobId) + '>' + '\'
            else
            str_2 := '^' + '<' + YFname + '/@@helper.call("equip",' + inttostr(getEquipIdByName(YFname,JobId)) + ')@EquipStrDlg~' + inttostr(getEquipIdByName(YFname,JobId) * 100 + JobId) + '>' + '\'; 
        end else
        str_2 := '';
        
        str := str + str_1 + str_2;

    end;
    This_Player.HelperDialog(
    '请选择你需要查看的装备：\'
    + str
    +'|<返回/@helpEquip>')
end;

procedure _EquipStrDlg(EquipJobId : string);
var EJid , Eid , Jid : integer; 
begin
    EJid := StrToIntDef(EquipJobId , -1);
    Eid := EJid div 100;
    Jid := EJid mod 100;
    
    This_Player.HelperDialog(
    getEquipStr(Eid) + '\\' 
    +'|<返回/@helpEquipJob~' + inttostr(Jid) + '>');
end;
procedure _help_9;
begin
    This_Player.HelperDialog(
    '你想了解什么装？\\'
    +'{cmd}|<祖玛装备/@help_9_1>    ^<赤月装备/@>    ^<雷霆装备/@>\'
    +'{cmd}|<强雷装备/@>    ^<战神装备/@>    ^<星王装备/@>\'
    +'{cmd}|<衣服武器/@>\'
    +'{cmd}|<返回/@main>\' 
    );
end;  

procedure _help_9_1;
begin
    This_Player.HelperDialog(
    '祖玛装备：\'
    +'产出：xxxxxxx\\'
    +'{cmd}|<查看战士祖玛装备/@help_9_1_1>\'
    +'{cmd}|<查看法师祖玛装备/@help_9_1_2>\'
    +'{cmd}|<查看道士祖玛装备/@help_9_1_3>\'
    +'{cmd}|<返回/@help_9>\' 
    );
end; 

procedure _help_9_1_1;
begin
    This_Player.HelperDialog(
    '战士祖玛装备：\\'
    +'力量戒指，骑士手镯，绿色项链\'
    +'青铜腰带，紫绸靴，黑铁头盔\'
    +'点击右边装备栏可查看属性\' 
    +'{cmd}|<返回/@help_9>\' 
    );
end; 

procedure _help_5;
begin
    This_Player.HelperDialog(
    '游戏内主要社交方式有：\' 
    +'{cmd}|<好友系统/@help_5_1>      ^<战队行会系统/@help_5_2>\'
    +'{cmd}|<结婚系统/@help_5_3>      ^<组队系统/@help_5_4>\' 
    +'{cmd}|<结义系统/@help_5_5>\' 
    +'{cmd}|<返回/@main>\' 
    );
end; 

procedure _help_5_1;
begin
    This_Player.HelperDialog(
    '好友系统：|点开血球下方的隐藏菜单，或是在布局中拖拽出好友菜单。您可以添加好友、查看附近的人、关注玩家、设置黑名单。\'
    +'{cmd}|<添加好友/@help_5_1_1>      ^<附近的人/@help_5_1_2>\'
    +'{cmd}|<关注列表/@help_5_1_3>      ^<黑名单/@help_5_1_4>\'  
    +'{cmd}|<返回/@help_5>\' 
    );
end; 

procedure _help_5_1_1;
begin
    This_Player.HelperDialog(
    '添加好友：|您可以在游戏中添加好友，共享更方便的组队和私聊，更能关注好友最新的等级装备情况。\'
    +'{cmd}|<返回/@help_5_1>\' 
    );
end; 

procedure _help_5_1_2;
begin
    This_Player.HelperDialog(
    '附近的人：|您可以查看附近的玩家，将他们加为好友或关注，邀请他们一同组队。\'
    +'{cmd}|<返回/@help_5_1>\' 
    );
end; 

procedure _help_5_1_3;
begin
    This_Player.HelperDialog(
    '关注列表：|您可以对玩家添加关注，自定义颜色，该玩家在人群中将会显示出不同的颜色，让你一眼就能看到对方。\'
    +'{cmd}|<返回/@help_5_1>\' 
    );
end; 

procedure _help_5_1_4;
begin
    This_Player.HelperDialog(
    '黑名单：|被设置为黑名单的玩家在所有频道的发言您都不会见到。一键屏蔽骚扰。\'
    +'{cmd}|<返回/@help_5_1>\' 
    );
end; 

procedure _help_5_2;
begin
    This_Player.HelperDialog(
    '战队行会系统：|在血球下方的隐藏菜单中，点击行会按钮即可打开行会战队系统。在布局中也可以进行调用。\'
    +'{cmd}|<战队系统/@help_5_2_1>    ^<行会系统/@help_5_2_2>' 
    +'{cmd}|<返回/@help_5>\' 
    );
end; 

procedure _help_5_2_1;
begin
    This_Player.HelperDialog(
    '战队系统：|为方便行会管理，玩家可以成立战队，战队队长才能够带领玩家加入行会。具体情况可以咨询比奇国王，他就在比奇宫殿里。\'
    +'{cmd}|<返回/@help_5_2>\' 
    );
end;

procedure _help_5_2_2;
begin
    This_Player.HelperDialog(
    '行会系统：|行会是一个大家庭，加入行会能够体验游戏的更多玩法，攻沙更是传奇的一大盛典。具体情况可以咨询比奇国王，他就在比奇宫殿里。\'
    +'{cmd}|<返回/@help_5_2>\' 
    );
end;

procedure _help_5_3;
begin
    This_Player.HelperDialog(
    '结婚系统：|如果你在玛法大陆已经有了一定声望（5点以上），又遇到了心爱的女子，带着一枚求婚戒指到封魔谷城堡的姻缘神殿去找月老吧。\' 
    +'{cmd}|<如何前往/@help_5_3_1>    ^<了解婚宴/@help_5_3_2>' 
    +'{cmd}|<返回/@help_5>\' 
    );
end; 

procedure _help_5_3_1;
begin
    This_Player.HelperDialog(
    '如何前往：|封魔谷城堡有一个小台阶通往姻缘神殿。但要达到神殿，需要穿过一条同心小径。夫妻同心，其利断金。\' 
    +'{cmd}|<返回/@help_5_3>\' 
    );
end; 

procedure _help_5_3_2;
begin
    This_Player.HelperDialog(
    '了解婚宴：|结婚怎么可以不办宴席，现在您可以在月老那里举办婚宴，中式古典、欧式教堂、高级定制传奇婚宴，每一种都会令你难忘。\' 
    +'{cmd}|<返回/@help_5_3>\' 
    );
end; 

procedure _help_5_4;
begin
    This_Player.HelperDialog(
    '组队系统：|游戏中有许多难度较高的地图，组队进入更加安全，还可以和队友分享经验和掉落物品。在血球下方的隐藏菜单栏中点击组队即可进入组队系统，在布局中还可以调用快速组队按键。\' 
    +'{cmd}|<返回/@help_5>\' 
    );
end;                                                                                 

procedure _help_5_5;
begin
    This_Player.HelperDialog(
    '结义系统：|一个好汉三个帮。带上好兄弟到边界城的结义见证人那里结拜吧。结义成功后将增加声望，还可以享受兄弟传送。\' 
    +'{cmd}|<返回/@help_5>\' 
    );
end; 

procedure _help_7; 
begin
   This_Player.HelperDialog(
    '游戏充值：|点开血球下方隐藏的商城菜单，可以进行元宝充值，交付结果可能存在延迟，请耐心等待。如有问题，可以联系彩虹客服。\'
    +'{cmd}|<货币种类/@help_7_1>\'  
    +'{cmd}|<返回/@main>\' 
    );
end;

procedure _help_7_1;
begin
    This_Player.HelperDialog(
    '货币种类：|传奇中有金币、元宝、灵符三种货币。金币可以在日常游戏中获得，元宝可由充值和玩家之间交易获得，灵符和元宝价值相同，可通过一些特殊活动获得。\' 
    +'{cmd}|<返回/@help_7>\' 
    );
end; 

procedure _help_10;
begin
    This_Player.HelperDialog(
    '暂未开通\' 
    +'{cmd}|<返回/@main>\' 
    );
end;

procedure _help_6;
begin
    This_Player.HelperDialog(
    '游戏内主要的系统有：\' 
    +'{cmd}|<精力活力值系统/@help_6_1>       ^<信用分系统/@help_6_2>\' 
    +'{cmd}|<辅助系统/@help_6_3>       ^<语音系统/@help_6_4>\'
    +'{cmd}|<返回/@main>\'
    );
end;

procedure _help_6_1;
begin
    This_Player.HelperDialog(
    '活力值系统：|精力值、活力值将在打怪时转化为大量额外经验。您点击屏幕上方属性条左侧的箭头按钮查看自己的精力值、活力值、存储经验值。\' 
    +'{cmd}|<精力值/@help_6_1_1>       ^<活力值/@help_6_1_2>\' 
    +'{cmd}|<存储经验值/@help_6_1_3>\' 
    +'{cmd}|<返回/@help_6>\'
    );
end;

procedure _help_6_1_1;
begin
    This_Player.HelperDialog(
    '精力值：|精力值是由精力水晶鉴定而来，在边界城的天下第一雕像处使用虔诚项链膜拜，也可以获得精力值。如果您在打怪或交易中获得了精力水晶，可以去找边界城的水晶鉴定师处进行鉴定。\' 
    +'{cmd}|<返回/@help_6_1>\'
    );
end;

procedure _help_6_1_2;
begin
    This_Player.HelperDialog(
    '活力值：|玩家每日共计可获得48点系统赠送的活力值，当日未登录活力值也将累计。打怪有可能掉落活力水晶，双击使用也可增加活力值。具体情况你可以问边界城的水晶鉴定师。\' 
    +'{cmd}|<返回/@help_6_1>\'
    );
end;

procedure _help_6_1_3;
begin
    This_Player.HelperDialog(
    '存储经验值：|在精力值和活力值都使用完毕后，当日打怪获得的额外经验值将被存储起来，可在边界城的水晶鉴定师处使用活力值或精力值进行提取。\' 
    +'{cmd}|<返回/@help_6_1>\'
    );
end;

procedure _help_6_2;
begin
   This_Player.HelperDialog(
    '信用分系统：|玩家可在各传送NPC和仓库管理员处查看信用分并进行验证，验证玩家能享受更多福利，游戏更方便。\'
    +'地下夺宝、学习高级技能、购买商城道具、击杀Boss、参与活动等行为都会获得信用分。\' 
//    +'{cmd}|<如何使用/@help_6_2_1>       ^<如何获取/@help_6_2_2>\' 
    +'{cmd}|<返回/@help_6>\'
    );
end;

procedure _help_6_2_1;
begin
    This_Player.HelperDialog(
    '信用分到达30分后可在各地图传送NPC和仓库管理员处进行认证，认证用户能够体验全部游戏内容。\' 
    +'{cmd}|<返回/@help_6_2>\'
    );
end;

procedure _help_6_2_2;
begin
    This_Player.HelperDialog(
    '玩家在游戏中参与地下夺宝、击杀Boss、购买和使用道具、学习高级技能等许多方法都可以增加信用分。\' 
    +'{cmd}|<返回/@help_6_2>\'
    );
end;

procedure _help_6_3;
begin
   This_Player.HelperDialog(
    '辅助系统：|辅助内挂让打怪更加轻松，点开血球下的隐藏菜单，在设置-辅助内可以进行自定义挂机设置，在布局中调用挂机按钮，轻松实现一键挂机。\' 
    +'{cmd}|<注意事项/@help_6_3_2>\' //|<如何设置/@help_6_3_1>       ^
    +'{cmd}|<返回/@help_6>\'
    );
end;

procedure _help_6_3_1;
begin
    This_Player.HelperDialog(
    '玩家在游戏设置中的"辅助"功能里可以进行挂机设置，在布局中调用"挂机"按钮可以开启自动挂机。\' 
    +'{cmd}|<返回/@help_6_3>\'
    );
end;

procedure _help_6_3_2;
begin
    This_Player.HelperDialog(
    '注意事项：|辅助挂机只能用于打怪练级，在挑战地图内挂机将面临封号和清空信用分的严惩。\'
    +'|挑战地图有：霸者大厅、石墓七层、生死之间、祖玛神殿七层大厅、牛魔寺庙大厅、魔龙西郊、沃玛三层。\'
    +'{cmd}|<返回/@help_6_3>\'
    );
end;

procedure _help_6_4;
begin
   This_Player.HelperDialog(
    '语音系统：|唱歌、聊天、行会战，语音交流更方便。点击在血球下方的隐藏语音菜单，或在布局中直接拖拽出语音按钮即可进行语音。\'
    +'{cmd}|<实时语音/@help_6_4_1>       ^<语音喊话/@help_6_4_2>\' //
    +'{cmd}|<返回/@help_6>\'
    );
end;

procedure _help_6_4_1;
begin
    This_Player.HelperDialog(
    '实时语音：|您可以在语音系统创建或加入一个频道，在布局中打开实时语音，就可以实时进行和频道内的玩家进行对话了。\'
    +'{cmd}|<返回/@help_6_4>\'
    );
end;

procedure _help_6_4_2;
begin
    This_Player.HelperDialog(
    '语音喊话：|您可以在布局中调用语音按钮，就可以在世界、附近、私聊等诸多频道进行语音留言喊话了。\'
    +'{cmd}|<返回/@help_6_4>\'
    );
end;

procedure _help_3;
begin
    This_Player.HelperDialog(
    '游戏地图：|您可以在右上角查看地图，再也不怕迷路了。\'
    +'{cmd}|<查看地图/@help_3_1>        ^<地图属性/@help_3_2>\'
    +'{cmd}|<地图介绍/@help_3_3>        ^<挑战地图/@help_3_4>\'
    +'{cmd}|<返回/@main>\'
    );
end;

procedure _help_3_1;
begin
    This_Player.HelperDialog(
    '查看地图：|点击右上角的小地图，打开地图界面。您可以查看世界地图和区域地图。在区域地图内能快捷寻路至NPC处，佩戴传送戒指更能一键传送到你想去的地方。\'
    +'{cmd}|<返回/@help_3>\'
    );
end;

procedure _help_3_2;
begin
    This_Player.HelperDialog(
    '地图属性：|地图分为战斗地图和安全地图，安全区内不可以PK。还有一些特殊属性的地图，PK死亡不掉落装备，或只爆出特定物品，这些都会在公告里说明的。\'
    +'{cmd}|<返回/@help_3>\'
    );
end;

procedure _help_3_3;
begin
    This_Player.HelperDialog(
    '地图介绍：|\'
    +'比奇、盟重、苍月岛、封魔谷是几个大城镇，药店武器店首饰店一应\'
    +'俱全。毒蛇山谷、沃玛森林、魔龙城里充满了未知的危险。\'
    +'边界城是最大的玩家自由交易城，城内的NPC一个个都身怀特技。\'
    +'白日门是玛法大陆里的一块净土，里面有潜心修行的弟子，\'
    +'有空可以去参观。\ \'
    +'{cmd}|<返回/@help_3>\'
    );
end;

procedure _help_3_4;
begin
    This_Player.HelperDialog(
    '挑战地图：|\'
    + '霸者大厅、石墓七层、生死之间、祖玛神殿七层大厅、牛魔寺庙大厅\'
    +'、魔龙西郊、沃玛三层。在这些地方，你可能会遇见最强大的怪物，\'
    +'当然，如果你能击杀它们，奖励自然也是很丰厚的。\'
    +'挑战地图内挂机会受到严惩哦。\ \'
    +'{cmd}|<返回/@help_3>\'
    );
end;
 
begin
    //This_Player.HelperDialog(
    This_Player.HelperDialog(
    '有什么不了解的，让我给你介绍一下吧？\\'
    +'{cmd}|<练级地图/@help_1>       ^<装备提升/@help_2>       ^<装备介绍/@helpEquip>\\'  //   (看看其他玩家问了点啥)   
    +'{cmd}|<如何交易/@help_4>       ^<社交系统/@help_5>       ^<系统介绍/@help_6>\\' 
    +'{cmd}|<游戏充值/@help_7>       ^<技能介绍/@help_8>       ^<游戏地图/@help_3>\\'
    +'{cmd}|<彩虹帮助？/@help_10>'
    );
  //_goMonMap('1'); 
  //  _help_1;
end.