{
/*******************************************************************************
/*  脚本内容 :
/*  对应NPC  : 神秘护卫
/*  修订记录 :
/*
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '你带来了精制材料卷吗？\如果你有精制材料卷，我便可以通过这个材料卷，\召唤出那些贪婪的怪物，它们的身上也许会有你需要的精制材料。\ \'
  +'|{cmd}<是的，我有精制材料卷/@yaoqugive>\ \'
  +'|{cmd}<麻烦你送我回酒馆吧/@back>'
  );
end;

procedure Getout;
begin
  if compareText(This_Player.DynRoomName, 'Drinkwater') = 0 then
  begin
    This_Player.RandomFlyTo('0170');
  end;
end;

procedure _yaoqugive;
var
  temp : integer;
begin
  if This_Npc.CheckCurrMapMon >= 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你只有消灭现在出现的怪物，才可以继续使用精制材料卷！');
  end
  else if This_Player.GetBagItemCount('精制材料卷') >= 1 then
  begin
    This_Npc.CloseDialog(This_Player);
    This_Player.Take('精制材料卷',1);
    This_Player.CallOut(This_Npc,600,'Getout');
    //在该动态房间随机刷怪 
    temp := random(4) + 1;
    if temp = 1 then
    begin
      This_Npc.CreateMon('',14,16,3,'白野猪3281',1); 
    end
    else if temp = 2 then
    begin
      This_Npc.CreateMon('',14,16,3,'白野猪3282',1); 
    end
    else if temp = 3 then
    begin
      This_Npc.CreateMon('',14,16,3,'白野猪3283',1); 
    end
    else if temp = 4 then
    begin
      This_Npc.CreateMon('',14,16,3,'白野猪3284',1); 
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '必须要有精制材料卷，我才能放出怪物，\精制材料卷你可以从天关、卧龙山庄和雷炎洞穴得到。');
  end; 
end;

procedure _back;
begin
  if compareText(This_Player.DynRoomName, 'Drinkwater') = 0 then
  begin
    This_Player.RandomFlyTo('0170');
  end;
end;

begin
  domain;
end.
  