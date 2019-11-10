procedure _GetFreeGold;  //BY 佰盛QQ：10302235
var Snum : Integer;//局部语法变量声明
begin
   Snum := GetG(3,2)
     if Snum < 50 then
      begin 
        if This_Player.GetV(13,4) <> 1 then
        begin
            if This_Player.Level >= 50 then
          begin
            if This_Player.FreeBagNum >= 1 then
            begin 
                This_Player.Give('100元宝',2);
				This_Player.Give('书页',100);
                This_Player.SetV(13,4,1);
                SetG(3,2,Snum + 1);
                This_NPC.NpcDialog(This_Player,
                '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹不足1格') 
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
    if Snum1 < 40 then
    begin 
         if This_Player.GetV(14,4) <> 1 then
        begin
          if This_Player.Level >= 52 then
           begin
             if This_Player.FreeBagNum >= 3 then
             begin 
                This_Player.Give('100元宝',3);
				This_Player.Give('书页',200);
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
    if Snum2 < 30 then
    begin 
        if This_Player.GetV(15,4) <> 1 then
        begin
          if This_Player.Level >= 54 then
          begin
            if This_Player.FreeBagNum >= 6 then
            begin 
                This_Player.Give('100灵符礼包',5);
				This_Player.Give('书页',200);
                This_Player.SetV(15,4,1);
                SetG(5,2,Snum2 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足6格')
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
    if Snum3 < 10 then
    begin 
        if This_Player.GetV(16,4) <> 1 then
        begin
          if This_Player.Level >= 56 then
          begin
            if This_Player.FreeBagNum >= 1 then
            begin 
                This_Player.Give('100元宝',5);
                This_Player.SetV(16,4,1);
                SetG(6,2,Snum3 + 1); 
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足1格')
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
    if Snum4 < 6 then
    begin 
        if This_Player.GetV(17,4) <> 1 then
        begin
            if This_Player.Level >= 58 then
          begin
            if This_Player.FreeBagNum >= 6 then
            begin 
                This_Player.Give('1000元宝',1);
                This_Player.SetV(17,4,1);
                SetG(7,2,Snum4 + 1);
                This_NPC.NpcDialog(This_Player,
               '恭喜你领取成功');
            end else
            This_NPC.NpcDialog(This_Player,'你的包裹剩余不足6格')
          end else
          This_NPC.NpcDialog(This_Player,'你的等级不足58级'); 
        end else
        This_NPC.NpcDialog(This_Player,'你已领取了奖励');
    end else
    This_NPC.NpcDialog(This_Player,'58级奖励已全部领取！');
end;


var Snum , Snum1 , Snum2 , Snum3 , Snum4 : Integer; //主函数入口
begin
    begin
     Snum := GetG(3,2)
     Snum1 := GetG(4,2)
     Snum2 := GetG(5,2)
     Snum3 := GetG(6,2)
     Snum4 := GetG(7,2)
     
    end;
    This_NPC.NpcDialog( This_Player,
    '50级奖励：当前剩余数量:   ' + inttostr(28- Snum) + '\|' +
    '52级奖励：当前剩余数量:  ' + inttostr(15 - Snum1) + '\|' +
    '54级奖励：当前剩余数量:  ' + inttostr(10 - Snum2) + '\|' +
    '56级奖励：当前剩余数量:  ' + inttostr(6 - Snum3) + '\|' +
    '58级奖励：当前剩余数量:  ' + inttostr(3 - Snum4) + '\|' +
    '60级奖励：特殊奖励,当前剩余数量:< 1个/c=red>\|' +

    '|{cmd}<50级冲级奖励/@GetFreeGold> ^<52级冲级奖励/@GetFreeGold1>\'  +
    '|{cmd}<54级冲级奖励/@GetFreeGold2> ^<56级冲级奖励/@GetFreeGold3>\' + 
    '|{cmd}<58级冲级奖励/@GetFreeGold4> ^<60级冲级奖励/@GetFreeGold5>\\' +
    '|<60级冲级奖励，请联系客服领取。/c=red>>\\' +
	'|  ^<离开/@doexit>');
end.