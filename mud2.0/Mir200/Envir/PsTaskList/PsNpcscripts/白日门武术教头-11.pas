{
/************************************************************************}

PROGRAM Mir2;


Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '我的功夫你应该不会怀疑吧！那群徒弟嘛也算是学有所成了。\'+
   '唉！要不是这把老骨头，我也真想同他们一道去闯荡闯荡！\ \'+
   '|{cmd}<退出/@doexit>');
end.