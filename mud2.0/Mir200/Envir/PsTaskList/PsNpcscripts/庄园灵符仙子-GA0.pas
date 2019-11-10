{
*******************************************************************}

program Mir2;

 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _chuang;
begin
   if This_Player.Level >= 8 then
   begin
      if compareText(This_Player.MapName,'GA0') = 0 then
      begin
         This_Player.RandomFlyTo('0122~1');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄúµÄµÈ¼¶²»¹»£¬Ìì¹Ø¶ÔÄú¿ÉÄÜÌ«Î£ÏÕÁË£¡'); 
   end;
end;

procedure _xijie;
begin
   This_Npc.NpcDialog(This_Player,
   '|{cmd}<Í¬Ê±ÓµÓĞÔÂ¿¨ºÍÃë¿¨£¬ÈçºÎ¶Ò»»Áé·û/@duihuan>\'+
   '|{cmd}<ÎªÊ²Ã´ÌáÊ¾ÎÒ¡°Ìì¹ØÍ¨µÀÒÑ¾­ÂúÔ±£¬ÇëÉÔºóÔÙÊÔ¡±/@why>\'+
   '|{cmd}<¶Ò»»Áé·ûÊ±£¬ÎªÊ²Ã´ÏµÍ³ÌáÊ¾:¡°ÄãÒªµÈÒ»»á¶ù£¬²ÅÄÜ¶Ò»»£  ±/@tishi>\'+
   '|{cmd}<ÔÚÌì¹ØÖĞ»ñµÃµÄ½ğ¸ÕÊ¯ÈçºÎÏÔÊ¾/@xianshi>\'+
   '|{cmd}<Ìì¹ØÍ¨µÀÊÇ·ñ¾ÍÊÇÌì¹Ø/@shifou>\ \'+
   '|{cmd}<·µ»Ø/@main>');
end;

procedure _shifou;
begin
   This_Npc.NpcDialog(This_Player,
   'Ìì¹ØÍ¨µÀ²¢²»ÊÇÌì¹Ø£¬Ö»ÊÇÌìÍ¥Í¨ÍùÌì¹ØµÄÍ¨µÀ£»\'+
   'Ìì¹ØÍ¨µÀÀïÃ»ÓĞ±¦²Ø£¬ÕæÕıµÄ±¦²ØÊÇÒş²ØÔÚÌì¹ØÀïµÄ¡£\ \'+
   '|{cmd}<·µ»ØÉÏÒ»Ò³/@xijie>');
end;

procedure _xianshi;
begin
   This_Npc.NpcDialog(This_Player,
   'Èç¹ûÄúÔÚÌì¹ØÖĞ»ñµÃÁË½ğ¸ÕÊ¯£¬ÄÇÃ´ÔÚÍ¬Ò»Ìì¹ØÖĞÊÇÎŞ·¨ÏÔÊ¾µÄ£¬\'+
   'Èç¹ûÄú½øÈëÏÂÒ»Ìì¹Ø£¬»ò·µ»ØÌìÍ¥£¬¾Í¿ÉÒÔ¿´µ½Ôö¼ÓµÄ½ğ¸ÕÊ¯ÁË¡£\ \'+
   '|{cmd}<·µ»ØÉÏÒ»Ò³/@xijie>');
end;

procedure _tishi;
begin
   This_Npc.NpcDialog(This_Player,
   'ÏµÍ³¹æ¶¨Ã¿´Î¶Ò»»Áé·ûºó£¬±ØĞëµÈÒ»·ÖÖÓºó²ÅÄÜÔÙ´Î¶Ò»»¡£\ \'+
   '|{cmd}<·µ»ØÉÏÒ»Ò³/@xijie>');
end;

procedure _why;
begin
   This_Npc.NpcDialog(This_Player,
   'Èç¹ûÍæ¼Ò¶Ô×Ô¼ºµÄÊµÁ¦ÓĞĞÅĞÄ£¬¿ÉÒÔ[Ñ¡ÔñÏûÃğ¹ÖÎï]£¬\'+
   'ÔÚÃ»ÓĞÁé·ûµÄ±£»¤ÏÂ½øÈëÌì¹ØÍ¨µÀ¡£\'+
   'Íæ¼Ò±ØĞëÖ»ÉíÏûÃğÍêÌì¹ØÍ¨µÀÀïµÄËùÓĞ¹ÖÎï£¬²ÅÄÜ½øÈëÌì¹Ø¶á±¦£¬\'+
   'ÕâÑùµÄÍ¨µÀÒ»¹²ÓĞ10Ìõ£¬\'+
   'Èç¹ûÂúÔ±¾Í»áÌáÊ¾£º¡°Ìì¹ØÍ¨µÀÒÑ¾­ÂúÔ±£¬ÇëÉÔºóÔÙÊÔ¡±\ \'+
   '|{cmd}<·µ»ØÉÏÒ»Ò³/@xijie>');
end;

procedure _duihuan;
begin
   This_Npc.NpcDialog(This_Player,
   '¶Ò»»Áé·ûÊ±£¬ÈçÕÊºÅÍ¬Ê±´æÔÚÔÂ¿¨¡¢Ãë¿¨£¬ÏµÍ³½«ÏÈ¿ÛÔÂ¿¨ÔÙ¿Û\'+
   'Ãë¿¨£»\'+
   'ÈçÍæ¼Ò¶Ò»»ÊıÁ¿´óÓÚµÈÓÚµ±Ç°ÔÂ¿¨Ê£ÓàÌìÊı£¬ÏµÍ³½«Ö»¶Ò»»ÔÂ¿¨\'+
   'µ±Ç°Óà¶î¼õÈ¥1ÌìºóËù¶ÔÓ¦µÄÁé·ûÊıÁ¿£»\'+
   'Èç¹ûÍæ¼Ò»¹Òª¼ÌĞø¶Ò»»£¬ÔòĞèµÈ´ıÒ»¶ÎÊ±¼ä£¬Õâ¶ÎÊ±¼ä¼ä¸ô¸ù¾İ\'+
   'Íæ¼ÒÉêÇëÊ±Ñ¡Ôñ¶Ò»»Áé·ûµÄÊıÁ¿¶ø¶¨£»\'+
   'Õâ¶ÎÊ±¼äÒÔºó£¬Íæ¼Ò¿ÉÊ¹ÓÃÃë¿¨½øĞĞÁé·ûµÄ¶Ò»»Ãë¿¨ÄÜ¶Ò»»µÄ×î\'+
   '´ó¶î¶ÈÎªÃë¿¨µÄµ±Ç°Óà¶î¼õÈ¥1Ğ¡Ê±Ëù¶ÔÓ¦µÄÁé·ûÊıÁ¿¡£\'+ 
   '|{cmd}<¡°¼õÈ¥ 1Ìì¡±¡¢¡°¼õÈ¥ 1Ğ¡Ê±¡±ÊÇÊ²Ã´ÒâË¼/@yisi>        ^<·µ»ØÉÏÒ»Ò³/@xijie>');
end;

procedure _yisi;
begin
   This_Npc.NpcDialog(This_Player,
   'ÔÂ¿¨ÓÃ»§ÔÚ¶Ò»»Áé·ûÊ±£¬ÏµÍ³»á±£Áôµ±Ç°ÔÂ¿¨µÄ×îºóÒ»Ìì£¬ÒÔ¾¡\'+
   'Á¿±£Ö¤Íæ¼ÒÏÂ´ÎÄÜµÇÂ½ÓÎÏ·£»\'+
   'µ±Ç°ÔÂ¿¨ËùÄÜ¶Ò»»Áé·ûµÄ×î´ó¶î¶ÈµÈÓÚÔÂ¿¨µÄµ±Ç°Óà¶î¼õÈ¥1Ìì£¬\'+
   '±£ÁôµÄÕâ1ÌìÒÀÈ»×ñÊØÔÂ¿¨¡°ËæÊ±¼ä×ÔÈ»ÏûºÄ¡±µÄ¼Æ·Ñ·½Ê½£»\'+
   'Ãë¿¨ÓÃ»§ÔÚ¶Ò»»Áé·ûÊ±£¬ÏµÍ³Ò²½«±£Áôµ±Ç°Ãë¿¨µÄ×îºóÒ»Ğ¡Ê±£»\'+
   'µ±Ç°Ãë¿¨ËùÄÜ¶Ò»»Áé·ûµÄ×î´ó¶î¶ÈµÈÓÚÃë¿¨µÄµ±Ç°Óà¶î¼õÈ¥ 1Ğ¡\'+
   'Ê±£¬±£ÁôµÄÕâ 1Ğ¡Ê±Ò²ÒÀÈ»×ñÊØÃë¿¨¡°Ëæ×ÅÓÎÏ·¶øÏûºÄ¡±µÄ¼Æ·Ñ\'+
   '·½Ê½¡£\'+
   '|{cmd}<·µ»Ø/@xijie>');
end;

procedure _randomga0;
var
tga0 : integer;
begin
  if compareText(This_Player.MapName,'GA0') = 0 then
  begin
     tga0 := random(5);
     if tga0 = 4 then
     begin
        This_Player.Flyto('GA0',70,71);
     end else if tga0 = 3 then
     begin
        This_Player.Flyto('GA0',73,64);
     end else if tga0 = 2 then
     begin
        This_Player.Flyto('GA0',73,69);
     end else if tga0 = 1 then
     begin
        This_Player.Flyto('GA0',62,72);
     end else if tga0 = 0 then
     begin
        This_Player.Flyto('GA0',61,64);
     end; 
  end;
end;

procedure _ybbuylingfu;
var
  num : integer;
begin
  num := This_Player.GetV(14,2);
  if num < 0 then
  begin
    num := 0;
    This_Player.SetV(14,2,0);
    This_Npc.NpcDialog(This_Player,
    '¶Ò»»±ê×¼£º1¸öÔª±¦¿ÉÒÔÓÃÒÔ¶Ò»»1ÕÅÁé·û£¬\'
    +'ÈçÄú½øĞĞÁé·ûµÄ¶Ò»»£¬ÔòÊÓÄúÒÑ¾­Í¬ÒâÒÔÉÏ¶Ò»»¹æÔò¡£\' 
    +'Äã»¹Ã»ÓĞ¶Ò»»Áé·û¡£\'  
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼ÓÒ»ÕÅ/@ybaddone> ^<¼ÓÎåÕÅ/@ybaddfive> ^<¼ÓÊ®ÕÅ/@ybaddten>      |<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    );
  end
  else if num = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '¶Ò»»±ê×¼£º1¸öÔª±¦¿ÉÒÔÓÃÒÔ¶Ò»»1ÕÅÁé·û£¬\'
    +'ÈçÄú½øĞĞÁé·ûµÄ¶Ò»»£¬ÔòÊÓÄúÒÑ¾­Í¬ÒâÒÔÉÏ¶Ò»»¹æÔò¡£\'
    +'Äã»¹Ã»ÓĞ¶Ò»»Áé·û¡£\'  
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼ÓÒ»ÕÅ/@ybaddone> ^<¼ÓÎåÕÅ/@ybaddfive> ^<¼ÓÊ®ÕÅ/@ybaddten>      |<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    );
  end
  else if num < 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '¶Ò»»±ê×¼£º1¸öÔª±¦¿ÉÒÔÓÃÒÔ¶Ò»»1ÕÅÁé·û£¬\'
    +'ÈçÄú½øĞĞÁé·ûµÄ¶Ò»»£¬ÔòÊÓÄúÒÑ¾­Í¬ÒâÒÔÉÏ¶Ò»»¹æÔò¡£\' 
    +'Äã´òËã¶Ò»»' + inttostr(num) + 'ÕÅÁé·û\' 
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼ÓÒ»ÕÅ/@ybaddone> ^<¼ÓÎåÕÅ/@ybaddfive> ^<¼ÓÊ®ÕÅ/@ybaddten>      |<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    );
  end
  else
  begin
    num := 1000;
    This_Player.SetV(14,2,num);
    This_Npc.NpcDialog(This_Player,
    'Ò»´Î×î¶à¿É¶Ò»»1000ÕÅÁé·û£¬\'
    +'ÄúÒÑ¾­Ñ¡Ôñ¶Ò»»1000ÕÅÁé·û£¬ÊÇ·ñ½øĞĞ¶Ò»»£¿\ \'
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    ); 
  end;
end;

procedure showchklinfu();
var
  num : integer;
begin
  num := This_Player.GetV(14,2);
  if num < 0 then
  begin
    num := 0;
    This_Player.SetV(14,2,0);
    This_Npc.NpcDialog(This_Player,
    '¶Ò»»±ê×¼£º1¸öÔª±¦¿ÉÒÔÓÃÒÔ¶Ò»»1ÕÅÁé·û£¬\'
    +'ÈçÄú½øĞĞÁé·ûµÄ¶Ò»»£¬ÔòÊÓÄúÒÑ¾­Í¬ÒâÒÔÉÏ¶Ò»»¹æÔò¡£\' 
    +'Äã»¹Ã»ÓĞ¶Ò»»Áé·û¡£\' 
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼ÓÒ»ÕÅ/@ybaddone> ^<¼ÓÎåÕÅ/@ybaddfive> ^<¼ÓÊ®ÕÅ/@ybaddten>      |<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    );
  end
  else if num = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '¶Ò»»±ê×¼£º1¸öÔª±¦¿ÉÒÔÓÃÒÔ¶Ò»»1ÕÅÁé·û£¬\'
    +'ÈçÄú½øĞĞÁé·ûµÄ¶Ò»»£¬ÔòÊÓÄúÒÑ¾­Í¬ÒâÒÔÉÏ¶Ò»»¹æÔò¡£\' 
    +'Äã»¹Ã»ÓĞ¶Ò»»Áé·û¡£\' 
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼ÓÒ»ÕÅ/@ybaddone> ^<¼ÓÎåÕÅ/@ybaddfive> ^<¼ÓÊ®ÕÅ/@ybaddten>      |<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    );
  end
  else if num < 1000 then
  begin
    This_Npc.NpcDialog(This_Player,
    '¶Ò»»±ê×¼£º1¸öÔª±¦¿ÉÒÔÓÃÒÔ¶Ò»»1ÕÅÁé·û£¬\'
    +'ÈçÄú½øĞĞÁé·ûµÄ¶Ò»»£¬ÔòÊÓÄúÒÑ¾­Í¬ÒâÒÔÉÏ¶Ò»»¹æÔò¡£\' 
    +'Äã´òËã¶Ò»»' + inttostr(num) + 'ÕÅÁé·û\' 
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼ÓÒ»ÕÅ/@ybaddone> ^<¼ÓÎåÕÅ/@ybaddfive> ^<¼ÓÊ®ÕÅ/@ybaddten>      |<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    );
  end
  else
  begin
    num := 1000;
    This_Player.SetV(14,2,num);
    This_Npc.NpcDialog(This_Player,
    'Ò»´Î×î¶à¿É¶Ò»»1000ÕÅÁé·û£¬\'
    +'ÄúÒÑ¾­Ñ¡Ôñ¶Ò»»1000ÕÅÁé·û£¬ÊÇ·ñ½øĞĞ¶Ò»»£¿\ \'
    +'|{cmd}<²éÑ¯Áé·û/@chklinfu>\'
    +'|{cmd}<¼õÒ»ÕÅ/@ybdecone> ^<¼õÎåÕÅ/@ybdecfive> ^<¼õÊ®ÕÅ/@ybdecten>\'
    +'|{cmd}<È·¶¨Ê¹ÓÃÔª±¦¶Ò»»/@ybbuylf>          ^<ÈÎÒâ¶Ò»»Áé·û/@ybbuylf_1>          |<·µ»Ø/@main>'
    
    ); 
  end;
end;

procedure _chklinfu;
begin
  This_Npc.NpcDialog(This_Player,
  'Äãµ±Ç°µÄÁé·û×ÜÊıÊÇ£º' + inttostr(This_Player.MyLFnum)
  ); 
end;

procedure ybaddlinfu(num : integer);
var
  allnum : integer;
begin
  allnum := This_Player.GetV(14,2) + num;
  if  allnum < 1000 then
  begin
    This_Player.SetV(14,2,allnum);
    showchklinfu;
  end
  else
  begin
    This_Player.SetV(14,2,1000);
    showchklinfu;
  end;
end; 


procedure _ybaddone;
begin
  ybaddlinfu(1);
end;

procedure _ybaddfive;
begin
  ybaddlinfu(5);
end;  

procedure _ybaddten;
begin
  ybaddlinfu(10);
end;

procedure ybdeclinfu(num : integer);
var
  allnum : integer;
begin
  allnum := This_Player.GetV(14,2) - num;
  if  allnum > 0 then
  begin
    This_Player.SetV(14,2,allnum);
    showchklinfu;
  end
  else
  begin
    This_Player.SetV(14,2,0);
    showchklinfu;
  end;
end; 

procedure _ybdecone;
begin
  ybdeclinfu(1);
end;

procedure _ybdecfive;
begin
  ybdeclinfu(5);
end;  

procedure _ybdecten;
begin
  ybdeclinfu(10);
end;

procedure _ybbuylf;
var
  linfu_num : integer;
begin
  linfu_num := This_Player.GetV(14,2);
  if This_Player.YBNum >= linfu_num then
  begin
    This_Npc.ClientYBbuyLF(This_Player, linfu_num);
    This_Player.SetV(14,2,0);
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    'ÄúÉíÉÏÃ»ÓĞÄÇÃ´¶àµÄÔª±¦¡£\ \|{cmd}<·µ»Ø/@main>');
  end;
end;

procedure _ybbuylf_1;
begin
  This_Npc.InputDialog(This_Player, 'ÇëÊäÈëÒª¶Ò»»µÄÁé·ûÊıÁ¿(1~~1000)£º', 0, 101);
end;

procedure P101;
var
  linfu_num : integer;
begin
  if This_Npc.InputOk then
  begin
    linfu_num := strtointdef(Trim(This_Npc.InputStr), 0);
    if This_Player.YBNum >= linfu_num then
    begin
      if (linfu_num > 0) and (linfu_num <= 1000) then
      begin
        This_Npc.ClientYBbuyLF(This_Player, linfu_num);
      end
      else
      begin
        This_Npc.NpcDialog(This_Player,
        'Ã¿´Î¶Ò»»²»ÄÜ³¬¹ı1000ÕÅ¡£\ \|{cmd}<·µ»Ø/@main>'); 
      end;
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      'ÄúÉíÉÏÃ»ÓĞÄÇÃ´¶àµÄÔª±¦¡£\ \|{cmd}<·µ»Ø/@main>'); 
    end;
  end; 
end;

Begin
   This_Npc.NpcDialog(This_Player,
   'ÔÚ½øÈëÌì¹ØÍ¨µÀÇ°µÄË²¼ä£¬Ê¹ÓÃ1ÕÅÁé·û½«¿ÉÒÔÒşÉí¶İĞÎ¡£\'+
   '´ËÊ±£¬Ìì¹ØÍ¨µÀÄÚµÄ¹ÖÎï½«ÎŞ·¨¿´µ½Äã£¬Í¨¹ıÎÒ£¬ÎÒ¿ÉÒÔ½«ÄúµÄ\'+
   'Ôª±¦¶Ò»»³ÉÁé·û£¬Äã¿ÉÒÔÊäÈëÏëÒª¶Ò»»µÄÁé·ûÊıÁ¿£¬\'+
   '1¸öÔª±¦¶Ò»»1ÕÅÁé·û£¬½øÈë×¯Ô°ºó£¬µÈ´ıÒ»·ÖÖÓºó¾Í¿É¶Ò»»Áé·û¡£\ \'+
   '|{cmd}<Ç°ÍùÌìÍ¥´³Ìì¹Ø/@chuang>                  ^<²éÑ¯Áé·ûÊıÁ¿/@chklinfu>\'+ 
   '|{cmd}<ÁË½â´³Ìì¹ØµÄ¹æÔò/@xijie>                ^<Ê¹ÓÃÔª±¦¶Ò»»Áé·û/@ybbuylingfu>\'+
   '|{cmd}<È¥ÖÜÎ§¿´¿´/@randomga0>                      ^<Àë¿ª/@doexit>');
end.