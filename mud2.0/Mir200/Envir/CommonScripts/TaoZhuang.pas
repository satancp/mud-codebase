      {
*******************************************************************}

procedure JHTZ_XH_ZS();
var wuqi, xianglian, toukui , shouzhuo1 , shouzhuo2 , jiezhi1 , jiezhi2  : string;
begin
wuqi := This_Player.GetItemNameOnBody(1);
xianglian := This_Player.GetItemNameOnBody(3);
toukui := This_Player.GetItemNameOnBody(4);
shouzhuo1 := This_Player.GetItemNameOnBody(5);
shouzhuo2 := This_Player.GetItemNameOnBody(6);
jiezhi1 := This_Player.GetItemNameOnBody(7);
jiezhi2 := This_Player.GetItemNameOnBody(8);
//////////验证成功获得技能并且循环验证
if (wuqi = '裁决之杖') or (wuqi = '怒斩') or (wuqi = '屠龙') or (wuqi = '霸者之刃') then 
begin
  if (xianglian = '圣战项链') and (toukui = '圣战头盔') then 
  begin
  if (shouzhuo1 = '圣战手镯') or (shouzhuo2 = '圣战手镯') then 
    begin
	  if (jiezhi1 = '圣战戒指') or (jiezhi2 = '圣战戒指') then 
	  begin
	  if This_Player.GetSkillLevelExt('刺杀剑术',false) < 4 then
	  begin
      This_Player.ChgSkillLv('刺杀剑术',4,0);
      This_Player.PlayerNotice('赤月套装激活成功,已掌握4级刺杀剑术！',2);
	  end;
	  end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少法神戒指,套装效果消失！',2);
end;
end;
	end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少法神手镯,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少法神项链或头盔,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('刺杀剑术',false) = 4 then
begin
This_Player.ChgSkillLv('刺杀剑术',3,0);
This_Player.PlayerNotice('缺少战士神器,套装效果消失！',2);
end;
end;
    This_Player.CallOut(This_Npc, 5, 'JHTZ_XH_ZS');
end;


procedure JHTZ_XH_FS();
var wuqi, xianglian, toukui , shouzhuo1 , shouzhuo2 , jiezhi1 , jiezhi2  : string;
begin
wuqi := This_Player.GetItemNameOnBody(1);
xianglian := This_Player.GetItemNameOnBody(3);
toukui := This_Player.GetItemNameOnBody(4);
shouzhuo1 := This_Player.GetItemNameOnBody(5);
shouzhuo2 := This_Player.GetItemNameOnBody(6);
jiezhi1 := This_Player.GetItemNameOnBody(7);
jiezhi2 := This_Player.GetItemNameOnBody(8);
//////////验证成功获得技能并且循环验证
if (wuqi = '骨玉权杖') or (wuqi = '龙牙') or (wuqi = '嗜魂法杖') or (wuqi = '血饮') or (wuqi = '霸者之刃') then 
begin
  if (xianglian = '法神项链') and (toukui = '法神头盔') then 
  begin
  if (shouzhuo1 = '法神手镯') or (shouzhuo2 = '法神手镯') then 
    begin
	  if (jiezhi1 = '法神戒指') or (jiezhi2 = '法神戒指') then 
	  begin
	  if This_Player.GetSkillLevelExt('魔法盾',false) < 4 then
	  begin
      This_Player.ChgSkillLv('魔法盾',4,0);
      This_Player.PlayerNotice('赤月套装激活成功,已掌握4级魔法盾！',2);
	  end;
	  end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法神戒指,套装效果消失！',2);
end;
end;
	end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法神手镯,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法神项链或头盔,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('魔法盾',false) = 4 then
begin
This_Player.ChgSkillLv('魔法盾',3,0);
This_Player.PlayerNotice('缺少法师神器,套装效果消失！',2);
end;
end;
    This_Player.CallOut(This_Npc, 5, 'JHTZ_XH_FS');
end;



procedure JHTZ_XH_DS();
var wuqi, xianglian, toukui , shouzhuo1 , shouzhuo2 , jiezhi1 , jiezhi2  : string;
begin
wuqi := This_Player.GetItemNameOnBody(1);
xianglian := This_Player.GetItemNameOnBody(3);
toukui := This_Player.GetItemNameOnBody(4);
shouzhuo1 := This_Player.GetItemNameOnBody(5);
shouzhuo2 := This_Player.GetItemNameOnBody(6);
jiezhi1 := This_Player.GetItemNameOnBody(7);
jiezhi2 := This_Player.GetItemNameOnBody(8);
//////////验证成功获得技能并且循环验证
if (wuqi = '龙纹剑') or (wuqi = '逍遥扇') or (wuqi = '无极棍') or (wuqi = '霸者之刃') then 
begin
  if (xianglian = '天尊项链') and (toukui = '天尊头盔') then 
  begin
  if (shouzhuo1 = '天尊手镯') or (shouzhuo2 = '天尊手镯') then 
    begin
	  if (jiezhi1 = '天尊戒指') or (jiezhi2 = '天尊戒指') then 
	  begin
	  if This_Player.GetSkillLevelExt('施毒术',false) < 4 then
	  begin
      This_Player.ChgSkillLv('施毒术',4,0);
	  This_Player.PlayerNotice('赤月套装激活成功,已掌握4级施毒术！',2);
	  end;
	  end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少天尊戒指,套装效果消失！',2);
end;
end;
	end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少天尊手镯,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少天尊项链或头盔,套装效果消失！',2);
end;
end;
end else
begin
if This_Player.GetSkillLevelExt('施毒术',false) = 4 then
begin
This_Player.ChgSkillLv('施毒术',3,0);
This_Player.PlayerNotice('缺少道士神器,套装效果消失！',2);
end;
end;
    This_Player.CallOut(This_Npc, 5, 'JHTZ_XH_DS');
end;


procedure JHTZ_KS(); 
begin      
//This_Player.PlayerNotice('成功调用2',2);      
  case This_Player.Job of
       0: 
	   JHTZ_XH_ZS();
       1: 
	   JHTZ_XH_FS();
       2: 
	   JHTZ_XH_DS();
  end;
end; 

function TZJH_NPC:string; 
begin
//This_Player.PlayerNotice('成功调用1',2);   
  JHTZ_KS();
end;  




