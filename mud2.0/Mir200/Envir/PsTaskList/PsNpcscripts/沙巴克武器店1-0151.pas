{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '¸ĞĞ»£¬ ÄúÏëÒªĞ©Ê²Ã´£¿ \ÎÒÃÇÕâÀïÓĞĞí¶à±ãÒË·æÀûµÄ½£¡£ÇëÄúÌôÑ  £\¸ù¾İÕâ¸ö³Ç±¤µÄÖ÷ÈË'+This_npc.GetCastleGuildName+'µÄÃüÁî£¬ \ÎÒÃÇÌØ±ğ¶Ô'+This_npc.GetCastleGuildName+'³ÉÔ±Ìá¹©20%µÄÕÛ¿Û¡£\'
  +'|{cmd}<ÂòÎäÆ÷/@buy>\'
  +'|{cmd}<ÂôÎäÆ÷/@sell>\'
  +'|{cmd}<ĞŞÀíÎäÆ÷/@repair>\'
  +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '²»Òªµ£ĞÄÎÒÃÇÕâÀïÎäÆ÷µÄÊıÁ¿£¬ÇëÄú¾¡Á¿ÌôÑ¡ÄúĞèÒªµÄÎäÆ÷¡£\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '·ÅÏÂÄãÒªÂôµÄÎäÆ÷¡£\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _Repair;
begin
  This_Npc.NpcDialog(This_Player,
    'ÏëĞŞÀíÎäÆ÷Âğ£¿  ÄãÏëĞŞÀíÄÄ¸ö£¿\ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '¿´ÆğÀ´ÍêÈ«ĞŞºÃÁË£¿  »¹ÓĞÒªĞŞÀíµÄÂğ£¿\ \' +
    '|{cmd}<·µ»Ø/@main>'
  );
end;



//³õÊ¼»¯²Ù×÷
procedure OnInitialize;
begin
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.AddStdMode(43);
  This_Npc.FillGoods('Ä¾½£',50,1);
  This_Npc.FillGoods('ÇàÍ­½£',50,1);
  This_Npc.FillGoods('Ìú½£',50,1); 
  This_Npc.FillGoods('Ø°Ê×',50,1);
  This_Npc.FillGoods('ĞŞÂŞ',50,1);
  This_Npc.FillGoods('ÄıËª',50,1);
  This_Npc.SetRebate(100);
end;

//½Å±¾Ö´ĞĞµÄÈë¿Ú
begin
  domain;
end.