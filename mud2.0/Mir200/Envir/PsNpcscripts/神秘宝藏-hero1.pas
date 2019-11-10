program mir2;

procedure _OpenValuedBox;
begin
  This_Npc.OpenNeedKeyBox(This_Player);
end;

procedure _OpenValuedBox2;
begin
  This_Npc.OpenNeedKeyBox2(This_Player);
end;

procedure OpenValuedBox_OK2;
begin
   This_NPC.NpcDialog(This_Player,
   '恭喜，宝藏已经开启\ \'+
   '|{cmd}<继续使用宝藏钥匙/@OpenValuedBox>');
end;

procedure OpenValuedBox_Fail;
begin
   This_NPC.NpcDialog(This_Player,
   '好像没有发现什么宝藏\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure OpenValuedBox_Again;
begin
   This_NPC.NpcDialog(This_Player,
   '你现在获得了一个再次开启天赐的机会，\'+
   '这次天赐的开启不需要使用宝藏钥匙，\'+
   '只要你使用1个元宝就可以直接开启，\'+
   '你是否愿意使用1个元宝再次开启天赐？\'+
   '你也可以放弃这次机会，继续使用宝藏钥匙开启天赐。\'+
   '|{cmd}<使用1个元宝再次开启天赐/@OpenValuedBox2>\ \'+
   '|{cmd}<继续使用宝藏钥匙/@OpenValuedBox>');
end;

procedure OnInitialize;
begin
  This_Npc.AddNpcProp(13);
end;

begin
  This_Npc.NpcDialog( This_Player,
    '如此近的距离，\' +
    '你终于看清宝藏的箱子上镌刻着一行斑驳的字迹：\' +
    '——此乃上古封存的绝世宝藏，惟有宝藏钥匙方能开启。\ \' +
    '|{cmd}<使用宝藏钥匙/@OpenValuedBox>'
    );
end.
