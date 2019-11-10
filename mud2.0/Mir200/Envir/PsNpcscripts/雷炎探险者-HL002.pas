{
*******************************************************************}

Program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;                         
begin
  This_Npc.CloseDialog(This_Player);
end;
                                                                                                                             
procedure _newskill2;                         
begin
   This_Npc.NpcDialog(This_Player,
   '是最近玛法风传的古战技秘籍对吧？嗯，我明白你的意思。\'+
   '行走江湖多年，对于古秘籍也有所耳闻，我想我能够帮你。\'+
   '10个古籍残片(小)可以解读成1个古籍残片(中)，\'+
   '5个古籍残片(中)可以拼接成1个古籍残片(大)。\ \'+
   '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\ \'+
   '|{cmd}<没事，谢谢/@exit>');
end;

procedure _newskill21;
begin
  if This_Player.GetBagItemCount('古籍残片(小)') >= 10 then
  begin
    This_Player.Take('古籍残片(小)',10);
    This_Player.Give('古籍残片(中)',1);
    This_Npc.NpcDialog(This_Player,
    '是最近玛法风传的古战技秘籍对吧？嗯，我明白你的意思。\'+
    '行走江湖多年，对于古秘籍也有所耳闻，我想我能够帮你。\'+
    '10个古籍残片(小)可以解读成1个古籍残片(中)，\'+
    '5个古籍残片(中)可以拼接成1个古籍残片(大)。\ \'+
    '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\ \'+
    '|{cmd}<没事，谢谢/@exit>');
  end else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够的残片啊！'
    );
  end;
end;

procedure _newskill22;
begin
  if This_Player.GetBagItemCount('古籍残片(中)') >= 5 then
  begin
    This_Player.Take('古籍残片(中)',5);
    This_Player.Give('古籍残片(大)',1);
    This_Npc.NpcDialog(This_Player,
    '是最近玛法风传的古战技秘籍对吧？嗯，我明白你的意思。\'+
    '行走江湖多年，对于古秘籍也有所耳闻，我想我能够帮你。\'+
    '10个古籍残片(小)可以解读成1个古籍残片(中)，\'+
    '5个古籍残片(中)可以拼接成1个古籍残片(大)。\ \'+
    '|{cmd}<解读古籍残片(小)/@newskill21>                 ^<拼接古籍残片(中) /@newskill22>\ \'+
    '|{cmd}<没事，谢谢/@exit>');
  end else
  begin
    This_Npc.NpcDialog(This_Player,
    '你没有足够的残片啊！'
    );
  end;
end;

procedure _golone;
var
LY : integer;                         
begin
   if compareText(This_Player.MapName,'HL002') = 0 then
   begin
      LY := random(6)+1;
      if LY = 6 then
      begin
         This_Player.Flyto('HL001',24,221);
      end else if LY = 5 then
      begin
         This_Player.Flyto('HL001',23,222);
      end else if LY = 4 then
      begin
         This_Player.Flyto('HL001',21,224);
      end else if LY = 3 then
      begin
         This_Player.Flyto('HL001',19,225);
      end else if LY = 2 then
      begin
         This_Player.Flyto('HL001',20,223);
      end else if LY = 1 then
      begin
         This_Player.Flyto('HL001',20,226);
      end; 
   end;
end;

Begin
   This_Npc.NpcDialog(This_Player,
   '这里处处充满危险，各位大侠一定要小心。\ \'+
  
   '|{cmd}<前往雷炎洞穴一层/@golone>');
end.