{********************************************************************

*******************************************************************}
program mir2;

{$I WarehouseAndMbind.pas} 
{$I ActiveValidateCom.pas}

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain; 
begin
    
   This_NPC.NpcDialog(This_Player,
   '沙巴克就在盟重，你想去一睹沙巴克城主的风采吗？\ \'
   +'|{cmd}<进入庄园/@baodian>      ^<关于PK/@pk>\'
   +'|{cmd}<想去商店/@move0>          ^<想去毒蛇山谷/@moveDS>\'
   +'|{cmd}<想去苍月岛/@move4>          ^<洞穴传送/@goMonMap>\' 
   +'|{cmd}<退出/@exit>'
   +ActiveValidateStr
   );

end;

procedure _moveDS; 
begin
This_Player.Flyto('2',500,485);
end;

procedure _goMonMap;
begin
    This_NPC.NpcDialog(This_Player,
    '你想去哪里？我可以送你一程。\ \'
    +'|{cmd}<前往祖玛洞穴/@goToMonMap_1>              ^<前往蜈蚣洞穴/@goToMonMap_2>\'
    +'|{cmd}<前往石墓洞穴/@goToMonMap_3>              ^<前往毒蛇矿区/@goToMonMap_4>\'
    +'|{cmd}<返回/@main>\ '
    );
end;

procedure _goToMonMap_1; 
begin 
    if This_Player.MapName = '3' then 
    This_Player.Flyto('3',855 + random(3) - 1,185 + random(3) - 1); 
end;

procedure _goToMonMap_2; 
begin 
    if This_Player.MapName = '3' then 
    This_Player.Flyto('3',143 + random(3) - 1,98 + random(3) - 1); 
end;

procedure _goToMonMap_3; 
begin 
    if This_Player.MapName = '3' then 
    This_Player.Flyto('3',295 + random(3) - 1,340 + random(3) - 1); 
end;

procedure _goToMonMap_4; 
begin 
    if This_Player.MapName = '3' then 
    This_Player.Flyto('2',555 + random(3) - 1,175 + random(3) - 1); 
end;

procedure _move6;
begin
   if compareText(This_Player.MapName,'3') = 0 then
      This_Player.Flyto('6',121,154);
end;

procedure _baodian;
begin
  This_Npc.NpcDialog(This_Player,
  '通过庄园内的“元宝使者”，能与其他玩家进行元宝交易，\您现在要去庄园吗?\ \'
  +'|{cmd}<前往庄园/@zhuangyuan>'
  );
end;

procedure _zhuangyuan;
var temp: integer;
//随机5个点传送
begin
  temp := random(5)+1;
  if This_Player.Level >= 8 then
  begin
    if compareText(This_Player.MapName, '3') = 0 then
    begin
        if temp = 1 then
        begin
        This_Player.Flyto('GA0',59,46);
        end
        else if temp = 2 then
        begin
        This_Player.Flyto('GA0',57,61);
        end
        else if temp = 3 then
        begin
        This_Player.Flyto('GA0',71,72);
        end
        else if temp = 4 then
        begin
        This_Player.Flyto('GA0',59,75);
        end
        else
        begin
        This_Player.Flyto('GA0',67,83);
        end;
    end;  
  end
  else
    This_Npc.NpcDialog(This_Player,
    '你的能力不够，我还不能送你去那里，\当您达到8级的时候再来找我吧！\'
    );  
end;
procedure _move4; 
begin
This_Player.Flyto('5',140,330);
end;


procedure _pk; 
begin
   This_NPC.NpcDialog(This_Player,
   '如果遇到PK的人，可要自己保重哦！虽然说PK的人\'
   +'会受到流放的处罚，可这是在他们死亡以后进行的。\'
   +'奉劝大家不要PK，流放到边疆以后的日子可不好过，\'
   +'相信每一个在流放村里孤苦伶仃，没有装备，没有\'
   +'补给的度过日子的人都会同意我这句话。\'
   +'差点忘了告诉大家，沙巴克离流放地最近，是一个\'
   +'流放犯出没的区域，千万小心财不露白哦！\\'
   +'|{cmd}<返回/@main>'
   );

end;

procedure _speed; 
begin
   This_NPC.NpcDialog(This_Player,
   '觉得速度慢,其实有很多原因，如果你不在上海，那么最有可\'
   +'能的就是因为跨地区，网络不够通畅。所以，你千万要记得\'
   +'在www.mir2.com.cn报告，这样才可以让盛大网络\'
   +'尽快在你的区域安装服务器呀。\'
   +'最后提醒一句，这个网站有比我更详细的帮助可以看。\\\ '
   +'|{cmd}<返回/@main>'
   );

end;

procedure _move0; 
begin
   This_NPC.NpcDialog(This_Player,
   '你想到哪个商店？这可是免费体验服务啊！\\'
   +'|{cmd}<服装店/@move01>\'
   +'|{cmd}<武器店/@move02>\'
   +'|{cmd}<首饰店/@move03>\'
   +'|{cmd}<书店/@move04>\'
   +'|{cmd}<仓库/@move05>\'
   +'|{cmd}<返回/@main>'
   
   );

end;

procedure _move01; 
begin
This_Player.RandomFlyTo('0149');
end;

procedure _move02; 
begin
This_Player.RandomFlyTo('0159');
end;

procedure _move03; 
begin
This_Player.RandomFlyTo('0158');
end;

procedure _move04; 
begin
This_Player.RandomFlyTo('0161');
end;

procedure _move05; 
begin
This_Player.RandomFlyTo('0145');
end;



begin
    domain; 
end.