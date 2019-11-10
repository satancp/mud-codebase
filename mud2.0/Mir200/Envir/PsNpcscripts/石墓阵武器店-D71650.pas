{
*******************************************************************}


PROGRAM Mir2;

{$I common.pas}

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;


Procedure _repair;
Begin
   This_Npc.NpcDialog(This_Player,
   'ÒªĞŞÀíÎäÆ÷Âğ£¿ĞŞÀíÊ²Ã´ÎäÆ÷£¿\ \'+
   '|{cmd}<·µ»Ø/@main>');
   This_Npc.Click_Repair(This_Player);
end;

procedure RepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '»¹ÓĞÒªĞŞÀíµÄÂğ£¿\ \' +
    '|{cmd}<·µ»Ø/@main>'
  );
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



procedure OnInitialize;
begin
//  DebugOut('OnInitalize');
  This_Npc.SetRebate(200);

  //¼ÓÔØstdmode  
  This_NPC.AddStdMode(5);
  This_NPC.AddStdMode(6);
end;

Procedure _Normal;
begin
   This_Npc.NpcDialog(This_Player,
   '¶ÔÄãÕâÑùµÄÎäÊ¿À´Ëµ£¬ÎäÆ÷¾Í¸úÉúÃüÒ»Ñù¡£Èç¹ûÊ±¿Ì²»×¼±¸×Å£¬\'+
   'ÄÇÃ´ÄãÒ²»á³ÉÎªµØÉÏµÄ÷¼÷Ã¡£ÒªÊÇÄãÓĞºÃ¼¸ÌõÃü£¬ÄÇÃ´¿ÉÒÔ²»\'+
   'ĞŞÀíÎäÆ÷£¬ÔõÃ´Ñù£¬°ÑÄãµÄÎäÆ÷½»¸øÎÒÀ´ĞŞÀí°É£¿\ \'+
   '|{cmd}<ĞŞÀíÎäÆ÷/@repair> '+AddSpace(' ',24)+'|{cmd}<ÌØÊâĞŞÀí/@s_repair>\'+
   '|{cmd}<ÍË³ö/@doexit>');
end;

Procedure _QianBeiZou108;
begin
   This_Npc.NpcDialog(This_Player,
   'ÊÇ°  £ËµÆğÀ´£¬ÎÒÃÇµ±Ê±Ì«³å¶¯ÁË£¬Ò»ĞÄÏë×ÅÎªÁ÷ÀËºº±¨³ğ¡£\'+
   'µÄÈ·È´ºöÂÔÁËËûÒÑÊÇ¹Â¹Âµ¥µ¥µÄ¡£\'+
   'ÄãÈ¥°ÑÕâ¸öÏûÏ¢¸æËßÊ¯Ä¹ÕóÒÂ·şµêÀÏ°å°É£¡Ò»ÇĞÇëËû¶¨¶á£¡\'+
   '£¨ÈÎÎñÄ¿±ê£ºÉîÈëÊ¯Ä¹Õó£¬ÕÒµ½ÒÂ·şµêÀÏ°å£©\ \'+
   '|{cmd}<ºÃµÄ£¬ÎÒÕâ¾ÍÈ¥£¡/@QianBeiZou108_01>');
end;

Procedure _QianBeiZou108_01;
begin
   if This_Player.GetV(108,1) = 11 then
   begin
      This_Player.Give('¾­Ñé',320000);
      This_Player.SetV(108,1,12);
      This_Player.UpdateTaskDetail(108,1);
      This_NPC.CloseDialog(This_Player);
   end;
end;

var
  SM108 : integer; 
Begin
   SM108 := This_Player.GetV(108,1);
   if SM108 = 12 then
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÈ¥°ÑÕâ¸öÏûÏ¢¸æËßÊ¯Ä¹ÕóÒÂ·şµêÀÏ°å°É£¡Ò»ÇĞÇëËû¶¨¶á£¡\'+
      '£¨ÈÎÎñÄ¿±ê£ºÉîÈëÊ¯Ä¹Õó£¬ÕÒµ½ÒÂ·şµêÀÏ°å£©\ \'+
      '|{cmd}<ºÃµÄ£¬ÎÒÕâ¾ÍÈ¥£¡/@doexit>\ \'+
      '|{cmd}<ÎÒÓĞÆäËûÊÂÇéÕÒÄã/@Normal>');
   end else if SM108 = 11 then
   begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÄÒâË¼ÊÇËµ£¬ÄãÒÑ¾­°ïÁ÷ÀËººÕÒ»ØËûÇ×ÈËµÄº¡¹ÇÁË£¿\'+
      'ÎÒÃÇµÜĞÖ¼¸¸öÔÚÕâÀïÕâÃ´¾Ã¶¼Ã»ÓĞÕÒµ½£¬ÄãÒ»¸öÈË¾Í°ìµ½ÁË£¿\'+
      '°¥£¬²ÑÀ¢°  ­¡­\ \'+
      '|{cmd}<»¹ÇëÇ°±²Á¢¼´·µ»ØÃËÖØ°É/@QianBeiZou108>£¬Á÷ÀËººµÄÇ×ÈË½ÔÒÑ¹ÊÈ¥£¬\'+
      'ÄÚĞÄ±Ø¶¨±¸ÊÜ¼å°¾£¬ÕıÊÇĞèÒªÄãÃÇÕâĞ©µÜĞÖµÄÊ±ºò£¡\ \'+
      '|{cmd}<ÎÒÓĞÆäËûÊÂÇéÕÒÄã/@Normal>');
   end else
   begin
      _Normal;
   end;
end.