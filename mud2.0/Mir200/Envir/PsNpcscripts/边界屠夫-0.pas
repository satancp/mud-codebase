{
/*******************************************************************************
}

program Mir2;

{$I common.pas}

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  'ÄúÀ´ÕâÀïÂôÈâÂğ£¿\ \'
  +'|{cmd}<ÂôÈâ/@sell>\'
  +'|{cmd}<Ñ¯ÎÊ/@meathelp>\' 
  +'|{cmd}<ÍË³ö/@doexit>'
  );
end;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '¸ß¼ÛÂòÈëÆ·ÖÊºÃµÄÈâ¡£\µÍ¼ÛÂòÈëÕ³ÉÏÍÁ»ò±»»ğÉÕµÄÈâ¡£\ \|{cmd}<·µ»Ø/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;

procedure _meathelp;
begin
  This_Npc.NpcDialog(This_Player,
  'Èâ¿ÉÒÔ´Ó¼¦£¬Â¹£¬ÀÇÉíÉÏ¸îµÄ¡£ ÏÈ´òÕâĞ©¹ÖÎï\Ğ¡ĞÄÅöµ½±È×Ô¼ºÀ÷º¦µÄ¹ÖÎï±»´òËÀ\´òËÀ¹ÖÎïÖ®ºó£¬°´alt¼ü£¬°ÑÊó±ê·ÅÔÚ¹ÖÎïÊ¬ÌåÉÏ\Äú¾Í»á¿´µ½×Ô¼º¸îÈâµÄÑù×Ó¡£\¹ıÒ»»á¶ù£¬ÄúµÄ°üÀï¾Í»á·Å×ÅÒ»¸ö´óÈâ¿é¡£\¶ÔÁË£¬²îÒ»µãÍüÁË¸æËßÄú£¬ÆóÍ¼ÌÓÅÜµÄ¹ÖÎïÆ·ÖÊ¸üºÃ\ÎªÁË·½±ã£¬Ê¹ÓÃÄ§·¨´ò¹ÖÎï£¬ÆäÆ·ÖÊ»á±ä³É0£¬ÕâÒ»µãÇ§Íò¼Ç×  £\ \|{cmd}<¼ÌĞø/@main>'
  );
end;

//³õÊ¼»¯²Ù×÷
procedure OnInitialize;
begin
  This_Npc.AddStdMode(40);
  This_Npc.AddStdMode(1);
  This_Npc.SetRebate(100);
end;  

//½Å±¾Ö´ĞĞµÄÈë¿Ú
begin
  domain;
end.