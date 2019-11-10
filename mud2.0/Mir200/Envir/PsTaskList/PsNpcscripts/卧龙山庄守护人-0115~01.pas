{
/***********************************************************************
/*  脚本内容 : 
/*  原脚本NPC: wolong-0115~01
/************************************************************************}

PROGRAM Mir2;



Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;


{函数注释：
    //卧龙山庄的提升属性任务
    //返回 ： -1 任务已完成过一次  Field_Quest_Finish
    //        -2 物品还没有凑齐    Field_Quest_Fail
    //         1 任务成功完成      Field_Quest_OK
    function SubmitBallQuest(Player: TPlayer): Integer;
}
Procedure _submitball;
var
i : integer;
begin
   i := This_Npc.SubmitBallQuest(This_Player);
   if i = -2 then
   begin
      This_Npc.NpcDialog(This_Player,
      '想要获得战斗力的提升，就必须收集齐所有五种夜明珠，\'+
      '快去探索守护古书的名将首领，就可获得带有神秘力量的夜明珠！\'+
      '同时，还需要获得卧龙庄主手中的庄主令牌！');
   end else if i = -1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经得到过自身属性的提升了，\'+
      '夜明珠的力量虽然强大，但也只能成功一次！');
   end else if i = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经成功获得了自身属性的超越！');
      This_Npc.NpcNotice(''+This_Player.Name+'完成了卧龙山庄守护人的任务，获得了战斗力的提升！') 
   end;
end;

Procedure _HuiShou;
begin
   This_Npc.NpcDialog(This_Player,
   '你有夜明珠或者庄主令牌就交给我吧，我可以帮你兑换一个火龙珠！\你打算把哪一样交给我呢？\ \'+
   '<红色夜明珠/@HuiShou_01>         <黄色夜明珠/@HuiShou_02>          <绿色夜明珠/@HuiShou_03>\'+
   '<蓝色夜明珠/@HuiShou_04>         <橙色夜明珠/@HuiShou_05>\'+	   
   '<庄主令牌/@HuiShou_06>');
end;

Procedure WLHuishou(HSName : string);
begin
   if This_Player.GetBagItemCount(HSName) >= 1 then
   begin
      if This_Player.Take(HSName,1) then
      begin
         This_Player.Give('火龙珠',1);
         This_Npc.NpcDialog(This_Player,
         '你有夜明珠或者庄主令牌就交给我吧，我可以帮你兑换一个火龙珠！\你还打算把哪一样交给我呢？\ \'+
         '<红色夜明珠/@HuiShou_01>         <黄色夜明珠/@HuiShou_02>          <绿色夜明珠/@HuiShou_03>\'+
         '<蓝色夜明珠/@HuiShou_04>         <橙色夜明珠/@HuiShou_05>\'+	   
         '<庄主令牌/@HuiShou_06>'); 
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你身上好像没有' + HSName + '，我怎么帮你兑换呢？'); 
   end;
end;

Procedure _HuiShou_01;
begin
   WLHuishou('红色夜明珠');
end;

Procedure _HuiShou_02;
begin
   WLHuishou('黄色夜明珠');
end;

Procedure _HuiShou_03;
begin
   WLHuishou('绿色夜明珠');
end;

Procedure _HuiShou_04;
begin
   WLHuishou('蓝色夜明珠');
end;

Procedure _HuiShou_05;
begin
   WLHuishou('橙色夜明珠');
end;

Procedure _HuiShou_06;
begin
   WLHuishou('庄主令牌');
end;

Begin
   if (This_Player.GetBagItemCount('红色夜明珠') >= 1) and (This_Player.GetBagItemCount('橙色夜明珠') >= 1) and
      (This_Player.GetBagItemCount('黄色夜明珠') >= 1) and (This_Player.GetBagItemCount('绿色夜明珠') >= 1) and
      (This_Player.GetBagItemCount('蓝色夜明珠') >= 1) and (This_Player.GetBagItemCount('庄主令牌') >= 1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '如果你已经找齐了五种夜明珠和庄主令牌，就都可以交给我，\'+
      '我会释放其中的力量，给你带来自身战斗力的提升！\'+
      '不过夜明珠的力量虽然强大，但我也只能带来一次属性的超越！\ \'+
      '<我已经找齐了，我想获得自身属性的超越/@submitball>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '只要是玛法大陆的勇士，我就可以给战士带来攻击力的提升，给\'+
      '道士带来道术的提升，给魔法师带来魔法力的提升！\'+
      '卧龙山庄存在着五本古书，你必须首先战胜守护这五本古书的名\'+
      '将首领，获得他们携带的五种不同颜色的夜明珠。然后，再去战\'+
      '胜卧龙庄主，得到他手中的庄主令牌，只有把这五种不同颜色的\'+
      '夜明珠和庄主令牌一起交给我，我才可以获得其中的力量，让你\'+
      '获得自身属性的超越！\'+
      '不过夜明珠的力量虽然强大，但我也只能带来一次属性的超越！\'+
      '<回收夜明珠和庄主令牌/@HuiShou>');
   end;
end.