program NewSkyNpc;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

{*****************************GS脚本 Begin*************************************}
procedure _RgivUp;
begin
  This_Player.Flyto('0122~1', 0, 0);
end;

procedure _JinRuTong;   // 进通道
begin
//  This_Player.Flyto('D5071~0', 11, 13);
  This_Npc.EnterRouteWayByLF(This_Player, True);
end;


procedure _JinRuNext;   // 下一关
begin
  This_Npc.EnterNext(This_Player, False);
end;

procedure _jinrunext2;   // 隐藏关
begin
  This_Npc.EnterMyStery(This_Player);
end;
{*****************************GS脚本 End  *************************************}

procedure _EnAch;
begin
  This_Npc.NpcDialog(This_Player,
    '            请选择放置弓箭手的位置\\' +
    '■<◎1号/@EngageAch1>                                 ^<◎10号/@EngageAch10>■\' +
    '■                                            ■\' +
    '■<◎2号/@EngageAch2>                                 ^<◎09号/@EngageAch9>■\' +
    '■                                            ■\' +
    '■<◎3号/@EngageAch3> ^<◎4号/@EngageAch4> ^<◎5号/@EngageAch5> ^<◎6号/@EngageAch6> ^<◎7号/@EngageAch7> ^<◎08号/@EngageAch8>■\' +
    '■■■■■■■■■■■■■■■■■■■■■■■■\');
end;

procedure _MovAch;
begin
  This_Npc.NpcDialog(This_Player,
    '        	  请选择要移动的弓箭手\\' +
    '■<◎1号/@GetMoving1>                                 ^<◎10号/@GetMoving10>■\' +
    '■                                            ■\' +
    '■<◎2号/@GetMoving2>                                 <◎09号/@GetMoving9>■\' +
    '■                                            ■\' +
    '■<◎3号/@GetMoving3> ^<◎4号/@GetMoving4> ^<◎5号/@GetMoving5> ^<◎6号/@GetMoving6> ^<◎7号/@GetMoving7> ^<◎8号/@GetMoving8>■\' +
    '■■■■■■■■■■■■■■■■■■■■■■■■\');
end;


procedure _GetMoving1;
begin
  if This_Npc.GetMoveChance(This_Player, 1) then
    _EnAch;
end;

procedure _GetMoving2;
begin
  if This_Npc.GetMoveChance(This_Player, 2) then
    _EnAch;
end;

procedure _GetMoving3;
begin
  if This_Npc.GetMoveChance(This_Player, 3) then
    _EnAch;
end;

procedure _GetMoving4;
begin
  if This_Npc.GetMoveChance(This_Player, 4) then
    _EnAch;
end;

procedure _GetMoving5;
begin
  if This_Npc.GetMoveChance(This_Player, 5) then
    _EnAch;
end;

procedure _GetMoving6;
begin
  if This_Npc.GetMoveChance(This_Player, 6) then
    _EnAch;
end;

procedure _GetMoving7;
begin
  if This_Npc.GetMoveChance(This_Player, 7) then
    _EnAch;
end;

procedure _GetMoving8;
begin
  if This_Npc.GetMoveChance(This_Player, 8) then
    _EnAch;
end;

procedure _GetMoving9;
begin
  if This_Npc.GetMoveChance(This_Player, 9) then
    _EnAch;
end;

procedure _GetMoving10;
begin
  if This_Npc.GetMoveChance(This_Player, 10) then
    _EnAch;
end;


procedure _rule;
begin
  This_Npc.NpcDialog(This_Player,
    '调遣你的弓箭手，拦截逃离的怪物，获得怪物盗走的宝物\' +
    '逃离的怪物越少，您能获得的物品将更加丰富\' +
    '不放走1个怪物，更有机会获得<金天赐>\' +
    '拦截47-49个怪物，可获得银天赐；拦截41-46个怪物，可获得铜天赐\' +
    '拦截的怪物少于41个，还可以获得木天赐\' +
    '每次摆放弓箭手，都需要付出1张灵符\' +
     '|{cmd}<返回/@main>\'
   // '|{cmd}<什么是弩牌？/@rule4>\' +
   // '|{cmd}<如何摆放弓箭手/@rule1>    ^<如何移动弓箭手/@rule2>\' +
   // '|{cmd}<如何领取天关宝物/@rule3>'
   );
end;

procedure _rule1;
begin
  This_Npc.NpcDialog(This_Player,
    '比赛开始，第一次摆放弓箭手时\' +
    '您可以点击<“选择摆放弓箭手位置”>选择摆放第一个弓箭手的位置\' +
    '第一个弓箭手位置一旦放置完毕，则怪物大军开始逃离！\' +
    '您的弓箭手杀死怪物，会在杀死怪物的弓箭手旁掉落<“弩牌”/@rule4>\' +
    '当您拥有5个弩牌时可以选择<“使用5个弩牌换取弓箭手”>\' +
    '同时您<“必须付出1张灵符”>，将获得再次选择摆放1个弓箭手的机会\' +
    '如果您再交出弩牌后没有立刻摆放弓箭手\' +
    '可以再次选择<“选择摆放弓箭手位置”>进行摆放\' +
    '|{cmd}<下一页/@next>');
end;

procedure _next;
begin
  This_Npc.NpcDialog(This_Player,
    '每次阻击战中您只能摆放6个弓箭手\' +
    '|{cmd}<退出/@exit>        ');
end;

procedure _rule2;
begin
  This_Npc.NpcDialog(This_Player,
    '当您的包裹里存在1个弩牌，并且拥有1个以上弓箭手时\' +
    '您可以选择<“使用1个弩牌移动弓箭手”>\' +
    '先选择要移动的弓箭手后，再选择要放置的位置，即可移动\' +
    '如果您已经选择了移动弓箭手，但是放置的位置错误\' +
    '可以再次选择<“选择摆放弓箭手位置”>摆放弓箭手\' +
    '移动弓箭手<“不需要付出灵符”>\' +
    '|{cmd}<退出/@exit>');
end;

procedure _rule3;
begin
  This_Npc.NpcDialog(This_Player,
    '当您狙击怪物的数量达到一定时\' +
    '便可以选择<"领取天关宝物">领取挑战物品\' +
    '如果您已经领取了宝物,则领取后再狙击的怪物不再计入成绩\' +
    '如果您能保持连续的全狙成绩,更有神秘关卡等待着你！\' +
    '|{cmd}<退出/@exit>');
end;

procedure _rule4;
begin
  This_Npc.NpcDialog(This_Player,
    '弩牌为召唤和移动弓箭手的凭证\' +
    '你可以使用5个弩牌和1张灵符换取1个弓箭手为你作战\' +
    '或者使用1个弩牌为你的1个弓箭手移位\' +
    '杀死逃离的怪物有机会获得弩牌\' +
    '弩牌只能在魔王岭中使用，一旦带离魔王岭，它将失去魔力\' +
    '再进入魔王岭时会被传送之力所粉碎\' +
    '|{cmd}<退出/@exit>');
end;

procedure _GNewPrize;
begin
  This_Npc.ClientGetPrize(This_Player);

end;

procedure _lingqu;
begin
  This_Npc.NpcDialog(This_Player,
    '不需要结束这次挑战，您就可以到我这里领取物品，\' +
    '但是领取的物品将由您已经消灭的怪物数量来决定，\' +
    '木、铜、银、金各种天赐双击后就可以打开，\' +
    '其中的物品会自动放到您的包裹里，\' +
    '请您务必注意，领取时要<确保包裹有足够的空间>哦，\' +
    '否则将会无法领到天赐或天赐中的物品。\' +
    '您确认您现在就要来领取吗？\' +
    '|{cmd}<我确认，我现在就要领取/@GNewPrize>\' +
    '|{cmd}<等我结束这次挑战后再来领取吧/@exit>');
end;

procedure main1;
begin
  This_Npc.NpcDialog(This_Player,
    '这里是天关中的隐藏关，\' +
    '只要拦截盗宝的怪物数量在47个以上，\' +
    '那除了可以获得原有的宝藏外，更可以获得神秘天赐，\' +
    '如果未能消灭47个以上，仍然可以获得原有的天关宝物。\' +
    '请<选择摆放弓箭手位置/@EnAch>摆放第一个弓箭手，\' +
    '如果移动弓箭手的位置错误，也可以在这里重新放置\' +
    '|{cmd}<使用5个弩牌换取弓箭手/@GetEngage>    |<使用1个弩牌移动弓箭手/@MovAch>\  \' +
    '|{cmd}<领取天关宝物/@lingqu>                        ^<查看规则/@rule>\');

end;

procedure _EngageAch1;
begin
  This_Npc.EngageArcher(This_Player, 1);
end;

procedure _EngageAch2;
begin
  This_Npc.EngageArcher(This_Player, 2);
end;

procedure _EngageAch3;
begin
  This_Npc.EngageArcher(This_Player, 3);
end;

procedure _EngageAch4;
begin
  This_Npc.EngageArcher(This_Player, 4);
end;

procedure _EngageAch5;
begin
  This_Npc.EngageArcher(This_Player, 5);
end;

procedure _EngageAch6;
begin
  This_Npc.EngageArcher(This_Player, 6);
end;

procedure _EngageAch7;
begin
  This_Npc.EngageArcher(This_Player, 7);
end;

procedure _EngageAch8;
begin
  This_Npc.EngageArcher(This_Player, 8);
end;

procedure _EngageAch9;
begin
  This_Npc.EngageArcher(This_Player, 9);
end;

procedure _EngageAch10;
begin
  This_Npc.EngageArcher(This_Player, 10);
end;

procedure _GetEngage;
begin
  if This_Npc.GetEngageChance(This_Player) then
    _EnAch;
end;

function getEngageStr() : string;
var R_str : string;
i: integer;
begin
    R_str := '';
    
    for i:= 1 to 10 do
    begin
        if This_NPC.IsExistArcher(This_Player,i) then  //This_NPC.IsExistArcher(This_Player,i) 位置是否有弓箭手 
        R_str := R_str + '' + inttostr(i) + ' '  
        else
        R_str := R_str + '<' + inttostr(i) + '号位/@GetEngage_10_SD~' + inttostr(i) + '>' ;
        
        if (i mod 5) = 0 then
        R_str := R_str + '|'
        else
        R_str := R_str + '^';
    end; 
    
    result := '|{cmd}' + R_str;
end; 

procedure _GetEngage_10();
var i : integer;
begin
    This_Npc.NpcDialog(This_Player,
    '请选择召唤弓箭手的位置\ \' 
    + getEngageStr
    );
    

end; 


procedure _GetEngage_10_SD(str_i : string);
var i : integer;
begin
    i := StrToIntDef(str_i , 0);
    
    if i > 0  then
    begin
        if This_Npc.GetEngageChance(This_Player) then
        This_Npc.EngageArcher(This_Player, i)    
        else
        This_Npc.EngageArcher(This_Player, i);
    
        _GetEngage_10();
    end;
end; 

procedure _chklinfu;
begin
  This_Npc.NpcDialog(This_Player,
  '你当前的灵符总数是：' + inttostr(This_Player.MyLFnum)
  ); 
end;

procedure OnInitialize;
begin
  This_Npc.AddNpcProp(12);

end;       

begin
  This_Npc.NpcDialog(This_Player,
    '赶快召唤出弓箭手，盗走天关宝物的怪物就要出现了！\' +
    '拦截逃离的怪物，夺回被盗的宝物！\' +
    '每次摆放弓箭手，都需要付出一张灵符哦\' +
    //'|{cmd}<使用5个弩牌换取弓箭手/@GetEngage>    |<使用1个弩牌移动弓箭手/@MovAch>\  \' +
    '|{cmd}<摆放弓箭手/@GetEngage_10>' +
    '|{cmd}<领取天关宝物/@lingqu>                        ^<查看规则/@rule>\'
    +'|<查询灵符/@chklinfu>'
    );

end.