{
*******************************************************************}

Program Mir2;



Procedure _doexit;
begin
   This_NPC.CloseDialog(This_Player);
end;

function Gaoji0LB(price, num: Integer):boolean;
begin                                               

  result := true;
end;




procedure _xiane4;
     begin
    if This_Player.FreeBagNum > 0 then
begin
   if This_Player.MyLFnum >= 500 then 
  begin
  This_Player.Give('50元宝',1);
  This_Player.DecLF(0, 500, false);
  end
    else
    This_Npc.NpcDialog(This_Player,
    '对不起，你没有500灵符，不能兑换元宝！'
    );
  end else
   This_Npc.NpcDialog(This_Player,
	'对不起，你背包已满！'
	);
	end;

procedure _xiane5;
     begin
    if This_Player.FreeBagNum > 0 then
begin
   if This_Player.MyLFnum >= 500 then 
  begin
  This_Player.Give('金刚石',60);
  This_Player.DecLF(0, 500, false);
  end
    else
    This_Npc.NpcDialog(This_Player,
    '对不起，你没有500灵符，不能兑换金刚石！'
    );
  end else
   This_Npc.NpcDialog(This_Player,
	'对不起，你背包已满！'
	);
	end;	

	
procedure _xiane7;
     begin
    if This_Player.FreeBagNum > 0 then
begin
   if This_Player.YBNum >= 50 then 
  begin
  This_Player.Give('50元宝',1);
  This_Player.PsYBConsum(This_NPC,'YB_NewComeBag',20001,50,1); 
  end
    else
    This_Npc.NpcDialog(This_Player,
    '对不起，你没有50元宝，不能兑换取出！'
    );
  end else
   This_Npc.NpcDialog(This_Player,
	'对不起，你背包已满！'
	);
	end;
		
procedure _xiane1;
begin
   if This_Player.MyLFnum >= 100 then 
  begin
  This_Player.MyShengwan := This_Player.MyShengwan + 5;
  This_Player.DecLF(0, 100, false);
  end
    else
    This_Npc.NpcDialog(This_Player,
    '对不起，你没有100灵符，不能兑换声望！'
    );
	end;



   begin
      This_NPC.NpcDialog(This_Player,
      '在我这里可以货币互换哦\ \'
	  +'|{cmd}<500灵符兑换50个元宝/@xiane4>  \'
	  +'|{cmd}<500灵符兑换60个金刚石/@xiane5>  \'
	  +'|{cmd}<100灵符兑换5声望点/@xiane1>  \'
	  +'|{cmd}<提取50元宝/@xiane7>  \'
      );
end.