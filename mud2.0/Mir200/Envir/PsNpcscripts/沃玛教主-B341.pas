{********************************************************************

*******************************************************************}

Program Mir2;


{$I common.pas}
procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

PROCEDURE _mo;
begin
   This_Npc.NpcDialog(This_Player,
   '哈哈哈，你要挑战心魔？简直在开玩笑，\'+ 
   '没有充分的觉悟，不要随便挑战心魔\'+ 
   '有勇无谋可是会丧命的哦~\'+ 
   '哈哈哈哈哈哈~~~~~~\ \'+ 
   '|{cmd}<闪开啦!我要挑战！/@join>\'+
   '|{cmd}<算了,我还没准备好/@doexit>\');
end;

PROCEDURE _join;
begin
   This_Npc.NpcDialog(This_Player,
   '好！有胆识！你要挑战的心魔就在沃玛森林，你找不到？\'+
   '哈哈哈，告诉你，那是一间破败的屋子，里面居住着的是\'+
   '你无法战胜的恶魔，哈哈哈哈！！！\ \'+
   '|{cmd}<离开/@doexit>\');
end;




Procedure _ask;
Begin
    This_Npc.NpcDialog(This_Player,
   '前几天抓来一个疯疯癫癫的老头，\'+
   '总说自己是什么掌管世人姻缘的神仙，\'+
   '被我关到阁楼里去了。你认识他吗？\ \'+
   '|{cmd}<返回/@main>');
end;



Begin
   This_Npc.NpcDialog(This_Player,
   '哈哈，有人来了。\'+
   '封魔堡属于我的主人"虹魔教主"，\'+
   '你们是来给他当早餐的吧，嘿嘿……\ \'+ 
   '|{cmd}<打听消息/@ask>\'+ 
   '|{cmd}<我要挑战心魔/@mo>\' +
   '|{cmd}<退出/@doexit>');
end.