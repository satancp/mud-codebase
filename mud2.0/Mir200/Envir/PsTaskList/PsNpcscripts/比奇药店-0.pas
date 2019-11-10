{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure domain;
var temp: integer;
begin
  temp := random(3)+1;
  {$IFDEF Q136_hero}
  begin
    This_Npc.NpcDialog(This_Player,
    '¸ĞĞ»¹âÁÙ£¬ÓĞÊ²Ã´ÊÂÇéĞèÒªÎÒ°ïÃ¦Âğ£¿\ \'
    +'|{cmd}<ÂòÒ©/@buy>\'
    +'|{cmd}<ÂôÒ©/@sell>\'
    +'|{cmd}<´òÌı¹ØÓÚÌØÊâÒ©Ë®µÄÏûÏ¢/@talk>       ^<½øÈëÒ©µêÄÚÌÃ/@JInruyao>\'
    +'|{cmd}<ÍË³ö/@doexit>'
    );
  end
  {$ELSE}
  if This_Player.Level >= 8 then
  begin
      if temp = 3 then
      begin 
      This_Npc.NpcDialog(This_Player,
      '¿Í¹ÙÄúÓĞÈÕ×ÓÃ»À´ÁË£¬Îä¹¦¸ßÇ¿ÁË£¬Ò²¾Í²»ĞèÒª°³ÕâĞ¡Ò©Ê¦ÁË¡£\²»¹ı£¬Õâ¼¸ÈÕÄú×îºÃ¶à¶ÚµãÒ©£¬ÌıÀ´ÍùµÄ¿Í¹ÙËµ°¡£¬×î½üÂê·¨´óÂ½\³öÏÖÁËÊ²Ã´²Ø±¦Í¼£¬¶à±¸µãÒ©²ÅÄÜ×ßÔ¶Â·È¥ÕÒ°  £\'
      +'|{cmd}<ºÏ³É»ğÁúÉñÆ·/@hecheng>'+ addSpace('', 16) + '|{cmd}<²é¿´ºÏ³É»ğÁúÉñÆ·Åä·½/@lookfor>\'
      +'|{cmd}<´òÌı¡°»ğÁúÖ®ĞÄ¡±µÄÃØÃÜ/@huolong>\'
      +'|{cmd}<ÂòÒ©/@buy>\'
      +'|{cmd}<ÂôÒ©/@sell>\'
      +'|{cmd}<´òÌı¹ØÓÚÌØÊâÒ©Ë®µÄÏûÏ¢/@talk>       ^<½øÈëÒ©µêÄÚÌÃ/@JInruyao>\'
      +'|{cmd}<ÍË³ö/@doexit>'
       );
      end
      else
      begin
      This_Npc.NpcDialog(This_Player,
      '¸ĞĞ»¹âÁÙ£¬ÓĞÊ²Ã´ÊÂÇéĞèÒªÎÒ°ïÃ¦Âğ£¿\ \'
      +'|{cmd}<ºÏ³É»ğÁúÉñÆ·/@hecheng>'+ addSpace('', 16) + '|{cmd}<²é¿´ºÏ³É»ğÁúÉñÆ·Åä·½/@lookfor>\'
      +'|{cmd}<´òÌı¡°»ğÁúÖ®ĞÄ¡±µÄÃØÃÜ/@huolong>\'
      +'|{cmd}<ÂòÒ©/@buy>\'
      +'|{cmd}<ÂôÒ©/@sell>\'
      +'|{cmd}<´òÌı¹ØÓÚÌØÊâÒ©Ë®µÄÏûÏ¢/@talk>       ^<½øÈëÒ©µêÄÚÌÃ/@JInruyao>\'
      +'|{cmd}<ÍË³ö/@doexit>'
      );
      end;
  end 
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '¸ĞĞ»¹âÁÙ£¬ÓĞÊ²Ã´ÊÂÇéĞèÒªÎÒ°ïÃ¦Âğ£¿\ \'
    +'|{cmd}<ºÏ³É»ğÁúÉñÆ·/@hecheng>'+ addSpace('', 16) + '|{cmd}<²é¿´ºÏ³É»ğÁúÉñÆ·Åä·½/@lookfor>\'
    +'|{cmd}<´òÌı¡°»ğÁúÖ®ĞÄ¡±µÄÃØÃÜ/@huolong>\'
    +'|{cmd}<ÂòÒ©/@buy>\'
    +'|{cmd}<ÂôÒ©/@sell>\'
    +'|{cmd}<´òÌı¹ØÓÚÌØÊâÒ©Ë®µÄÏûÏ¢/@talk>       ^<½øÈëÒ©µêÄÚÌÃ/@JInruyao>\'
    +'|{cmd}<ÍË³ö/@doexit>'
    );
  end;
  {$ENDIF}
end;

procedure _JInruyao;
begin
   if compareText(This_Player.MapName, '0') = 0 then
   begin
      This_Player.RandomFlyTo('0108');
   end;
end;

procedure _hecheng;
begin
  This_Npc.NpcDialog(This_Player,
  'ÎÒ»¹Ã»ÓĞÍêÈ«²ÎÍ¸ÆäÖĞµÄÃØÃÜ£¬¿ÉÒÔºÏ³ÉµÄÎïÆ·»¹ºÜÓĞÏŞ£¬\Äã¾Í¸æËßÎÒÄãÏëºÏ³ÉÊ²Ã´Ò©Æ·°É¡£\ \'
  +'|{cmd}<¾Å»¨ÓñÂ¶/@yulu>'+ addSpace('', 16) + '|{cmd}<¾Å»¨Ñ©Â¶/@xuelu>\'
  +'|{cmd}<ÔªÉñµ¤/@qidan>'+ addSpace('', 16) + '|{cmd}<»ØÆø¸à/@qigao>\'
  +'|{cmd}<²é¿´ºÏ³ÉÅä·½/@lookfor>\'
  +'|{cmd}<¹Ø±Õ/@doexit>'
  );
end;

procedure _yulu;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³É¾Å»¨ÓñÂ¶ĞèÒª×Ï±³Ìì¿û¡¢ÌúÊ÷¹û¡¢ÒõÑôÏÉ²İ¸÷1¸ö\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<¿ªÊ¼ºÏ³É/@yulu1>\ \'
  +'|{cmd}<·µ»Ø/@hecheng>'+ addSpace('', 16) + '|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _yulu1;
begin
  if This_Player.GetBagItemCount('×Ï±³Ìì¿û') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('ÌúÊ÷¹û') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('ÒõÑôÏÉ²İ') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('×Ï±³Ìì¿û',1);
    This_Player.Take('ÌúÊ÷¹û',1);
    This_Player.Take('ÒõÑôÏÉ²İ',1);
    This_Player.Give('¾Å»¨ÓñÂ¶',1);
    This_Npc.NpcDialog(This_Player,
    '¹§Ï²Äú£¬¾Å»¨ÓñÂ¶ÒÑ¾­ºÏ³ÉºÃÁË£¡'
     ); 
  end;
end;

procedure _xuelu;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³É¾Å»¨ÓñÂ¶ĞèÒª»ÆÉ«ÂíÖ¦»¨£¬ÂŞ²¼ÂéÒ¶£¬\µØ¿àµ¨, ËÄÒ¶²ÎÕâËÄÖÖ²İÒ©¸÷1¸ö£¬\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<¿ªÊ¼ºÏ³É/@xuelu1>\ \'
  +'|{cmd}<·µ»Ø/@hecheng>'+ addSpace('', 16) + '|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _xuelu1;
begin
  if This_Player.GetBagItemCount('»ÆÉ«ÂíÖ¦»¨') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('ÂŞ²¼ÂéÒ¶') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('µØ¿àµ¨') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('ËÄÒ¶²Î') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('»ÆÉ«ÂíÖ¦»¨',1);
    This_Player.Take('ÂŞ²¼ÂéÒ¶',1);
    This_Player.Take('µØ¿àµ¨',1);
    This_Player.Take('ËÄÒ¶²Î',1);
    This_Player.Give('¾Å»¨Ñ©Â¶',1);
    This_Npc.NpcDialog(This_Player,
    '¹§Ï²Äú£¬¾Å»¨Ñ©Â¶ÒÑ¾­ºÏ³ÉºÃÁË£¡'
     ); 
  end;
end;

procedure _qidan;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³ÉÔªÉñµ¤ĞèÒª¶¾Ö©ÖëÑÀ³İ¡¢ÇùÂÑ¡¢Ğ«×ÓµÄÎ²°Í¸÷4¸ö£¬\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<¿ªÊ¼ºÏ³É/@qidan1>\ \'
  +'|{cmd}<·µ»Ø/@hecheng>'+ addSpace('', 16) + '|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _qidan1;
begin
  if This_Player.GetBagItemCount('¶¾Ö©ÖëÑÀ³İ') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('ÇùÂÑ') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('Ğ«×ÓµÄÎ²°Í') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('¶¾Ö©ÖëÑÀ³İ',4);
    This_Player.Take('ÇùÂÑ',4);
    This_Player.Take('Ğ«×ÓµÄÎ²°Í',4);
    This_Player.Give('ÔªÉñµ¤',1);
    This_Npc.NpcDialog(This_Player,
    '¹§Ï²Äú£¬ÔªÉñµ¤ÒÑ¾­ºÏ³ÉºÃÁË£¡'
     ); 
  end;
end;

procedure _qigao;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³É»ØÆø¸àĞèÒªĞèÒª¼¦Èâ¡¢Èâ¡¢Ê³ÈËÊ÷Ò¶¸÷4¸ö£¬\Í¬Ê±»¹ĞèÒªÊ³ÈËÊ÷µÄ¹ûÊµ1¸ö£¬\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<¿ªÊ¼ºÏ³É/@qigao1>\ \'
  +'|{cmd}<·µ»Ø/@hecheng>'+ addSpace('', 16) + '|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _qigao1;
begin
  if This_Player.GetBagItemCount('¼¦Èâ') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('Èâ') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('Ê³ÈËÊ÷Ò¶') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('Ê³ÈËÊ÷µÄ¹ûÊµ') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     'ºÜ¿ÉÏ§£¬ÄãÃ»ÓĞ×ã¹»ºÏ³ÉĞèÒªµÄ²ÄÁÏ¡£\ \|{cmd}<ÍË³ö/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('¼¦Èâ',4);
    This_Player.Take('Èâ',4);
    This_Player.Take('Ê³ÈËÊ÷Ò¶',4);
    This_Player.Take('Ê³ÈËÊ÷µÄ¹ûÊµ',1);
    This_Player.Give('»ØÆø¸à',1);
    This_Npc.NpcDialog(This_Player,
    '¹§Ï²Äú£¬»ØÆø¸àÒÑ¾­ºÏ³ÉºÃÁË£¡'
     ); 
  end;
end;

procedure _lookfor;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ»÷ÍşÁ¦Ç¿´ó£¬µ«Ê¹ÓÃËü±ØĞëÏÈÒªÓµÓĞ¡°»ğÁúÖ®ĞÄ¡±\ÎÒÖªµÀÄãÌıËµ¹ı¡°»ğÁúÖ®ĞÄ¡±£¬µ«ÎÒ¶Ï¶¨ÄãÖªÆäÒ»²»ÖªÆä¶ş\¡°»ğÁúÖ®ĞÄ¡±ÊÇÓÃÀ´»ıĞîÅ­ÆøµÄ£¬ĞîÂú·½ÄÜÊ¹ÓÃºÏ»÷\ÔÚ¡°»ğÁúÖ®ĞÄ¡±ÖĞ·ÅÈë»ğÁúÉñÆ·£¬Å­Æø»á´óÁ¿Ôö¼Ó\ÉñÆ·ÆäÊµÓĞºÜ¶àÖÖ£¬²»Í¬µÄÅä·½ÄÜºÏ³É³ö²»Í¬µÄ»ğÁúÉñÆ·\ÎÒ»áÖÆ×÷ºÜ¶àÖÖ¡°»ğÁúÖ®ĞÄ¡±£¬ÏÖÔÚÀ´¿´¿´ÄãÏëÒªÄÄÖÖ°É¡£\'
  +'|{cmd}<¾Å»¨ÓñÂ¶/@yulu2>'+ addSpace('', 16) + '|{cmd}<¾Å»¨Ñ©Â¶/@xuelu2>\'
  +'|{cmd}<ÔªÉñµ¤/@qidan2>'+ addSpace('', 16) + '|{cmd}<»ØÆø¸à/@qigao2>\'
  +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _yulu2;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³É¾Å»¨ÓñÂ¶ĞèÒª×Ï±³Ìì¿û¡¢ÌúÊ÷¹û¡¢ÒõÑôÏÉ²İ¸÷1¸ö\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<·µ»Ø/@main>'+ addSpace('', 16) +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _xuelu2;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³É¾Å»¨Ñ©Â¶ĞèÒª»ÆÉ«ÂíÖ¦»¨£¬ÂŞ²¼ÂéÒ¶£¬\µØ¿àµ¨, ËÄÒ¶²ÎÕâËÄÖÖ²İÒ©¸÷1¸ö£¬\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<·µ»Ø/@main>'+ addSpace('', 16) +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _qidan2;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³ÉÔªÉñµ¤ĞèÒª¶¾Ö©ÖëÑÀ³İ¡¢ÇùÂÑ¡¢Ğ«×ÓµÄÎ²°Í¸÷4¸ö£¬\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<·µ»Ø/@main>'+ addSpace('', 16) +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _qigao2;
begin
  This_Npc.NpcDialog(This_Player,
  'ºÏ³É»ØÆø¸àĞèÒªĞèÒª¼¦Èâ¡¢Èâ¡¢Ê³ÈËÊ÷Ò¶¸÷4¸ö£¬\Í¬Ê±»¹ĞèÒªÊ³ÈËÊ÷µÄ¹ûÊµ1¸ö£¬\Èç¹ûÄúÒÑ¾­ÓĞÁËÕâĞ©ÎïÆ·£¬ÎÒ¾Í¿ÉÒÔ°ïÄú½øĞĞºÏ³É¡£\ \'
  +'|{cmd}<·µ»Ø/@main>'+ addSpace('', 16) +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _huolong;
begin
  This_Npc.NpcDialog(This_Player,
  '¡°»ğÁúÖ®ĞÄ¡±ÊÇÓÃÀ´»ıĞîÅ­ÆøµÄ£¬ĞîÂú·½ÄÜÊ¹ÓÃºÏ»÷£¬\ÔÚ¡°»ğÁúÖ®ĞÄ¡±ÖĞ·ÅÈë»ğÁúÉñÆ·£¬Å­Æø»á´óÁ¿Ôö¼Ó£¬\ºÜ¶àÎïÆ·¶¼¿ÉÒÔÔö¼ÓÅ­ÆøÖµ£¬°×ÈÕÃÅ¼¼ÄÜÊé¿É´óÁ¿Ôö¼ÓÅ­Æø£¬\¼¦Èâ¡¢Ê³ÈËÊ÷Ò¶¡¢µØ¿àµ¨¡¢ÊéÒ³µÈ¶¼¿É²»Í¬³Ì¶ÈÔö¼ÓÅ­Æø£¬\¾Å»¨Ñ©Â¶¡¢¾Å»¨ÓñÂ¶¡¢ÔªÉñµ¤¡¢»ØÆø¸à¡¢²¹Æøµ¤ÕâĞ©ÉñÆ·£¬\¿ÉÒÔ´Ó¶àÖÁÉÙ²»Í¬ÊıÁ¿Ôö¼ÓÅ­ÆøÖµ¡£\'
  +'|{cmd}<ºÏ³É»ğÁúÉñÆ·/@hecheng>'+ addSpace('', 16) +'|{cmd}<²é¿´ºÏ³É»ğÁúÉñÆ·Åä·½/@lookfor>\'
  +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _talk;
begin
  This_Npc.NpcDialog(This_Player,
  'ÕâĞ©Ò©Ë®¿ÉÒÔÔö¼ÓÄãµÄ¹¥»÷£¬ËÙ¶È£¬ÉúÃüÖµµÈµÈ£¬\¾İËµ»¹ÓĞÈËÄÜÓÃËüÃÇ»»È¡Ò»°ÑÄ§½££¡\ÕâÃ´ºÃµÄ¶«Î÷µ±È»²»ÊÇÇáÒ×¾Í¿ÉÒÔµÃµ½µÄ£¬\²»¹ı³àÔÂÏ¿¹ÈºÃÏñ¾­³£»á³öÏÖ¡£\\ <·µ»Ø/@main>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    'ĞèÒªÊ²Ã´¶«Î÷Âğ£¿\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    'Çë¸øÎÒÒªÂôµÄ¶«Î÷£¬ÎÒ»á¸øºÃ¼ÛÇ®µÄ¡£\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;


//³õÊ¼»¯²Ù×÷
procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(25);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('½ğ´´Ò©(Ğ¡Á¿)',200,1);
  This_Npc.FillGoods('Ä§·¨Ò©(Ğ¡Á¿)',200,1);
  This_Npc.FillGoods('½ğ´´Ò©(ÖĞÁ¿)',100,1); 
  This_Npc.FillGoods('Ä§·¨Ò©(ÖĞÁ¿)',100,1);
  This_Npc.FillGoods('Ç¿Ğ§½ğ´´Ò©',100,1);
  This_Npc.FillGoods('Ç¿Ğ§Ä§·¨Ò©',100,1);
  This_Npc.FillGoods('½ğ´´Ò©(Ğ¡)°ü',100,1);
  This_Npc.FillGoods('Ä§·¨Ò©(Ğ¡)°ü',100,1);
  This_Npc.FillGoods('½ğ´´Ò©(ÖĞ)°ü',100,1);
  This_Npc.FillGoods('Ä§·¨Ò©(ÖĞ)°ü',100,1);
  This_Npc.FillGoods('³¬¼¶½ğ´´Ò©',100,1); 
  This_Npc.FillGoods('³¬¼¶Ä§·¨Ò©',100,1);
  This_Npc.FillGoods('»ÒÉ«Ò©·Û(ÉÙÁ¿)',10,1);
  This_Npc.FillGoods('»ÆÉ«Ò©·Û(ÉÙÁ¿)',10,1);
  This_Npc.FillGoods('»ÒÉ«Ò©·Û(ÖĞÁ¿)',10,1); 
  This_Npc.FillGoods('»ÆÉ«Ò©·Û(ÖĞÁ¿)',10,1);
  This_Npc.FillGoods('»ÒÉ«Ò©·Û(´óÁ¿)',10,1);
  This_Npc.FillGoods('»ÆÉ«Ò©·Û(´óÁ¿)',10,1);
  This_Npc.FillGoods('³¬¼¶»ÒÉ«Ò©·Û',10,1);
  This_Npc.FillGoods('³¬¼¶»ÆÉ«Ò©·Û',10,1);
  This_Npc.SetRebate(100);
end;

//½Å±¾Ö´ĞĞµÄÈë¿Ú
begin
  domain;
end.