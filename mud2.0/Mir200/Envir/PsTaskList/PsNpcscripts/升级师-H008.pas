{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure domain;
begin
   This_NPC.NpcDialog(This_Player,
   '我正忙着呢，别来打扰我！\ \'
   +'|<用/@a1>1000金币试探\'
   +'|<离开/@exit>'
   );

end;

procedure _a1;
begin
    if This_Player.GoldNum >= 1000 then
    begin
    This_Player.DecGold(1000);
   This_NPC.NpcDialog(This_Player,
   '哈哈，谢谢你的金币！\'
   +'我正在研究一种新的升级技术，你愿意帮忙吗？\ \'
   +'|<赞助/@a2>2000金币研究费\'
   +'|<一毛不拔/@exit>'
   );
    end else
   This_NPC.NpcDialog(This_Player,
   '你连这么点钱都没有？我可只为有钱人服务！\ \'
   +'|<离开/@exit>'
   );

end;

procedure _a2;
begin
    if This_Player.GoldNum >= 2000 then
    begin
        This_Player.DecGold(2000);
       This_NPC.NpcDialog(This_Player,
       '呵呵，太感谢了！\'
       +'等我研究成功之后别忘了来找我！\ \'
       +'|<离开/@exit>'
       )
    end  else
   This_NPC.NpcDialog(This_Player,
   '你连这么点钱都没有？我可只为有钱人服务！\ \'
   +'|<离开/@exit>'
   );

end;
//脚本执行的入口
begin
  domain;
end.