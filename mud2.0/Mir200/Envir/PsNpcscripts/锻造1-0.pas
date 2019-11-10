{
*******************************************************************}

program Mir2;



procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//*******************¶ÍÔì½ğ¸ÕÊ¯*********************** 
procedure _ForgeDiamond;
begin
  This_Npc.NpcDialog(This_Player,
  '¶ÍÔì½ğ¸ÕÊ¯ĞèÒªÓÃÇ¿´óµÄÒâÖ¾Á¦£¬²¢ÇÒµÈ¼¶´ïµ½15¼¶£¬Ò»µ©¿ªÊ¼\'+
  '¶Í²»¹ÜÊÇ·ñÔÚÏß¶¼½«³ÖĞø½øĞĞ5·ÖÖÓ£¬ÆÚ¼ä²»ÄÜ±»ÖÕÖ¹¡£¶ÍÔì5\'+ 
  '·ÖÖÓºó¿ÉÁìÈ¡¶ÍÔìµÄ½ğ¸ÕÊ¯£¬²¢ÇÒÓĞ¼¸ÂÊ»ñµÃ¶îÍâ½±Àø¡£\ \'+
  '|{cmd}<ÎÒÒª¿ªÊ¼½ğ¸ÕÊ¯¶ÍÔì/@ForgeDiamondStart>\'+
  '|{cmd}<ÁìÈ¡¶ÍÔìÍê³ÉµÄ½ğ¸ÕÊ¯/@ForgeDiamondGet>\' +
  '|{cmd}<²éÑ¯½ğ¸ÕÊ¯¶ÍÔì¹æÔò/@ForgeDiamondRule>'
  );
end;

procedure _ForgeDiamondRule;
begin
  This_Npc.NpcDialog(This_Player,
  '1.¿ªÊ¼¶ÍÔì5·ÖÖÓºó²Å¿ÉÁìÈ¡¶ÍÔìÍê³ÉµÄ½ğ¸ÕÊ¯¡£\'+
  '2.µ±Ç°¶ÍÔìÎ´Íê³É²»ÄÜÉêÇëÏÂ´Î¶ÍÔì¡£\'+
  '3.Ã¿ÌìÖ»ÄÜÑ¡Ôñ1ÖÖ·½Ê½½øĞĞ1´Î¶ÍÔì¡£\'+
  '4.Ã¿´ÎÁìÈ¡¶ÍÔìÍê³ÉµÄ½ğ¸ÕÊ¯Ê±¶¼¿É»ñµÃ¶îÍâ½±Àø¡£\'+
  '5.Ö»ÓĞ15¼¶ÒÔÉÏµÄÓÂÊ¿²Å¿É½øĞĞ¶ÍÔì¡£\ \'+
  '|{cmd}<ÒÑÁË½â½ğ¸ÕÊ¯¶ÍÔì¹æÔò£¬·µ»Ø/@ForgeDiamond>'
  );
end;

procedure _ForgeDiamondStart;
begin
  if This_Player.Level < 15 then
  begin
  This_Npc.NpcDialog(This_Player,
  'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
  ); 
  end else
  This_Npc.NpcDialog(This_Player,
  'Ò»µ©¿ªÊ¼¶ÍÔì£¬²»¹ÜÊÇ·ñÔÚÏß¶¼½«³ÖĞø1Ğ¡Ê±£¬ÇÒ²»¿É±»ÖÕÖ¹¡£\'+
  '|Ã¿ÌìÖ»ÄÜÑ¡Ôñ1ÖÖ·½Ê½½øĞĞ1´Î¶ÍÔì£¬Ã¿´Î¶ÍÔì¶¼¿É»ñµÃ¶îÍâ½±Àø¡£\ \'+
  '|{cmd}<Ê¹ÓÃ10Ôª±¦¶ÍÔì30¿Å½ğ¸ÕÊ¯/@ForgeDiamondStart_YB1>\'+
  '|{cmd}<Ê¹ÓÃ30Ôª±¦¶ÍÔì90¿Å½ğ¸ÕÊ¯/@ForgeDiamondStart_YB2>\'+
  '|{cmd}<Ê¹ÓÃ50Ôª±¦¶ÍÔì150¿Å½ğ¸ÕÊ¯/@ForgeDiamondStart_YB3>\'
  );
end;

function ForgeDiaYB(price, num: Integer):boolean;
begin
  This_Player.SetS(73,45,GetDateNum(GetNow));
  This_Player.SetS(73,46,ConvertDateTimeToDB(GetNow));
  This_Player.SetS(73,47,price);
  This_Npc.NpcDialog(This_Player,
  'ÄãÒÑ¾­³É¹¦¿ªÊ¼½ğ¸ÕÊ¯¶ÍÔì£¬Çë1Ğ¡Ê±ºóÁìÈ¡¶ÍÔìÍê³ÉµÄ½ğ¸ÕÊ¯¡£'
  );
  result := true;
end;

procedure _ForgeDiamondStart_YB1;
var
temp:integer;
begin  
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20146,10,1); 
   end;  
end;

{procedure _ForgeDiamondStart_JD1;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 100 then 
      begin
        if This_Player.DecGloryPoint(30078,100,1,false,'½ğ¸ÕÊ¯¶ÍÔì') then
        begin
          ForgeDiaYB(1,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÄ½ğ¶§²»×ã£¡\' );
      end;      
   end;  
end;
        }
procedure _ForgeDiamondStart_YB2;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20147,30,1); 
   end;  
end;
{
procedure _ForgeDiamondStart_JD2;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 500 then 
      begin
        if This_Player.DecGloryPoint(30079,500,1,false,'½ğ¸ÕÊ¯¶ÍÔì') then
        begin
          ForgeDiaYB(5,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÄ½ğ¶§²»×ã£¡\' );
      end;      
   end;  
end;
   }
procedure _ForgeDiamondStart_YB3;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20148,50,1); 
   end;  
end;
{
procedure _ForgeDiamondStart_JD3;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 1000 then 
      begin
        if This_Player.DecGloryPoint(30080,1000,1,false,'½ğ¸ÕÊ¯¶ÍÔì') then
        begin
          ForgeDiaYB(10,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÄ½ğ¶§²»×ã£¡\' );
      end;      
   end;  
end;
   } 
    {
procedure _ForgeDiamondStart_YB4;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
   This_Player.PsYBConsum(This_NPC,'ForgeDiaYB',20149,30,1); 
   end;  
end;

procedure _ForgeDiamondStart_JD4;
var
temp:integer;
begin
   if This_Player.Level < 15 then
   begin
   This_Npc.NpcDialog(This_Player,
   'ÄãµÄµÈ¼¶²»Âú15¼¶£¬²»¿É¶ÍÔì½ğ¸ÕÊ¯¡£'
   ); 
   end else
   if This_Player.GetS(73,45) = GetDateNum(GetNow) then
   begin
   This_Npc.NpcDialog(This_Player,
   'Äã½ñÌìÒÑ¾­½øĞĞ¹ı½ğ¸ÕÊ¯¶ÍÔìÁË£¬ÇëÃ÷ÌìÔÙÀ´°É£¡'
   ); 
   end else
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 60;
      if temp >= 60 then
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãÉĞÓĞÎ´ÁìÈ¡µÄ½ğ¸ÕÊ¯£¬ÇëÏÈÁìÈ¡ºóÔÙÀ´¶ÍÔì£¡'
      ); 
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´ÎµÄ¶ÍÔì»¹Î´Íê³É£¬²»¿ÉÔÙ´Î½øĞĞ¶ÍÔì¡£'
      ); 
   end else
   begin
      if This_Player.GloryPoint >= 3000 then 
      begin
        if This_Player.DecGloryPoint(30081,3000,1,false,'½ğ¸ÕÊ¯¶ÍÔì') then
        begin
          ForgeDiaYB(30,1);
        end; 
      end else
      begin
      This_Npc.NpcDialog(This_Player,
      'ÄãµÄ½ğ¶§²»×ã£¡\' );
      end;      
   end;  
end;
   }
   
function getZDJZname():string;
begin
    result := '';
    case random(5) of
        0:result :='¿ó¶´×é¶Ó¾íÖá';
        1:result :='Éñµî×é¶Ó¾íÖá';
        2:result :='Ğ°¿ß×é¶Ó¾íÖá';
        3:result :='µØÑ¨×é¶Ó¾íÖá';
        4:result :='Ê¯Ä¹×é¶Ó¾íÖá';
    end;
end;

function getExpnum() : integer;
var P_LV : integer;
begin
    P_LV := This_Player.Level;
   if P_LV <  1  then result := 0
   else if (P_LV >=  1 ) and (P_LV <=  7 ) then   result  := 57000
   else if (P_LV >=  8 ) and (P_LV <=  14 ) then   result  := 75000
   else if (P_LV >=  15 ) and (P_LV <=  18 ) then   result  := 90000
   else if (P_LV >=  19 ) and (P_LV <=  21 ) then   result  := 105000
   else if (P_LV >=  22 ) and (P_LV <=  24 ) then   result  := 120000
   else if (P_LV >=  25 ) and (P_LV <=  27 ) then   result  := 135000
   else if (P_LV >=  28 ) and (P_LV <=  30 ) then   result  := 150000
   else if (P_LV >=  31 ) and (P_LV <=  34 ) then   result  := 180000
   else if (P_LV >=  35 ) and (P_LV <=  37 ) then   result  := 210000
   else if (P_LV >=  38 ) and (P_LV <=  40 ) then   result  := 240000
   else if (P_LV >=  41 ) and (P_LV <=  42 ) then   result  := 270000
   else if (P_LV >=  43 ) and (P_LV <=  44 ) then   result  := 285000
   else if (P_LV >=  45 ) and (P_LV <=  45 ) then   result  := 300000
   else if (P_LV >=  46 ) and (P_LV <=  46 ) then   result  := 330000
   else if (P_LV >=  47 ) and (P_LV <=  48 ) then   result  := 345000
   else if (P_LV >=  49 ) and (P_LV <=  50 ) then   result  := 360000
   else if (P_LV >=  51 ) and (P_LV <=  52 ) then   result  := 375000
   else if (P_LV >=  53 ) and (P_LV <=  54 ) then   result  := 390000
   else if (P_LV >=  55 ) and (P_LV <=  56 ) then   result  := 405000
   else if (P_LV >=  57 ) and (P_LV <=  58 ) then   result  := 420000
   else result := 450000;
end;

function getdZprz():string;
begin
   result := '';
   case random(20) of
      0 : result := 'ÆïÊ¿ÊÖïí';
      1 : result := 'ÂÌÉ«ÏîÁ´';
      2 : result := '½ğ×©';
      3 : result := 'ÁúÖ®ÊÖïí';
      4 : result := '×£¸£ÓÍ';
      5 : result := 'Ì©Ì¹½äÖ¸';
      6 : result := 'Áé»êÏîÁ´';
      7 : result := '×Ï±ÌÂİ';
      8 : result := '×£¸£ÓÍ';
      9 : result := '¶ñÄ§Áåîõ';
      10 : result := 'ºÚÌúÍ·¿ø';
      11 : result := '×£¸£ÓÍ';
      12 : result := 'Á¦Á¿½äÖ¸';
      13 : result := '×£¸£ÓÍ';
      14 : result := 'ÈÙÓşÑ«ÕÂ15ºÅ';
      15 : result := 'ÈÙÓşÑ«ÕÂ14ºÅ';
      16 : result := 'ÈÙÓşÑ«ÕÂ13ºÅ';
      17 : result := 'ÈÙÓşÑ«ÕÂ25ºÅ';
      18 : result := 'ÈÙÓşÑ«ÕÂ24ºÅ';
      19 : result := 'ÈÙÓşÑ«ÕÂ23ºÅ';
   end;
   
   
end;
 
procedure _ForgeDiamondGet;
var
i,temp,num,expnum,FreeBagNum:integer;
JZname , JZstr , morePrz : string;
begin
   JZname := '';
   JZstr := '';
   morePrz := '';
   if This_Player.GetS(73,46) > 0 then
   begin
      temp:= (ConvertDateTimeToDB(GetNow) - This_Player.GetS(73,46)) div 5;
      if temp >= 5 then
      begin
        num:= This_Player.GetS(73,47);
        case num of
          10:FreeBagNum:=1;
          30:FreeBagNum:=3;
          50:FreeBagNum:=6;
        end; 
        if This_Player.FreeBagNum > FreeBagNum then
        begin
          
          This_Player.SetS(73,46,0);
          This_Player.SetS(73,47,0); 
          This_Player.Give('½ğ¸ÕÊ¯',num*3);
          
          for i:=1 to (num div 10) do
          begin
            JZname := getZDJZname;
            This_Player.Give(JZname,1);
            JZstr := JZstr + JZname;
            if i < (num div 10) then
            JZstr := JZstr + '¡¢';
          end;
          
          expnum := getExpnum * num; 
          expnum := expnum - Random(expnum div 5) + (expnum div 10);
          
          This_Player.Give('¾­Ñé',expnum);
          
          if num = 50 then
          begin
             morePrz := getdZprz();
             This_Player.Give(morePrz,1);
             
             morePrz := '|¶îÍâ½±Àø:' + morePrz;
          end else
          morePrz := '';
          
          
          This_Npc.NpcDialog(This_Player,
          '¹§Ï²Äã»ñµÃÁË¶ÍÔìÍê³ÉµÄ½±Àø:'
          +'|½ğ¸ÕÊ¯:'+inttostr(num*3)+'¿Å£¬¾­Ñé:'+inttostr(expnum)+'\'+
          '|¾íÖá:' + JZstr
          +morePrz 
          );  
        end else
        This_Npc.NpcDialog(This_Player,
        'ÄãµÄ°ü¹üÌ«ÂúÁË£¬ÏÈÕûÀíÒ»ÏÂ°É¡£'
        );  
      end else 
      This_Npc.NpcDialog(This_Player,
      'ÄãÉÏ´Î¶ÍÔìµÄ½ğ¸ÕÊ¯ÉĞÎ´Íê³É£¬²»¿ÉÁìÈ¡½ğ¸ÕÊ¯¡£\'+
      'Çë'+inttostr(5-temp)+'·ÖÖÓºóÔÙÀ´ÁìÈ¡£'
      ); 
   end else
   This_Npc.NpcDialog(This_Player,
   'Äã»¹Î´½øĞĞ½ğ¸ÕÊ¯¶ÍÔì£¬²»¿ÉÁìÈ¡½ğ¸ÕÊ¯¡£'
   );     
end;




begin    
   
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<½ğ¸ÕÊ¯¶ÍÔì/@ForgeDiamond>                    \ \' 
  );
end.  