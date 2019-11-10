{
*******************************************************************}


program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================ĞÂÊÖÈÎÎñ
procedure dorenwu5;
begin
   This_Npc.NpcDialog(This_Player,
   'Äã¾ÍÊÇĞÂÀ´µÄÄêÇáÈË°É£¡'+ This_Player.Name + '£¬³öÃÅÔÚÍâ£¬\'+
   '×Ô¼º¿ÉÒª¶à×¢Òâ°²È«¡£ÎªÁË°ïÖúÄã¸ü¿ìµÄÊìÏ¤ÕâÀïµÄ»·¾³\'+
   'ÎÒÏëÈÃÄãÈÏÊ¶ÈÏÊ¶Õâ¸ö³ÇÀïµÄÈËÃÇ£¬ÏÈÈ¥¸ô±Ú<·ş×°µê/c=red>´ò¸öÕĞºô°É\'+
   'ÕâĞ©×°±¸ÊÇÎÒ×÷Îª³êÀÍËÍ¸øÄãµÄ£¡\ \ \'+
   '|{cmd}<ÎÒ½ÓÊÜ(ÈÎÎñ)/@renwu6>');
end;

procedure dorenwu6;
begin
   This_Npc.NpcDialog(This_Player,
   'ÏÈÈ¥¸ô±Ú·ş×°µê´ò¸öÕĞºô°É£¡\ \ \'+
   '|{cmd}<ÎÒÕâ¾ÍÈ¥(ÈÎÎñ)/@doexit>\');
end;


procedure _renwu6;
begin
   if This_Player.GetV(102,1) = 2 then
   begin
     This_Npc.NpcDialog(This_Player,
    'ÏÈÈ¥¸ô±Ú·ş×°µê´ò¸öÕĞºô°É£¡\ \ \'+
    '|{cmd}<ÎÒÕâ¾ÍÈ¥(ÈÎÎñ)/@doexit>\');
   end else
   begin
      if This_Player.FreeBagNum < 5 then
      begin
         This_Npc.NpcDialog(This_Player,
         'ÄãµÄ°ü¹üÌ«Âú£¬ÇëÖÁÉÙÕûÀí³ö5¸ö°ü¹üÎ»Ö®ºóÔÙÀ´ÕÒÎÒ¡£');
      end else
      begin
         This_Player.SetV(102,1,2);        //ÈÎÎñ±ê¼Ç
         This_Player.UpdateTaskDetail(102,1);
         This_Player.Give('¾­Ñé',800);
         //This_Player.Give('ÏßÍÅ',1);
         This_Player.Give('ĞÂÊÖÏîÁ´',1);
         This_Player.Give('ĞÂÊÖÊÖïí',2);
         This_Player.Give('ĞÂÊÖ½äÖ¸',2);
         This_Player.PlayerNotice('¿ìÈ¥ÕÒ·ş×°µêÀÏ°å£¡', 2);
         This_Npc.CloseDialog(This_Player);
      end;
   end;  
end;

//==============================================================ĞÂÊÖÈÎÎñ
procedure domain;
var
  ZHRW102 : integer;
begin
   ZHRW102 := This_Player.GetV(102,1);
   if (ZHRW102 = 2) or (ZHRW102 = 1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '¸ĞĞ»£¬ÎÒ¿ÉÒÔÎªÄã×öÊ²Ã´Âğ£¿\ \'
      +'|{cmd}<¹ºÂòÎïÆ·/@buy>  \'
      +'|{cmd}<³öÊÛÎïÆ·/@sell>  \'
      +'|{cmd}<Ñ¯ÎÊÎïÆ·ÏêÏ¸Çé¿ö/@questionprize>            \'//^<³É³¤ÈÎÎñ£ºÈçºÎ³ÉÎªÂê·¨ÓÂÊ¿/@RWZHExtra>\'
      +'|{cmd}<ÍË³ö/@doexit>');
   end else 
   begin
      This_Npc.NpcDialog(This_Player,
      '¸ĞĞ»£¬ ÎÒ¿ÉÒÔÎªÄã×öÊ²Ã´Âğ£¿\ \'
      +'|{cmd}<¹ºÂòÎïÆ·/@buy>  \'
      +'|{cmd}<³öÊÛÎïÆ·/@sell>  \'
      +'|{cmd}<Ñ¯ÎÊÎïÆ·ÏêÏ¸Çé¿ö/@questionprize>  \'
      +'|{cmd}<ÍË³ö/@doexit>');
   end;
end;

procedure _RWZHExtra;
var
  ZHRW102 : integer;
begin
   ZHRW102 := This_Player.GetV(102,1);
   if ZHRW102 = 2 then
   begin
      dorenwu6;
   end else if ZHRW102 = 1 then
   begin
      dorenwu5;
   end;
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    'ÄãÏëÂòÊ²Ã´£¿\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    'ÄãÏëÂôÊ²Ã´¶«Î÷£¿\ \ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _questionprize;
begin
  This_Npc.NpcDialog(This_Player,
  'ÎÒÃÇµêÓĞ<µØÀÎÌÓÍÑ¾í/@teleport>£¬\|{cmd}<Ëæ»ú´«ËÍ¾í/@teleport2>£¬<ĞŞ¸´ÓÍ/@repairoil> µÈµÈ¡£\¾İËµ»¹ÓĞ´ÓÑı¹ÖÉíÉÏÄÃµ½µÄ<»Ø³Ç¾í/@steleport>¡£\ \|{cmd}<·µ»Ø/@main>'
  );
end;

procedure _steleport;
begin
  This_Npc.NpcDialog(This_Player,
  '»Ø³Ç¾í¾İËµÀ´×ÔÔ¶¹ÅµÄÒ»ÖÖÉñÆæ¾íÖá¡£\'+
  'µ«²»ĞÒµÄÊÇ£¬ÏÖÔÚÒÑ¾­¶ªÊ§ÁË¡£\'+
  'µ«ÎÒÃÇÌıËµÓĞĞ©¹ÖÎï»¹ÓĞÕâÖÖ¾íÖá£¬\'+
  'Èç¹ûÊ¹ÓÃËüÄã¿ÉÒÔÁ¢¿Ì·µ»Ø´å×¯¡£\ \'+
  '|{cmd}<·µ»Ø/@questionprize>'
  );
end;

procedure _teleport;
begin
  This_Npc.NpcDialog(This_Player,
  'µØÀÎÌÓÍÑ¾íÊÇ½«×Ô¼ºË²¼äÒÆ¶¯µ½×îºó¾­¹ıµÄ´å×¯µÄÖäÎÄÊé£¬\µ±È»ºÍÏà±È£¬ËüµÄÍşÁ¦»¹ËãÈõ£¬\µ«ÊÇ¾È×Ô¼ºÒ»ÌõÃü£¬ÒÑ¾­×ã¹»ÁË¡£\ \ |{cmd}<·µ»Ø/@main>'
  );
end;

procedure _teleport2;
begin
  This_Npc.NpcDialog(This_Player,
  'Ëæ»ú´«ËÍ¾íÊÇ×Ô¼ºÄ¿Ç°ËùÔÚµÄµØÍ¼£¬Ò²¾ÍÊÇÔÚ»òÔÚµêÀïÃæ£¬\¿ÉÒÔÒÆ¶¯µ½ÈÎºÎµØ·½µÄÖäÎÄÊé¡£\¾¡¹Ü±È½ÏÎ£ÏÕ£¬µ«ÊÇ»¹Ê£ºÜ¶àÒ©µÄ»°£¬\Ê¹ÓÃÕâ¸ö£¬»á¶ÔÄã´òÁÔÓĞ°ïÖúµÄ¡£\ \ |{cmd}<·µ»Ø/@main>'
  );
end;

procedure _repairoil;
begin
  This_Npc.NpcDialog(This_Player,
  'ĞŞ¸´ÓÍÊÇÌá¸ß×Ô¼ºÄÃ×ÅµÄÎäÆ÷µÄÄÍ¾ÃÁ¦µÄÓÍ¡£\µ«ÊÇÒòÎªÃ»ÓĞÌØÊâĞŞÀíµÄĞ§¹û£¬\ÓÃĞŞÀíÓÍĞŞÀíµÄÎäÆ÷µÄÄÍ¾ÃÁ¦»áÔ½À´Ô½Ğ  £\Èç¹û²»ÊÇºÜ¹óµÄÎäÆ÷£¬´ø×ÅÒ»¸öÓÃÀ´×öĞŞÀí£¬\»á¶ÔÄã³¤¾ÃÊ±¼ä´òÁÔÓĞ°ïÖú¡£\ \ |{cmd}<·µ»Ø/@main>'
  );
end; 

//³õÊ¼»¯²Ù×÷
procedure OnInitialize;
begin
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(25);
  This_Npc.AddStdMode(30);
  This_Npc.FillGoods('µØÀÎÌÓÍÑ¾í',100,1);
  This_Npc.FillGoods('Ëæ»ú´«ËÍ¾í',100,1);
  This_Npc.FillGoods('»¤Éí·û',100,1); 
  This_Npc.FillGoods('ĞŞ¸´ÓÍ',50,17);
  This_Npc.FillGoods('µØÀÎÌÓÍÑ¾í°ü',100,1);
  This_Npc.FillGoods('Ëæ»ú´«ËÍ¾í°ü',100,1);
  This_Npc.FillGoods('»¤Éí·û(´ó)',50,1);
  This_Npc.FillGoods('³¬¼¶»¤Éí·û',10,1);
  This_Npc.SetRebate(100);
end;

//½Å±¾Ö´ĞĞµÄÈë¿Ú
begin
  domain;
end.