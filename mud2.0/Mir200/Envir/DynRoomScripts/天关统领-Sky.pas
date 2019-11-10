program Skynpc;
                                   
procedure _RgivUp;
begin
  This_Player.Flyto('0122~1', 0, 0); 
end;


procedure _recmon;
begin
  // 必须有，从天关到通道（GS脚本，非文件脚本）
  This_Npc.WantWarMon(This_Player)
end;

procedure _jinrutong;
begin
  // 必须有，从天关到通道（GS脚本，非文件脚本）
  This_Npc.EnterRouteWayByLF(This_Player, True);
end;

procedure _jinrunext2;   // 隐藏关
begin
  This_Npc.EnterMyStery(This_Player);
end;

procedure _fanhui;
begin
  This_Player.Flyto('0122~1', 0, 0); 
end;

procedure _getprize;
begin
  This_Npc.GetSkyPrize(This_Player);
end;


procedure _GetGift;
begin
  This_Npc.NpcDialog(This_Player,
    '只有消灭完房间里的所有怪物，才算是挑战成功。\'+
    '在领取宝物前，请您确认您包裹里有足够的空间放置宝藏。\ \'+
    '|{cmd}<准备好了，领取宝物/@getprize>');
end;


procedure _lookmon;
begin
  This_Npc.ChkMonAndItem(This_Player);
end;

procedure _Enoughvalue;
begin
  This_Npc.NpcDialog(This_Player,
    '你的勇士卡内已经没有灵符，不能进入下一关');
end;

procedure _NotNewBieCard;
begin
  This_Npc.NpcDialog(This_Player,
    '你的等级已经大于21级，不能再使用勇士卡内灵符进入');
end;

procedure OnInitialize;
begin
  This_Npc.AddNpcProp(11);

end;
  
begin
  This_Npc.NpcDialog(This_Player,
    '能来到这里，你果然智勇双全。\'+
    '先看看我这里的宝物，只要打败所有怪物，宝物就归你了。\'+
    '如果想到下一关，你可以使用1张灵符再过一次天关通道；\'+
    '如果不想使用灵符，那就靠实力打过去吧。\'+
    '天关有无数重，能过多少关就看你的勇气和毅力了。\'+
    '|{cmd}<看看这里的宝物/@lookmon>        ^<挑战成功，领取宝物/@GetGift>\ \'+ 
    '|{cmd}<返回天庭/@fanhui>');
end.

