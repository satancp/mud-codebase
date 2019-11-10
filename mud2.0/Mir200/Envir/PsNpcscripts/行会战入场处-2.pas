{
/************************************************************************}

PROGRAM Mir2;



Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _newskill;
Begin
   if This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   Begin
      This_Npc.NpcDialog(This_Player,
      'Ã»ÊÂ¾Í¸Ï¿ìÀë¿ª£¡');
   end else if This_Player.GetV(10,3) = GetDateNum(GetNow()) then
   begin
      if This_Player.GetV(10,1) = 2 then
      begin
         This_Npc.NpcDialog(This_Player,
         '±ÈÆæ³Â¼ÒÆÌ×ÓÀÏ°åÏëÕÒ¸öÈË°ïÃ¦½ÌÑµÒ»ÏÂÄ³¸öÎÞÁ¼µÄ¼éÉÌ£¬\'+
         'Äã°ïÎÒÈ¥Ò»ÏÂ°É¡£');
      end 
      else if (This_Player.GetV(10,1)=1) and (This_Player.GetBagItemCount('¼ø±¦ÊÖÐÅ') >= 1) then
      Begin
         This_Npc.NpcDialog(This_Player,
         'ßÀ£¬Ô­À´ÊÇÄÇ¸öÏ²»¶µ½´¦»ÎµÄ¼Ò»ï£¬×î½üÒ»Ö±ÔÚ¾Æ¹Ý´ô×ÅÂð£¿\'+
         'Ð»Ð»ÄãÌØµØËÍÐÅ¹ýÀ´£¬ÎÒÓÐÒ»µãÊÂÏëÂé·³Äã£¬ÎÒµÄÅóÓÑ£¬\'+
         '±ÈÆæµÄ³Â¼ÒÆÌ×ÓÀÏ°åÏëÕÒ¸öÈË°ïÃ¦½ÌÑµÒ»ÏÂÄ³¸öÎÞÁ¼µÄ¼éÉÌ£¬\'+
         'Äã°ïÎÒÈ¥Ò»ÏÂ°É¡£');
         This_Player.SetV(10,1,2);
         This_Player.Take('¼ø±¦ÊÖÐÅ',1);
       end; 
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '¼ø±¦ÊÖÐÅ´øÀ´ÁËÂð£¿ÎÒµÃ¿´¿´¼ø±¦É¢ÈËµÄ×Ö¼££¡');
   end;
end;

Procedure _rule;
Begin
   This_Npc.NpcDialog(This_Player,
   '±¾´Î»î¶¯Ä¿µÄÖ»ÊÇÌá¹©¸ø´ó¼ÒÒ»¸ö»¥ÏàÇÐ´èµÄ»ú»á£¬Ê¤¸ºÎÞ¹Ø½ôÒª¡£\'+
   'ÈÎºÎ´íÎóÊ¹ÓÃ¾íÖá»òÆäËüÐÐÎªµ¼ÖÂÍÑÀëÈü³¡µÄÐÐÎª£¬Çë×ÔÐÐ½â¾ö¡£\'+
   '±ÈÈüÖÐ²»»áÀÛ¼ÓPKÖµ£¬Íæ¼ÒËÀÍö²»»áµôÂäÈÎºÎÎïÆ·£¬°üÀ¨Æíµ»ÏµÁÐ¡£\'+
   '±ÈÈü³¡µØÏÞ¶¨120ÈËÍ¬Ê±¾º¼¼£¬Ò»µ©ÈËÊý²»×ãÔò»áÁ¢¿Ì²¹³ä¡£\'+
   '±ÈÈüÖÐ£¬·²ÊÇÊ¹ÓÃ¹«¹²ÆµµÀÂîÈËµÄÍæ¼Ò£¬½«ÊÜµ½½ûÑÔ30·ÖÖÓ£¬Öð³ö\'+
   'Èü³¡µÄ´¦·£¡£\ \'+
   '|{cmd}<ÏÂÒ»Ò³/@rule1>');
end;

Procedure _rule1;
Begin
   This_Npc.NpcDialog(This_Player,
   '·²ÊÇÔÚ±ÈÈüÕýÊ½¿ªÊ¼Ç°£¬»òÕß±ÈÈü½áÊøºó¼ÌÐø¹¥»÷ËûÈËµÄ\'+
   'Íæ¼Ò£¬½«ÊÜµ½´¦·£¡£ÎÒÃÇ½«¶ÔµÃ·Ö×î¸ßµÄ3¸öÐÐ»á½øÐÐ¹«¸æ±íÑï¡£\'+
   'Í¬Ê±ÔÚÕâ3¸öÐÐ»áÖÐÑ¡³öµÃ·Ö×î¸ßµÄ¸öÈË¹Ú¾ü£¬½øÐÐ¹«¸æ±íÑï£¡\'+
   'ÌØ±ðÉêÃ÷£¬ÔÚÎÒÃÇÐû²¼±ÈÈü¿ªÊ¼Ç°£¬»ò±ÈÈü½áÊøºó£¬¼ÌÐø¹¥»÷µÄ\'+
   '¸öÈËºÍÐÐ»á½«ÊÜµ½ÑÏËà´¦·Ö£¬¹¥»÷Ò»´Î¿Û³ý1000·Ö£¬¿Û·ÖÀÛ¼Æ\'+
   '³¬¹ý5000µÄÈ¡Ïû×Ê¸ñ£¡\ \'+
   '|{cmd}<½øÈëÈü³¡/@enter>                      ^<Àë¿ª/@doexit>');
end;


Procedure _Enter;
begin
   if (This_Player.GoldNum >= 1000) and (This_Player.Level >=10) then
   begin
      if CheckOtherMapHum('F003') < 120 then
      begin
         if (This_Player.GetBagItemCount('µØÀÎÌÓÍÑ¾í')>=1) or (This_Player.GetBagItemCount('µØÀÎÌÓÍÑ¾í°ü')>=1) 
             or (This_Player.GetBagItemCount('»Ø³Ç¾í')>=1) or (This_Player.GetBagItemCount('ÐÐ»á»Ø³Ç¾í°ü')>=1) 
             or (This_Player.GetBagItemCount('ÐÐ»á»Ø³Ç¾í')>=1) or (This_Player.GetBagItemCount('»Ø³Ç¾í°ü')>=1)  then
         begin
             This_Npc.NpcDialog(This_Player,
             'Ð¯´øµØÀÎÌÓÍÑ¾í£¬»Ø³Ç¾í£¬ÐÐ»á»Ø³Ç¾í£¬\'+
             '²»ÄÜ½øÈëÐÐ»áÕù°ÔÈüµØÍ¼¡£\'+
             'ÔÚÐÐ»áÕù°ÔÈüµØÍ¼ÖÐ£¬·²ÊÇÊ¹ÓÃÕâÐ©¾íÖáÀë¿ªÈü³¡£¬\'+
             '½«ÎÞ·¨ÔÙ´Î½øÈëÈü³¡£¬Çë×ñÊØ¹æÔò\ \'+
             '|{cmd}<È·¶¨/@doexit>');
         end  else
         begin
             This_Player.DecGold(1000);
             This_Player.RandomFlyTo('F003');
         end;   
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '±§Ç¸£¬ÏÖÔÚ²ÎÈüÈËÊýÒÑÂúÇëÉÔºóÔÙÀ´¡£\ \'+
         '|{cmd}<È·¶¨/@doexit>');
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      'Äã´øµÄÇ®²»¹»£¬»òÕß¼¶±ðÌ«µÍÁË£¬\'+
      'Çë´øºÃ1000½ð±ÒÈë³¡·Ñ£¬Éýµ½10¼¶ÒÔÉÏÔÙÀ´ÕÒÎÒ¡£\ \'+
      '|{cmd}<Àë¿ª/@doexit>');
   end;
end;


Begin
   if  This_Player.GetV(10,2) = GetDateNum(GetNow()) then
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÏë²Î¼ÓÎÞ²î±ðÐÐ»áÕù°ÔÈüÂð£¿ÕâÀï²»¼ÓPKÖµ£¬Ò²²»»áµô\'+
      'ÂäÎïÆ·¡£Äã¿ÉÒÔÍ¨¹ýÈü³¡ÄÚµÄNPCÀë¿ªÈü³  £\'+
      'ÎÒ½«ÊÕÈ¡1000½ð±Ò×÷ÎªÈë³¡·Ñ£¬¶øÇÒÄãÒª´ïµ½10¼¶ÒÔÉÏ¡£\' +
      '¹Ù·½Ò²»á×éÖ¯ÕýÊ½µÄ±ÈÈü£¬ÔÚÕýÊ½±ÈÈüÖÐ¾ÍÓÐ¹æÔòÏÞ¶¨ÁË¡£\ \'+
      '|{cmd}<½øÈë/@enter>                       ^<²é¿´ÕýÊ½±ÈÈü¹æÔò/@rule>\'+
      '|{cmd}<ÒÔºóÔÙÀ´/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÏë²Î¼ÓÎÞ²î±ðÐÐ»áÕù°ÔÈüÂð£¿ÕâÀï²»¼ÓPKÖµ£¬Ò²²»»áµô\'+
      'ÂäÎïÆ·¡£Äã¿ÉÒÔÍ¨¹ýÈü³¡ÄÚµÄNPCÀë¿ªÈü³  £\'+
      'ÎÒ½«ÊÕÈ¡1000½ð±Ò×÷ÎªÈë³¡·Ñ£¬¶øÇÒÄãÒª´ïµ½10¼¶ÒÔÉÏ¡£\' +
      '¹Ù·½Ò²»á×éÖ¯ÕýÊ½µÄ±ÈÈü£¬ÔÚÕýÊ½±ÈÈüÖÐ¾ÍÓÐ¹æÔòÏÞ¶¨ÁË¡£\ \'+
      '|{cmd}<½øÈë/@enter>                       ^<²é¿´ÕýÊ½±ÈÈü¹æÔò/@rule>\'+
      '|{cmd}<ÒÔºóÔÙÀ´/@doexit>                   ^<³öÊ¾¼ø±¦ÊÖÐÅ/@newskill>');
   end;   
end.