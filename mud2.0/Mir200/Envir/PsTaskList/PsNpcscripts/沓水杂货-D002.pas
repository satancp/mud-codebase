{********************************************************************

*******************************************************************}
Program Mir2;

{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas}

Procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure _getback;
Begin
   This_Npc.NpcDialog(This_Player,
   '请看目录决定找什么东西。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_GetBack(This_Player);
end;

Procedure _storage;
begin
   This_Npc.NpcDialog(This_Player,
   '需要保管什么东西？\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_GetBack(This_Player);
end;

Procedure _DoInputDialog1;
begin
   This_Npc.InputDialog(This_Player,'请输入：', 0 , 100);
end;

Procedure P100;
begin
   If This_Npc.InputOK then
   begin
      This_Player.ReqOpenStorage(This_Npc.InputStr);
   end;
end;



Procedure Normal;
Begin
      
      This_Npc.NpcDialog(This_Player,
      '还有人竟然来到这里，你有什么事情吗？\'+
      '把东西保管一次收200金币。\'+
      '不知道今天能不能回到家。\ \'+
      //'|{cmd}<开启仓库/@DoInputDialog1>\'+
      '|{cmd}<仓库管理/@storage>          ' + ActiveValidateStr + '\'
      +'|{cmd}<我要扩展仓库/@Storagemore>\');
end;

function getNeedItemNum(STGid : integer) : integer; 
var P_Storger : integer;
begin
    if This_Player.CheckAuthen(1,100) then
    P_Storger := 48
    else
    P_Storger := 24;
    
    if (STGid - P_Storger) < 48 then
    result := 1
    else if (STGid - P_Storger) < (48*2) then
    result := 2
    else if (STGid - P_Storger) < (48*3) then
    result := 3
    else
    result := -1;
end;

procedure _Storagemore;
var stg_num : integer;
stg_str : string; 
begin
    stg_num := This_Player.GetStorageSpaceCount;
    
    case getNeedItemNum(stg_num) of
        -1 : stg_str := '';
        1 : stg_str := '递交1个坚硬的桦木扩大16格仓库（限第二页）';
        2 : stg_str := '递交2个坚硬的桦木扩大16格仓库（限第三页）';
        3 : stg_str := '递交3个坚硬的桦木扩大16格仓库（限第四页）';
    end;

    This_Npc.NpcDialog(This_Player,
     '是不是嫌仓库太小了？没事，给我一些坚硬的桦木，\'
    +'我就可以帮你扩大仓库。\'
    +'仓库第二页，每给我1个坚硬的桦木，我就会帮你扩大16格的仓库。\'
    +'仓库第三页，每给我2个坚硬的桦木，我就会帮你扩大16格的仓库。\'
    +'仓库的第四页所需要的材料更多，每给我3个坚硬的桦木我才能帮\' //
    +'你扩大16格。当然只有前面的仓库开启了你才能开启后面的。\'
    +'你需要扩大仓库么？\ \'
    +'|{cmd}<' + stg_str + '/@Storagemore_true>\'
    +'|{cmd}<返回/@main>'
    );
end;

procedure _Storagemore_true;
var stg_num , needHM : integer;
begin
    stg_num := This_Player.GetStorageSpaceCount;
    needHM := getNeedItemNum(stg_num);
    
    if needHM > 0 then
    begin
        if This_Player.GetBagItemCount('坚硬的桦木') >= needHM then
        begin
            This_Player.ExpandStorageSpace(16);
            This_Player.Take('坚硬的桦木',needHM);
            This_Npc.NpcDialog(This_Player,
            '你的仓库已成功扩大了16格！\'
            +'|{cmd}<返回/@Storagemore>'
            );
        end else
        This_Npc.NpcDialog(This_Player,
         '你的材料不够啊，我无能为力。\'
        +'|{cmd}<返回/@main>'
      );
    end; 

end;



begin
      Normal;
end.