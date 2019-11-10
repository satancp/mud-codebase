{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务 
procedure dorenwu11;
begin
  This_Npc.NpcDialog(This_Player,
  '想要知道历练的技巧，很简单！我这里有多种多样的技能书籍，\'+
  '你可以按照自身等级挑选一本，若我这里没有，也可以去各地\'+
  '(比奇、盟重、白日门)的书店老板处找寻符合自身职业的技能书，\'+
  '它将大大帮助你提升自身的能力。现在作为考验去城外帮我\'+
  '杀10个稻草人吧！\ \'+
  '|{cmd}<我接受(任务)/@renwu12>'
  );
end;

procedure dorenwu12;
begin
 if (This_Player.GetV(102,1)=7) then
 begin
 This_Npc.NpcDialog(This_Player,
 '对了，去城外帮我<杀10个稻草人/c=red>时请记住，年轻人，\'+
 '出城后可是非常危险的，请随时带好药品。另外，\'+
 '在城外的怪物会经常掉落一些装备，若你有机会获得，\'+
 '可以根据属性，选择自己佩戴或卖给商店获取金币。祝你好运！\ \'+
 '|{cmd}<我接受(任务)/@renwu13>'
 );
 end else
 begin
 This_Player.Give('经验',5000)
 This_Player.SetV(102,1,7);
 This_Player.UpdateTaskDetail(102,1);
 This_Npc.NpcDialog(This_Player,
 '对了，去城外帮我<杀10个稻草人/c=red>时请记住，年轻人，\'+
 '出城后可是非常危险的，请随时带好药品。另外，\'+
 '在城外的怪物会经常掉落一些装备，若你有机会获得，\'+
 '可以根据属性，选择自己佩戴或卖给商店获取金币。祝你好运！\ \'+
 '|{cmd}<我接受(任务)/@renwu13>'
 );
 end;
end;

procedure _renwu12;
begin
 if (This_Player.GetV(102,1)=7) then
 begin
 This_Npc.NpcDialog(This_Player,
 '对了，去城外帮我<杀10个稻草人/c=red>时请记住，年轻人，\'+
 '出城后可是非常危险的，请随时带好药品。另外，\'+
 '在城外的怪物会经常掉落一些装备，若你有机会获得，\'+
 '可以根据属性，选择自己佩戴或卖给商店获取金币。祝你好运！\ \'+
 '|{cmd}<我接受(任务)/@renwu13>'
 );
 end else
 begin
 This_Player.Give('经验',10000)
 This_Player.SetV(102,1,7);
 This_Player.UpdateTaskDetail(102,1);
 This_Npc.NpcDialog(This_Player,
 '对了，去城外帮我<杀10个稻草人/c=red>时请记住，年轻人，\'+
 '出城后可是非常危险的，请随时带好药品。另外，\'+
 '在城外的怪物会经常掉落一些装备，若你有机会获得，\'+
 '可以根据属性，选择自己佩戴或卖给商店获取金币。祝你好运！\ \'+
 '|{cmd}<我接受(任务)/@renwu13>'
 );
 end;
end;

procedure dorenwu13;
begin
 This_Npc.NpcDialog(This_Player,
 '你现在赶紧去城外消灭10个稻草人吧！\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;


procedure _renwu13;
begin
if (This_Player.GetV(102,1)=8) then
 begin
  This_Npc.NpcDialog(This_Player,
 '你现在赶紧去城外消灭10个稻草人吧！\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(102,1,8);        //任务标记
  This_Player.UpdateTaskDetail(102,1);
  This_Player.SetV(102,2,0);
  This_Player.Give('经验',5000);
  This_Npc.CloseDialog(This_Player);
  //自动寻路稻草人 
 end;  
end;

procedure dorenwu14;
begin
 This_Npc.NpcDialog(This_Player,
 '那么快就杀完啦！对了，<仓库保管员/c=red>那里好像有些麻烦事，\'+
 '你去看看能不能帮助他吧。\ \'+
 '|{cmd}<我接受(任务)/@renwu15>\ \'
 );
end;

procedure _renwu15;
begin
 if (This_Player.GetV(102,1)=10) then
 begin
  This_Npc.NpcDialog(This_Player,
 '对了，<仓库保管员/c=red>那里好像有些麻烦事，\'+
 '你去看看能不能帮助他吧。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(102,1,10);        //任务标记
  This_Player.UpdateTaskDetail(102,1);
  This_Player.Give('经验',10000);
  This_Npc.CloseDialog(This_Player);
  //This_player.AutoGotoMap('0',300,257);   //自动寻路仓库 
 end;  
end; 

procedure dorenwu15;
begin
  This_Npc.NpcDialog(This_Player,
 '对了，<仓库保管员/c=red>那里好像有些麻烦事，\'+
 '你去看看能不能帮助他吧。\ \ \'+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

//==============================================================新手任务 

Procedure domain;
var
  CZRW102 : integer;
begin
   CZRW102 := This_Player.GetV(102,1);
   if (CZRW102 >= 6) and (CZRW102 <= 10) then
   begin
      if This_Player.Level >= 22 then
      begin
         This_Npc.NpcDialog(This_Player,
         '欢迎，你想买些修炼的书吗？\ \'
         +'|{cmd}<买书/@buy>  \'
         +'|{cmd}<卖书/@sell>   \'
         +'|{cmd}<询问各种武技的细节/@helpbooks> \ \'
         //+'|{cmd}<成长任务：如何成为玛法勇士/@ExtraBQSD>'
         );
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '欢迎，你想买些修炼的书吗？\ \'
         +'|{cmd}<买书/@buy>  \'
         +'|{cmd}<卖书/@sell>  \'
         +'|{cmd}<询问各种武技的细节/@helpbooks> \ \'
         //+'|{cmd}<成长任务：如何成为玛法勇士/@ExtraBQSD>'
         );         
      end;
   end else
   begin
      if This_Player.Level >= 22 then
      begin 
         This_Npc.NpcDialog(This_Player,
         '欢迎，你想买些修炼的书吗？\ \'
         +'|{cmd}<买书/@buy>  \'
         +'|{cmd}<卖书/@sell>   \'
         +'|{cmd}<询问各种武技的细节/@helpbooks> \');
      end else 
      begin
         This_Npc.NpcDialog(This_Player,
         '欢迎，你想买些修炼的书吗？\ \'
         +'|{cmd}<买书/@buy>  \'
         +'|{cmd}<卖书/@sell>   \'
         +'|{cmd}<询问各种武技的细节/@helpbooks>         \');
      end;
   end;
end;

Procedure _FiveYBHBao;
begin
   This_Npc.NpcDialog(This_Player,
   '现在你有一次机会获得超值新手大礼包，<双倍宝典/c=red>、\'+
   '|{cmd}<魔血石(大)以及8张限时灵符/c=red>，\'+
   '总共<价值38元宝/c=red>的超值特惠大礼一起赠送给你！\'+
   '本礼包只<可获得一次/c=red>，等级超过<22级/c=red>将不可领取 \'+
   '|{cmd}<使用5元宝领取超值新手大礼包/@FiveYBHBao_01>');
   
   if This_Player.GetV(111,4) = 1 then
   begin
      if This_Player.SetV(111,4,10) then
      begin
         This_Player.Give('经验',10000);
         This_Player.PlayerNotice('你已经完成了成长之路：新手大礼包任务。',2);
         //#This_Player.DeleteTaskFromUIList(1004);
      end;
   end;   
end;

Procedure _FiveYBHBao_01;
begin
   if This_Player.GetV(16,96) = 100 then
   begin
      This_NPC.NpcDialog(This_Player,
      '你只有一次机会获得新手大礼包，不能重复获取！');
   end else if This_Player.FreeBagNum < 5  then
   begin
      This_NPC.NpcDialog(This_Player,
      '你的包裹太满，请至少整理出5个包裹位之后再来换取！');
   end else if not This_Player.NewBieGiftConsume then
   begin
      This_NPC.NpcDialog(This_Player,
      '你的元宝不够.');
   end;  
end;

Procedure NewBieGiftConsumeOK;
begin  
   //This_Player.Give('聚灵珠(小)',1);
   This_Player.Give('双倍宝典',1);
   //This_Player.Give('神秘天赐',1);
   //This_Player.Give('神秘钥匙',1);
   This_Player.Give('魔血石(大)',1);
   This_Player.AddLimLF(0,8);
   This_Player.SetV(16,96,100);
   This_NPC.CloseDialog(This_Player);
end;

procedure _ExtraBQSD;
var
  CRW102 : integer;
begin
   CRW102 := This_Player.GetV(102,1);
   if CRW102 = 10 then
   begin
      dorenwu15;
   end
   else if CRW102 = 9 then
   begin
      dorenwu14;
   end
   else if CRW102 = 8 then
   begin
      dorenwu13;
   end
   else if CRW102 = 7 then
   begin
     dorenwu12;
   end
   else if CRW102 = 6 then
   begin
     dorenwu11;
   end;
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请选择你想要买的书。\ \ \|{cmd}<返回/@main>');
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '给我看看你的书。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _drink;
begin
  This_Npc.NpcDialog(This_Player, 
    '当年为了抵抗半兽人的侵略，玛法人从遥远的东方请来了一名术士，\研制出一种特殊技能，这种特殊技能的作用在于修炼后将会在人体\本身产生一种隐性的能量，而它的神奇之处在于，当处于醉酒状态\时能够增强人体的体力，加强战斗力。随着历史的推延，玛法人早就\忘记了这本技能书的真正作用，你现在就可以去找盟重书店老板，\他可以帮你学习这个技能。\'
    );
end;

procedure _helpbooks;
begin
  This_Npc.NpcDialog(This_Player, 
    '你对那种书感兴趣？\ \武士可以学<基本剑术/@help11>和<攻杀剑术/@help12>\魔法师可以学<火球术/@help21>和<大火球/@help22>\道士可以学<治愈术/@help31>,<精神力战法/@help32>和<施毒术/@help33>\ \ |{cmd}<返回/@main>'
    );
end;

procedure _help11;
begin
  This_Npc.NpcDialog(This_Player, 
    '基本剑术你可以按如下步骤修炼：\Lv.1 : 你可以在第 7 级开始修炼\Lv.2 : 你可以在第 11 级开始修炼\Lv.3 : 你可以在第 16 级开始修炼\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help12;
begin
  This_Npc.NpcDialog(This_Player, 
    '攻杀剑术你可以按如下步骤修炼：\Lv.1 : 你可以在第 19 级开始修炼。\Lv.2 : 你可以在第 22 级开始修炼。\Lv.3 : 你可以在第 24 级开始修炼。\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help21;
begin
  This_Npc.NpcDialog(This_Player, 
    '火球术你可以按如下步骤修炼：\Lv.1: 你可以在第 7 级开始修炼。\Lv.2: 你可以在第 11 级开始修炼。\Lv.3: 你可以在第 16 级开始修炼。\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help22;
begin
  This_Npc.NpcDialog(This_Player, 
    '大火球你可以按如下步骤修炼：\Lv.1: 你可以在第 19 级开始修炼。\Lv.2: 你可以在第 23 级开始修炼。\Lv.3: 你可以在第 25 级开始修炼。\ \ |{cmd}<返回/@helpbooks>'
    );
end; 

procedure _help31;
begin
  This_Npc.NpcDialog(This_Player, 
    '治愈术你可以按如下步骤修炼：\Lv.1 : 你可以在第 7 级开始修炼.\Lv.2 : 你可以在第 11 级开始修炼.\Lv.3 : 你可以在第 16 级开始修炼.\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help32;
begin
  This_Npc.NpcDialog(This_Player, 
    '精神力战法你可以按如下步骤修炼：\Lv.1 : 你可以在第 9 级开始修炼.\Lv.2 : 你可以在第 13 级开始修炼.\Lv.3 : 你可以在第 19 级开始修炼.\ \ |{cmd}<返回/@helpbooks>'
    );
end;

procedure _help33;
begin
  This_Npc.NpcDialog(This_Player, 
    '施毒术你可以按如下步骤修炼：\Lv.1 : 你可以在第 14 级开始修炼.\Lv.2 : 你可以在第 17 级开始修炼.\Lv.3 : 你可以在第 20 级开始修炼.\ \ |{cmd}<返回/@helpbooks>'
    );
end;

//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(4);
  This_NPC.FillGoods('火球术', 100, 1);
  This_NPC.FillGoods('治愈术', 100, 1); 
  This_NPC.FillGoods('基本剑术', 100, 1);
  This_NPC.FillGoods('精神力战法', 100, 1);
  This_NPC.FillGoods('施毒术', 100, 1);
  This_NPC.FillGoods('大火球', 100, 1);
  This_NPC.FillGoods('抗拒火环', 100, 1);
  This_NPC.FillGoods('灵魂火符', 100, 1);
  This_NPC.FillGoods('雷电术', 100, 1);
  This_NPC.FillGoods('攻杀剑术', 100, 1);
  This_NPC.FillGoods('刺杀剑术', 100, 1); 
  This_NPC.FillGoods('半月弯刀', 100, 1);
  This_NPC.FillGoods('野蛮冲撞', 100, 1);
 
  This_NPC.FillGoods('召唤骷髅', 100, 1);
  This_NPC.FillGoods('隐身术', 100, 1);
  This_NPC.FillGoods('集体隐身术', 100, 1);
  This_NPC.FillGoods('幽灵盾', 100, 1);
  This_NPC.FillGoods('神圣战甲术', 100, 1);
  This_NPC.FillGoods('心灵启示', 100, 1);
  This_NPC.FillGoods('困魔咒', 100, 1); 
  This_NPC.FillGoods('群体治愈术', 100, 1);
 
  This_NPC.FillGoods('诱惑之光', 100, 1);
  This_NPC.FillGoods('地狱火', 100, 1);
  This_NPC.FillGoods('瞬息移动', 100, 1);
  This_NPC.FillGoods('爆裂火焰', 100, 1);
  This_NPC.FillGoods('火墙', 100, 1);
  This_NPC.FillGoods('疾光电影', 100, 1);
  This_NPC.FillGoods('地狱雷光', 100, 1);
  This_NPC.FillGoods('魔法盾', 100, 1);
  This_NPC.FillGoods('圣言术', 100, 1);

  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.    