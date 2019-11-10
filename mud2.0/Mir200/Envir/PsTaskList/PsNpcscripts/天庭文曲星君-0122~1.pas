{
/************************************************************************}



PROGRAM Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _canjia;
begin
   This_Npc.NpcDialog(This_Player,
   '在各地的老兵处，点击"闯天关"即可进入天庭。\'+
   '与天庭守卫对话，选择使用灵符直接进入天关通道。\'+
   '通过天关通道，进入天关，就可开始闯天关活动。\ \'+
   '|{cmd}<返回/@main>                         ^<关闭/@doexit>');
end;


Procedure _zuoyong;
begin
   This_Npc.NpcDialog(This_Player,
   '灵符的作用，是让使用者处于隐身状态。\'+
   '使用灵符，可以让通道里的怪物看不见你，\'+
   '你就可以直接穿越通道闯入天关。\'+
   '你必须先在灵符仙子处兑换到灵符，\'+
   '然后直接和天庭守卫对话即可使用。\ \'+
   '|{cmd}<返回/@main>                         ^<关闭/@doexit>');
end;


Procedure _shuliang;
begin
   This_Npc.NpcDialog(This_Player,
   '有三个方法可以查询：\'+
   '1、与天庭中的灵符仙子对话查询自己的当前的灵符数量。\'+
   '2、盟重省的公告牌可以查询。\'+ 
   '3、可以在角色人物栏中查询（金刚石数量下方）。\ \'+
   '|{cmd}<返回/@main>                         ^<关闭/@doexit>');
end;


Procedure _xiaoshi;
begin
   This_Npc.NpcDialog(This_Player,
   '灵符只针对本次活动，但是在活动结束后灵符不会消失。\'+
   '在今后的活动中，灵符还会起到一定的作用。\ \'+
   '|{cmd}<返回/@main>                         ^<关闭/@doexit>');
end;


Procedure _baoluo;
begin
   This_Npc.NpcDialog(This_Player,
   '在天庭、天关通道、天关里，死亡是不会掉落装备的。\ \'+
   '|{cmd}<返回/@main>                         ^<关闭/@doexit>');
end;

Procedure _baozang;
begin
   This_Npc.NpcDialog(This_Player,
   '在进入天关后，与天关统领对话，选择[看看这里的宝物]，\'+
   '可以查看到本关隐藏的宝物和需要守卫宝藏的怪物。\'+
   '打倒守卫宝藏的怪物后，就可以得到天关里的宝物。\'+
   '在闯天关活动中，有些天关还有隐藏的神秘宝藏，\'+
   '甚至传说中的战神、圣魔、真魂也隐藏在其中。\ \'+
   '|{cmd}<返回/@main>                         ^<关闭/@doexit>');
end;


Begin
   This_Npc.NpcDialog(This_Player,
   '想了解闯天关的规则吗？我不知道的，你也可以去问问灵符仙子！\ \'+
   '|{cmd}<如何参加“闯天关”/@canjia>\'+
   '|{cmd}<灵符的作用/@zuoyong>\'+
   '|{cmd}<如何查询自己的灵符数量/@shuliang>\'+
   '|{cmd}<活动结束后，灵符是否会消失/@xiaoshi>\'+
   '|{cmd}<在天关死亡是否会暴装备/@baoluo>\'+
   '|{cmd}<如何知道所在的天关隐藏的宝藏/@baozang>');
end.