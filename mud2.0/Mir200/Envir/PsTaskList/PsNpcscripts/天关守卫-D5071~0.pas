program mir2;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _mount;
begin
  This_Npc.NpcDialog(This_Player,
    '您现在拥有圣殿灵符：' + IntToStr(This_Player.NickLinFu) + '\ \' +
    '|{cmd}<返回/@chaxun>'
  )  
end;

procedure _dating;
begin
  This_Npc.NpcDialog( This_Player,
    '传说天关之中除了大家众所周知的奇珍异宝之外，\' +
    '其实还存在着圣殿，其中也隐藏着宝藏。\' +
    '只有使用圣殿灵符才可以进入天关中的圣殿，\' +
    '寻找其中隐藏的宝藏。\ \' +
    '|{cmd}<返回/@chaxun>'
  );
end;

procedure _chaxun;
begin
  This_Npc.NpcDialog( This_Player,
    '|{cmd}<查询圣殿灵符数量/@mount>\ \'  +
    '|{cmd}<打听圣殿宝藏/@dating>\ \' +
    '|{cmd}<返回/@main>'
  );
end;

procedure _jinruguan;
begin
  This_Npc.EnterGuan(This_Player);
end;

begin
  This_Npc.NpcDialog(This_Player,
    This_Player.Name + ',看来你已经做好了进入天关寻宝的准备\'+
    '我马上让你进入天关挑战自己，发现属于自己的宝藏\'+
    '另有一批怪物从天关中盗取宝物，正从魔王岭逃离\'+
    '魔王岭护卫正在征集勇士前去拦截盗宝的怪物\'+
    '杀死盗宝的怪物您有可能获得魔王岭守卫给予的酬谢\'+
    '注意：从天关和魔王岭任何一个地点内小退重新上线您将返回天庭\'+
    '|{cmd}<进入天关寻宝/@jinruguan>\ \'+
    '|{cmd}<关闭对话/@exit>                        ^<查询圣殿灵符/@chaxun>\');

end.
