{******************************************************************

* ÏîÄ¿Ãû³Æ£º
* µ¥ÔªÃû³Æ£ºÁ÷ÀËººµÄÐÄËéÍùÊÂ  
* µ¥Ôª×÷Õß£º
* Õª    Òª£º
* ±¸    ×¢£º

*******************************************************************}

program Mir2;
{$I common.pas}

//±¾ÈÎÎñµÄÈÎÎñ±àºÅ,Ã¿¸öÈÎÎñ¶ÔÓ¦²»Í¬µÄÈÎÎñ±àºÅ£¬Õâ¸ö²»¿ÉÒÔÖØ¸´ 
const CurrentTaskID   = 108; 
//TASK_TYPE_MAIN      ÈÎÎñÀàÐÍÎªÖ÷Ïß
//TASK_TYPE_SUB       ÈÎÎñÀàÐÍÎªÖ§Ïß
//TASK_TYPE_EVERYDAY  ÈÎÎñÀàÐÍÎªÃ¿ÈÕ
const CurrentTaskType = TASK_TYPE_MAIN;
const CurrentTaskTitle = 'Ö÷ÏßÈÎÎñ-Á÷ÀËººµÄÐÄËéÍùÊÂ';

//¸Ã¶Î²»×öÈÎºÎÐÞ¸Ä 
//********************************************************************
//µ±Ç°ÈÎÎñµÄ±àºÅ 
function GetTaskID(): Integer;
begin
  Result := CurrentTaskID;   
end; 

//µ±Ç°ÈÎÎñµÄÀàÐÍ
function GetTaskType(): Integer;
begin
  Result := CurrentTaskType;
end; 

//µ±Ç°ÈÎÎñµÄ±êÌâ
function GetTaskTitle(): string;
begin
  Result := CurrentTaskTitle; 
end; 
//********************************************************************


//ÅÐ¶Ïµ±Ç°ÈÎÎñ¶ÔÓÚÍæ¼Ò¶ÔÏóÊôÓÚÄÄÖÖ×´Ì¬
function GetTaskState(): Integer;
var
  Tem108 : integer;
begin
   //Õâ¸öº¯ÊýÖÐ¿ÉÒÔÊ¹ÓÃ This_Player
   //TASK_STATE_UNRECEIVED   //ÈÎÎñ×´Ì¬ÎªÎ´½Óµ±Ç°ÈÎÎñ
   //TASK_STATE_RECEIVED     //ÈÎÎñ×´Ì¬ÎªÒÑ½Óµ±Ç°ÈÎÎñ
   //TASK_STATE_FINISHED     //ÈÎÎñ×´Ì¬ÎªÒÑÍê³Éµ±Ç°ÈÎÎñ
   Tem108 := This_Player.GetV(108,1);
   if This_Player.GetV(109,1) >= 1 then
   begin
      Result := TASK_STATE_FINISHED;
   end
   else if Tem108 < 0 then
   begin                  
      Result := TASK_STATE_UNRECEIVED;
   end
   else if (Tem108 >= 1) and (Tem108 <= 19) then
   begin
      Result := Task_State_Received;
   end; 
end;

//µ±Ç°ÈÎÎñµÄÏêÏ¸ÃèÊö
function GetTaskDetail(): string;
var
  Tem108_1 : integer;
begin
  //Õâ¸öº¯ÊýÖÐ¿ÉÒÔÊ¹ÓÃ This_Player
  Tem108_1 := This_Player.GetV(108,1);
  case Tem108_1 of      
    1  : Result := 'È¥¼û¼û<Á÷ÀËºº(347,335)/CMD=10801>°É£¡\ÏàÐÅÄãÓ¦¸ÃÓÐÊµÁ¦°ïÖúËû½â¾öÀ§ÄÑµÄ¡£';
     
    2  : Result := 'Ç°Íù<Ê¯Ä¹Ò»²ã/c=red>£¬É±µô<5Ö»ºìÒ°Öí/c=red>ºóÏòÁ÷ÀËºº±¨¸æ¡£\ \Ë¢¹ÖµØµã£º\<Ê¯Ä¹Ò»²ãË¢ÐÂµãÒ»/CMD=10802>\ \|{cmd}<Ê¯Ä¹Ò»²ãË¢ÐÂµã¶þ/CMD=10812>';
     
    3  : Result := 'ÄãÏÖÔÚÒÑ¾­É±ËÀÁË5ºìÒ°Öí£¬\¸Ï¿ì»ØÈ¥ÕÒÃËÖØµÄ<Á÷ÀËºº(347,335)/CMD=10801>°É¡£';
     
    4  : Result := 'Ç°Íù<Ê¯Ä¹Ò»²ã/c=red>£¬É±µô<5Ö»ºÚÒ°Öí/c=red>ºóÏòÁ÷ÀËºº±¨¸æ¡£\ \Ë¢¹ÖµØµã£º\<Ê¯Ä¹Ò»²ãË¢ÐÂµãÒ»/CMD=10802>\ \|{cmd}<Ê¯Ä¹Ò»²ãË¢ÐÂµã¶þ/CMD=10812>';
     
    5  : Result := 'ÄãÏÖÔÚÒÑ¾­É±ËÀÁË5ºÚÒ°Öí£¬\¸Ï¿ì»ØÈ¥ÕÒÃËÖØµÄ<Á÷ÀËºº(347,335)/CMD=10801>°É¡£';
     
    6  : Result := 'ÉîÈë<Ê¯Ä¹¶þ²ã/c=red>£¬ÔÚºÚÉ«¶ñÇùµÄÉíÉÏÑ°ÕÒÁ÷ÀËºº\Ç×ÈËµÄÒÅº  £\ \Ë¢¹ÖµØµã£º\<Ê¯Ä¹¶þ²ãË¢ÐÂµãÒ»/CMD=10803>\ \|{cmd}<Ê¯Ä¹¶þ²ãË¢ÐÂµã¶þ/CMD=10813>';
     
    7  : Result := 'ÄãÒÑ¾­ÔÚºÚÉ«¶ñÇùµÄÉíÉÏÕÒµ½ÁËÒÅº¡£¬\¸Ï¿ì»ØÈ¥ÕÒÃËÖØµÄ<Á÷ÀËºº(347,335)/CMD=10801>°É£¡';
     
    8  : Result := 'ÉîÈë<Ê¯Ä¹Èý²ã/c=red>£¬ÔÚºìÒ°ÖíÉíÉÏÕÒÑ°Ê£ÏÂµÄº¡¹Ç¡£\ \Ë¢¹ÖµØµã£º\<Ê¯Ä¹Èý²ãË¢ÐÂµãÒ»/CMD=10804>\<Ê¯Ä¹Èý²ãË¢ÐÂµã¶þ/CMD=10814>';
     
    9  : Result := 'ÄãÒÑ¾­ÔÚºìÒ°ÖíµÄÉíÉÏÕÒµ½ÁËÊ£ÏÂµÄº¡¹Ç£¬\¸Ï¿ì»ØÈ¥ÕÒÃËÖØµÄ<Á÷ÀËºº(347,335)/CMD=10801>°É¡£';
     
    10 : Result := '½«Á÷ÀËººµÄÐÅ°²È«µØ\ËÍ´ï<ÃËÖØÖ¸»Ó¹Ù(336,331)/CMD=10805>´¦¡£';
     
    11 : Result := 'ÔÙ´ÎÇ°ÍùÊ¯Ä¹Õó£¬Ñ°ÕÒ¹ÂÉíÉîÈë\Ê¯Ä¹ÕóÖÐµÄ<ÎäÆ÷µêÀÏ°å(23,27)/CMD=10806>¡£';
     
    12 : Result := 'ÎäÆ÷µêÀÏ°åÍÐ¸¶Äã°ÑÏûÏ¢´ø¸øÊ¯Ä¹ÕóÖÐ\µÄ<ÒÂ·þµêÀÏ°å(23,27)/CMD=10807>¡£';
        
    13 : Result := 'Ç°Íù<Ê¯Ä¹Îå²ã/c=red>£¬É±ËÀÐ¨¶ê£¬\»ñÈ¡ÍêÕûµÄ¶êÒí´ø»Ø¸øÊ¯Ä¹ÕóÖÐµÄÒÂ·þµêÀÏ°å¡£\ \Ë¢¹ÖµØµã£º\<Ê¯Ä¹Îå²ãË¢ÐÂµãÒ»/CMD=10808>\<Ê¯Ä¹Îå²ãË¢ÐÂµã¶þ/CMD=10815>';
        
    14 : Result := 'ÄãÒÑ¾­ÔÚÊ¯Ä¹Îå²ã»ñÈ¡ÁËÍêÕûµÄ¶êÒí£¬\¿ì°ÑËü´ø»ØÈ¥½»¸øÊ¯Ä¹ÕóÖÐµÄ<ÒÂ·þµêÀÏ°å(23,27)/CMD=10807>¡£';
        
    15 : Result := '°ÑÏûÏ¢´«µÝ¸øÊ¯Ä¹ÕóÖÐµÄ\<Ê×ÊÎµê±£¹ÜÔ±(23,27)/CMD=10809>°É£¬\Ò²ÈÃËûÁËÈ´Ò»×®ÐÄÔ¸';
        
    16 : Result := '¾¡¿ì·µ»ØÃËÖØ£¬¸æËß<Á÷ÀËºº(347,335)/CMD=10801>Ê¯Ä¹ÀïµÄÏûÏ¢¡£';
        
    17 : Result := 'ÉîÈëòÚò¼¶´µÄ<ËÀÍö¹×²Ä/c=red>£¬É±ËÀÒ»Ö»\<Ð°¶ñÇ¯³æ(100,100)/c=red>£¬»ñµÃÇ¯³æ½ÇÖ®ºóËÍ¸øÁ÷ÀËºº¡£\ \Ë¢¹ÖµØµã£º\<ËÀÍö¹×²ÄË¢ÐÂµãÒ»/CMD=10810>\<ËÀÍö¹×²ÄË¢ÐÂµã¶þ/CMD=10816>';
        
    18 : Result := 'ÄãÒÑ¾­É±ËÀÐ°¶ñÇ¯³æ£¬»ñµÃÁËÇ¯³æ½Ç£¬\¸Ï¿ì»ØÃËÖØÍÁ³ÇÕÒ<Á÷ÀËºº(347,335)/CMD=10801>°É£¡';
        
    19 : Result := '´ø×ÅÁ÷ÀËººµÄÍÆ¼öÐÅÈ¥ÕÒµ½<×ÚÊ¦(323,338)/CMD=10811>¡£';
  end;
end;

//µ±Ç°ÈÎÎñµÄ½ø¶È
function GetTaskProgress(): string;
var
  DGTem, DGNum01, DGNum02, DGNum03 : integer; 
begin
   DGTem := This_Player.GetV(108,1);
   if DGTem = 2 then
   begin
      DGNum01 := This_Player.GetV(108, 2);
      if (DGNum01 > 0) and (DGNum01 < 5) then
      begin
         Result := 'ÄãÒÑ¾­ÏûÃðÁË' + IntToStr(DGNum01) + '/5Ö»ºìÒ°Öí\ \';
      end;
   end
   else if DGTem = 4 then
   begin
      DGNum02 := This_Player.GetV(108,3);
      if (DGNum02 > 0) and (DGNum02 < 5) then
      begin
         Result := 'ÄãÒÑ¾­ÏûÃðÁË' + IntToStr(DGNum02) + '/5Ö»ºÚÒ°Öí\ \';
      end;
   end; 
end;  

//±¾½Å±¾ÖÐ¿ÉÒÔÖ§³ÖµÄÃüÁî 
function DoTaskCommand(const value: string): Boolean;
var
  FiStr : integer;
begin 
   Result := True;
   FiStr := StrToIntDef(value,-1); 
   case FiStr of
    10801 : This_Player.AutoGotoMap('3',347,335);
    10802 : This_Player.AutoGotoMap('D711',201,203);
    10803 : This_Player.AutoGotoMap('D712',367,225);
    10804 : This_Player.AutoGotoMap('D713',34,190);
    10805 : This_Player.AutoGotoMap('3',336,331);
    10806 : This_Player.AutoGotoMap('D71650',20,30);
    10807 : This_Player.AutoGotoMap('D71651',20,30);
    10808 : This_Player.AutoGotoMap('D715',32,343);
    10809 : This_Player.AutoGotoMap('D71652',20,30);
    10810 : This_Player.AutoGotoMap('D606',13,28);
    10811 : This_Player.AutoGotoMap('3',323,338); 
    10812 : This_Player.AutoGotoMap('D711',251,41);
    10813 : This_Player.AutoGotoMap('D712',251,41);
    10814 : This_Player.AutoGotoMap('D713',251,41);
    10815 : This_Player.AutoGotoMap('D715',291,114);
    10816 : This_Player.AutoGotoMap('D606',67,76);
   end;
end; 

begin
  //Ö÷º¯Êý²»±»µ÷ÓÃ 
end.