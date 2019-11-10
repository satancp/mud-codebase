procedure _GetFreeGold;  //BY 佰盛QQ：10302235
var Snum : Integer;//局部语法变量声明
begin
   Snum := GetG(3,2)
     if Snum < 44 then
      begin 
        if This_Player.GetV(13,4) <> 1 then
        begin
            if This_Player.Level >= 50 then
          begin
            if This_Player.FreeBagNum >= 2 then
            begin 
                This_Player.Give('100元宝',1);
                This_Player.Give('100灵符礼包',1);
                This_Player.SetV(13,4,1);
				ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了50级奖励！', 70);
                SetG(3,2,Snum + 1);
                This_NPC.NpcDialog(This_Player,
                '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹不足2格') 
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足50级'); 
        end  else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
      end  else
      This_NPC.NpcDialog(This_Player,'50级奖励已全部领取！');
end;

procedure _GetFreeGold1;  //方法
var  Snum1 : Integer;
begin 
   Snum1 := GetG(4,2)
    if Snum1 < 39 then
    begin 
         if This_Player.GetV(14,4) <> 1 then
        begin
          if This_Player.Level >= 52 then
           begin
             if This_Player.FreeBagNum >= 3 then
             begin 
                This_Player.Give('100元宝',2);
                This_Player.Give('100灵符礼包',2);
				ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了52级奖励！', 70);
                This_Player.SetV(14,4,1);
                SetG(4,2,Snum1 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
             end else
             This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格') 
           end else
            This_NPC.NpcDialog(This_Player,'你的等级不足52级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'52级奖励已全部领取！');
end;









procedure _GetFreeGold2;  //方法
var  Snum2: Integer;//局部语法变量声明
begin 
    Snum2 := GetG(5,2)
    if Snum2 < 34 then
    begin 
        if This_Player.GetV(15,4) <> 1 then
        begin
          if This_Player.Level >= 54 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
                This_Player.Give('100元宝',3);
                This_Player.Give('书页',300);
				ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了54级奖励！', 70);
                This_Player.SetV(15,4,1);
                SetG(5,2,Snum2 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足54级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'54级奖励已全部领取！');
end;



procedure _GetFreeGold3;  //方法
var  Snum3: Integer;//局部语法变量声明
begin
    Snum3 := GetG(6,2)
    if Snum3 < 29 then
    begin 
        if This_Player.GetV(16,4) <> 1 then
        begin
          if This_Player.Level >= 56 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
                This_Player.Give('100元宝',5);
                This_Player.Give('书页',500);
				ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了56级奖励！', 70);
                This_Player.SetV(16,4,1);
                SetG(6,2,Snum3 + 1); 
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足56级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'56级奖励已全部领取！');
end;

procedure _GetFreeGold4;  //方法
var Snum4: Integer;//局部语法变量声明
begin
    Snum4 := GetG(7,2)
    if Snum4 < 24 then
    begin 
        if This_Player.GetV(17,4) <> 1 then
        begin
            if This_Player.Level >= 58 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
			     if This_Player.Gender = 0 then
                 This_Player.Give('凤天魔甲',1)
                 else
                 This_Player.Give('凰天魔衣',1);
				 ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了58级奖励！', 70);
                This_Player.SetV(17,4,1);
                SetG(7,2,Snum4 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足58级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'58级奖励已全部领取！');
end;


procedure _GetFreeGold5;  //方法
var    Snum5: Integer;//局部语法变量声明
begin
    Snum5 := GetG(8,2)
    if Snum5 < 19 then
    begin 
        if This_Player.GetV(18,4) <> 1 then
        begin
            if This_Player.Level >= 60 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
                case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('开天',1);
               end;
               1 : 
               begin
                   This_Player.Give('镇天',1);
               end;
               2 : 
               begin
                   This_Player.Give('玄天',1);
               end;
           end;
          ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了60级奖励！', 70);   
                This_Player.SetV(18,4,1);
                SetG(8,2,Snum5 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足60级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'60级奖励已全部领取！');
end;


procedure _GetFreeGold6;  //方法
var    Snum6: Integer;//局部语法变量声明
begin
    Snum6 := GetG(9,2)
    if Snum6 < 14 then
    begin 
        if This_Player.GetV(19,4) <> 1 then
        begin
            if This_Player.Level >= 65 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
                case This_Player.Job of
               0 : 
               begin
                 if This_Player.Gender = 0 then
                 This_Player.Give('星王圣甲(男)',1)
                 else
                 This_Player.Give('星王圣甲(女)',1);
               end;
               1 : 
               begin
                   if This_Player.Gender = 0 then
                 This_Player.Give('星王圣甲(男)',1)
                 else
                 This_Player.Give('星王圣甲(女)',1);
               end;
               2 : 
               begin
                  if This_Player.Gender = 0 then
                 This_Player.Give('星王圣甲(男)',1)
                 else
                 This_Player.Give('星王圣甲(女)',1);
               end;
           end;
      ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了65级奖励！', 70);
                This_Player.SetV(19,4,1);
                SetG(9,2,Snum6 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足65级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'65级奖励已全部领取！');
end;


procedure _GetFreeGold7;  //方法
var    Snum7: Integer;//局部语法变量声明
begin
    Snum7 := GetG(10,2)
    if Snum7 < 4 then
    begin 
        if This_Player.GetV(20,4) <> 1 then
        begin
            if This_Player.Level >= 66 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
                case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('星王圣剑(战)',1);
               end;
               1 : 
               begin
                   This_Player.Give('星王圣剑(法)',1);
               end;
               2 : 
               begin
                   This_Player.Give('星王圣剑(道)',1);
               end;
           end;
ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了66级奖励！', 70);
                This_Player.SetV(20,4,1);
                SetG(10,2,Snum7 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足66级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'66级奖励已全部领取！');
end;



procedure _GetFreeGold8;  //方法
var Snum8: Integer;//局部语法变量声明
begin
    Snum8 := GetG(11,2)
    if Snum8 < 2 then
    begin 
        if This_Player.GetV(21,4) <> 1 then
        begin
            if This_Player.Level >= 69 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
			     if This_Player.Gender = 0 then
                 This_Player.Give('狂雷战甲(男)',1)
                 else
                 This_Player.Give('狂雷战甲(女)',1);
				 ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了69级奖励！', 70);
                This_Player.SetV(21,4,1);
                SetG(11,2,Snum8 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足69级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'69级奖励已全部领取！');
end;


procedure _GetFreeGold9;  //方法
var  Snum9: Integer;//局部语法变量声明
begin
    Snum9 := GetG(12,2)
    if Snum9 < 2 then
    begin 
        if This_Player.GetV(22,4) <> 1 then
        begin
          if This_Player.Level >= 70 then
          begin
            if This_Player.FreeBagNum >= 3 then
            begin 
                This_Player.Give('狂雷之刃',1);
				ServerSay('玩家' + This_Player.Name + '在冲级奖励领取了70级奖励！', 70);
                This_Player.SetV(22,4,1);
                SetG(12,2,Snum9 + 1); 
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足3格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足70级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'70级奖励已全部领取！');
end;




var Snum , Snum1 , Snum2 , Snum3 , Snum4 , Snum5 , Snum6 , Snum7 , Snum8 , Snum9 : Integer; //主函数入口
begin
    begin
     Snum := GetG(3,2)
     Snum1 := GetG(4,2)
     Snum2 := GetG(5,2)
     Snum3 := GetG(6,2)
     Snum4 := GetG(7,2)
     Snum5 := GetG(8,2)
	 Snum6 := GetG(9,2)
	 Snum7 := GetG(10,2)
	 Snum8 := GetG(11,2)
	 Snum9 := GetG(12,2)
    end;
    This_NPC.NpcDialog( This_Player,
    '50级奖励：100元宝,100灵符当前剩余数量:   ' + inttostr(45 - Snum) + '\|' +
    '52级奖励：200元宝,200灵符当前剩余数量:  ' + inttostr(40 - Snum1) + '\|' +
    '54级奖励：300元宝,300书页当前剩余数量:  ' + inttostr(35 - Snum2) + '\|' +
    '56级奖励：500元宝,500书页当前剩余数量:  ' + inttostr(30 - Snum3) + '\|' +
    '58级奖励：凤天魔甲衣服   当前剩余数量:  ' + inttostr(25 - Snum4) + '\|' +
    '60级奖励：开天系列武器   当前剩余数量:  ' + inttostr(15 - Snum5) + '\|' +
	'65级奖励：星王系列衣服   当前剩余数量:  ' + inttostr(8 - Snum6) + '\|' +
	'66级奖励：星王系列武器   当前剩余数量:  ' + inttostr(5 - Snum7) + '\|' +
	'69级奖励：狂雷系列衣服   当前剩余数量:  ' + inttostr(2 - Snum8) + '\|' +
	'70级奖励：狂雷系列武器   当前剩余数量:  ' + inttostr(1 - Snum9) + '\|' +
    '|{cmd}<50级冲级奖励/@GetFreeGold> ^<52级冲级奖励/@GetFreeGold1>\'  +
    '|{cmd}<54级冲级奖励/@GetFreeGold2> ^<56级冲级奖励/@GetFreeGold3>\' + 
    '|{cmd}<58级冲级奖励/@GetFreeGold4> ^<60级冲级奖励/@GetFreeGold5>\' + 
	'|{cmd}<65级冲级奖励/@GetFreeGold6> ^<66级冲级奖励/@GetFreeGold7>\' + 
	'|{cmd}<69级冲级奖励/@GetFreeGold8> ^<70级冲级奖励/@GetFreeGold9>'
	);
end.