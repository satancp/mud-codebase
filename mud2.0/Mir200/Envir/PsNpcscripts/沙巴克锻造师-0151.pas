{********************************************************************

*******************************************************************}

PROGRAM Mir2;
{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

function getMaxEquipUpLv() : integer;
begin
result := This_NPC.MaxStrengthenEquipLv;
end;

function getMaxEquipUpStr(EQid : integer) : string;
begin
    case EQid of
        1 : result := '祖玛';
        2 : result := '赤月';
        3 : result := '雷霆';
        4 : result := '强雷';
        5 : result := '战神';
        6 : result := '星王';
        else
        result := ''; 
    end; 
end;

function getEquipUpYB(EQid : integer) : integer;
begin
    case EQid of
        1 : result := 10;
        2 : result := 40;
        3 : result := 160;
        4 : result := 640;
        5 : result := 2560;
        else
        result := 0; 
    end; 
end;

function getEquipUpName(EQid : integer) : string;
begin
    case EQid of
        1 : result := '祖玛助熔剂';
        2 : result := '赤月助熔剂';
        3 : result := '雷霆助熔剂';
        4 : result := '强雷助熔剂';
        5 : result := '战神助熔剂';
        else
        result := ''; 
    end; 
end;

function getEquipUpgradeName(EquipLV,EquipId : integer) : string; 
begin
    case EquipLV of
        1 ://祖玛装备 
        begin
            case EquipId of
                1 : result := '力量戒指';
                2 : result := '紫碧螺';
                3 : result := '泰坦戒指';
                4 : result := '骑士手镯';
                5 : result := '龙之手镯';
                6 : result := '三眼手镯';
                7 : result := '绿色项链';
                8 : result := '恶魔铃铛';
                9 : result := '灵魂项链';
                10 : result := '青铜腰带';
                11 : result := '青铜腰带';
                12 : result := '青铜腰带';
                13 : result := '紫绸靴';
                14 : result := '紫绸靴';
                15 : result := '紫绸靴';
                16 : result := '黑铁头盔';
                17 : result := '黑铁头盔';
                18 : result := '黑铁头盔';

            end;
        end;
        2 ://赤月装备
        begin
            case EquipId of
                1 : result := '力量戒指';
                2 : result := '紫碧螺';
                3 : result := '泰坦戒指';
                4 : result := '骑士手镯';
                5 : result := '龙之手镯';
                6 : result := '三眼手镯';
                7 : result := '绿色项链';
                8 : result := '恶魔铃铛';
                9 : result := '灵魂项链';
                10 : result := '青铜腰带';
                11 : result := '青铜腰带';
                12 : result := '青铜腰带';
                13 : result := '紫绸靴';
                14 : result := '紫绸靴';
                15 : result := '紫绸靴';
                16 : result := '黑铁头盔';
                17 : result := '黑铁头盔';
                18 : result := '黑铁头盔';
                
            end;
        end;
        3 : //雷霆装备
        begin
            case EquipId of
                1 : result := '雷霆战戒';
                2 : result := '烈焰魔戒';
                3 : result := '光芒道戒';
                4 : result := '雷霆护腕';
                5 : result := '烈焰护腕';
                6 : result := '光芒护腕';
                7 : result := '雷霆项链';
                8 : result := '烈焰项链';
                9 : result := '光芒项链';
                10 : result := '雷霆腰带';
                11 : result := '烈焰腰带';
                12 : result := '光芒腰带';
                13 : result := '雷霆战靴';
                14 : result := '烈焰魔靴';
                15 : result := '光芒道靴';
                16 : result := '雷霆头盔';
                17 : result := '烈焰头盔';
                18 : result := '光芒头盔';
     
            end;
        end;
        4 ://强雷装备
        begin
            case EquipId of
                1 : result := '强化雷霆战戒';
                2 : result := '强化烈焰魔戒';
                3 : result := '强化光芒道戒';
                4 : result := '强化雷霆护腕';
                5 : result := '强化烈焰护腕';
                6 : result := '强化光芒护腕';
                7 : result := '强化雷霆项链';
                8 : result := '强化烈焰项链';
                9 : result := '强化光芒项链';
                10 : result := '强化雷霆腰带';
                11 : result := '强化烈焰腰带';
                12 : result := '强化光芒腰带';
                13 : result := '强化雷霆战靴';
                14 : result := '强化烈焰魔靴';
                15 : result := '强化光芒道靴';
                16 : result := '强化雷霆头盔';
                17 : result := '强化烈焰头盔';
                18 : result := '强化光芒头盔';
 
            end;
        end;
        5 ://战神装备
        begin
            case EquipId of
                1 : result := '战神戒指';
                2 : result := '圣魔戒指';
                3 : result := '真魂戒指';
                4 : result := '战神手镯';
                5 : result := '圣魔手镯';
                6 : result := '真魂手镯';
                7 : result := '战神项链';
                8 : result := '圣魔项链';
                9 : result := '真魂项链';
                10 : result := '战神腰带';
                11 : result := '圣魔腰带';
                12 : result := '真魂腰带';
                13 : result := '战神靴';
                14 : result := '圣魔靴';
                15 : result := '真魂靴';
                16 : result := '战神头盔';
                17 : result := '圣魔头盔';
                18 : result := '真魂头盔';
      
            end;
        end;
        6 ://星王装备
        begin
            case EquipId of
                1 : result := '星王战戒';
                2 : result := '星王魔戒';
                3 : result := '星王道戒';
                4 : result := '星王护腕(战)';
                5 : result := '星王护腕(法)';
                6 : result := '星王护腕(道)';
                7 : result := '星王项链(战)';
                8 : result := '星王项链(法)';
                9 : result := '星王项链(道)';
                10 : result := '星王腰带(战';
                11 : result := '星王腰带(法)';
                12 : result := '星王腰带(道)';
                13 : result := '星王战靴';
                14 : result := '星王魔靴';
                15 : result := '星王道靴';
                16 : result := '星王战盔';
                17 : result := '星王法冠';
                18 : result := '星王道盔';
  
            end;
        end;
    end;
end;


procedure _EquipUpgrade; 
begin
    This_NPC.NpcDialog(This_Player,
    '请选择你想要了解的项目:\'
    +'|{cmd}<可合成的装备/@EquipUpgrade_1>              ^<催化剂/@EquipUpgrade_2>\'
    +'|{cmd}<替代材料/@EquipUpgrade_3>                  ^<合成的时间>\'
    +'|{cmd}<返回/@main>'
    );
end;

procedure _EquipUpgrade_2;
begin
    This_Npc.NpcDialog(This_Player,
 '催化剂为合成装备时不可或缺的材料，合成时必须加入对应级别的催\'
  +'化剂才可合成。使用催化剂的种类取决于想要合成的装备。\ \'
  +'|合成赤月级别时需要添加祖玛助熔剂\'
  +'|合成雷霆级别时需要添加赤月助熔剂\'
  +'|合成强雷级别时需要添加雷霆助熔剂\'
  +'|合成战神级别时需要添加强雷助熔剂\'
  +'|合成星王级别时需要添加战神助熔剂\'
  +'|{cmd}<返回/@EquipUpgrade>'
  );

end;

procedure _EquipUpgrade_3;
begin
    This_Npc.NpcDialog(This_Player,
 '合成装备时，作为材料的装备均可用相应级别的熔锭来代替，\'
+'不过每次合成最多只可替代3件材料装备。例如：合成战神戒指，\'
+'需要5件力量戒指，你可以使用2件力量戒指和3个祖玛熔锭来合成哦\'
+'要是阁下想用熔锭的话，在合成时可直接花元宝使用哦。\'
+'|祖玛熔锭可替代祖玛级别装备来进行合成。需10元宝1个。\'
+'|赤月熔锭可替代赤月级别装备来进行合成。需40元宝1个。\'
+'|雷霆熔锭可替代雷霆级别装备来进行合成。需160元宝1个。\'
+'|强雷熔锭可替代强雷级别装备来进行合成。需640元宝1个。\'
+'|战神熔锭可替代战神级别装备来进行合成。需2560元宝1个。|{cmd}<返回/@EquipUpgrade>\ \'
);
end;

procedure _EquipUpgrade_1;
begin
    This_NPC.NpcDialog(This_Player,
    '请选择你想要了解的项目:\'
    +'最高可合成的装备\'
    +'|{cmd}<赤月级别/@EquipUpDlg~2>         ^<雷霆级别/@EquipUpDlg~3>         ^<强雷级别/@EquipUpDlg~4>\'
    +'|{cmd}<战神级别/@EquipUpDlg~5>         ^<星王级别/@EquipUpDlg~6>         ^\'
    +'|{cmd}<返回/@main>'
    );
end;

function getEquipUpStr() : string; 
begin

end;

procedure _EquipUpDlg(HCidStr : string);
var HCid , i , j : integer;
strDlg_1 , strDlg_2 ,strBFDlg_1 , strBFDlg_2 , strNextDlg_1 , strNextDlg_2 , strDlg  : string;
begin
    HCid := strtointDef(HCidStr,-1);
    strDlg := '';
    j := 0;
    for i := 1 to 9 do
    begin
        strDlg_1 := getEquipUpgradeName(HCid - 1 , i);
        strDlg_2 := getEquipUpgradeName(HCid, i);
        
        strBFDlg_1 := getEquipUpgradeName(HCid - 1 , i - 1);
        strBFDlg_2 := getEquipUpgradeName(HCid, i - 1);
        
        strNextDlg_1 := getEquipUpgradeName(HCid - 1, i + 1);
        strNextDlg_2 := getEquipUpgradeName(HCid, i + 1);
        
        if strDlg_1 = strBFDlg_1 then
        begin
            if strDlg_2 <> strBFDlg_2 then
            begin
             strDlg := strDlg + '、' + strDlg_2; 
            end;  
            
        end else
        begin
            if (strDlg_1 = strNextDlg_1) and (strDlg_2 <> strNextDlg_2) then
            begin
            strDlg := strDlg + '|\' + addSpace(strDlg_1,14) + strDlg_2;
            j := 0;
            end
            else
            begin
                strDlg := strDlg + addSpace(strDlg_1,14) + '^' + addSpace(strDlg_2,14) ;
                j := j + 1; 
                if (j mod 2) = 0 then
                strDlg := strDlg + '\';
                
                strDlg := strDlg + '|';
            end;
        end;
        
    end;
    This_NPC.NpcDialog(This_Player,
    '合成' + getMaxEquipUpStr(HCid) + '级别装备：\'
    +addSpace('材料（需5件）：',14) + addSpace('可合成装备：',14) +addSpace('材料（需5件）：',14) + addSpace('可合成装备：',14) + '\'
    +strDlg
    +'|{cmd}<下一页/@EquipUpDlg_1~' + HCidStr + '>         ^<返回/@EquipUpgrade_1>'
    );
end;

procedure _EquipUpDlg_1(HCidStr : string);
var HCid , i , j : integer;
strDlg_1 , strDlg_2 ,strBFDlg_1 , strBFDlg_2 , strNextDlg_1 , strNextDlg_2 , strDlg  : string;
begin
    HCid := strtointDef(HCidStr,-1);
    strDlg := '';
    j := 0;
    for i := 10 to 18 do
    begin
        strDlg_1 := getEquipUpgradeName(HCid - 1 , i);
        strDlg_2 := getEquipUpgradeName(HCid, i);
        
        strBFDlg_1 := getEquipUpgradeName(HCid - 1 , i - 1);
        strBFDlg_2 := getEquipUpgradeName(HCid, i - 1);
        
        strNextDlg_1 := getEquipUpgradeName(HCid - 1, i + 1);
        strNextDlg_2 := getEquipUpgradeName(HCid, i + 1);
        
        if strDlg_1 = strBFDlg_1 then
        begin
            if strDlg_2 <> strBFDlg_2 then
            begin
             strDlg := strDlg + '、' + strDlg_2; 
            end;  
            
        end else
        begin
            if (strDlg_1 = strNextDlg_1) and (strDlg_2 <> strNextDlg_2) then
            begin
            strDlg := strDlg + '|\' + addSpace(strDlg_1,14) + strDlg_2;
            j := 0;
            end
            else
            begin
                strDlg := strDlg + addSpace(strDlg_1,14) + '^' + addSpace(strDlg_2,14);
                j := j + 1; 
                if (j mod 2) = 0 then
                strDlg := strDlg + '\';
                
                strDlg := strDlg + '|';
            end;
        end;
        
    end;
    This_NPC.NpcDialog(This_Player,
    '合成' + getMaxEquipUpStr(HCid) + '级别装备：\'
    +addSpace('材料（需5件）：',14) + addSpace('可合成装备：',14) + addSpace('材料（需5件）：',14) + addSpace('可合成装备：',14) + '\'
    +strDlg
    +'|\<上一页/@EquipUpDlg~' + HCidStr + '>         ^<返回/@EquipUpgrade_1>'
    );
end;

procedure _BuyCatalyzer; 
var
Catalyzer_KD: array[1..5] of string;
i,temp_level:integer;
begin  
   for i:=1 to 5 do 
   begin
      Catalyzer_KD[i]:='';
   end;
   temp_level:=getMaxEquipUpLv; 
   if temp_level >= 1 then Catalyzer_KD[1]:='|{cmd}<使用10元宝购买1个祖玛助熔剂/@BuyCatalyzer_1~1>\';
   if temp_level >= 2 then Catalyzer_KD[2]:='|{cmd}<使用40元宝购买1个赤月助熔剂/@BuyCatalyzer_1~2>\';
   if temp_level >= 3 then Catalyzer_KD[3]:='|{cmd}<使用160元宝购买1个雷霆助熔剂/@BuyCatalyzer_1~3>\';
   if temp_level >= 4 then Catalyzer_KD[4]:='|{cmd}<使用640元宝购买1个强雷助熔剂/@BuyCatalyzer_1~4>\';
   if temp_level >= 5 then Catalyzer_KD[5]:='|{cmd}<使用2560元宝购买1个战神助熔剂/@BuyCatalyzer_1~5>\';
   
   
   This_NPC.NpcDialog(This_Player,
   '你要购买催化剂么？购买前确定材料的等级哦。\ \'
   +Catalyzer_KD[1]+Catalyzer_KD[2]+Catalyzer_KD[3]+Catalyzer_KD[4]+Catalyzer_KD[5]
   );
end;

procedure _BuyCatalyzer_1(str_kind:string); 
var
temp_kind,temp_level,temp_YB:integer;
str_Equip:string;
begin      
   temp_kind:= strtointdef(str_kind,-1);
   if (temp_kind < 1) or (temp_kind > 5) then exit;
   temp_level:=getMaxEquipUpLv; 
   if temp_kind > temp_level then
   begin
   This_NPC.NpcDialog(This_Player,
   '当前最高可购买' + getEquipUpName(temp_level) + '。'
   );
   end else
   begin
    temp_YB:=getEquipUpYB(temp_kind);
    str_Equip:=getEquipUpName(temp_kind);
    This_NPC.NpcDialog(This_Player,
    '你确定使用'+inttostr(temp_YB)+'元宝购买'+str_Equip+'吗？\ \'+
    '|{cmd}<确定购买/@BuyCatalyzer_2~'+str_kind+'>' 
    );
   end;
end;

procedure _BuyCatalyzer_2(str_kind:string); 
var
temp_kind,temp_level,temp_YB:integer;
begin      
   temp_kind:= strtointdef(str_kind,-1);
   if (temp_kind < 1) or (temp_kind > 5) then exit;
   temp_level:=getMaxEquipUpLv; 
   if temp_kind > temp_level then
   begin
   This_NPC.NpcDialog(This_Player,
   '当前最高可购买' + getEquipUpName(temp_level) + '。'
   );
   end else
   if This_Player.FreeBagNum > 0 then
   begin
    temp_YB:=getEquipUpYB(temp_kind);
    if temp_YB > 0 then 
    This_Player.PsYBConsum(This_NPC,'YB_Catalyzer',20144,temp_YB,1);
   end else
   begin
   This_NPC.NpcDialog(This_Player,
   '你的包裹太满了。'
   );
   end;
end;

procedure GetCatalyzer(price:integer);
var
temp_kind:integer;
str_Equip:string;
begin
  case price of 
  10:temp_kind:=1;
  40:temp_kind:=2;
  160:temp_kind:=3;
  640:temp_kind:=4;
  2560:temp_kind:=5;
  end;
  str_Equip:=getEquipUpName(temp_kind);
  This_Player.Give(str_Equip,1);
  This_NPC.NpcDialog(This_Player,
  '你获得了：'+str_Equip+'。\ \'+
  '|{cmd}<继续购买/@BuyCatalyzer>' 
  );
end;

function YB_Catalyzer(price, num: Integer):boolean; 
begin
  GetCatalyzer(price);
  Result := true;
end;


procedure domian;
begin
    This_NPC.NpcDialog(This_Player,
     '老夫一生，醉心于收集玛法大陆的各项技术，尤其是对装备的研究，\'
    +'所幸天不负我，终于让我研究出了装备合成的奥秘。\'
    + '任意<5件相同的首饰、头盔、腰带、靴子/c=red>与<催化剂/c=red>一起熔炼即可100%\'
    +'合成1件<更高一级的装备/c=red>。当然我这里准备了各种级别的熔锭，\'
    +'5件装备中的<3件可以用熔锭替代/c=red>哦。催化剂我也有独门配方能够提\'
    +'供哦。当然，熔锭和催化剂价格好商量。\ \'
    +'|{cmd}<了解装备合成详情/@EquipUpgrade>      ^<购买催化剂/@BuyCatalyzer>\'
    +'|{cmd}<开始装备合成/@@StrengthenEquip>（当前可最高合成至' + getMaxEquipUpStr(getMaxEquipUpLv+1) + '级别）\'  
    );
    //_EquipUpDlg('3');
end;

Begin
    domian;
end.