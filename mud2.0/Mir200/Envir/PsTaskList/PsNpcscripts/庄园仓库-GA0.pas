{
*******************************************************************}

program Mir2;

{$I common.pas} 
{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _mibao;
begin
   This_Npc.NpcDialog(This_Player,
   '启用密宝最新防护功能，上线后前三分钟，身上的装备也能得\'+
   '到隐藏保护！\'+
   '现在就去密宝选项界面选择最新防护功能，修改密宝绑定模式\'+
   '即可轻松启用。\ \'+
   //'|{cmd}<开启仓库/@DoInputDialog1>\ \'+
   '|{cmd}<返回/@main>');
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

Procedure _mbind;
begin
  This_Npc.NpcDialog(This_Player,
  '你知道我是什么人吗，你对我这么信任？ \' +
  '这可都是巨额交易啊！\' +
  '你要试一下吗？那就尽管放心好了！ \' +
  '|{cmd}<金币换金条./@chgtobar>'+addspace(' ',20)+'|{cmd}<金条换金币./@bartogold>\' +
  '|{cmd}<金条换金砖./@chgtobrick>'+addspace(' ',20)+'|{cmd}<金砖换金条./@bricktobar>\'+
  '|{cmd}<捆药瓶和卷轴/@bind>\'+ 
  '|{cmd}<取消/@doexit>');
end;

Procedure _chgtobar;
begin
   This_Npc.Click_GoldChgBar(This_Player);
end;

Procedure _bartogold;
begin
   This_Npc.Click_BartoGold(This_Player);
end;

Procedure _chgtobrick;
begin
   This_Npc.Click_BartoBrick(This_Player);
end;

Procedure _bricktobar;
begin
   This_Npc.Click_BricktoBar(This_Player);
end;

Procedure _bind;
begin
  This_Npc.NpcDialog(This_Player,
  '目前我能捆的只有卷书和药水。\'+
  '你要捆吗？ \'+ 
  '要捆东西需要100金币. \ \'+
  '|{cmd}<捆药水/@P_bind>'+addspace(' ',20)+'|{cmd}<捆卷书/@Z_bind> \ \'+
  '|{cmd}<返回/@main>');
end;

Procedure _P_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<强效金创药捆/@ch_bind1>  \'+
  '|{cmd}<捆强效魔法药/@ma_bind1> \'+ 
  '|{cmd}<捆金创药（中）/@ch_bind2> \'+
  '|{cmd}<捆魔法药（中）/@ma_bind2> \'+
  '|{cmd}<捆金创药/@ch_bind3> \'+
  '|{cmd}<捆魔法药/@ma_bind3> \'+
  '|{cmd}<返回/@bind>');
end;

//捆药模板
//item_src待捆绑的东西， item_des捆绑成的东西 
procedure DoBindDrug(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;

procedure _ma_bind3;
begin
  DoBindDrug('魔法药(小量)', '魔法药(小)包');
end;

Procedure _ch_bind3;
begin
  DoBindDrug('金创药(小量)', '金创药(小)包');    
end;

Procedure _ma_bind2;
begin
  DoBindDrug('魔法药(中量)', '魔法药(中)包');  
end;

Procedure _ch_bind2;
begin
  DoBindDrug('金创药(中量)', '金创药(中)包');    
end;

Procedure _ma_bind1;
begin
  DoBindDrug('强效魔法药', '超级魔法药');     
end;

Procedure _ch_bind1;
begin
  DoBindDrug('强效金创药', '超级金创药');   
end;


Procedure _Z_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<捆地牢逃脱卷/@zum_bind1> \' +
  '|{cmd}<捆随机传送卷/@zum_bind2> \' +
  '|{cmd}<捆回城卷/@zum_bind3>  \' +
  '|{cmd}<捆行会回城卷/@zum_bind4>  \' +
  '|{cmd}<返回/@bind>');
end;

//捆书卷模板
//item_src待捆绑的东西， item_des捆绑成的东西 
procedure DoBindBook(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@Z_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有可以捆的卷书，还捆什么? \'+
     '等准备好之后，再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;   
end; 

procedure _zum_bind4;
begin
  DoBindBook('行会回城卷', '行会回城卷包');
end;

Procedure _zum_bind3;
begin
  DoBindBook('回城卷', '回城卷包');  
end;

Procedure _zum_bind2;
begin
  DoBindBook('随机传送卷', '随机传送卷包');  
end;

Procedure _zum_bind1;
begin
  DoBindBook('地牢逃脱卷', '地牢逃脱卷包');  
end;

Procedure _goback;
begin
   if This_Player.GoldNum >= 110 then
   begin
      This_Npc.NpcDialog(This_Player,
      '我这里只有地牢逃脱卷，卖你一个卷轴吧。\ \'+
      '|{cmd}<购买地牢逃脱卷/@goumai>');      
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你连这点钱都没有，算了，我再给你指条路吧。\'+ 
      '听说庄园管家的厨艺很好，深得比奇国王的欣赏，尤其是花叶\'+
      '包鸡，可是玛法一绝，你如果能让他给我做一碗花叶包鸡，那\'+
      '我就送你回去。\');
   end;
end;

Procedure _goumai;
begin
   if This_Player.GoldNum >= 110 then
   begin
      This_Player.DecGold(110);
      This_Player.Give('地牢逃脱卷',1);
   end;
end;

Procedure _huode;
begin
   if This_Player.GetBagItemCount('花叶包鸡') >= 1 then
   begin
      This_Player.Take('花叶包鸡',1);
      This_Player.Give('地牢逃脱卷',1);
      This_Npc.CloseDialog(This_Player);
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你给我带来花叶包鸡了吗？');
   end;
end;

procedure _randomga0;
var
tga0 : integer;
begin
  if compareText(This_Player.MapName,'GA0') = 0 then
  begin
     tga0 := random(5);
     if tga0 = 4 then
     begin
        This_Player.Flyto('GA0',70,71);
     end else if tga0 = 3 then
     begin
        This_Player.Flyto('GA0',73,64);
     end else if tga0 = 2 then
     begin
        This_Player.Flyto('GA0',73,69);
     end else if tga0 = 1 then
     begin
        This_Player.Flyto('GA0',62,72);
     end else if tga0 = 0 then
     begin
        This_Player.Flyto('GA0',61,64);
     end; 
  end;
end;

function getNeedItemNum(STGid : integer) : integer; 
var P_Storger : integer;
begin
    if true then // if This_Player.CheckAuthen(1,100) then
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
    +'仓库的第四页所需要的材料更多，每给我3个坚硬的桦木我才能帮 \'
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

Begin
   if This_Player.GetBagItemCount('花叶包鸡') >= 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '感谢你给我送来花叶包鸡，你的人品真好，\'+
      '我现在就送你一个地牢逃脱卷。\ \'+
      '|{cmd}<获得地牢逃脱卷/@huode>\'+
      '|{cmd}<去周围看看/@randomga0>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '您可以将宝藏先寄存在我这里。\'+
      '为每一位勇士保管好武器和战斗装备是我的天职。\'+
      '启用密宝最新防护功能，连身上的装备都能保护起来。\'+
      //'|{cmd}<了解密宝最新防护详情/@mibao>\'+
      //'|{cmd}<开启仓库/@DoInputDialog1>\'+
      '|{cmd}<仓库管理/@storage>               ^' + ActiveValidateStr + '\'+//^<找回东西/@getback>\'+
      '|{cmd}<我要扩展仓库/@Storagemore>\'+
      '|{cmd}<捆各种卷书和药水/@mbind>\'+
      '|{cmd}<返回/@goback>玛法大陆\'+
      '|{cmd}<去周围看看/@randomga0>                   ^<退出/@doexit>');
   end;
end.