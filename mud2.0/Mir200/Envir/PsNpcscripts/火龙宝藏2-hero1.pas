program mir2;

procedure _openherobox;
begin
  This_Npc.OpenActionBox(This_Player);
end;

procedure OnInitialize;
begin
  This_Npc.AddNpcProp(13);
end;

begin
  if GetHour >= 23 then
    This_Npc.NpcDialog( This_Player,
      '现在，你可以搜寻这里的宝藏了。\' +
      '注意：请预留6个以上的包裹空间，\' +
      '否则将可能不能正常领取 \' +
      '|{cmd}<开启火龙宝藏/@openherobox>'
    );
end.