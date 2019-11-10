{********************************************************************

*******************************************************************}

program Mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _ruhejh;
begin
   This_Npc.NpcDialog(This_Player,
   '如果你是女性，那么你有权力允许或者拒绝对方的求婚，\聊天框输入：@允许求婚 ，你就可以接受男性的求婚了，\聊天框输入：@拒绝求婚 ，你将拒绝所有男性对你的求婚，\指令只需输入一次就可终身有效。\ \|{cmd}<返回/@main>'
   );
end;

procedure domain;
begin
   This_Npc.NpcDialog(This_Player,
   '你想做什么？\ \' 
   +'|{cmd}<如何结婚/@ruhejh>\'
   +'|{cmd}<求婚/@jiehun>\'
   +'|{cmd}<离婚/@lihun>\'
   +'|{cmd}<打听消息/@xiaoxi>\'
   +'|{cmd}<离开/@doexit>'
   );
end;


procedure _jiehun;
begin
  This_Npc.NpcDialog(This_Player,
  '求婚者必须是男性且拥有求婚戒指，声望值在5点以上\如果你点数不够，对方不在姻缘神殿，或者不同意求婚，\戒指收走后就拿不回去了。\你准备好求婚了吗？\'
  +'|{cmd}<准备好了/@DoMarry>\'
  +'|{cmd}<没有/@doexit>，下次再来\'
  +'|{cmd}<返回/@main>'
  );
end;

procedure _DoMarry;
begin
  This_Npc.InputDialog(This_Player, '输入要求婚的玩家名', 0, 202);
end;

procedure p202;
begin
  if This_Npc.InputOK then
  begin
    This_Npc.RequestMarry(This_Player, This_Npc.InputStr);
  end;
end;

procedure _agreemarry;
begin
  This_Player.AgreeMarry(This_Npc);
end;

procedure _dismarry;
begin
  This_Player.DisAgreeMarry;
  This_Npc.CloseDialog(This_Player);
end;

procedure _npclihun;
begin
  This_Player.NpcDivMarry(This_Npc);
end;

procedure _lihun;
begin
  This_Npc.NpcDialog(This_Player,
  '想要离婚的话必须支付100万金币，\你确定要离婚吗？\ \'
  +'|{cmd}<确定/@npclihun>\'
  +'|{cmd}<不离/@doexit>\'
  +'|{cmd}<返回/@main>\'
  );
end;

procedure _xiaoxi;
begin
  This_Npc.NpcDialog(This_Player,
  '前几天我不小心把一枚戒指掉在外面了，\你能帮我找回来吗？\ \|{cmd}<确定/@doexit>'
  );
end;

begin
  domain;
end.