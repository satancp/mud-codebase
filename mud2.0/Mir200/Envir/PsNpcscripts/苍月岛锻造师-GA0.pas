
{********************************************************************

*******************************************************************}

PROGRAM Mir2;
{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

var
wp_name : array[1..24] of string;
wp_value : array[1..24] of integer; 

procedure OnInitialize;
begin
wp_name[1] :='凝霜';
wp_name[2] :='修罗';
wp_name[3] :='偃月';
wp_name[4] :='降魔';
wp_name[5] :='炼狱';
wp_name[6] :='魔杖';
wp_name[7] :='银蛇';
wp_name[8] :='罗刹';
wp_name[9] :='祈祷之刃';
wp_name[10] :='井中月';
wp_name[11] :='血饮';
wp_name[12] :='无极棍';
wp_name[13] :='霸者之刃';
wp_name[14] :='裁决之杖';
wp_name[15] :='骨玉权杖';
wp_name[16] :='龙纹剑';
wp_name[17] :='怒斩';
wp_name[18] :='龙牙';
wp_name[19] :='屠龙';
wp_name[20] :='嗜魂法杖';
wp_name[21] :='逍遥扇';

wp_value[1] :=0;
wp_value[2] :=0;
wp_value[3] :=0;
wp_value[4] :=0;
wp_value[5] :=2;
wp_value[6] :=0;
wp_value[7] :=0;
wp_value[8] :=0;
wp_value[9] :=0;
wp_value[10] :=0;
wp_value[11] :=0;
wp_value[12] :=0;
wp_value[13] :=40;
wp_value[14] :=5;
wp_value[15] :=5;
wp_value[16] :=5;
wp_value[17] :=30;
wp_value[18] :=30;
wp_value[19] :=40;
wp_value[20] :=40;
wp_value[21] :=40;

end; 

procedure _SmeltWeapon;
begin
  This_NPC.NpcDialog(This_Player,
   '老夫的熔炉乃神秘之地所得，可将大部分武器熔炼为金刚石。\'
   +'至于能够熔炼出多少金刚石，就要看你武器的优劣了。\ \'
   +'|{cmd}<熔炼单把武器/@SmeltWeapon_1>             ^<熔炼多把武器/@SmeltWeapon_2>\ \'
   +'|{cmd}<查看可熔炼的武器/@SmeltWeapon_3>'
   ); 
end; 

procedure _SmeltWeapon_1;
begin
   This_Npc.NpcDialog(This_Player,
   '请投入武器，不同的武器熔炼出的金刚石数量不同。\'
   +'|<注意：武器熔炼后将消失。/c=red>\'
   
   +'|裁决之杖、骨玉权杖、龙纹剑       5颗金刚石\'
   +'|怒斩、龙牙                      30颗金刚石\'
   +'|霸者之刃                        40颗金刚石\'
   +'|嗜魂法杖、屠龙、逍遥扇          40颗金刚石\'
   +'|{cmd}<熔炼/@SmeltWeapon_1_1>    <返回/@SmeltWeapon>'
  );
  
end; 

procedure _SmeltWeapon_1_1;
begin
    This_NPC.Click_CommitItem(This_Player,1,'请投入武器：'); 
end;

procedure CommitItem(AType:word);
var
wp_kind,dm_num:integer;
begin
   dm_num:=0;
   for wp_kind := 13 to 21 do
   begin
   if wp_name[wp_kind] = This_Item.ItemName then dm_num := wp_value[wp_kind];
   end;
   if dm_num > 0 then
   begin
   This_Player.TakeByClientID(This_Item.ClientItemID);
   This_Player.Give('金刚石',dm_num);   
   This_Player.NotifyClientCommitItem(1,'');
   end else 
   begin
   This_Player.NotifyClientCommitItem(0,'该物品不可熔炼，请投入可熔炼的武器！');   
   end;   
end;

procedure _SmeltWeapon_2;
begin
  This_NPC.NpcDialog(This_Player,
   '选择需要熔炼的武器，不同的武器熔炼出的金刚石数量不同。\'
   +'|<注意：将会扣除包裹中所有所选武器，请谨慎操作。/c=red>\ \'
   +'|{cmd}<卖出包裹中所有凝霜、修罗、偃月、降魔/@SmeltWeapon_2_3>\ \'
   +'|{cmd}<熔炼包裹中所有炼狱、魔杖、银蛇/@SmeltWeapon_2_1~9>\ \'   
   +'|{cmd}<井中月/@SmeltWeapon_2_1~10>        ^<血饮/@SmeltWeapon_2_1~11>          ^<无极棍/@SmeltWeapon_2_1~12>\'
   +'|{cmd}<返回/@SmeltWeapon>'
   ); 
end; 

procedure _SmeltWeapon_2_1(kind:string);
var
wp_kind,wp_num,wp_num1,wp_num2,wp_num3,dm_num,dm_num1,dm_num2,dm_num3:integer;
begin
   wp_kind:= strtointdef(kind,-1);
   if (wp_kind < 9) or (wp_kind > 12) then exit;
   if wp_kind = 9 then
   begin
     wp_num1:= This_Player.GetBagItemCount(wp_name[5]);
     wp_num2:= This_Player.GetBagItemCount(wp_name[6]);
     wp_num3:= This_Player.GetBagItemCount(wp_name[7]);
     wp_num:= wp_num1+wp_num2+wp_num3;
     if wp_num > 0 then
     begin
     dm_num:= wp_num1*wp_value[5]+wp_num2*wp_value[6]+wp_num3*wp_value[7];
     This_NPC.NpcDialog(This_Player,
     '你确定将'+inttostr(wp_num1)+'把'+wp_name[5]+'、'+inttostr(wp_num2)+'把'+wp_name[6]+'、'+inttostr(wp_num3)+'把'+wp_name[7]+'熔炼为'+inttostr(dm_num)+'颗金刚石吗？\ \'
     +'|{cmd}<确定熔炼/@SmeltWeapon_2_2~'+kind+'>\'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     ); 
     end else
     This_NPC.NpcDialog(This_Player,
     '你身上没有所选武器。\ \'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     );
   end else
   begin
     wp_num:= This_Player.GetBagItemCount(wp_name[wp_kind]);
     dm_num:= wp_num*wp_value[wp_kind];
     if wp_num > 0 then
     begin
     This_NPC.NpcDialog(This_Player,
     '你确定将'+inttostr(wp_num)+'把'+wp_name[wp_kind]+'熔炼为'+inttostr(dm_num)+'颗金刚石吗？\ \'
     +'|{cmd}<确定熔炼/@SmeltWeapon_2_2~'+kind+'>\'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     ); 
     end else
     This_NPC.NpcDialog(This_Player,
     '你身上没有所选武器。\ \'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     ); 
   end;
end; 

procedure _SmeltWeapon_2_2(kind:string);
var
wp_kind,wp_num,wp_num1,wp_num2,wp_num3,dm_num,dm_num1,dm_num2,dm_num3:integer;
begin
   wp_kind:= strtointdef(kind,-1);
   if (wp_kind < 9) or (wp_kind > 12) then exit;
   if wp_kind = 9 then
   begin
     wp_num1:= This_Player.GetBagItemCount(wp_name[5]);
     wp_num2:= This_Player.GetBagItemCount(wp_name[6]);
     wp_num3:= This_Player.GetBagItemCount(wp_name[7]);
     wp_num:= wp_num1+wp_num2+wp_num3;
     if wp_num > 0 then
     begin
     dm_num:= wp_num1*wp_value[5]+wp_num2*wp_value[6]+wp_num3*wp_value[7];
     if wp_num1 > 0 then This_Player.Take(wp_name[5],wp_num1);
     if wp_num2 > 0 then This_Player.Take(wp_name[6],wp_num2);
     if wp_num3 > 0 then  This_Player.Take(wp_name[7],wp_num3);
     This_Player.Give('金刚石',dm_num);
     This_NPC.NpcDialog(This_Player,
     '熔炼成功：你获得了'+inttostr(dm_num)+'颗金刚石。\ \'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     ); 
     end else
     This_NPC.NpcDialog(This_Player,
     '你身上没有所选武器。。\ \'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     ); 
   end else
   begin    
     wp_num:= This_Player.GetBagItemCount(wp_name[wp_kind]);
     dm_num:= wp_num*wp_value[wp_kind];
     if wp_num > 0 then
     begin 
     This_Player.Take(wp_name[wp_kind],wp_num);
     This_Player.Give('金刚石',dm_num);
     This_NPC.NpcDialog(This_Player,
     '熔炼成功：你获得了'+inttostr(dm_num)+'颗金刚石。\ \'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     ); 
     end else
     This_NPC.NpcDialog(This_Player,
     '你身上没有所选武器。。\ \'
     +'|{cmd}<返回/@SmeltWeapon_2>' 
     ); 
   end;  
end; 

procedure _SmeltWeapon_2_3;
var
wp_num,wp_num1,wp_num2,wp_num3,wp_num4,gd_num:integer;
begin
   wp_num1:= This_Player.GetBagItemCount(wp_name[1]);
   wp_num2:= This_Player.GetBagItemCount(wp_name[2]);
   wp_num3:= This_Player.GetBagItemCount(wp_name[3]);
   wp_num4:= This_Player.GetBagItemCount(wp_name[4]);
   wp_num:= wp_num1+wp_num2+wp_num3+wp_num4;
   if wp_num > 0 then
   begin
   gd_num:= wp_num*2000;
   This_NPC.NpcDialog(This_Player,
   '你确定卖出'+inttostr(wp_num1)+'把'+wp_name[1]+'、'+inttostr(wp_num2)+'把'+wp_name[2]+'、'+inttostr(wp_num3)+'把'+wp_name[3]+'、'+inttostr(wp_num4)+'把'+wp_name[4]+'\'
   +'并获得'+inttostr(gd_num)+'金币吗？\' 
   +'|{cmd}<确定卖出/@SmeltWeapon_2_4>\'
   +'|{cmd}<返回/@SmeltWeapon_2>' 
   ); 
   end else
   This_NPC.NpcDialog(This_Player,
   '你身上没有所选武器。\ \'
   +'|{cmd}<返回/@SmeltWeapon_2>' 
   );
end; 

procedure _SmeltWeapon_2_4;
var
wp_num,wp_num1,wp_num2,wp_num3,wp_num4,gd_num:integer;
begin
   wp_num1:= This_Player.GetBagItemCount(wp_name[1]);
   wp_num2:= This_Player.GetBagItemCount(wp_name[2]);
   wp_num3:= This_Player.GetBagItemCount(wp_name[3]);
   wp_num4:= This_Player.GetBagItemCount(wp_name[4]);
   wp_num:= wp_num1+wp_num2+wp_num3+wp_num4;
   if wp_num > 0 then
   begin
   gd_num:= wp_num*2000;
   if wp_num1 > 0 then This_Player.Take(wp_name[1],wp_num1);
   if wp_num2 > 0 then This_Player.Take(wp_name[2],wp_num2);
   if wp_num3 > 0 then  This_Player.Take(wp_name[3],wp_num3);
   if wp_num4 > 0 then  This_Player.Take(wp_name[4],wp_num4);
   This_Player.AddGold(gd_num);
   This_NPC.NpcDialog(This_Player,
   '卖出：'+inttostr(gd_num)+'金币。\ \'
   +'|{cmd}<返回/@SmeltWeapon_2>' 
   ); 
   end else
   This_NPC.NpcDialog(This_Player,
   '你身上没有所选武器。。\ \'
   +'|{cmd}<返回/@SmeltWeapon_2>' 
   ); 
end; 

procedure _SmeltWeapon_3;
begin
  This_NPC.NpcDialog(This_Player,
   '以下武器可以熔炼，并可熔炼出金刚石：\'
   +'|裁决之杖、骨玉权杖、龙纹剑       5颗金刚石\'
   +'|怒斩、龙牙                      30颗金刚石\'
   +'|霸者之刃                        40颗金刚石\'
   +'|嗜魂法杖、屠龙、逍遥扇          40颗金刚石\'
   +'|{cmd}<返回/@SmeltWeapon>'
   ); 
end; 

procedure _ForgeWeapon;
begin
  This_NPC.NpcDialog(This_Player,
   '你要进行锻造吗？\'
   +'可惜我已年迈，无法再锻造出精良的武器了。\'
   +'如果你愿意，我可以交给我的徒弟们来锻造，由于他们各自的\'
   +'熟练度有所不同，可能锻造出的武器有所差异。\'
   +'使用88颗金刚石就能够锻造1次，你是否需要锻造？\ \'
   +'|{cmd}<使用88颗金刚石开始锻造/@ForgeWeapon_1>\ \'
   +'|{cmd}<查看可锻造的武器/@ForgeWeapon_2>'
   ); 
end; 

procedure _ForgeWeapon_1;
var
wp_kind,wp_rand1,wp_rand2:integer; 
begin
  if This_Player.GetBagItemCount('金刚石') >= 88 then
  begin
    if This_Player.FreeBagNum > 0 then
    begin
      wp_rand1 := random(10000);
      if wp_rand1 < 810 then
      begin
      wp_kind:=1;          //凝霜
      end else
      if wp_rand1 < 2810 then
      begin
      wp_kind:=2;          //修罗 
      end else
      if wp_rand1 < 4810 then
      begin
      wp_kind:=3;          //偃月 
      end else
      if wp_rand1 < 6810 then
      begin
      wp_kind:=4;          //降魔 
      end else
      if wp_rand1 < 7810 then
      begin
      wp_kind:=5;          //炼狱
      end else
      if wp_rand1 < 8810 then
      begin
      wp_kind:=6;         //魔杖 
      end else
      if wp_rand1 < 9810 then
      begin
      wp_kind:=7;         //银蛇
      end else
      if wp_rand1 < 9830 then
      begin
      wp_kind:=8;         //罗刹
      end else
      if wp_rand1 < 9850 then
      begin
      wp_kind:=9;         //祈祷之刃
      end else
      if wp_rand1 < 9910 then
      begin
      wp_kind:=10;         //井中月
      end else
      if wp_rand1 < 9970 then
      begin
      wp_kind:=12;        //无极棍
      end else
      if (wp_rand1 < 9985) then
      begin
      wp_kind:=11;        //血饮
      end else
      if (GetG(2,2) > 0) and (wp_rand1 < 9990) then
      begin
      wp_kind:=11;        //血饮
      end else
      begin
        if  GetG(36,22) = 70 then wp_rand2 := random(305)  else      //当服务器有玩家达到55级时，可抽到开天档 
        if  GetG(2,2) > 0 then wp_rand2 := random(305)   //当服务器有玩家达到41级时，可抽到屠龙档 
        else wp_rand2 := random(325);  
        
        if wp_rand2 < 5 then
        begin
        wp_kind:=13;          //霸者之刃 
        end else
        if wp_rand2 < 105 then
        begin
        wp_kind:=14;         //裁决之杖 
        end else
        if wp_rand2 < 205 then
        begin
        wp_kind:=15;         //骨玉权杖
        end else
        if wp_rand2 < 305 then
        begin
        wp_kind:=16;         //龙纹剑 
        end else
        if wp_rand2 < 315 then
        begin
        wp_kind:=17;         //怒斩 
        end else
        if wp_rand2 < 325 then
        begin
        wp_kind:=18;         //龙牙 
        end else
        if wp_rand2 < 330 then
        begin
        wp_kind:=19;         //屠龙 
        end else
        if wp_rand2 < 335 then
        begin
        wp_kind:=20;         //嗜魂法杖 
        end else
        if wp_rand2 < 340 then
        begin
        wp_kind:=21;         //逍遥扇 
        end; 
      end;
      This_Player.Take('金刚石',88);
      This_Player.Give(wp_name[wp_kind],1);
      //This_Player.IncActivePoint(1);  //增加活跃度1
      if wp_rand1 >= 6800 then
      begin
      This_NPC.NpcDialog(This_Player,
      '锻造成功！\'+
      '恭喜：你锻造出了：<'+wp_name[wp_kind]+'/c=red>！\ \'+ 
      '|{cmd}<继续锻造/@ForgeWeapon_1>'
      ); 
      end else 
      This_NPC.NpcDialog(This_Player,
      '锻造成功！\'+
      '你锻造出了：'+wp_name[wp_kind]+'！\ \'+ 
      '|{cmd}<继续锻造/@ForgeWeapon_1>'
      ); 
      if (wp_kind >= 13) then This_NPC.NpcNotice('恭喜'+This_Player.Name+'在云游锻造师处锻造出了：'+wp_name[wp_kind]+'！'); 
    end else
    This_NPC.NpcDialog(This_Player,
    '你的包裹太满了，先整理一下吧。'
    ); 
  end else
  This_NPC.NpcDialog(This_Player,
  '锻造武器需要88颗金刚石。'
  );
end; 

procedure _ForgeWeapon_2;
begin
   if GetG(36,22) = 70 then
  begin
   This_NPC.NpcDialog(This_Player,
   '可能锻造出的武器有：\'
   +'凝霜、修罗、偃月、降魔、炼狱、魔杖、银蛇、罗刹、祈祷之刃、\'
   +'井中月、血饮、无极棍、裁决之杖、骨玉权杖、龙纹剑、怒斩、\'
   +'龙牙、霸者之刃、屠龙、嗜魂法杖、逍遥扇、开天、镇天、玄天。\ \'
   +'|{cmd}<返回/@ForgeWeapon>'
   ); 
   end else        
   if GetG(2,2) > 0 then
   begin
   This_NPC.NpcDialog(This_Player,
   '可能锻造出的武器有：\'
   +'凝霜、修罗、偃月、降魔、炼狱、魔杖、银蛇、罗刹、祈祷之刃、\'
   +'井中月、血饮、无极棍、裁决之杖、骨玉权杖、龙纹剑、怒斩、\'
   +'龙牙、霸者之刃、屠龙、嗜魂法杖、逍遥扇。\'
   +'<注意：当服务器有玩家达到55级时才能锻造出开天、镇天、玄天。/c=red>\ \'
   +'|{cmd}<返回/@ForgeWeapon>'
   ); 
   end else
   This_NPC.NpcDialog(This_Player,
   '可能锻造出的武器有：\'
   +'凝霜、修罗、偃月、降魔、炼狱、魔杖、银蛇、罗刹、祈祷之刃、\'
   +'井中月、血饮、无极棍、裁决之杖、骨玉权杖、龙纹剑、怒斩、\'
   +'龙牙、霸者之刃。\'
   +'|<注意：当服务器有玩家达到40级时才能锻造出屠龙、嗜魂法杖、逍遥扇。/c=red>\'
   +'|{cmd}<返回/@ForgeWeapon>'
   ); 
end; 

begin
   This_NPC.NpcDialog(This_Player,
   '老夫云游一生，有幸见识过玛法大陆上的许多神兵利器，\'
   +'也掌握了大多数的锻造和熔炼技巧。其中最困难的莫过于\'
   +'金刚石的锻造。不过我会尽我所能帮助勇士们达成心愿。\ \'
   +'|{cmd}<熔炼武器（获得金刚石）/@SmeltWeapon>             \ \'
   +'|{cmd}<锻造武器（获得武器）/@ForgeWeapon>'
   ); 
end. 