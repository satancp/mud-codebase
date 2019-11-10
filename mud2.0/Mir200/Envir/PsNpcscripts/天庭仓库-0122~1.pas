{******************************************************************

*******************************************************************}

PROGRAM Mir2;

{$I common.pas}
{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;







PROCEDURE _mibao;
Begin
   This_Npc.NpcDialog(This_Player,
   '启用密宝最新防护功能，\'+
   '上线后前三分钟，身上的装备也能得到隐藏保护！\'+ 
   '现在就去密宝选项界面选择最新防护功能，\'+
   '修改密宝绑定模式即可轻松启用。\ \'+
   '|{cmd}<开启仓库/@DoInputDialog1>\'+
   '|{cmd}<返回/@main>');
end;

PROCEDURE _zhuang;
Begin
   if compareText(This_Player.MapName, '0122~1') = 0 then
   begin
      This_Player.Flyto('SLDG',323,401);
   end;
end;


PROCEDURE _goumai;
Begin
   if This_Player.GoldNum >= 110 then
   begin
      This_Player.DecGold(110);
      This_Player.Give('地牢逃脱卷',1);
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你连这点钱都没有，算了，你还是去边界城找仓库管理员吧。\ \'+
      '|{cmd}<返回边界城/@zhuang>');
   end;
end;


PROCEDURE _goback;
Begin
   This_Npc.NpcDialog(This_Player,
   '我这里只有地牢逃脱卷，卖你一个卷轴吧。\ \'+ 
   '|{cmd}<购买/@goumai>地牢逃脱卷');
end;


Begin
    
   
   This_Npc.NpcDialog(This_Player,
   '别看我不起眼，我找到了通往玛法大陆的捷径，想去哪里就跟\'+
   '我说，为每一位勇士保管好武器和战斗装备是我的天职。\'+
   '启用密宝最新防护功能，连身上的装备都能保护起来。 \ \'+
   '|{cmd}<开启仓库/@DoInputDialog1>  \'+
   '|{cmd}<保管东西/@storage>          '+ActiveValidateStr+
   '|{cmd}<找回东西/@getback>\'+
   '|{cmd}<捆各种卷书和药水/@mbind>                  ^<去边界城/@zhuang>\'+
   '|{cmd}<返回/@goback>玛法大陆                      ^<退出/@doexit>');
end.