{
*******************************************************************}

program Mir2;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end; 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _move;
begin
   This_NPC.NpcDialog(This_Player,
   '你想移动到哪里去呢？\'+
   '|{cmd}<挑战幻境一层/@move1> \'+
   '|{cmd}<我有钱,直接挑战幻境7层/@move2> \'+

   '|{cmd}<返回/@main>');
end;



procedure _move2;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到幻境七层。\'+ 
   '不能让你免费使用，你必须支付3000000金币！\'+ 
   '你想花这笔钱吗？\ \'+  
   '|{cmd}<移动/@pay2>\');

end;


procedure _pay2;
begin
   if This_Player.GoldNum >= 1500000 then
        begin
     
          This_Player.Flyto('H007',161,172);

           
           end;
           
           begin
            This_Player.DecGold(1500000);
           end;
           if This_Player.GoldNum >= 1500000 then
        begin
         ServerSay('土豪玩家：'+This_Player.Name+'直接使用150万金币前往幻境7层，祝她好运！',3);
    
        end else       
        begin
         This_Player.NotifyClientCommitItem(0,'如果你想去，就必须首先给我150万金币，赶快给我吧。'); 
        end;
end;



procedure _move1;
begin
   This_NPC.NpcDialog(This_Player,
   '移动到幻境一层需要金币。\'+ 
   '不能让你免费使用，你必须支付100000金币！\'+ 
   '你想花这笔钱吗？\ \'+  
   '|{cmd}<移动/@pay1>\'+ 
   '|{cmd}<退出/@talkwith>');
end;

procedure _pay1;
begin
   if This_Player.GoldNum >= 100000 then
        begin
     
           This_Player.Flyto('H001',73,79);

           
         end;
           
         begin
            This_Player.DecGold(100000);
         end ;
         if This_Player.GoldNum >= 100000 then
        begin
         ServerSay('玩家：'+This_Player.Name+'使用10万金币前往幻境！',3);
    
        end else   
        begin
         This_Player.NotifyClientCommitItem(0,'如果你想去，就必须首先给我150万金币，赶快给我吧。'); 
        end;
end;













var
tem : integer;
say : string;
Begin
   tem := random(6)+1;
   case tem of
     1 : say := '玛法大陆惊现神秘幻境，涌现大量怪物。年轻的勇士可以从我这里前往挑战幻境.打开传送门需要大量灵力，所以需要收取点金币.进入幻境一层需要10W金币，当然你有钱的话我可以送你去幻境7层.进入幻境7层需要300W金币，土豪专用！！！\' ;
     2 : say := '玛法大陆惊现神秘幻境，涌现大量怪物。年轻的勇士可以从我这里前往挑战幻境.打开传送门需要大量灵力，所以需要收取点金币.进入幻境一层需要10W金币，当然你有钱的话我可以送你去幻境7层.进入幻境7层需要300W金币，土豪专用！！！\';
     3 : say := '玛法大陆惊现神秘幻境，涌现大量怪物。年轻的勇士可以从我这里前往挑战幻境.打开传送门需要大量灵力，所以需要收取点金币.进入幻境一层需要10W金币，当然你有钱的话我可以送你去幻境7层.进入幻境7层需要300W金币，土豪专用！！！\';
     4 : say := '玛法大陆惊现神秘幻境，涌现大量怪物。年轻的勇士可以从我这里前往挑战幻境.打开传送门需要大量灵力，所以需要收取点金币.进入幻境一层需要10W金币，当然你有钱的话我可以送你去幻境7层.进入幻境7层需要300W金币，土豪专用！！！\';
     5 : say := '玛法大陆惊现神秘幻境，涌现大量怪物。年轻的勇士可以从我这里前往挑战幻境.打开传送门需要大量灵力，所以需要收取点金币.进入幻境一层需要10W金币，当然你有钱的话我可以送你去幻境7层.进入幻境7层需要300W金币，土豪专用！！！\';
     6 : say := '玛法大陆惊现神秘幻境，涌现大量怪物。年轻的勇士可以从我这里前往挑战幻境.打开传送门需要大量灵力，所以需要收取点金币.进入幻境一层需要10W金币，当然你有钱的话我可以送你去幻境7层.进入幻境7层需要300W金币，土豪专用！！！\';
   end;
   {$IFDEF Q136_hero}
   This_NPC.NpcDialog(This_Player,
   say+
   '|{cmd}<挑战幻境/@move>\'+

   '|{cmd}<退出/@exit>');
   {$ELSE}
   This_NPC.NpcDialog(This_Player,
   say+
   '|{cmd}<挑战幻境/@move>\'+

   '|{cmd}<退出/@exit>');
   {$ENDIF}
end.