{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '我是沙巴克密使！我可以把你直接送到沙巴克皇宫中！\'
   +'不过你必须满足我的要求，而我的要求嘛……\'
   +'你先给我5000金币吧，不算多吧？\ \'
   +'|<试试/@a1>\'
   +'|<离开/@exit>'
   );

end;

procedure _a1;
begin
    case random(3) of
        0:
        begin
            if This_Player.GoldNum >= 5000 then
            begin
                This_Player.DecGold(5000);
               This_NPC.NpcDialog(This_Player,
               '谢谢你的金币了！\'
               +'可惜别人出的钱更多，所以我还不打算为你服务。\'
               +'但如果你能出更多的钱，我是愿意再考虑考虑的！\ \'
               +'|<再出/@a1>5000金币试试\'
               +'|<离开/@exit>'  
               );
        
            end else
           This_NPC.NpcDialog(This_Player,
           '你连这么点钱都没有？我可只为有钱人服务！\ \'
           +'|<离开/@exit>'
           );
    
        end;
        1:
        begin
            if This_Player.GoldNum >= 5000 then
            begin
                This_Player.DecGold(5000);
               This_NPC.NpcDialog(This_Player,
               '谢谢你的金币了！可是我改变主意了！\'
               +'现在我要……我要……我还没想好！\'
               +'这样吧，等我想好了再说吧！\ \'
               +'|<离开/@exit>'  
               ); 
            end else
           This_NPC.NpcDialog(This_Player,
           '你连这么点钱都没有？我可只为有钱人服务！\ \'
           +'|<离开/@exit>'
           );
    
        end;
        2:
        begin
            if This_Player.GoldNum >= 5000 then
            begin
                This_Player.DecGold(5000);
               This_NPC.NpcDialog(This_Player,
               '哎呀！不好意思，传送失败了！\'
               +'什么原因呢，真奇怪！\'
               +'是天气的原因？还是缺少了什么？难道是钱不够……？\ \'
               +'|<再出/@a1>5000金币试试\'
               +'|<离开/@exit>'           
               );
    
            end else
           This_NPC.NpcDialog(This_Player,
           '你连这么点钱都没有？我可只为有钱人服务！\ \'
           +'|<离开/@exit>'
           );
        end;
    end;
end;

begin
    domain;
end.