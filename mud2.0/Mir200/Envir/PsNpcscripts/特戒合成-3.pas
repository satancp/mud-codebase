program Mir2;
Procedure _doexit;
begin
This_Npc.CloseDialog(This_Player);
end;



procedure _1; 
begin
if This_Player.GetBagItemCount('低级赞助斗笠')   >= 1 then    //检测物品
begin
if This_Player.GetBagItemCount('金刚石') >= 2000 then    //检测物品
begin
if This_Player.GetBagItemCount('书页') >= 2000 then    //检测物品
begin 
if  This_Player.FreeBagNum >= 1 then     //检测背包
begin
This_Player.Take('低级赞助斗笠' , 1);
This_Player.Take('金刚石' , 2000);
This_Player.Take('书页' , 2000);
This_Player.Give('中级赞助斗笠' , 1);  //给与物品 
ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在盟重成功锻造出了★★★中级斗笠★★★，大家可以前往膜拜！',3);
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'背包空格数量不足1！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'低级赞助斗笠不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'金刚石*2000不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'书页*2000不足！！！  ');
end ;
end ;



procedure _2; 
begin
if This_Player.GetBagItemCount('金刚石')   >= 12222 then    //检测物品
begin
if This_Player.GetBagItemCount('书页') >= 5000 then    //检测物品
begin
if This_Player.GetBagItemCount('会员积分') >= 30 then    //检测物品
begin 
if This_Player.GetBagItemCount('中级赞助斗笠') >= 2 then    //检测物品
begin 
if  This_Player.FreeBagNum >= 1 then     //检测背包
begin
This_Player.Take('金刚石' , 12222);
This_Player.Take('书页' , 5000);
This_Player.Take('会员积分' , 30);
This_Player.Take('中级赞助斗笠' , 2);
This_Player.Give('高级赞助斗笠' , 1);  //给与物品 
ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在盟重成功锻造出了★★★高级斗笠★★★，大家可以前往膜拜！',3);
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'背包空格数量不足1！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'金刚石不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'书页不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'会员积分不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'中级赞助斗笠不足！！！  ');
end ;
end ;


procedure _3; 
begin
if This_Player.GetBagItemCount('金刚石')   >= 18888 then    //检测物品
begin
if This_Player.GetBagItemCount('书页') >= 12222 then    //检测物品
begin
if This_Player.GetBagItemCount('会员积分') >= 200 then    //检测物品
begin 
if This_Player.GetBagItemCount('高级赞助斗笠') >= 5 then    //检测物品
begin 
if  This_Player.FreeBagNum >= 1 then     //检测背包
begin
This_Player.Take('金刚石' , 18888);
This_Player.Take('书页' , 12222);
This_Player.Take('会员积分' , 200);
This_Player.Take('高级赞助斗笠' , 5);
This_Player.Give('终级赞助斗笠' , 1);  //给与物品 
ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在盟重成功锻造出了★★★终级斗笠★★★，大家可以前往膜拜！',3);
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'背包空格数量不足1！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'金刚石不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'书页不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'会员积分不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'高级赞助斗笠不足！！！  ');
end ;
end ;



procedure _4; 
begin
if This_Player.GetBagItemCount('金刚石')   >= 38888 then    //检测物品
begin
if This_Player.GetBagItemCount('书页') >= 18888 then    //检测物品
begin
if This_Player.GetBagItemCount('会员积分') >= 500 then    //检测物品
begin 
if This_Player.GetBagItemCount('终级赞助斗笠') >= 1 then    //检测物品
begin 
if  This_Player.FreeBagNum >= 1 then     //检测背包
begin
This_Player.Take('金刚石' , 38888);
This_Player.Take('书页' , 18888);
This_Player.Take('会员积分' , 500);
This_Player.Take('终级赞助斗笠' , 1);
This_Player.Give('护身戒指' , 1);  //给与物品 
ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在盟重成功锻造出了★★★护身戒指★★★，大家可以前往膜拜！',3);
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'背包空格数量不足1！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'金刚石不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'书页不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'会员积分不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'终级赞助斗笠不足！！！  ');
end ;
end ;


procedure _5; 
begin
if This_Player.GetBagItemCount('金刚石')   >= 38888 then    //检测物品
begin
if This_Player.GetBagItemCount('书页') >= 18888 then    //检测物品
begin
if This_Player.GetBagItemCount('会员积分') >= 500 then    //检测物品
begin 
if This_Player.GetBagItemCount('终级赞助斗笠') >= 1 then    //检测物品
begin 
if  This_Player.FreeBagNum >= 1 then     //检测背包
begin
This_Player.Take('金刚石' , 38888);
This_Player.Take('书页' , 18888);
This_Player.Take('会员积分' , 500);
This_Player.Take('终级赞助斗笠' , 1);
This_Player.Give('麻痹戒指' , 1);  //给与物品 
ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在盟重成功锻造出了★★★麻痹戒指★★★，大家可以前往膜拜！',3);
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'背包空格数量不足1！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'金刚石不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'书页不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'会员积分不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'终级斗笠不足！！！  ');
end ;
end ;


procedure _6; 
begin
if This_Player.GetBagItemCount('金刚石')   >= 38888 then    //检测物品
begin
if This_Player.GetBagItemCount('书页') >= 18888 then    //检测物品
begin
if This_Player.GetBagItemCount('会员积分') >= 500 then    //检测物品
begin 
if This_Player.GetBagItemCount('终级赞助斗笠') >= 1 then    //检测物品
begin 
if  This_Player.FreeBagNum >= 1 then     //检测背包
begin
This_Player.Take('金刚石' , 38888);
This_Player.Take('书页' , 18888);
This_Player.Take('会员积分' , 500);
This_Player.Take('终级赞助斗笠' , 1);
This_Player.Give('复活戒指' , 1);  //给与物品 
ServerSay('玛法大陆忽然风云色变，玩家★★★'+ This_Player.Name+'★★★在盟重成功锻造出了★★★复活戒指★★★，大家可以前往膜拜！',3);
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'背包空格数量不足1！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'金刚石不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'书页不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'会员积分不足！！！  ');
end ;
end else  //检测提示 
begin
This_Npc.NpcDialog(This_Player,
'终级斗笠不足！！！  ');
end ;
end ;

begin
       This_Npc.NpcDialog( This_Player,
  '中级斗笠需要:(低级斗笠*1+金刚石*2000+书页*2000)\' +
  '|高级斗笠需要:(金刚石*12222+书页*5000+会员积分*30+中级斗笠*2)\' +
  '|终极斗笠需要:(金刚石*18888+书页*12222+会员积分*200+高级斗笠*5)\' +
  '|护身斗笠需要:(金刚石*28888+书页*18888+会员积分*500+终级斗笠)\' +
  '|麻痹戒指需要:(金刚石*28888+书页*18888+会员积分*500+终级斗笠)\' +
  '|复活戒指需要:(金刚石*28888+书页*18888+会员积分*500+终级斗笠)\'+
  '|<中级斗笠/@1>  ^<高级斗笠/@2>  ^<终极斗笠/@3>\'+
  '|<护身戒指/@4>  ^<麻痹戒指/@5>  ^<复活戒指/@6>'
    );
end.