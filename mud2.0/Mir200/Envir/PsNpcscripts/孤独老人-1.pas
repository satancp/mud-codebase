{********************************************************************

*******************************************************************}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '前面是一片全新的土地，\'
   +'如果你想到里面去的话一定要去下载新的客户端，\'
   +'否则进去之后就是一片漆黑。\'
   +'如果你一定要进去的话，\'
   +'记得回来的坐标是51,478\\'
   +'|{cmd}<询问/@ask>如何得到新客户端\'
   +'|{cmd}<询问/@new>盛大其他最新情况\'
   +'|{cmd}<确定/@exit>'
   );

end;

procedure _ask;
begin
   This_NPC.NpcDialog(This_Player,
   '新的客户端总共257M左右，\'
   +'你可以在网上下载，也可以直接购买光盘。\'
   +'解压之后就可以安装了，\'
   +'安装之后有700多M。\'
   +'|{cmd}<确定/@exit>'
   
   
   
   
   
   );

end;

procedure _new;
begin
   This_NPC.NpcDialog(This_Player,
   '《疯狂坦克2.0BULE》  \\'
   +'除了练功升级我还能做什么？现在您又多了一份选择！我们为\'
   +'您准备了一款清新轻松的Q版坦克大餐。今年夏天盛大网络全新\'
   +'推出清新健康风靡世界的网络休闲游戏大作《疯狂坦克2》。\'
   +'《疯狂坦克2》共有13种造型可爱各具特性的坦克供玩家挑选，\'
   +'他们有着各自拿手的本领，作战中他们还会做出十分搞笑的动作，\'
   +'在战斗中您还可以使用多达36中的特殊道具， 每种都有不同的\'
   +'作用。只有运用好这些道具才能使您立于不败之地！\'
   +'|{cmd}<确定/@exit>'
   
   );

end;
 
begin
    domain;
end.