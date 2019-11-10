{
*******************************************************************}
Program Mir2;

Procedure _DoExit;
begin
   This_NPC.CloseDialog(This_Player);
end;

Procedure _Buy;
begin
   This_NPC.NpcDialog(This_Player,
   '请看需要取回什么东西？\ \ \'+
   '|{cmd}<放入/@sell>                  ^<关闭/@doexit> \');
   This_NPC.Click_Buy(This_Player);
end;

Procedure _sell;
begin
   This_NPC.NpcDialog(This_Player,
   '请看需要放入什么东西？\ \ \'+
   '|{cmd}<取回/@Buy>                     ^<将所有物品放入背包/@StorageAllBagItems>\ \'+
   '|{cmd}<关闭/@doexit>\');
   This_NPC.Click_Sell(This_Player);
end;

Procedure _StorageAllBagItems;
begin
   This_NPC.StorageAllBagItems(This_Player);
end;

Procedure OnInitialize;
begin
   This_NPC.AddNpcProp(9);
end;

Begin
   This_NPC.NpcDialog(This_Player,
   '你好，我是GM管家，你需要些什么服务？\ \ \'+
   '|{cmd}<取回/@Buy>                        ^<放入/@sell>\');
end.