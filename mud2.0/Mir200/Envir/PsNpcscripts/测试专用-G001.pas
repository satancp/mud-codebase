{********************************************************************

*******************************************************************}

program Mir2;
{$I common.pas}


procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

function getSkillNameByJob(HumOrHero , jobId , SkillId : integer) : string;
begin
    result := '';
    case HumOrHero of
        1 :
        begin
            case jobId of
                0 : 
                begin
                    case SkillId of
                    1 : result := '基本剑术';
                    2 : result := '攻杀剑术';
                    3 : result := '刺杀剑术';
                    4 : result := '半月弯刀';
                    5 : result := '烈火剑法';
                    6 : result := '野蛮冲撞';
                    7 : result := '十字狂风斩';
                    8 : result := '双龙斩';
                    9 : result := '狮子吼';
                    10 : result := '攻破斩';
                    11 : result := '雾遁';
                    12 : result := '逐日剑法';
                    end;
                end;
                1 : 
                begin
                    case SkillId of
                    1 : result := '大火球';
                    2 : result := '抗拒火环';
                    3 : result := '地狱火';
                    4 : result := '疾光电影';
                    5 : result := '雷电术';
                    6 : result := '诱惑之光';
                    7 : result := '瞬息移动';
                    8 : result := '火墙';
                    9 : result := '爆裂火焰';
                    10 : result := '地狱雷光';
                    11 : result := '魔法盾';
                    12 : result := '圣言术';
                    13 : result := '冰咆哮';
                    14 : result := '灭天火';
                    15 : result := '寒冰掌';
                    16 : result := '分身术1';
                    17 : result := '火龙气焰1';
                    18 : result := '流星火雨';
                    19 : result := '火球术';
                    
                    end;
                end;
                2 : 
                begin
                    case SkillId of
                    1 : result := '治愈术';
                    2 : result := '精神力战法';
                    3 : result := '施毒术';
                    4 : result := '灵魂火符';
                    5 : result := '幽灵盾';
                    6 : result := '神圣战甲术';
                    7 : result := '困魔咒';
                    8 : result := '召唤骷髅';
                    9 : result := '隐身术';
                    10 : result := '集体隐身术';
                    11 : result := '心灵启示';
                    12 : result := '群体治愈术';
                    13 : result := '召唤神兽';
                    14 : result := '无极真气';
                    15 : result := '气功波';
                    16 : result := '净魂术';
                    17 : result := '召唤天使';
                    18 : result := '乾坤咒';
                    19 : result := '噬血术';
                    20 : result := '骷髅咒';
                    21 : result := '驯兽术';
                    end;
                end;
                99 : 
                begin
                    case SkillId of
                    1 : result := '酒气护体';
                    2 : result := '先天元力';
                    3 : result := '疾风步法';
                    4 : result := '斗转星移';
                    end;
                end;
                
            end;
        end;
        2 :
        begin
            case jobId of
                0 : 
                begin
                    case SkillId of
                    1 : result := '白日门剑术';
                    2 : result := '白日门攻杀';
                    3 : result := '白日门刺杀';
                    4 : result := '白日门半月';
                    5 : result := '白日门烈火';
                    6 : result := '白日门野蛮';
                    7 : result := '开天斩';
                    8 : result := '双龙斩';
                    9 : result := '白日门狮子吼';
                    10 : result := '攻破斩';
                    11 : result := '雾遁';
                    12 : result := '白日门逐日';
                    
                    end;
        
                end;
                1 : 
                begin
                    case SkillId of
                    1 : result := '白日门大火球';
                    2 : result := '白日门抗拒';
                    3 : result := '白日门地狱火';
                    4 : result := '白日门疾光';
                    5 : result := '白日门雷电术';
                    6 : result := '白日门诱惑术';
                    7 : result := '白日门瞬移';
                    8 : result := '白日门火墙';
                    9 : result := '白日门爆裂';
                    10 : result := '白日门雷光';
                    11 : result := '白日门魔法盾';
                    12 : result := '白日门圣言术';
                    13 : result := '白日门冰咆哮';
                    14 : result := '白日门灭天火';
                    15 : result := '白日门寒冰掌';
                    16 : result := '分身术';
                    17 : result := '火龙气焰1';
                    18 : result := '白日门火雨';
                    19 : result := '白日门火球术';
                    
                    end;
                
                end;
                2 : 
                begin
                    case SkillId of
                    1 : result := '白日门治愈术';
                    2 : result := '白日门战法';
                    3 : result := '白日门施毒术';
                    4 : result := '白日门火符';
                    5 : result := '白日门幽灵盾';
                    6 : result := '白日门战甲术';
                    7 : result := '白日门困魔咒';
                    8 : result := '白日门骷髅术';
                    9 : result := '白日门隐身';
                    10 : result := '白日门群隐';
                    11 : result := '白日门启示';
                    12 : result := '白日门群疗';
                    13 : result := '白日门神兽术';
                    14 : result := '白日门真气';
                    15 : result := '白日门气功波';
                    16 : result := '净魂术';
                    17 : result := '召唤月灵';
                    18 : result := '乾坤咒';
                    19 : result := '白日门噬血术';
                    20 : result := '骷髅咒';
                    21 : result := '白日门圣兽术';

                    end;
                end;
                3 : 
                begin
                    case SkillId of
                    1 : result := '破魂斩';
                    2 : result := '劈星斩';
                    3 : result := '雷霆一击';
                    4 : result := '噬魂沼泽';
                    5 : result := '末日审判';
                    6 : result := '火龙气焰';
                    end;
                end;
                99 : 
                begin
                    case SkillId of
                    1 : result := '酒气护体1';
                    2 : result := '先天元力';
                    3 : result := '疾风步法';
                    4 : result := '斗转星移';
                    end;
                
                end;
                
            end;
        end;
    end;
end;

procedure _deBug_Skill_1();
begin
    This_Npc.NpcDialog(This_Player,
    '|<提升战士技能/@deBug_Skill_1_1~0>      ^<提升法师技能/@deBug_Skill_1_1~1>\\||'
    +'<提升道士技能/@deBug_Skill_1_1~2>      ^<提升技能/@deBug_Skill_1_1~99>\\||'
    +'<返回/@deBug_Skill>'
    );
end;

procedure _deBug_Skill_1_1(str_job : string);
var temp_job , n : integer;
str_xx , str_skill : string;
begin
    str_xx := '';
    
    temp_job := StrToIntDef(str_job,-1);
    
    This_Player.SetV(1,48,temp_job);
    
    for n := 0 to 21 do
    begin
        str_skill := getSkillNameByJob(1,temp_job,n);
        if str_skill <> '' then
        begin
            str_xx := str_xx +'<---/@skillDown~' + str_skill + '>' + str_skill +  inttostr(This_Player.GetSkillLevelExt(str_skill,false)) + '级' + '<+++/@skillUP~' + str_skill + '>'  + addSpace('', 11- length(str_skill));
            
            if (n mod 2) = 1 then
            str_xx := str_xx + '^'; 
            
            if (n mod 2) = 0 then
            str_xx := str_xx + '\|'; 
            
            
        end;
    end;
    
    This_NPC.NpcDialog(This_Player,'|' + str_xx);
end;

procedure _skillUP(str_Skill : string); 
begin
    if This_Player.GetSkillLevelExt(str_Skill,false) < 0 then
    This_Player.Give(str_Skill,1)
    else
    This_Player.ChgSkillLv(str_Skill,This_Player.GetSkillLevelExt(str_skill,false) + 1 ,0);
    
                                                                                                   
    _deBug_Skill_1_1(inttostr(This_Player.GetV(1,48)));  
end;

procedure _skillDown(str_Skill : string); 
begin
    if This_Player.GetSkillLevelExt(str_Skill,false) = 0 then
    This_Player.DeleteSkill(str_Skill)
    else
    This_Player.ChgSkillLv(str_Skill,This_Player.GetSkillLevelExt(str_skill,false) - 1 ,0);
    
                                                                                                   
    _deBug_Skill_1_1(inttostr(This_Player.GetV(1,48)));  
end;

procedure _deBug_Skill_2_1(str_job : string);
var temp_job , n : integer;
str_xx , str_skill : string;
begin
    str_xx := '';
    
    temp_job := StrToIntDef(str_job,-1);
    
    This_Player.SetV(1,48,temp_job);
    
    if This_Player.HeroLevel < 1 then
    begin
        This_NPC.NpcDialog(This_Player,
        '请召唤出你的英雄。');
        exit;
    end;   
    
    for n := 0 to 21 do
    begin
        str_skill := getSkillNameByJob(2,temp_job,n);                                                 
        if str_skill <> '' then
        begin
            str_xx := str_xx +'<---/@HeroskillDown~' + str_skill + '>' + str_skill +  inttostr(This_Player.GetSkillLevelExt(str_skill,true)) + '级' + '<+++/@HeroskillUP~' + str_skill + '>'  + addSpace('', 11- length(str_skill));
            
            if (n mod 2) = 1 then
            str_xx := str_xx + '^'; 
            
            if (n mod 2) = 0 then
            str_xx := str_xx + '\|'; 
            
            
        end;
    end;
    
    This_NPC.NpcDialog(This_Player,'|' + str_xx);
end;

procedure _HeroskillUP(str_Skill : string); 
begin
    if This_Player.GetSkillLevelExt(str_Skill,true) < 0 then
    This_Player.Give(str_Skill,1)
    else
    This_Player.ChgSkillLv(str_Skill,This_Player.GetSkillLevelExt(str_skill,true) + 1 ,0);

                                                                                                   
    _deBug_Skill_1_1(inttostr(This_Player.GetV(1,48)));  
end;

procedure _HeroskillDown(str_Skill : string); 
begin
    if This_Player.GetSkillLevelExt(str_Skill,false) = 0 then
    This_Player.DeleteSkill(str_Skill)
    else
    This_Player.ChgSkillLv(str_Skill,This_Player.GetSkillLevelExt(str_skill,false) - 1 ,0);
    
                                                                                                   
    _deBug_Skill_1_1(inttostr(This_Player.GetV(1,48)));  
end;


procedure _deBug_Skill();
begin
    This_Npc.NpcDialog(This_Player,
    '|<提升主号技能/@deBug_Skill_1>      ^<提升主号技能/@deBug_Skill_2>\\||'
    +'<返回/@main>'
    );
end;

Begin

      This_Npc.NpcDialog(This_Player,
      '|<提升技能/@deBug_Skill>      ^<提升装备属性>'
      );
end. 