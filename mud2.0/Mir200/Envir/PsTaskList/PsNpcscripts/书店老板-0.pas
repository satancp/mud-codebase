{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure domain;
begin
   if This_Player.GetS(80,7) <> 2016 then
   begin
   This_NPC.NpcDialog(This_Player,
   '欢迎，你想买些修炼的书吗？\ \'
   +'|{cmd}<买书/@buy>                     \'   //^<新手礼包/@NewComeBag> 
   +'|{cmd}<卖书/@sell>   \'
   +'|{cmd}<询问各种武技的细节/@helpbooks>  \'
   +'|{cmd}<取消/@exit>'
   );
   end else
   This_NPC.NpcDialog(This_Player,
   '欢迎，你想买些修炼的书吗？\ \'
   +'|{cmd}<买书/@buy>                    \'
   +'|{cmd}<卖书/@sell>   \'
   +'|{cmd}<询问各种武技的细节/@helpbooks>  \'
   +'|{cmd}<取消/@exit>'
   );
end;

procedure _NewComeBag;
begin
   This_Npc.NpcDialog(This_Player,
   '嘿，年轻人，欢迎你来到比奇。看到你们，就想起当年的我。\'
   +'我为你准备了一份礼物，你只需要花费8元宝就可以拿到手了。\'
   +'礼包中有<随机传送石(绑)、比奇传送石(绑)、盟重传送石(绑)/c=red>\'
   +'<和2个精力水晶/c=red>。\'
   +'每人只可获得一份，机不可失，失不再来，考虑考虑吧。 \ \' 
   +'|{cmd}<使用8元宝购买/@NewComeBag_1>\'
   +'|{cmd}<返回/@main>'
   );
end;  

procedure _NewComeBag_1;
begin
   if This_Player.GetS(80,7) <> 2016 then
   begin
     if This_Player.FreeBagNum > 3 then
     begin
       This_Player.PsYBConsum(This_NPC,'YB_NewComeBag',20157,8,1);    
     end else
     begin
       This_Npc.NpcDialog(This_Player,
       '你的包裹满了，请先预留4个以上包裹空间再来找我吧！'
       ); 
     end;
   end;
end;

function YB_NewComeBag(price, num: Integer):boolean;
begin
  This_Player.SetS(80,7,2016); 
  This_Player.Give('随机传送石(绑)',1);
  This_Player.Give('比奇传送石(绑)',1);
  This_Player.Give('盟重传送石(绑)',1);
  This_Player.Give('精力水晶',2);
  This_Player.IncActivePoint(8);  //增加活跃度8点
  This_Npc.NpcDialog(This_Player,
  '你获得了：随机传送石(绑)、比奇传送石(绑)、盟重传送石(绑)\'+
  '和2个精力水晶。'
  ); 
end;


Procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '给我看看你的书。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Sell(This_Player);
end;



Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   '请选择你想要买的书。\ \ \'+
   '|{cmd}<返回/@main>');
   This_Npc.Click_Buy(This_Player);
end;


procedure _helpbooks;
begin
   This_NPC.NpcDialog(This_Player,
   '你对哪种书感兴趣？\ \'
   +'武士可以学<基本剑术/@help11>和<攻杀剑术/@help12>\'
   +'魔法师可以学 <火球术/@help21>, <大火球/@help22>,\'
   +'<爆裂火焰/@help23>和<雷电术/@help24>,\'
   +'道士可以学<治愈术/@help31>,<精神力战法/@help32>,\'
   +'<施毒术/@help33>\ \'
   +'|{cmd}<返回/@main>'
   
   
   
   );

end;

procedure _help11;
begin

   This_NPC.NpcDialog(This_Player,
   '基本剑术你可以按如下步骤修炼：\'
   +'|Lv.1 : 你可以在第 7 级开始修炼\'
   +'|Lv.2 : 你可以在第 11 级开始修炼\'
   +'|Lv.3 : 你可以在第 16 级开始修炼\\'
   +'|{cmd}<返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help12;
begin
   This_NPC.NpcDialog(This_Player,
   '攻杀剑术你可以按如下步骤修炼：\'
   +'|Lv.1 : 你可以在第 20 级开始修炼。\'
   +'|Lv.2 : 你可以在第 22 级开始修炼。\'
   +'|Lv.3 : 你可以在第 24 级开始修炼。\\'
   +'|{cmd}<返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help21;
begin

   This_NPC.NpcDialog(This_Player,
   '火球术你可以按如下步骤修炼：\'
   +'|Lv.1: 你可以在第 7 级开始修炼。\'
   +'|Lv.2: 你可以在第 11 级开始修炼。\'
   +'|Lv.3: 你可以在第 16 级开始修炼。\\'
   +'|{cmd}<返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help22;
begin
   This_NPC.NpcDialog(This_Player,
   '大火球你可以按如下步骤修炼：\'
   +'|Lv.1: 你可以在第 19 级开始修炼。\'
   +'|Lv.2: 你可以在第 23 级开始修炼。\'
   +'|Lv.3: 你可以在第 25 级开始修炼。\\'
   +'|{cmd}<返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help23;
begin
   This_NPC.NpcDialog(This_Player,
   '爆裂火焰你可以按如下步骤修炼：\'
   +'|Lv.1: 你可以在第 22 级开始修炼。\'
   +'|Lv.2: 你可以在第 27 级开始修炼。\'
   +'|Lv.3: 你可以在第 31 级开始修炼。\\'
   +'|{cmd}<返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help24;
begin
   This_NPC.NpcDialog(This_Player,
   '雷电术你可以按如下步骤修炼：\'
   +'|Lv.1: 你可以在第 17 级开始修炼。\'
   +'|Lv.2: 你可以在第 20 级开始修炼。\'
   +'|Lv.3: 你可以在第 23 级开始修炼。\\'
   +'|{cmd}<返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help31;
begin
   This_NPC.NpcDialog(This_Player,
   '治愈术你可以按如下步骤修炼：\'
   +'|Lv.1 : 你可以在第 7 级开始修炼.\'
   +'|Lv.2 : 你可以在第 11 级开始修炼.\'
   +'|Lv.3 : 你可以在第 16 级开始修炼. \\'
   +'|  <返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help32;
begin
   This_NPC.NpcDialog(This_Player,
   '精神力战法你可以按如下步骤修炼：\'
   +'|Lv.1 : 你可以在第 9 级开始修炼.\'
   +'|Lv.2 : 你可以在第 13 级开始修炼.\'
   +'|Lv.3 : 你可以在第 19 级开始修炼.\\'
   +'|{cmd}<返回/@helpbooks>'
   
   
   
   
   
   );

end;

procedure _help33;
begin
   This_NPC.NpcDialog(This_Player,
   '施毒术你可以按如下步骤修炼：\'
   +'|Lv.1 : 你可以在第 14 级开始修炼.\'
   +'|Lv.2 : 你可以在第 17 级开始修炼.\'
   +'|Lv.3 : 你可以在第 20 级开始修炼.\\'
   +'|{cmd}<返回/@helpbooks>'
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
  This_NPC.FillGoods('大火球', 100, 1);
  This_NPC.FillGoods('攻杀剑术', 100, 1);
  This_NPC.FillGoods('施毒术', 100, 1);
  This_NPC.FillGoods('抗拒火环', 100, 1);
  This_NPC.FillGoods('地狱火', 100, 1);
  This_NPC.FillGoods('雷电术', 100, 1);
  This_NPC.FillGoods('疾光电影', 100, 1);
  This_NPC.FillGoods('灵魂火符', 100, 1);
  This_NPC.FillGoods('幽灵盾', 100, 1);
  This_NPC.FillGoods('神圣战甲术', 100, 1);
  This_NPC.FillGoods('刺杀剑术', 100, 1);
  This_NPC.FillGoods('困魔咒', 100, 1);
  This_NPC.FillGoods('召唤骷髅', 100, 1);
  This_NPC.FillGoods('隐身术', 100, 1);
  This_NPC.FillGoods('集体隐身术', 100, 1);
  This_NPC.FillGoods('诱惑之光', 100, 1);
  This_NPC.FillGoods('瞬息移动', 100, 1);
  This_NPC.FillGoods('火墙', 100, 1);
  This_NPC.FillGoods('爆裂火焰', 100, 1);
  This_NPC.FillGoods('地狱雷光', 100, 1);
  This_NPC.FillGoods('半月弯刀', 100, 1);
  This_NPC.FillGoods('野蛮冲撞', 100, 1);
  This_NPC.FillGoods('心灵启示', 100, 1);
  This_NPC.FillGoods('群体治愈术', 100, 1);
  This_NPC.FillGoods('魔法盾', 100, 1);
  This_NPC.FillGoods('圣言术', 100, 1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.    