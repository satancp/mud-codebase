{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  {$IFDEF Q136_hero}
  if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>  \'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \' );
   end else if (This_Player.GetV(10,1) = 4) or (This_Player.GetV(10,1) = 5) then
   begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>  \'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \'+
      '|{cmd}<ÄÇ¼Ò»ï¹ûÈ»¹»±¿/@newskill465>');
   end else if (This_Player.GetV(10,1) = 2) or (This_Player.GetV(10,1) = 3) then
   begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>  \'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \'+
      '|{cmd}<ÄãĞèÒªÎÒ°ïÃ¦£¿/@newskill>');
   end else
   Begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>  \'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \');
   end;
  {$ELSE}
   if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>                          ^<´òÌı¾ÆÆø»¤Ìå/@drink>\'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \' );
   end else if (This_Player.GetV(10,1) = 4) or (This_Player.GetV(10,1) = 5) then
   begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>                          ^<´òÌı¾ÆÆø»¤Ìå/@drink>\'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \'+
      '|{cmd}<ÄÇ¼Ò»ï¹ûÈ»¹»±¿/@newskill465>');
   end else if (This_Player.GetV(10,1) = 2) or (This_Player.GetV(10,1) = 3) then
   begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>                          ^<´òÌı¾ÆÆø»¤Ìå/@drink>\'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \'+
      '|{cmd}<ÄãĞèÒªÎÒ°ïÃ¦£¿/@newskill>');
   end else
   Begin
      This_Npc.NpcDialog(This_Player,
      '»¶Ó­£¬ÄãÏëÂòĞ©ĞŞÁ¶µÄÊéÂğ£¿\ \'+
      '|{cmd}<ÂòÊé/@buy>                          ^<´òÌı¾ÆÆø»¤Ìå/@drink>\'+
      '|{cmd}<ÂôÊé/@sell>  \'+
      '|{cmd}<Ñ¯ÎÊ¸÷ÖÖÎä¼¼µÄÏ¸½Ú/@helpbooks> \ \');
   end;
  {$ENDIF}
end;

procedure _jinzhen;
begin
  This_Npc.NpcDialog(This_Player,
  'ÌıËµ×¯Ô°¹Ü¼Ò×î½üÅªµ½Ò»´óÅú¡°À¬»ø¡±£¬\'
  +'ÆäÖĞÓĞ²»ÉÙÊÇÒ»Ğ©ÒÑ¾­ÒÅÊ§µÄÊé¼®¡£ÄãÄÜ°ïÎÒÈ¥ÅªÀ´Ò»Ğ©Ã´£¿\'
  +'»òĞíÄÜÕÒµ½Ò»Ğ©²»´íµÄ¶«Î÷¡£µ±È»£¬ÎÒÒ²²»»á¿÷´ıÄã¡£\ \'
  +'|{cmd}<¼ø¶¨¡°²ĞÆÆµÄ¹Å¼®¡±/@jinzhen1>             ^<¼ø¶¨¡°Î¢»ÆµÄ¹ÅÊé¡±/@jinzhen2>\'
  +'|{cmd}<¼ø¶¨¡°¹Å´úÃØ¼®¡±/@jinzhen3>\ \'
  +'|{cmd}<ÓÃ¹Å¼®»»È¡½±ÀøµÄ/@jinzhen4>\'
  );
end;

procedure _jinzhen1;
begin
  if This_Player.GetBagItemCount('²ĞÆÆµÄ¹Å¼®') > 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    'ß×£¬ÕâÊÇ£¿Õâ±¾<²ĞÆÆµÄ¹Å¼®/c=red>¿´ÉÏÈ¥ÒÑ¾­ÓĞÉÏ°ÙÄêµÄÀúÊ·ÁË¡£\'
    +'ÓĞµãÒâË¼£¬Õâ±¾ÊéµÄÊéÒ³ÒÑ¾­±»ÑªË®Õ³Á¬ÆğÀ´ÁË£¬\'
    +'¿´À´ÎÒĞèÒª»¨µãÊ±¼äÀ´ÕûÀíËü¡£Ò²ĞíÄÜ·¢ÏÖÒ»Ğ©ÓĞÒâË¼µÄ¶«Î÷¡£\'
    +'ÄãÔ¸Òâ°Ñ<²ĞÆÆµÄ¹Å¼®/c=red>¸øÎÒÃ´£¿\ \'
    +'|{cmd}<Ã»ÎÊÌâ£¬ÄãÄÃÈ¥°É/@jinzhen1_start>\ \'
    +'|{cmd}<Àë¿ª/@doexit>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '±§Ç¸£¬ÎÒºÜÃ¦¡£\Ã»ÓĞÒª½ôµÄÊÂÇé²»Òª·³ÎÒ¡£\ \|{cmd}<²»ºÃÒâË¼/@doexit>'
    );
  end;
end;

procedure _jinzhen1_start;
var
  temp,temp1: integer;
begin
    if This_Player.GetBagItemCount('²ĞÆÆµÄ¹Å¼®') >= 1 then
    begin
      temp := random(100) + 1;
      if temp <= 10 then
      begin
        This_Npc.NpcDialog(This_Player,
        '¼¸ÌìÇ°ÓĞÒ»¸öÂÃĞĞ¼Ò¾­¹ıÎÒÕâ£¬ÍĞÎÒ¸øËûĞ´ÁËÒ»·â¼ÒÊé¡£\'
        +'ÁÙ×ßËÍÁËÎÒÕâ½Ø<Ğ«ÉßµÄÇ¯×Ó/c=red>¡£ËûËµÕâ¶«Î÷ìÒÌÀ·Ç³£ÃÀÎ¶¡£\'
        +'¿ÉÏ§£¬ÎÒ¶ÔÕâÍæÒâ²»¸ĞĞËÈ¤¡£ËÍ¸øÄã°É¡£\'
        +'ÌıËµ<¼ø±¦É¢ÈË/c=red>Í¦Ï²»¶ÕâÖÖÏ¡Ææ¹Å¹ÖµÄ¶«Î÷¡£\'
        +'Èç¹ûÄãÒ²²»Ï²»¶£¬¿ÉÒÔ¸øËûËÍ¹ıÈ¥£¬»òĞíÄÜÓĞËù·¢ÏÖ¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('²ĞÆÆµÄ¹Å¼®',1);
        This_Player.Give('Ğ«ÉßµÄÇ¯×Ó',1);
      end
      else if temp <= 35 then
      begin
        This_Npc.NpcDialog(This_Player,
        'Õâ°Ñ<Ö¸»Óµ¶/c=red>ÊÇÎÒÅóÓÑµÄ£¬¿ÉÏ§ËûÔÚÌ½Ë÷¹Å¼£µÄÊ±ºò±»°ëÊŞÈË\'
        +'É±º¦ÁË¼¸ÌìÇ°ÓĞÈËÔÚÒ»´¦°ëÊŞÈËµÄ³²Ñ¨·¢ÏÖÁËËü£¬²¢´øÁË»ØÀ´¡£\'
        +'×÷Îª²ĞÆÆµÄ¹Å¼®µÄ»Ø±¨£¬ÏÖÔÚÎÒ°ÑËüÖ£ÖØµÄ½»¸øÄã¡£\'
        +'Ï£ÍûÄãµÄÄÜ¹»´ø×ÅËû£¬È¥Ì½Ë÷Âê·¨´óÂ½µÄÉñÆæ¡£\'
        +'Èç¹ûÄã²»ĞèÒªËû£¬Ò²¿ÉÒÔ°ÑËûËÍ¸ø<ÃËÖØÖ¸»Ó¹Ù/c=red>£¬\'
        +'ËûĞËĞí»á¶ÔÕâ¸ö¸ĞĞËÈ¤¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('²ĞÆÆµÄ¹Å¼®',1);
        This_Player.Give('Ö¸»Óµ¶',1);
      end
      else if temp <= 50 then
      begin
        This_Npc.NpcDialog(This_Player,
        'ÎÒÕâÓĞÒ»±¾<Î¢»ÆµÄ¹ÅÊé/c=red>£¬ÀïÃæµÄÄÚÈİÊÇÓÃÒ»ÖÖ·Ç³£¹ÅÀÏµÄÎÄ×ÖÊéĞ´µÄ\'
        +'Èç¹ûÄã¸ĞĞËÈ¤£¬¿ÉÒÔÄÃÈ¥ÑĞ¾¿ÏÂ¡£\'
        +'Èç¹ûÄã¾õµÃÕâ±¾Êé¶ÔÄã¶øÑÔ¹ıÓÚ¼èÄÑ£¬¿ÉÒÔÄÃµ½ÎÒÕâ»»ÆäËûµÄÊé¼®¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('²ĞÆÆµÄ¹Å¼®',1);
        This_Player.Give('Î¢»ÆµÄ¹ÅÊé',1);
      end
      else
      begin
        This_Player.Take('²ĞÆÆµÄ¹Å¼®',1);
        This_Npc.NpcDialog(This_Player,
        '¶àĞ»Äã£¬ÓÂÊ¿£¡²»¹ıÄã¸øÎÒµÄ¶«Î÷ºÃÏñÃ»Ê²Ã´¼ÛÖµ£¬\Èç¹ûÏÂ´ÎÄã»¹ÓĞÕâÒ»ÀàµÄÎïÆ·¿ÉÒÔ¸øÎÒ¿´¿´£¬\»òĞíÄÜ¹»ÓĞËù·¢ÏÖ£¡'
        ); 
      end;  
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÃ»ÓĞ<²ĞÆÆµÄ¹Å¼®/c=red>Ñ½£¡\ \|{cmd}<ºÃµÄ/@doexit>'); 
    end;
end;

//¸Ã¹ı³ÌÔ­À´È±Ê§£¬ÏÖ²¹³ä£» 
procedure _jinzhen2;
begin
  if This_Player.GetBagItemCount('Î¢»ÆµÄ¹ÅÊé') > 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    '|{cmd}<Î¢»ÆµÄ¹ÅÊé/c=red>£¬É¢·¢×ÅÀúÊ·µÄÎ¶µÀ¡£¿´À´£¬Õâ±¾Êé»¹ÊÇÓëÄãÎŞÔµ£¬'+
    '»¹ÊÇÈÃÎÒÀ´´ÓÖĞÑ°ÕÒÀúÊ·µÄºÛ¼£°É¡£±Ï¾¹ÕâÊÇÎÒµÄ¹¤×÷¡£\'+
    '²»¹ÜÔõÃ´Ëµ£¬´Ò´ÒµÄÂÃ¿Í£¬»¹ÊÇ¸ĞĞ»Äã¡£°ÑÎ¢»ÆµÄ¹ÅÊé¸øÎÒ£¬\'+
    'ÎÒ¿´¿´ÓĞÃ»ÓĞÁîÄã¸ĞĞËÈ¤µÄ¶«Î÷×÷Îª»Ø±¨¡£\ \'+
    '|{cmd}<¸øÄãÎ¢»ÆµÄ¹ÅÊé/@jinzhen2_start>\ \'+
    '|{cmd}<Àë¿ª/@doexit>');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '±§Ç¸£¬ÎÒºÜÃ¦¡£\Ã»ÓĞÒª½ôµÄÊÂÇé²»Òª·³ÎÒ¡£\ \|{cmd}<²»ºÃÒâË¼/@doexit>'
    );
  end;
end;

procedure _jinzhen2_start;
var
  temp,temp1: integer;
begin
    if This_Player.GetBagItemCount('Î¢»ÆµÄ¹ÅÊé') >= 1 then
    begin
      temp := random(100) + 1;
      if temp <= 10 then
      begin
        This_Npc.NpcDialog(This_Player,
        '¸ÃËÀ£¬Õâ±¾ÊéÀï¾ÓÈ»»¹¼Ğ×ÅÕâÍæÒâ¡£\' 
        +'Õâ´é<Å£Ä§Ã«·¢/c=red>¸øÄãÁË£¡±ğÎÊÎÒÓĞÊ²Ã´ÓÃ¡£ÎÒÖ»¹ØĞÄÕâ±¾Êé¡£\'
        +'¾İËµÊÇ´ÓÅ£Ä§¶´ÀïÇÀ³öÀ´µÄ¡£\'
        +'ÖÁÓÚÕâ¸öÃ«·¢ÓĞÊ²Ã´ÓÃ£¬È¥ÎÊÃËÖØ¾Æ¹İµÄ<¼ø±¦É¢ÈË/c=red>°É¡£\'
        +'Ëû¾ÍÏ²»¶µ¹ÌÚÕâĞ©ÔàÙâÙâµÄ¶«Î÷¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('Î¢»ÆµÄ¹ÅÊé',1);
        This_Player.Give('Å£Ä§Ã«·¢',1);
      end
      else if temp <= 35 then
      begin
        This_Npc.NpcDialog(This_Player,
        'Ç°Õó×ÓÓĞ¸ö¹ó×å´ÓÎÒÕâ¾­¹ı¡£\'
        +'²»ÖªµÀÎªÊ²Ã´Ò»¶¨ÒªÓÃÕâ°Ñ<Í³ÁìÅå½£/c=red>È¥»»Ò»±¾ÁÒ»ğ½£·¨¡£\'
        +'ËäÈ»ÎÒ³öÊÛ¸÷ÖÖÕ½¼¼£¬µ«ÊÇ×÷ÎªÒ»¸ö°æ±¾Ñ§¼Ò£¬\'
        +'ÎÒ¶ÔÍ³ÁìÅå½£²»¸ĞĞËÈ¤¡£ËÍ¸øÄã°É¡£\'
        +'ÌıËµ<ÃËÖØÖ¸»Ó¹Ù/c=red>¶ÔÕâ¸öÍ¦¸ĞĞËÈ¤µÄ¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('Î¢»ÆµÄ¹ÅÊé',1);
        This_Player.Give('Í³ÁìÅå½£',1);
        if This_Player.GetV(21,6)>= 0 then
        begin
          temp1 := This_Player.GetV(21,6);
          This_Player.SetV(21, 6, temp1+1);
        end
        else
        begin
          This_Player.SetV(21, 6, 1);
        end;
      end
      else if temp <= 50 then
      begin
        This_Npc.NpcDialog(This_Player,
        '¿´ÄãµÄÑù×ÓÒ²Ó¦¸ÃÊÇ¸ö¶ÔÎäÑ§³äÂúĞËÈ¤µÄÈËÁË¡£\'
        +'Õâ±¾¹Å´úÃØ¼®ÄÃÈ¥°É¡£»òĞíÄã»á¸ĞĞËÈ¤¡£\'
        +'µ±È»£¬Õâ±¾ÊéÊÇĞèÒªÒ»¶¨µÄ¶¨Á¦²ÅÄÜ¿´µÄÏÂÈ¥µÄ¡£\'
        +'¶ÔÎÒÕâÖÖ¸ÊÓÚ¼ÅÄ¯µÄÈË¶øÑÔ£¬ÊÇÔÙºÃ²»¹ıµÄÒ»¼ÁÁ¼·½¡£\ \'
        +'|{cmd}<ºÃµÄ£¬ÎÒ³¢ÊÔÒ»ÏÂ/@doexit>'
        );
        This_Player.Take('Î¢»ÆµÄ¹ÅÊé',1);
        This_Player.Give('¹Å´úÃØ¼®',1);
      end
      else
      begin
        This_Player.Take('Î¢»ÆµÄ¹ÅÊé',1);
        This_Npc.NpcDialog(This_Player,
        '¶àĞ»Äã£¬ÓÂÊ¿£¡²»¹ıÄã¸øÎÒµÄ¶«Î÷ºÃÏñÃ»Ê²Ã´¼ÛÖµ£¬\Èç¹ûÏÂ´ÎÄã»¹ÓĞÕâÒ»ÀàµÄÎïÆ·¿ÉÒÔ¸øÎÒ¿´¿´£¬\»òĞíÄÜ¹»ÓĞËù·¢ÏÖ£¡'
        ); 
      end;  
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÃ»ÓĞ<Î¢»ÆµÄ¹ÅÊé/c=red>Ñ½£¡\ \|{cmd}<ºÃµÄ/@doexit>'); 
    end;
end;

//¸Ã¹ı³ÌÔ­À´È±Ê§£¬ÏÖ²¹³ä£» 
procedure _jinzhen3;
begin
  if This_Player.GetBagItemCount('¹Å´úÃØ¼®') > 0 then
  begin
    This_Npc.NpcDialog(This_Player,
    'ºÃ°ÉºÃ°É£¬Ò²Ö»ÄÜÕâÑùÁË¡£Ïñ<¹Å´úÃØ¼®/c=red>ÕâÖÖ¼èÉ¬µÄÊé¼®»¹ÊÇ\'+
    'Áô¸øÎÒÀ´Æ·ÆÀ°É¡£°¥£¬ÈËĞÄ²»¹Å°¡£¬ÈËĞÄ²»¹Å°  £¿´ÄãÕâÃ´ĞÒ¿à£¬\'+
    '°Ñ<¹Å´úÃØ¼®/c=red>¸øÎÒ°É£¬ÎÒÓ¦¸ÃÄÜÕÒµ½Ò»·İÄã¸ĞĞËÈ¤µÄ¶«Î÷¡£\ \'+
    '|{cmd}<ÎÒÕâÀïÓĞ±ú¹Å´úÃØ¼®£¬¸øÄã/@jinzhen3_start>\ \'+
    '|{cmd}<Àë¿ª/@doexit>');
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '±§Ç¸£¬ÎÒºÜÃ¦¡£\Ã»ÓĞÒª½ôµÄÊÂÇé²»Òª·³ÎÒ¡£\ \|{cmd}<²»ºÃÒâË¼/@doexit>'
    );
  end;
end;

procedure _jinzhen3_start;
var
  temp,temp1: integer;
begin
  if This_Player.GetV(21,4) = GetDateNum(GetNow) then
  begin
    This_Npc.NpcDialog(This_Player,
    '½ñÌìÄãÒÑ¾­¶Ò»»¹ıÎïÆ·ÁË£¬²»ÄÜÔÙ´Î¶Ò»»£¡'); 
  end
  else
  begin
    if This_Player.GetBagItemCount('¹Å´úÃØ¼®') >= 1 then
    begin
      temp := random(100) + 1;
      if temp <= 10 then
      begin
        This_Npc.NpcDialog(This_Player,
        '|{cmd}<ÖëÍõ¶ÏÖ«/c=red>£¡ºÇºÇ£¬ºÜÉÙ¼ûµÄ¶«Î÷°É¡£\'
        +'|{cmd}<¼ø±¦É¢ÈË/c=red>Ò»Ö±ÔÚÕÒÕâ¸ö¶«Î÷¡£ÄÃÈ¥°É¡£\'
        +'È¥ÕÒ¼ø±¦É¢ÈË¡£Ëû»á¸æËßÄãÒ»¶Î·Ç³£ÓĞÈ¤µÄ¹ÊÊÂµÄ¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('¹Å´úÃØ¼®',1);
        This_Player.Give('ÖëÍõ¶ÏÖ«',1);
        This_Player.SetV(21,4, GetDateNum(GetNow));
      end
      else if temp <= 35 then
      begin
        This_Npc.NpcDialog(This_Player,
        This_Player.Name + '£¬¸øÄã<½«¾üÁîÅÆ/c=red>£¡\'
        +'µ±ÄêÎÒ´Ó¾üµÄÊ±ºò£¬Ö¸»Ó¹Ù°ä·¢¸øÎÒµÄÌØ±ğ½±Àø¡£\'
        +'Õâ¿é½«¾üÁîÅÆ´ú±í×Å¾ü¶ÓµÄ×î¸ßÈ¨ÏŞ£¬\'
        +'Ê¹ÓÃËü¿ÉÒÔÔÚ<×¯Ô°¹Ü¼Ò/c=red>ÄÇÀï½øĞĞÒ»´Î×î¸ßÌØÑµ£¬\'
        +'¾­¹ıÌØÑµ£¬Äã»áµÃµ½´óÁ¿µÄ¾­Ñé£¬»òÕß¸÷ÖÖµÈ¼¶µÄ½ğÕë¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('¹Å´úÃØ¼®',1);
        This_Player.Give('½«¾üÁîÅÆ',1);
        This_Player.SetV(21,4, GetDateNum(GetNow));
        if This_Player.GetV(21,7)>= 0 then
        begin
          temp1 := This_Player.GetV(21,7);
          This_Player.SetV(21, 7, temp1+1);
        end
        else
        begin
          This_Player.SetV(21, 7, 1);
        end;
      end
      else if temp <= 50 then
      begin
        This_Npc.NpcDialog(This_Player,
        '¿´À´±ØĞëÄÃ³öÎÒµÄÕä²ØÁË¡ª¡ª<½£ÉñÊÖÔı/c=red>£¡\'
        +'Õâ¸öÊÀ½çÉÏ¾ÍÖ»ÓĞÕâÒ»±¾¡£\'
        +'ËùÒÔ£¬ÎÒÖ»ÄÜ½è¸øÄã¿´£¬¿´ÍêÁËÇë»¹¸øÎÒ¡£\'
        +'ÎÒ»á¸øÄã½²½âÆäÖĞµÄ°ÂÃØ£¬ÏàĞÅÄãÄÜ¹»´ÓÖĞÁìÎòµ½²»ÉÙĞÂµÄ¶«Î÷¡£\ \'
        +'|{cmd}<ºÃµÄ/@doexit>'
        );
        This_Player.Take('¹Å´úÃØ¼®',1);
        This_Player.Give('½£ÉñÊÖÔı',1);
        This_Player.SetV(21,4, GetDateNum(GetNow));
      end
      else
      begin
        This_Player.Take('¹Å´úÃØ¼®',1);
        This_Npc.NpcDialog(This_Player,
        '¶àĞ»Äã£¬ÓÂÊ¿£¡²»¹ıÄã¸øÎÒµÄ¶«Î÷ºÃÏñÃ»Ê²Ã´¼ÛÖµ£¬\Èç¹ûÏÂ´ÎÄã»¹ÓĞÕâÒ»ÀàµÄÎïÆ·¿ÉÒÔ¸øÎÒ¿´¿´£¬\»òĞíÄÜ¹»ÓĞËù·¢ÏÖ£¡'
        ); 
      end;  
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÃ»ÓĞ<¹Å´úÃØ¼®/c=red>Ñ½£¡\ \|{cmd}<ºÃµÄ/@doexit>'); 
    end;
  end;
end;

procedure _jinzhen4;
begin
  This_Npc.NpcDialog(This_Player,
  'ÇëÎÊÄãÒªÓÃÊ²Ã´À´»»È¡½±Àø£¿\ \' 
  +'|{cmd}<²ĞÆÆµÄ¹Å¼®/@jinzhen4_1>              ^<Î¢»ÆµÄ¹ÅÊé/@jinzhen4_2>\ \'
  +'|{cmd}<¹Å´úÃØ¼®/@jinzhen4_3>                ^<½£ÉñÊÖÔı/@jinzhen4_4>'
  );
end;

//Í³Ò»µÄµÀ¾ß»»È¡½±Àø½Ó¿Ú£¬
//µÀ¾ßÎªµÚÒ»¸ö²ÎÊı£¨ÊıÁ¿Ö¸¶¨Îª1£©£»½±ÀøÎªµÚ¶ş¸ö²ÎÊı£»½±ÀøÊıÁ¿ÎªµÚÈı¸ö²ÎÊı 
procedure ItemChgPrize(item: string; prize: string; prizenum: integer);
begin
  This_Player.Take(item, 1);
  This_Player.Give(prize, prizenum);
  This_NPC.NpcDialog(This_Player,
  'ÄãÊ¹ÓÃ' + item + '»»È¡ÁË' + prize + '£º' + inttostr(prizenum)
  ); 
end;

procedure _jinzhen4_1;
var
  temp : integer;
begin
  if This_Player.GetBagItemCount('²ĞÆÆµÄ¹Å¼®') > 0 then
  begin
    temp := random(100) + 1;
    if temp <= 50 then
    begin
      ItemChgPrize('²ĞÆÆµÄ¹Å¼®','¾­Ñé',400000); 
    end
    else if temp <= 80 then
    begin
      ItemChgPrize('²ĞÆÆµÄ¹Å¼®','¾­Ñé',600000);
    end
    else if temp <= 95 then
    begin
      ItemChgPrize('²ĞÆÆµÄ¹Å¼®','¾­Ñé',800000);
    end
    else
    begin
      ItemChgPrize('²ĞÆÆµÄ¹Å¼®','½ğÕëËéÆ¬',1);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    'Èç¹ûÄã´øÀ´ÁË²ĞÆÆµÄ¹Å¼®£¬¾Í¸Ï¿ì½»¸øÎÒ»»È¡½±Àø°É£¡'
    ); 
  end; 
end;

procedure _jinzhen4_2;
var
  temp : integer;
begin
  if This_Player.GetBagItemCount('Î¢»ÆµÄ¹ÅÊé') > 0 then
  begin
    temp := random(100) + 1;
    if temp <= 50 then
    begin
      ItemChgPrize('Î¢»ÆµÄ¹ÅÊé','¾­Ñé',1000000); 
    end
    else if temp <= 80 then
    begin
      ItemChgPrize('Î¢»ÆµÄ¹ÅÊé','¾­Ñé',1500000);
    end
    else if temp <= 95 then
    begin
      ItemChgPrize('Î¢»ÆµÄ¹ÅÊé','¾­Ñé',2000000);
    end
    else
    begin
      ItemChgPrize('Î¢»ÆµÄ¹ÅÊé','½ğÕëËéÆ¬',2);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    'Èç¹ûÄã´øÀ´ÁËÎ¢»ÆµÄ¹ÅÊé£¬¾Í¸Ï¿ì½»¸øÎÒ»»È¡½±Àø°É£¡'
    ); 
  end; 
end;

procedure _jinzhen4_3;
var
  temp : integer;
begin
  if This_Player.GetBagItemCount('¹Å´úÃØ¼®') > 0 then
  begin
    temp := random(100) + 1;
    if temp <= 50 then
    begin
      ItemChgPrize('¹Å´úÃØ¼®','¾­Ñé',2000000); 
    end
    else if temp <= 80 then
    begin
      ItemChgPrize('¹Å´úÃØ¼®','¾­Ñé',3000000);
    end
    else if temp <= 95 then
    begin
      ItemChgPrize('¹Å´úÃØ¼®','¾­Ñé',4000000);
    end
    else
    begin
      ItemChgPrize('¹Å´úÃØ¼®','½ğÕë',1);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    'Èç¹ûÄã´øÀ´ÁË¹Å´úÃØ¼®£¬¾Í¸Ï¿ì½»¸øÎÒ»»È¡½±Àø°É£¡'
    ); 
  end; 
end;

procedure _jinzhen4_4;
var
  temp : integer;
begin
  if This_Player.GetBagItemCount('½£ÉñÊÖÔı') > 0 then
  begin
    temp := random(1000) + 1;
    if temp <= 600 then
    begin
      ItemChgPrize('½£ÉñÊÖÔı','¾­Ñé',6000000); 
    end
    else if temp <= 900 then
    begin
      ItemChgPrize('½£ÉñÊÖÔı','½ğÕë',4);
    end
    else if temp <= 990 then
    begin
      ItemChgPrize('½£ÉñÊÖÔı','Ò»¼¶½ğÕë',3);
    end
    else
    begin
      ItemChgPrize('½£ÉñÊÖÔı','ËÄ¼¶½ğÕë',1);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    'Èç¹ûÄã´øÀ´ÁË½£ÉñÊÖÔı£¬¾Í¸Ï¿ì½»¸øÎÒ»»È¡½±Àø°É£¡'
    ); 
  end; 
end;


Procedure _newskill;
Begin
   If  This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÂğ£¿\'); 
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 3 then
      Begin
         This_Npc.NpcDialog(This_Player,
         'ÄÇ¸öÎŞÁ¼µÄ¼éÉÌ¾ÍÔÚÊŞÈË¹ÅÄ¹µÄ¶ş²ã£¬\'+
         'Ëû×ÜÊÇÏë×Å×¬ÓÂÊ¿ÃÇµÄºÚĞÄÇ®£¡\'+
         '°ÑÎÒ¸øÄãµÄÆÆÍë½»¸øËû£¬¾ÍËµÊÇÎÒÕä²ØµÄ£¬ºÙºÙ£¡');
      end else if This_Player.GetV(10,1) = 2 then
      begin
         if This_Player.FreeBagNum >= 1 then
         begin
            This_Npc.NpcDialog(This_Player,
            'ºÃ°É£¬¼ÈÈ»ÊÇÎÒÀÏÅóÓÑ½éÉÜÀ´µÄ£¬ÎÒÏëÒ²Ó¦¸ÃÃ»ÓĞÎÊÌâ¡£\'+
            'ÄÇ¸öÎŞÁ¼µÄ¼éÉÌ¾ÍÔÚÊŞÈË¹ÅÄ¹µÄ¶ş²ã£¬\'+
            'Ëû×ÜÊÇÏë×Å×¬ÓÂÊ¿ÃÇµÄºÚĞÄÇ®£¡\'+
            'ÕâÊÇÒ»¸ö·Ç³£ÆÕÍ¨µÄĞ¡ÆÆÍë£¬ÄãÈ¥Âô¸øËû£¬¼Ç×¡£¡\'+
            'ÄãÖ»ĞèÒªËµ³öÊÇÎÒÕä²ØµÄ¾ÍĞĞÁË£¬ºÙºÙ¡£');
            This_Player.SetV(10,1,3);
            This_Player.Give('´ÉÍë',1);
         end else
         begin
            This_Npc.NpcDialog(This_Player,
            '°Ñ°ü¹üÇåÀíÒ»ÏÂÔÙÀ´ÕÒÎÒ°É£¬\'+
            'ÎÒÓĞ¸öÖØÒªµÄ¶«Î÷Òª½»¸øÄã£¡');
         end;
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÃÏÈÈ¥ÃËÖØ¾Æ¹İÕÒ¼ø±¦É¢ÈËÁìÈ¡¼ø±¦ÊÖĞÅ£¡\'); 
   end;
end;

Procedure _newskill465;
begin
   If This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÂğ£¿\');
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 5 then
      Begin
         This_Npc.NpcDialog(This_Player,
         'ÎÒÓĞ¸öÅóÓÑÔÚÎÖÂêÉ­ÁÖ·Ï´åÀïµ±Ìú½³£¬\'+
         'ÎªÓÂÊ¿ÃÇĞŞÀíÎäÆ÷×°±¸£¬\'+
         'Ëû×î½üºÃÏñÓĞĞèÒªÕÒÈË°ïÖúËûËÍÒ»Ğ©¶«Î÷£¬\'+
         'ÄãÈ¥ÕÒËûÒ»ÏÂ°É£¿\');
      end else if This_Player.GetV(10,1) = 4 then
      begin
         This_Npc.NpcDialog(This_Player,
         'Ğ»Ğ»£¬ĞÁ¿àÁË£¬ÊÇÄÇ¼Ò»ï»î¸Ã£¡\'+
         'ËãÁËËµÕıÊÂ£¬ÎÒÓĞ¸öÅóÓÑÔÚÎÖÂêÉ­ÁÖ·Ï´åÀïµ±Ìú½³£¬\'+
         'ÎªÓÂÊ¿ÃÇĞŞÀíÎäÆ÷×°±¸£¬\'+
         'Ëû×î½üºÃÏñÓĞĞèÒªÕÒÈË°ïÖúËûËÍÒ»Ğ©¶«Î÷£¬\'+
         'ÄãÈ¥ÕÒËûÒ»ÏÂ°É£¿\');
         This_Player.SetV(10,1,5);
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÃÏÈÈ¥ÃËÖØ¾Æ¹İÕÒ¼ø±¦É¢ÈËÁìÈ¡¼ø±¦ÊÖĞÅ£¡\');
   end;
end;


procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    'ÇëÑ¡ÔñÄãÏëÒªÂòµÄÊé¡£\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '¸øÎÒ¿´¿´ÄãµÄÊé¡£\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _drink;
begin
  This_Npc.NpcDialog(This_Player, 
    'µ±ÄêÎªÁËµÖ¿¹°ëÊŞÈËµÄÇÖÂÔ£¬Âê·¨ÈË´ÓÒ£Ô¶µÄ¶«·½ÇëÀ´ÁËÒ»ÃûÊõÊ¿£¬\ÑĞÖÆ³öÒ»ÖÖÌØÊâ¼¼ÄÜ£¬ÕâÖÖÌØÊâ¼¼ÄÜµÄ×÷ÓÃÔÚÓÚĞŞÁ¶ºó½«»áÔÚÈËÌå\±¾Éí²úÉúÒ»ÖÖÒşĞÔµÄÄÜÁ¿£¬¶øËüµÄÉñÆæÖ®´¦ÔÚÓÚ£¬µ±´¦ÓÚ×í¾Æ×´Ì¬\Ê±ÄÜ¹»ÔöÇ¿ÈËÌåµÄÌåÁ¦£¬¼ÓÇ¿Õ½¶·Á¦¡£Ëæ×ÅÀúÊ·µÄÍÆÑÓ£¬Âê·¨ÈËÔç\¾ÍÍü¼ÇÁËÕâ±¾¼¼ÄÜÊéµÄÕæÕı×÷ÓÃ£¬ÄãÏÖÔÚ¾Í¿ÉÒÔÈ¥ÕÒÃËÖØÊéµêÀÏ°å£¬\Ëû¿ÉÒÔ°ïÄãÑ§Ï°Õâ¸ö¼¼ÄÜ¡£\'
    );
end;

procedure _helpbooks;
begin
  This_Npc.NpcDialog(This_Player, 
    'Äã¶ÔÄÇÖÖÊé¸ĞĞËÈ¤£¿\ \ÎäÊ¿¿ÉÒÔÑ§<»ù±¾½£Êõ/@help11>ºÍ<¹¥É±½£Êõ/@help12>\Ä§·¨Ê¦¿ÉÒÔÑ§<»ğÇòÊõ/@help21>ºÍ<´ó»ğÇò/@help22>\µÀÊ¿¿ÉÒÔÑ§<ÖÎÓúÊõ/@help31>,<¾«ÉñÁ¦Õ½·¨/@help32>ºÍ<Ê©¶¾Êõ/@help33>\ \ |{cmd}<·µ»Ø/@main>'
    );
end;

procedure _help11;
begin
  This_Npc.NpcDialog(This_Player, 
    '»ù±¾½£ÊõÄã¿ÉÒÔ°´ÈçÏÂ²½ÖèĞŞÁ¶£º\Lv.1 : Äã¿ÉÒÔÔÚµÚ 7 ¼¶¿ªÊ¼ĞŞÁ¶\Lv.2 : Äã¿ÉÒÔÔÚµÚ 11 ¼¶¿ªÊ¼ĞŞÁ¶\Lv.3 : Äã¿ÉÒÔÔÚµÚ 16 ¼¶¿ªÊ¼ĞŞÁ¶\ \ |{cmd}<·µ»Ø/@helpbooks>'
    );
end;

procedure _help12;
begin
  This_Npc.NpcDialog(This_Player, 
    '¹¥É±½£ÊõÄã¿ÉÒÔ°´ÈçÏÂ²½ÖèĞŞÁ¶£º\Lv.1 : Äã¿ÉÒÔÔÚµÚ 19 ¼¶¿ªÊ¼ĞŞÁ¶¡£\Lv.2 : Äã¿ÉÒÔÔÚµÚ 22 ¼¶¿ªÊ¼ĞŞÁ¶¡£\Lv.3 : Äã¿ÉÒÔÔÚµÚ 24 ¼¶¿ªÊ¼ĞŞÁ¶¡£\ \ |{cmd}<·µ»Ø/@helpbooks>'
    );
end;

procedure _help21;
begin
  This_Npc.NpcDialog(This_Player, 
    '»ğÇòÊõÄã¿ÉÒÔ°´ÈçÏÂ²½ÖèĞŞÁ¶£º\Lv.1: Äã¿ÉÒÔÔÚµÚ 7 ¼¶¿ªÊ¼ĞŞÁ¶¡£\Lv.2: Äã¿ÉÒÔÔÚµÚ 11 ¼¶¿ªÊ¼ĞŞÁ¶¡£\Lv.3: Äã¿ÉÒÔÔÚµÚ 16 ¼¶¿ªÊ¼ĞŞÁ¶¡£\ \ |{cmd}<·µ»Ø/@helpbooks>'
    );
end;

procedure _help22;
begin
  This_Npc.NpcDialog(This_Player, 
    '´ó»ğÇòÄã¿ÉÒÔ°´ÈçÏÂ²½ÖèĞŞÁ¶£º\Lv.1: Äã¿ÉÒÔÔÚµÚ 19 ¼¶¿ªÊ¼ĞŞÁ¶¡£\Lv.2: Äã¿ÉÒÔÔÚµÚ 23 ¼¶¿ªÊ¼ĞŞÁ¶¡£\Lv.3: Äã¿ÉÒÔÔÚµÚ 25 ¼¶¿ªÊ¼ĞŞÁ¶¡£\ \ |{cmd}<·µ»Ø/@helpbooks>'
    );
end; 

procedure _help31;
begin
  This_Npc.NpcDialog(This_Player, 
    'ÖÎÓúÊõÄã¿ÉÒÔ°´ÈçÏÂ²½ÖèĞŞÁ¶£º\Lv.1 : Äã¿ÉÒÔÔÚµÚ 7 ¼¶¿ªÊ¼ĞŞÁ¶.\Lv.2 : Äã¿ÉÒÔÔÚµÚ 11 ¼¶¿ªÊ¼ĞŞÁ¶.\Lv.3 : Äã¿ÉÒÔÔÚµÚ 16 ¼¶¿ªÊ¼ĞŞÁ¶.\ \ |{cmd}<·µ»Ø/@helpbooks>'
    );
end;

procedure _help32;
begin
  This_Npc.NpcDialog(This_Player, 
    '¾«ÉñÁ¦Õ½·¨Äã¿ÉÒÔ°´ÈçÏÂ²½ÖèĞŞÁ¶£º\Lv.1 : Äã¿ÉÒÔÔÚµÚ 9 ¼¶¿ªÊ¼ĞŞÁ¶.\Lv.2 : Äã¿ÉÒÔÔÚµÚ 13 ¼¶¿ªÊ¼ĞŞÁ¶.\Lv.3 : Äã¿ÉÒÔÔÚµÚ 19 ¼¶¿ªÊ¼ĞŞÁ¶.\ \ |{cmd}<·µ»Ø/@helpbooks>'
    );
end;

procedure _help33;
begin
  This_Npc.NpcDialog(This_Player, 
    'Ê©¶¾ÊõÄã¿ÉÒÔ°´ÈçÏÂ²½ÖèĞŞÁ¶£º\Lv.1 : Äã¿ÉÒÔÔÚµÚ 14 ¼¶¿ªÊ¼ĞŞÁ¶.\Lv.2 : Äã¿ÉÒÔÔÚµÚ 17 ¼¶¿ªÊ¼ĞŞÁ¶.\Lv.3 : Äã¿ÉÒÔÔÚµÚ 20 ¼¶¿ªÊ¼ĞŞÁ¶.\ \ |{cmd}<·µ»Ø/@helpbooks>'
    );
end;

//³õÊ¼»¯²Ù×÷
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(4);
  This_NPC.FillGoods('»ğÇòÊõ', 100, 1);
  This_NPC.FillGoods('ÖÎÓúÊõ', 100, 1); 
  This_NPC.FillGoods('»ù±¾½£Êõ', 100, 1);
  This_NPC.FillGoods('¾«ÉñÁ¦Õ½·¨', 100, 1);
  This_NPC.FillGoods('Ê©¶¾Êõ', 100, 1);
  This_NPC.FillGoods('´ó»ğÇò', 100, 1);
  This_NPC.FillGoods('¿¹¾Ü»ğ»·', 100, 1);
  This_NPC.FillGoods('Áé»ê»ğ·û', 100, 1);
  This_NPC.FillGoods('À×µçÊõ', 100, 1);
  This_NPC.FillGoods('¹¥É±½£Êõ', 100, 1);
  This_NPC.FillGoods('´ÌÉ±½£Êõ', 100, 1); 
  This_NPC.FillGoods('°ëÔÂÍäµ¶', 100, 1);
  This_NPC.FillGoods('Ò°Âù³å×²', 100, 1);
 
  This_NPC.FillGoods('ÕÙ»½÷¼÷Ã', 100, 1);
  This_NPC.FillGoods('ÒşÉíÊõ', 100, 1);
  This_NPC.FillGoods('¼¯ÌåÒşÉíÊõ', 100, 1);
  This_NPC.FillGoods('ÓÄÁé¶Ü', 100, 1);
  This_NPC.FillGoods('ÉñÊ¥Õ½¼×Êõ', 100, 1);
  This_NPC.FillGoods('ĞÄÁéÆôÊ¾', 100, 1);
  This_NPC.FillGoods('À§Ä§Öä', 100, 1); 
  This_NPC.FillGoods('ÈºÌåÖÎÓúÊõ', 100, 1);
  
  This_NPC.FillGoods('ÓÕ»óÖ®¹â', 100, 1);
  This_NPC.FillGoods('µØÓü»ğ', 100, 1);
  This_NPC.FillGoods('Ë²Ï¢ÒÆ¶¯', 100, 1);
  This_NPC.FillGoods('±¬ÁÑ»ğÑæ', 100, 1);
  This_NPC.FillGoods('»ğÇ½', 100, 1);
  This_NPC.FillGoods('¼²¹âµçÓ°', 100, 1);
  This_NPC.FillGoods('µØÓüÀ×¹â', 100, 1);
  This_NPC.FillGoods('Ä§·¨¶Ü', 100, 1);
  This_NPC.FillGoods('Ê¥ÑÔÊõ', 100, 1);
  
  This_Npc.SetRebate(100);
end;

//½Å±¾Ö´ĞĞµÄÈë¿Ú
begin
  domain;
end.    