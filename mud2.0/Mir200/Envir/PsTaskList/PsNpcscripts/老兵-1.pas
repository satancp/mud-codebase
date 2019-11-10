{********************************************************************

*******************************************************************}
procedure _exit; 
begin
    This_NPC.CloseDialog(This_Player);
    exit;
end;

procedure domain; 
begin
   This_NPC.NpcDialog(This_Player,
   '听说虹魔教主复活了！他的领地“封魔谷”也已重现大陆！\'
   +'不过那么险恶的地方，你真的打算去吗？\\'
   +'|{cmd}<要去/@move>\'
   +'|{cmd}<过几天再去/@exit>'
   );


end;

procedure _move; 
begin
This_Player.Flyto('4',440,190);

end;
 
begin
    domain;
end.