{
*******************************************************************}

Program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;                         
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _hcsuipian;                         
begin
   This_Npc.NpcDialog(This_Player,
   '你好，您是来合成战神、真魂、圣魔装备的吗？\'+
   '如果你带来了6个战神碎片，就可以合成一件装备。\'+
   '这件装备将是战神、真魂、圣魔装备中随机产生的一件。\'+
   '但是由于这些装备的力量实在是太过于强大，我无法解开\'+
   '禁锢他们的力量。\ \'+
   '|{cmd}<合成战神碎片/@hcsuipian01>');
end;

procedure _hcsuipian01;                         
begin
   if This_Player.GetBagItemCount('战神碎片') >= 6 then
   begin
      This_Player.Take('战神碎片',6);
      This_NPC.GiveConfigPrize(This_Player, 10, This_Player.Name + '在苍月锻造师处使用战神碎片合成了：<$GIFTITEM>！')
      This_NPC.CloseDialog(This_Player);
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你没有带来6块战神碎片，赶快去寻找吧！');
   end;
end;

procedure _duanzao;                         
begin
   This_Npc.NpcDialog(This_Player,
   '请选择想要锻造的首饰，只要有足够的原料，就放心交给我吧。\'+
   '|{cmd}<雷霆战戒/@leijie>           ^<雷霆护腕/@leiwan>          ^<雷霆项链/@leilian>\'+
   '|{cmd}<雷霆战靴/@leixue>           ^<雷霆腰带/@leidai>\'+
   '|{cmd}<烈焰魔戒/@liejie>           ^<烈焰护腕/@liewan>          ^<烈焰项链/@lielian>\'+
   '|{cmd}<烈焰魔靴/@liexue>           ^<烈焰腰带/@liedai>\'+
   '|{cmd}<光芒道戒/@guangjie>           ^<光芒护腕/@guangwan>          ^<光芒项链/@guanglian>\'+
   '|{cmd}<光芒道靴/@guangxue>           ^<光芒腰带/@guangdai>\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure DuanZaoMB(tu01:string; tu02:string; tu03:string; tu04:string; DZItem:string);
Begin
   if ( This_Player.GetBagItemCount(tu01) >= 1 ) and ( This_Player.GetBagItemCount(tu02) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu03) >= 1 ) and ( This_Player.GetBagItemCount(tu04) >= 1 ) 
      and ( This_Player.MyDiamondnum >= 300) then
   begin
      This_Player.Take(tu01,1);
      This_Player.Take(tu02,1);
      This_Player.Take(tu03,1);
      This_Player.Take(tu04,1);
      This_Player.TakeDiamond(300,This_Npc);
      This_Player.Give(DZItem,1);
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
end;

procedure _guangdai;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成光芒腰带所需物品：\'+
   '金刚石：300\'+
   '四个钢铁腰带\ \'+
   '进行<锻造/@makeguangdai>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeguangdai;
Begin
   DuanZaoMB('钢铁腰带','钢铁腰带','钢铁腰带','钢铁腰带','光芒腰带');
end;

procedure _guangxue;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成光芒道靴所需物品：\'+
   '金刚石：300\'+
   '四个避魂靴\ \'+
   '进行<锻造/@makeguangxue>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeguangxue;
Begin
   DuanZaoMB('避魂靴','避魂靴','避魂靴','避魂靴','光芒道靴');
end;

procedure _guanglian;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成光芒项链所需物品：\'+
   '金刚石：300\'+
   '四个天尊项链\ \'+
   '进行<锻造/@makeguanglian>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeguanglian;
Begin
   DuanZaoMB('天尊项链','天尊项链','天尊项链','天尊项链','光芒项链');
end;

procedure _guangjie;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成光芒道戒所需物品：\'+
   '金刚石：300\'+
   '四个天尊戒指\ \'+
   '进行<锻造/@makeguangjie>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeguangjie;
Begin
   DuanZaoMB('天尊戒指','天尊戒指','天尊戒指','天尊戒指','光芒道戒');
end;

procedure _guangwan;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成光芒护腕所需物品：\'+
   '金刚石：300\'+
   '四个天尊手镯\ \'+
   '进行<锻造/@makeguangwan>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeguangwan;
Begin
   DuanZaoMB('天尊手镯','天尊手镯','天尊手镯','天尊手镯','光芒护腕');
end;

procedure _liedai;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成烈焰腰带所需物品：\'+
   '金刚石：300\'+
   '四个钢铁腰带\ \'+
   '进行<锻造/@makeliedai>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeliedai;
Begin
   DuanZaoMB('钢铁腰带','钢铁腰带','钢铁腰带','钢铁腰带','烈焰腰带');
end;

procedure _liexue;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成烈焰魔靴所需物品：\'+
   '金刚石：300\'+
   '四个避魂靴\ \'+
   '进行<锻造/@makeliexue>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeliexue;
Begin
   DuanZaoMB('避魂靴','避魂靴','避魂靴','避魂靴','烈焰魔靴');
end;

procedure _lielian;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成烈焰项链所需物品：\'+
   '金刚石：300\'+
   '四个法神项链\ \'+
   '进行<锻造/@makelielian>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makelielian;
Begin
   DuanZaoMB('法神项链','法神项链','法神项链','法神项链','烈焰项链');
end;

procedure _liewan;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成烈焰护腕所需物品：\'+
   '金刚石：188\'+
   '四个法神手镯\ \'+
   '进行<锻造/@makeliewan>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeliewan;
Begin
   DuanZaoMB('法神手镯','法神手镯','法神手镯','法神手镯','烈焰护腕');
end;

procedure _liejie;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成烈焰魔戒所需物品：\'+
   '金刚石：300\'+
   '四个法神戒指\ \'+
   '进行<锻造/@makeliejie>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeliejie;
Begin
   DuanZaoMB('法神戒指','法神戒指','法神戒指','法神戒指','烈焰魔戒');
end;

procedure _leidai;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成雷霆腰带所需物品：\'+
   '金刚石：300\'+
   '四个钢铁腰带\ \'+
   '进行<锻造/@makeleidai>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeleidai;
Begin
   DuanZaoMB('钢铁腰带','钢铁腰带','钢铁腰带','钢铁腰带','雷霆腰带');
end;

procedure _leixue;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成雷霆战靴所需物品：\'+
   '金刚石：300\'+
   '避魂靴\ \'+
   '进行<锻造/@makeleixue>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeleixue;
Begin
   DuanZaoMB('避魂靴','避魂靴','避魂靴','避魂靴','雷霆战靴');
end;

procedure _leilian;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成雷霆项链所需物品：\'+
   '金刚石：300\'+
   '四个圣战项链\ \'+
   '进行<锻造/@makeleilian>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeleilian;
Begin                           
   DuanZaoMB('圣战项链','圣战项链','圣战项链','圣战项链','雷霆项链');
end;

procedure _leiwan;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成雷霆护腕所需物品：\'+
   '金刚石：300\'+
   '四个圣战手镯\ \'+
   '进行<锻造/@makeleiwan>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeleiwan;
Begin
   DuanZaoMB('圣战手镯','圣战手镯','圣战手镯','圣战手镯','雷霆护腕');
end;

procedure _leijie;                         
begin
   This_Npc.NpcDialog(This_Player,
   '合成雷霆战戒所需物品：\'+
   '金刚石：300\'+
   '四个圣战戒指\ \'+
   '进行<锻造/@makeleijie>\'+
   '|{cmd}<返回查看配方/@duanzao>\'+
   '|{cmd}<关闭/@exit>');
end;

Procedure _makeleijie;
Begin
   DuanZaoMB('圣战戒指','圣战戒指','圣战戒指','圣战戒指','雷霆战戒');
end;

procedure _AFoundryList;
begin
  This_Npc.FoundryList(This_Player);
end;

procedure _DiaPeif_0;
begin
  This_Npc.DiaPeif(This_Player, 0);
end;

procedure _DiaPeif_1;
begin
  This_Npc.DiaPeif(This_Player, 1);
end;

procedure _DiaPeif_2;
begin
  This_Npc.DiaPeif(This_Player, 2);
end;

procedure _DiaPeif_3;
begin
  This_Npc.DiaPeif(This_Player, 3);
end;

procedure _DiaPeif_4;
begin
  This_Npc.DiaPeif(This_Player, 4);
end;

procedure _DiaPeif_5;
begin
  This_Npc.DiaPeif(This_Player, 5);
end;

procedure _DiaPeif_6;
begin
  This_Npc.DiaPeif(This_Player, 6);
end;

procedure _DiaPeif_7;
begin
  This_Npc.DiaPeif(This_Player, 7);
end;

procedure _DiaPeif_8;
begin
  This_Npc.DiaPeif(This_Player, 8);
end;

procedure _DiaPeif_9;
begin
  This_Npc.DiaPeif(This_Player, 9);
end;

procedure _DiaPeif_10;
begin
  This_Npc.DiaPeif(This_Player, 10);
end;

procedure _DiaPeif_11;
begin
  This_Npc.DiaPeif(This_Player, 11);
end;

procedure _DiaPeif_12;
begin
  This_Npc.DiaPeif(This_Player, 12);
end;

procedure _DiaPeif_13;
begin
  This_Npc.DiaPeif(This_Player, 13);
end;

procedure _DiaPeif_14;
begin
  This_Npc.DiaPeif(This_Player, 14);
end;

procedure _DiaPeif_15;
begin
  This_Npc.DiaPeif(This_Player, 15);
end;

procedure _DiaPeif_16;
begin
  This_Npc.DiaPeif(This_Player, 16);
end;

procedure _DiaPeif_17;
begin
  This_Npc.DiaPeif(This_Player, 17);
end;

procedure _DiaPeif_18;
begin
  This_Npc.DiaPeif(This_Player, 18);
end;

procedure _DiaPeif_19;
begin
  This_Npc.DiaPeif(This_Player, 19);
end;

procedure _DiaPeif_20;
begin
  This_Npc.DiaPeif(This_Player, 20);
end;

procedure _DiaPeif_21;
begin
  This_Npc.DiaPeif(This_Player, 21);
end;

procedure _DiaPeif_22;
begin
  This_Npc.DiaPeif(This_Player, 22);
end;

procedure _DiaPeif_23;
begin
  This_Npc.DiaPeif(This_Player, 23);
end;

procedure _DiaPeif_24;
begin
  This_Npc.DiaPeif(This_Player, 24);
end;

procedure _DiaPeif_25;
begin
  This_Npc.DiaPeif(This_Player, 25);
end;

procedure _DiaPeif_26;
begin
  This_Npc.DiaPeif(This_Player, 26);
end;

procedure _DiaPeif_27;
begin
  This_Npc.DiaPeif(This_Player, 27);
end;

procedure _DiaPeif_28;
begin
  This_Npc.DiaPeif(This_Player, 28);
end;

procedure _DiaPeif_29;
begin
  This_Npc.DiaPeif(This_Player, 29);
end;

procedure _DiaPeif_30;
begin
  This_Npc.DiaPeif(This_Player, 30);
end;

procedure _DiaPeif_31;
begin
  This_Npc.DiaPeif(This_Player, 31);
end;

procedure _DiaPeif_32;
begin
  This_Npc.DiaPeif(This_Player, 32);
end;

procedure _DiaPeif_33;
begin
  This_Npc.DiaPeif(This_Player, 33);
end;

procedure _DiaPeif_34;
begin
  This_Npc.DiaPeif(This_Player, 34);
end;

procedure _DiaPeif_35;
begin
  This_Npc.DiaPeif(This_Player, 35);
end;

procedure _DiaPeif_36;
begin
  This_Npc.DiaPeif(This_Player, 36);
end;

procedure _DiaPeif_37;
begin
  This_Npc.DiaPeif(This_Player, 37);
end;

procedure _DiaPeif_38;
begin
  This_Npc.DiaPeif(This_Player, 38);
end;

procedure _DiaPeif_39;
begin
  This_Npc.DiaPeif(This_Player, 39);
end;


procedure _MakeDiamondItem;
begin
  This_Npc.MakeItemUseDiam(This_Player);
end;

Procedure _foundrylist;
begin
   This_Npc.FoundryList(This_Player);
end;



//脚本执行的入口
Begin
   This_Npc.NpcDialog(This_Player,
   '你要进行锻造吗？那可要准备好需要的物品啊！\'+
   '锻造物品不需要消耗锻造时间，但存在锻造失败的可能，\'+
   '您的职业、性别、等级以及要锻造的物品都将影响到锻造的成败，\'+
   '失败不会扣除您提供的金刚石，只是配方中的其他物品会被消耗，\'+
   '而成功后就可收获您想要锻造的物品了。\'+
   '并且还有可能得到高于你锻造物品原始属性的超级极品！\'+
   
   '|{cmd}<锻造雷霆、光芒、烈焰系列首饰/@duanzao>');

end.    