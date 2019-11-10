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
           
   
          
                    end;
                end;
              
                    
                
                
            end;
        end;
       
                
    end;
end;


procedure _deBug_Skill_1();
begin
   if This_Player.Level >= 35 then 
   begin
    This_Npc.NpcDialog(This_Player,
    '|<提升战士技能/@deBug_Skill_1_1~0>    \\||');  
    


  
   end else

     begin
         
         This_Npc.NpcDialog(This_Player,
        '你的等级不到35，无法使用此功能!  ');

     end; 
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




Begin

      This_Npc.NpcDialog(This_Player,
       '近期大量测试玩家反映\|'
       +'战士属性低下，打不动人，各种被风筝死等情况\|'
	   +'特设置战士补偿NPC\|'
	   +'可以加强战士技能威力\|'
	   +'以提升战士生存环境\|'
       +'|{cmd}<提升技能/@deBug_Skill_1>   '   );
end. 