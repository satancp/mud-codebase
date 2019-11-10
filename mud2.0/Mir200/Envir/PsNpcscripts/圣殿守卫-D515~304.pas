{
*******************************************************************}
Program Mir2;

Procedure _Exit;
begin
   This_NPC.CloseDialog(This_Player);
end;

Procedure _mount;
var
LFNum : integer;
begin
   LFNum := This_Player.NickLinFu;
   This_NPC.NpcDialog(This_Player,
   '您现在拥有圣殿灵符：'+ IntToStr(LFNum)+'\ \'+
   '|{cmd}<返回/@main>');
end;

Procedure _goback;
begin
   if compareText(This_Player.MapName,'D515~304') = 0 then
     This_Player.RandomFlyTo('0122~1');
end;

Procedure notEnoughNick;
begin
   This_NPC.NpcDialog(This_Player,
   '你没有足够的圣殿灵符来领取宝藏。');
end;

Procedure NotEnoughBag;
begin
   This_NPC.NpcDialog(This_Player,
   '好像你的包裹已经满了，我怎么把圣殿中的宝藏给你呢？\'+
   '还是先整理一下包裹再来找我吧。');
end;

Procedure UseNick_OK;
begin
   This_NPC.NpcDialog(This_Player,
   '这里是天关中的圣殿，蕴藏着无尽的稀世珍宝。\'+
   '只要你连续地把圣殿灵符给我，就可以不断获得宝藏，\'+
   '给我的圣殿灵符越多，得到的宝物就越珍奇！\'+
   '宝物珍贵，请预留六个包裹空间。 \ \'+
   '|{cmd}<兑换1张/@useNick1>             ^<兑换10张/@useNick10>             ^<兑换100张/@useNick100>\ \'+
   '|{cmd}<返回天庭/@goback>            ^<查询圣殿灵符数量/@mount>');
end;

Procedure _useNick1;
begin
   if This_Player.NickLinFu >= 1 then
   begin
      if This_Player.FreeBagNum >= 6 then
      begin
         //这里是消耗圣殿灵符换取奖励的接口，后面的参数1、2和3分别指兑换1张、10张和100张圣殿灵符的情况。 
         This_NPC.UseNick(This_Player,1);
      end else
      begin
         This_NPC.NpcDialog(This_Player,
         '好像你的包裹已经满了，我怎么把圣殿中的宝藏给你呢？\'+
         '还是先整理一下包裹再来找我吧。');
      end;
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '你没有足够的圣殿灵符来领取宝藏。');
   end;
end;

Procedure _useNick10;
begin
   if This_Player.NickLinFu >= 10 then
   begin
      if This_Player.FreeBagNum >= 6 then
      begin
         This_NPC.UseNick(This_Player,2);
      end else
      begin
         This_NPC.NpcDialog(This_Player,
         '好像你的包裹已经满了，我怎么把圣殿中的宝藏给你呢？\'+
         '还是先整理一下包裹再来找我吧。');
      end;
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '你没有足够的圣殿灵符来领取宝藏。');
   end;
end;

Procedure _useNick100;
begin
   if This_Player.NickLinFu >= 100 then
   begin
      if This_Player.FreeBagNum >= 6 then
      begin
         This_NPC.UseNick(This_Player,3);
      end else
      begin
         This_NPC.NpcDialog(This_Player,
         '好像你的包裹已经满了，我怎么把圣殿中的宝藏给你呢？\'+
         '还是先整理一下包裹再来找我吧。');
      end;
   end else
   begin
      This_NPC.NpcDialog(This_Player,
      '你没有足够的圣殿灵符来领取宝藏。');
   end;
end;

Begin
   
   This_NPC.NpcDialog(This_Player,
   '奉比奇国王的旨意， \'+
   '现在已经不能再领取圣殿天关中的宝物。 \ \'+
   '|{cmd}<返回天庭/@goback>');
end.