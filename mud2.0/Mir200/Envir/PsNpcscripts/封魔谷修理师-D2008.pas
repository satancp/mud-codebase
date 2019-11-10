{
/************************************************************************}

Program Mir2;


{$I common.pas}


Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

Procedure _getback;
Begin
   This_Npc.NpcDialog(This_Player,
   'Çë¿´Ä¿Â¼¾ö¶¨ÕÒÊ²Ã´¶«Î÷¡£\ \ \'+
   '|{cmd}<·µ»Ø/@main>');
   This_Npc.Click_GetBack(This_Player);
end;

Procedure _storage;
begin
   This_Npc.NpcDialog(This_Player,
   'ĞèÒª±£¹ÜÊ²Ã´¶«Î÷£¿\ \ \'+
   '|{cmd}<·µ»Ø/@main>');
   This_Npc.Click_GetBack(This_Player);
end;

Procedure _DoInputDialog1;
begin
   This_Npc.InputDialog(This_Player,'ÇëÊäÈë£º', 0 , 100);
end;

Procedure P100;
begin
   If This_Npc.InputOK then
   begin
      This_Player.ReqOpenStorage(This_Npc.InputStr);
   end;
end;


Procedure _mbind;
begin
  This_Npc.NpcDialog(This_Player,
  'ÄãÖªµÀÎÒÊÇÊ²Ã´ÈËÂğ£¿ \'+ 
  'ÎÒ×öµÄÊÇÕâÑùµÄÊÂÇé... \'+ 
  'ÄãÒªÊÔÒ»ÏÂÂğ£¿ÓĞÊ²Ã´Òª°İÍĞµÄ¾ÍËµ°É \ \' +
  '|{cmd}<½ğ±Ò»»½ğÌõ./@chgtobar>'+addspace(' ',20)+'|{cmd}<½ğÌõ»»½ğ±Ò./@bartogold>\' +
  '|{cmd}<À¦Ò©Æ¿ºÍ¾íÖá/@bind>\'+ 
  '|{cmd}<È¡Ïû/@doexit>');
end;

Procedure _chgtobar;
begin
   This_Npc.Click_GoldChgBar(This_Player);
end;

Procedure _bartogold;
begin
   This_Npc.Click_BartoGold(This_Player);
end;

Procedure _bind;
begin
  This_Npc.NpcDialog(This_Player,
  'Ä¿Ç°ÎÒÄÜÀ¦µÄÖ»ÓĞ¾íÊéºÍÒ©Ë®¡£\'+
  'ÄãÒªÀ¦Âğ£¿ \'+ 
  'ÒªÀ¦¶«Î÷ĞèÒª100½ğ±Ò. \ \'+
  '|{cmd}<À¦Ò©Ë®/@P_bind>'+addspace(' ',20)+'|{cmd}<À¦¾íÊé/@Z_bind> \ \'+
  '|{cmd}<·µ»Ø/@main>');
end;

Procedure _Z_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<À¦µØÀÎÌÓÍÑ¾í/@zum_bind1> \' +
  '|{cmd}<À¦Ëæ»ú´«ËÍ¾í/@zum_bind2> \' +
  '|{cmd}<À¦»Ø³Ç¾í/@zum_bind3>  \' +
  '|{cmd}<À¦ĞĞ»á»Ø³Ç¾í/@zum_bind4>  \' +
  '|{cmd}<·µ»Ø/@bind>');
end;

//À¦Êé¾íÄ£°å
//item_src´ıÀ¦°óµÄ¶«Î÷£¬ item_desÀ¦°ó³ÉµÄ¶«Î÷ 
procedure DoBindBook(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
        This_Npc.NpcDialog(This_Player,
        'ÒÑ¾­À¦ºÃÁË... ÎÒµÄ¼¼Êõ²»´í°É... \'+
        '»¹ÓĞÒªÀ¦µÄ¾ÍÄÃ¸øÎÒ°É.. \ \'+
        '|{cmd}<¼ÌĞøÀ¦/@Z_bind> \'+
        '|{cmd}<È¡Ïû/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        'Äã¶¼Ã»ÓĞÇ®À¦¶«Î÷£¬\'+
        '»¹À¦Ê²Ã´? ¿ì×ß°É... \ \'+
        '|{cmd}<È¡Ïû/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     'Äã¶¼Ã»ÓĞ¿ÉÒÔÀ¦µÄ¾íÊé£¬»¹À¦Ê²Ã´? \'+
     'µÈ×¼±¸ºÃÖ®ºó£¬ÔÙÀ´ÕÒÎÒ°É.. \ \'+
     '|{cmd}<È¡Ïû/@doexit>');
  end;   
end; 

procedure _zum_bind4;
begin
  DoBindBook('ĞĞ»á»Ø³Ç¾í', 'ĞĞ»á»Ø³Ç¾í°ü');
end;

Procedure _zum_bind3;
begin
  DoBindBook('»Ø³Ç¾í', '»Ø³Ç¾í°ü');  
end;

Procedure _zum_bind2;
begin
  DoBindBook('Ëæ»ú´«ËÍ¾í', 'Ëæ»ú´«ËÍ¾í°ü');  
end;

Procedure _zum_bind1;
begin
  DoBindBook('µØÀÎÌÓÍÑ¾í', 'µØÀÎÌÓÍÑ¾í°ü');  
end;


Procedure _P_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<Ç¿Ğ§½ğ´´Ò©À¦/@ch_bind1>  \'+
  '|{cmd}<À¦Ç¿Ğ§Ä§·¨Ò©/@ma_bind1> \'+ 
  '|{cmd}<À¦½ğ´´Ò©£¨ÖĞ£©/@ch_bind2> \'+
  '|{cmd}<À¦Ä§·¨Ò©£¨ÖĞ£©/@ma_bind2> \'+
  '|{cmd}<À¦½ğ´´Ò©/@ch_bind3> \'+
  '|{cmd}<À¦Ä§·¨Ò©/@ma_bind3> \'+
  '|{cmd}<·µ»Ø/@bind>');
end;

//À¦Ò©Ä£°å
//item_src´ıÀ¦°óµÄ¶«Î÷£¬ item_desÀ¦°ó³ÉµÄ¶«Î÷ 
procedure DoBindDrug(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
        This_Npc.NpcDialog(This_Player,
        'ÒÑ¾­À¦ºÃÁË... ÎÒµÄ¼¼Êõ²»´í°É... \'+
        '»¹ÓĞÒªÀ¦µÄ¾ÍÄÃ¸øÎÒ°É.. \ \'+
        '|{cmd}<¼ÌĞøÀ¦/@P_bind> \'+
        '|{cmd}<È¡Ïû/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        'Äã¶¼Ã»ÓĞÇ®À¦¶«Î÷£¬\'+
        '»¹À¦Ê²Ã´? ¿ì×ß°É... \ \'+
        '|{cmd}<È¡Ïû/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     'Äã¶¼Ã»ÓĞÒªÀ¦µÄÒ©Ë®£¬»¹À¦Ê²Ã´? \'+
     'µÈ×¼±¸ºÃÒ©Ë®Ö®ºóÔÙÀ´ÕÒÎÒ°É.. \ \'+
     '|{cmd}<È¡Ïû/@doexit>');
  end;
end;

procedure _ma_bind3;
begin
  DoBindDrug('Ä§·¨Ò©(Ğ¡Á¿)', 'Ä§·¨Ò©(Ğ¡)°ü');
end;

Procedure _ch_bind3;
begin
  DoBindDrug('½ğ´´Ò©(Ğ¡Á¿)', '½ğ´´Ò©(Ğ¡)°ü');    
end;

Procedure _ma_bind2;
begin
  DoBindDrug('Ä§·¨Ò©(ÖĞÁ¿)', 'Ä§·¨Ò©(ÖĞ)°ü');  
end;

Procedure _ch_bind2;
begin
  DoBindDrug('½ğ´´Ò©(ÖĞÁ¿)', '½ğ´´Ò©(ÖĞ)°ü');    
end;

Procedure _ma_bind1;
begin
  DoBindDrug('Ç¿Ğ§Ä§·¨Ò©', '³¬¼¶Ä§·¨Ò©');     
end;

Procedure _ch_bind1;
begin
  DoBindDrug('Ç¿Ğ§½ğ´´Ò©', '³¬¼¶½ğ´´Ò©');   
end;

Procedure _cangku;
Begin
   This_Npc.NpcDialog(This_Player,
   '×òÌì£¬ÎÒÇë·âÄ§¹ÈµÄ²Ö¿â¹ÜÀíÔ±³Ô·¹£¬Ëû×ÜËã°Ñ²»´«µÄ¼¼Êõ¸æ\'+
   'ËßÁËÎÒ¡£ÎÒÏÖÔÚÒ²¿ÉÒÔ±£´æÎïÆ·ÁË£¬ÓĞÊ²Ã´ÒªÇó¾ÍºÍÎÒËµ°É¡£\ \'+
   //'|{cmd}<¿ªÆô²Ö¿â/@DoInputDialog1>\'+
  // '|{cmd}<´¢´æÎïÆ·/@storage>   
   '|{cmd}<²Ö¿â¹ÜÀí/@storage>\'  +
   '|{cmd}<À¦¸÷ÖÖ¾íÊéºÍÒ©Ë®/@mbind>\'+
   '|{cmd}<ÍË³ö/@doexit>');
end;

Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   'ÄúÒªĞŞÀíÂğ?\'+
   'ÎÒ¿ÉÊÇ¸öÍòÄÜ¹¤½³Å¶£¡\ \'+
   '|{cmd}<·µ»Ø/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
  'ÔõÃ´Ñù£¬ĞŞºÃÁË°É£¿¿´ÆğÀ´±ÈĞÂµÄ»¹ÖµÇ®£¡\ \' +
  '|{cmd}<·µ»Ø/@main>');
end;

Procedure _s_repair;
Begin
   This_Npc.NpcDialog(This_Player,
   'ÄãÕâ¼Ò»ï£¬Äã¿ÉÌ«ĞÒÔËÁË£¬ÎÒÕıºÃÓĞ²ÄÁÏ×öÌØÊâĞŞ²¹£¬\'+
   'µ«·ÑÓÃÊÇÆÕÍ¨µÄÈı±¶£¡\ \'+
   '|{cmd}<·µ»Ø/@main>');
   This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
   This_Npc.NpcDialog(This_Player,
   'ÒÑ¾­ĞŞÀíºÃÁË£¬¿´ÆğÀ´ºÜ²»´íÂï£¡\' +
   '|{cmd}<·µ»Ø/@main>');
end;

procedure _sell;
begin
   This_Npc.NpcDialog(This_Player,
   '¸øÎÒÄúÒªÂôµÄÎïÆ·.\ \ \'+
   '|{cmd}<·µ»Ø/@main>');
   This_Npc.Click_Sell(This_Player);
end;

Procedure _buy;
Begin
   This_Npc.NpcDialog(This_Player,
   'ÄúÏëÂòĞ©Ê²Ã´?\ \ \'+
   '|{cmd}<·µ»Ø/@main>');
   This_Npc.Click_Buy(This_Player);
end;

procedure OnInitialize;
var
i : integer;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(100);

  //¼ÓÔØµÀ¾ß
  This_NPC.FillGoods('½ğ´´Ò©(Ğ¡Á¿)', 200, 1);
  This_NPC.FillGoods('Ä§·¨Ò©(Ğ¡Á¿)', 200, 1); 
  This_NPC.FillGoods('½ğ´´Ò©(ÖĞÁ¿)', 100, 1);
  This_NPC.FillGoods('Ä§·¨Ò©(ÖĞÁ¿)', 100, 1);
  This_NPC.FillGoods('Ç¿Ğ§½ğ´´Ò©', 100, 1);
  This_NPC.FillGoods('Ç¿Ğ§Ä§·¨Ò©', 100, 1);
  This_NPC.FillGoods('½ğ´´Ò©(Ğ¡)°ü', 100, 1);
  This_NPC.FillGoods('Ä§·¨Ò©(Ğ¡)°ü', 100, 1);
  This_NPC.FillGoods('½ğ´´Ò©(ÖĞ)°ü', 100, 1);
  This_NPC.FillGoods('Ä§·¨Ò©(ÖĞ)°ü', 100, 1);  
  This_NPC.FillGoods('³¬¼¶½ğ´´Ò©', 100, 1);
  This_NPC.FillGoods('³¬¼¶Ä§·¨Ò©', 100, 1);

  //¼ÓÔØstdmode
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
  This_NPC.AddStdMode(43);
  This_NPC.AddStdMode(10);
  This_NPC.AddStdMode(11);
  This_NPC.AddStdMode(15);
  This_NPC.AddStdMode(0);
  This_NPC.AddStdMode(42);
  This_NPC.AddStdMode(3);
  for i := 19 to 28 do
  This_NPC.AddStdMode(i);
end;

Procedure _newskill;
Begin
   If This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÂğ£¿\');
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 8 then
      Begin
         This_Npc.NpcDialog(This_Player,
         '°×ÈÕÃÅµÄÊéµêÀÏ°åÊÇÎÒµÄÖÁ½»£¬\'+
         'Äã¼ÈÈ»À´ÁË£¬¾ÍÂé·³ÄãÈ¥ºÍËû´òÒ»¸öÕĞºô°É¡£\');
      end else if This_Player.GetV(10,1) = 7 then
      begin
         This_Npc.NpcDialog(This_Player,
         'àŞ...Ô­À´ÊÇÄÇ¸öÄêÇáÈË°  £\'+
         'ÕûÌìÔÚÕâÖÖ¹ÖÎïºáĞĞµÄµØ·½°ïÖúÓÂÊ¿ÃÇ£¬\' +
         'ÄÜÅ¼¶ûÌıµ½Ò»Ğ©Ôø¾­µÄÏûÏ¢£¬Ò²ÊÇºÜÁîÈË¸ßĞË¡£\'+
         '°×ÈÕÃÅµÄÊéµêÀÏ°åÊÇÎÒµÄÖÁ½»£¬\' +
         'Äã¼ÈÈ»À´ÁË£¬¾ÍÂé·³ÄãÈ¥ºÍËû´òÒ»¸öÕĞºô°É¡£\');
         This_Player.SetV(10,1,8);      
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÃÏÈÈ¥ÃËÖØ¾Æ¹İÕÒ¼ø±¦É¢ÈËÁìÈ¡¼ø±¦ÊÖĞÅ£¡\');
   end;      
end;


Begin
   if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      'Äã¾¹È»ÄÜÅÜµ½ÕâÀïÀ´£¿\'+
      '¿´ÔÚÄãÕâÃ´ÂôÃüµÄ·İÉÏ£¬ÎÒ¾Í°ïÖúÄãÒ»ÏÂ¡£\ \'+
      '|{cmd}<Âò/@buy>                    ^<Âô/@sell>\'+
      '|{cmd}<ĞŞÀí/@repair>                  ^<ÌØÊâĞŞÀí/@s_repair>\'+
      '|{cmd}<Ê¹ÓÃ²Ö¿â/@cangku>\ \');
   end else if (This_Player.GetV(10,1) = 7) or (This_Player.GetV(10,1) = 8) then
   begin
      This_Npc.NpcDialog(This_Player,
      'Äã¾¹È»ÄÜÅÜµ½ÕâÀïÀ´£¿\'+
      '¿´ÔÚÄãÕâÃ´ÂôÃüµÄ·İÉÏ£¬ÎÒ¾Í°ïÖúÄãÒ»ÏÂ¡£\ \'+
      '|{cmd}<Âò/@buy>                    ^<Âô/@sell>\'+
      '|{cmd}<ĞŞÀí/@repair>                  ^<ÌØÊâĞŞÀí/@s_repair>\'+
      '|{cmd}<Ê¹ÓÃ²Ö¿â/@cangku>\ \'+
      '|{cmd}<ÓĞÒ»¸öÄãÔø¾­Ö¸µã¹ıµÄ°×ÈÕÃÅÃÅÍ½£¬ÈÃÎÒÀ´ÎÊºòÄã/@newskill>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      'Äã¾¹È»ÄÜÅÜµ½ÕâÀïÀ´£¿\'+
      '¿´ÔÚÄãÕâÃ´ÂôÃüµÄ·İÉÏ£¬ÎÒ¾Í°ïÖúÄãÒ»ÏÂ¡£\ \'+
      '|{cmd}<Âò/@buy>                    ^<Âô/@sell>\'+
      '|{cmd}<ĞŞÀí/@repair>                  ^<ÌØÊâĞŞÀí/@s_repair>\'+
      '|{cmd}<Ê¹ÓÃ²Ö¿â/@cangku>\ \');
   end;
end.