{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//玛法见证添加部分；

Procedure ExtraMis(EMItemName : string ; EMNum :integer);
begin
   if (This_Player.GetV(13,6)>=1) and (This_Player.GetV(13,6)<=13) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '这是<玛法见证>吧，过一会我就帮你签。\'+
      '我有个小请求，能麻烦你帮忙给我找'+'|{cmd}<'+EMItemName+'>'+'吗？\'+
      '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
      '|{cmd}<好，先完成你的要求，等会再签名吧/@acception>\'+
      '|{cmd}<我很忙，先签名吧/@xiansuo>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '这是<玛法见证>吧，过一会我就帮你签。\'+
      '我有个小请求，能麻烦你帮忙给我找'+'|{cmd}<'+EMItemName+'>'+'吗？\'+
      '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
      '|{cmd}<好，先完成你的要求，等会再签名吧/@acception>\'+
      '|{cmd}<我很忙，先签名吧/@xiansuo>');
      This_Player.SetV(13,6,EMNum);
   end;
end;

 
Procedure ExtraMis_02(EMItemName_02 : string);
begin
   This_Npc.NpcDialog(This_Player,
   '你有没有帮我找到'+'|{cmd}<'+EMItemName_02+'>'+'啊？\ \'+
   '|{cmd}<已经找到了，现在就给你/@give>\' +
   '|{cmd}<我还在找呢/@doexit>');
end;


Procedure _acception;
var
R6 : integer;
begin
   R6 := This_Player.GetV(13,6);
   This_Player.SetV(13,7,R6);
   This_Npc.CloseDialog(This_Player);
end;  


Procedure _nextnpc;
var
R9 : integer;
begin
   if This_Player.GetV(13,8) = 1 then
   begin
      R9 := random(2);
      if R9 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <沙巴克的屠夫>吧。\');
         This_Player.SetV(13,1,6);
      end else if R9 = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <苍月岛的天虹法师>吧。\');
         This_Player.SetV(13,1,7);
      end;
   end;
end;
   



Procedure _xiansuo;
var
R5 : integer;
begin
   if (This_Player.GetV(13,1) = 2) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      R5 := random(2);
      if R5 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <沙巴克的屠夫>吧。\');
         This_Player.SetV(13,1,6);
      end else if R5 = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <苍月岛的天虹法师>吧。\');
         This_Player.SetV(13,1,7);
      end;
   end;
end;


Procedure ExtraMis_jiang(EMItemName_02 : string ;EMItemNum : integer);
begin
   if (This_Player.GetV(13,7) = 9) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if This_Player.GoldNum >= 6666 then
      begin
         This_Player.DecGold(6666);
         This_Player.SetV(13,8,1);
         _xiansuo;
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你好像还没有完成我给你的事情，还是先做完了再来找我吧。\');
      end;
   end else if (This_Player.GetV(13,7) >= 1) and (This_Player.GetV(13,7) <= 8) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if This_Player.GetBagItemCount(EMItemName_02) >= EMItemNum then
      begin
         This_Player.Take(EMItemName_02,EMItemNum);
         This_Player.SetV(13,8,1);
         _xiansuo;
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你好像还没有完成我给你的事情，还是先做完了再来找我吧。\');
      end;
   end else
   begin 
      This_Npc.NpcDialog(This_Player,
      '你好像还没有完成我给你的事情，还是先做完了再来找我吧。\');
   end;
end;



procedure _give;
var
  R7 : integer;
begin
  R7 := This_Player.GetV(13,7);
  if (R7 >= 1) and (R7 <= 9) and (This_Player.GetBagItemCount('玛法见证')>=1) then
  begin
    case R7 of
       1:ExtraMis_jiang('金创药(小量)',9);
       2:ExtraMis_jiang('彩票',5);
       3:ExtraMis_jiang('鹤嘴锄',6);
       4:ExtraMis_jiang('食人树叶',4);
       5:ExtraMis_jiang('食人树的果实',2);
       6:ExtraMis_jiang('肉',7);
       7:ExtraMis_jiang('银矿',7);
       8:ExtraMis_jiang('金矿',1);
       9:ExtraMis_jiang('金币',6666);
    end;
  end;
end;


Procedure NextOfCall21;
begin
   if compareText(This_Player.MapName, 'T140~21') = 0 then 
   begin
      If CheckOtherMapMon('T140~21') > 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '很可惜，你没有挑战成功。');
         This_Player.Flyto('0',333,273);
      end else if CheckOtherMapMon('T140~21') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,8,1);
         This_Player.SetV(13,9,13);
         This_Player.Flyto('0',333,273);
      end;
   end;
end;

Procedure NextOfCall22;
begin
   if compareText(This_Player.MapName, 'T140~22') = 0 then 
   begin
      If CheckOtherMapMon('T140~22') > 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '很可惜，你没有挑战成功。');
         This_Player.Flyto('0',333,273);
      end else if CheckOtherMapMon('T140~22') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,8,1);
         This_Player.SetV(13,9,13);
         This_Player.Flyto('0',333,273);
      end;
   end;
end;

Procedure NextOfCall23;
begin
   if compareText(This_Player.MapName, 'T140~23') = 0 then 
   begin
      If CheckOtherMapMon('T140~23') > 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '很可惜，你没有挑战成功。');
         This_Player.Flyto('0',333,273);
      end else if CheckOtherMapMon('T140~23') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,8,1);
         This_Player.SetV(13,9,13);
         This_Player.Flyto('0',333,273);
      end;
   end;
end;

Procedure NextOfCall24;
begin
   if compareText(This_Player.MapName, 'T140~24') = 0 then 
   begin
      If CheckOtherMapMon('T140~24') > 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '很可惜，你没有挑战成功。');
         This_Player.Flyto('0',333,273);
      end else if CheckOtherMapMon('T140~24') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,8,1);
         This_Player.SetV(13,9,13);
         This_Player.Flyto('0',333,273);
      end;
   end;
end;


Procedure _give13;
begin
   if This_Player.GetV(13,8) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 13) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if (CheckOtherMapHum('T140~21') = 0) and (This_Player.MapName = '0') then
      begin
         This_Player.RandomFlyTo('T140~21');
         This_Player.CallOut(This_Npc,1200,'NextOfCall21');
      end else if CheckOtherMapHum('T140~22') =0 then
      begin
         This_Player.RandomFlyTo('T140~22');
         This_Player.CallOut(This_Npc,1200,'NextOfCall22'); 
      end else if CheckOtherMapHum('T140~23') = 0 then
      begin
         This_Player.RandomFlyTo('T140~23');
         This_Player.CallOut(This_Npc,1200,'NextOfCall23'); 
      end else if CheckOtherMapHum('T140~24') = 0 then
      begin
         This_Player.RandomFlyTo('T140~24');
         This_Player.CallOut(This_Npc,1200,'NextOfCall24'); 
      end else
      begin
      end;
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事情吗？');
   end;
end;


Procedure _give12;
begin
   if This_Player.GetV(13,8) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 12) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if (This_Player.IsGroupOwner) or (This_Player.IsTeamMember) then
      begin
         This_Player.SetV(13,8,1);
         _xiansuo;
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你好像还没有完成我给你的事情，还是先做完了再来找我吧。');
      end; 
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你找我有什么事情吗？');
   end;
end;



Procedure _give11;
begin
   if This_Player.GetV(13,8) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 11) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '嗯，那我们<开始/@touzi>投骰子吧！');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你好像还没有完成我给你的事情，还是先做完了再来找我吧。');
   end;
end;

Procedure _touzi;
begin
   if  (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 11) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      This_Player.SetV(0,1,(Random(6)+1));
      This_Npc.PlayDice(This_Player,1,'@AfterCube'); 
   end;
end;


Procedure _AfterCube;
begin
   if This_Player.GetV(0,1) = 6 then
   begin
      This_Npc.NpcDialog(This_Player,
      '骰子的点数是<6/c=red> ，看来你运气不错啊！\'+
      '我把下一个地点告诉你吧！\ \'+
      '|{cmd}<好的/@nextnpc>');
      This_Player.SetV(13,8,1);
      This_Player.SetV(13,9,11);
   end else if (This_Player.GetV(0,1) >= 1) and (This_Player.GetV(0,1) < 6) then
   begin
      This_Npc.NpcDialog(This_Player,
      '很可惜，骰子的点数不为6，继续投骰子吧。\ \'+
      '|{cmd}<继续来/@touzi>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你好像还没有投骰子吧？');
   end;
end;

Procedure _give10;
begin
   if This_Player.GetV(13,8) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      This_Npc.NpcDialog(This_Player,
      '好，有勇气，来吧，看看谁的运气更好\'+ 
      '不过事先说明了，打平也是你输哦，\ \'+
      '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '你好像还没有完成我给你的事情，还是先做完了再来找我吧。');
   end;
end;

Procedure _cjd;
var
R801 : Integer;
begin
   if  (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      R801 := Random(3);
      if R801 = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出剪刀……我也是剪刀……打平，还是你输，呵呵！\'+
         '我们继续来猜拳，看看谁的运气更好！\ \'+
         '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\');
      end else if R801 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出剪刀……我出石头……哈哈，你输了！\'+
         '我们继续来猜拳，看看谁的运气更好！\ \'+
         '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\');
      end else if R801 = 2 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出剪刀……我出布……哎呀，我输了！\'+
         '我把下一个地点告诉你吧。\ \'+
         '|{cmd}<好的/@nextnpc>');
         This_Player.SetV(13,8,1);
         This_Player.SetV(13,9,10);
      end;
   end;
end;


Procedure _cst;
var
R802 : Integer;
begin
   if  (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      R802 := Random(3);
      if R802 = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出石头……我也出石头……打平，还是你输，呵呵！\'+
         '我们继续来猜拳，看看谁的运气更好！\ \'+
         '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\');
      end else if R802 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出石头……我出布……哈哈，你输了！\'+
         '我们继续来猜拳，看看谁的运气更好！\ \'+
         '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\');
      end else if R802 = 2 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出石头……我出剪刀……哎呀，我输了！\'+
         '我把下一个地点告诉你吧。\ \'+
         '|{cmd}<好的/@nextnpc>');
         This_Player.SetV(13,8,1);
         This_Player.SetV(13,9,10);
      end;
   end;
end;


Procedure _cbp;
var
R803 : Integer;
begin
   if  (This_Player.GetV(13,1) = 2) and (This_Player.GetV(13,7) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      R803 := Random(3);
      if R803 = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出布……我也出布……打平,还是你输，呵呵！\'+
         '我们继续来猜拳，看看谁的运气更好！\ \'+
         '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\');
      end else if R803 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出布……我出剪刀……哈哈，你输了！\'+
         '我们继续来猜拳，看看谁的运气更好！\ \'+
         '|{cmd}<出剪刀/@cjd>       ^<出石头/@cst>       ^<出布/@cbp>\');
      end else if R803 = 2 then
      begin
         This_Npc.NpcDialog(This_Player,
         '你出布……我出石头……哎呀，我输了！\'+
         '我把下一个地点告诉你吧。\ \'+
         '|{cmd}<好的/@nextnpc>');
         This_Player.SetV(13,8,1);
         This_Player.SetV(13,9,10);
      end;
   end;
end;



Procedure _gonext;
var
R1 : integer; 
R2 : integer;
R3 : Integer;
R4 : integer;
begin
  if (This_Player.GetV(13,1) = 2) or (This_Player.GetV(13,1) = 6) or (This_Player.GetV(13,1) = 7) then
  begin 
    if This_Player.GetV(13,1) = 6 then
    begin
       This_Npc.NpcDialog(This_Player,
       '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
       '你再去找一下 <沙巴克的屠夫>啊！\');
    end else if This_Player.GetV(13,1) = 7 then
    begin
       This_Npc.NpcDialog(This_Player,
       '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
       '你再去找一下 <苍月的天虹法师>啊！\ \');
    end else if This_Player.GetV(13,9) = 13 then
    begin
       This_Npc.NpcDialog(This_Player,
       '看来你果然有很强的实力，消灭了全部怪物，我就把下面的告诉你。\ \'+
       '|{cmd}<告诉我下一步/@nextnpc>\'+
       '|{cmd}<退出/@doexit>');
    end else if (This_Player.GetV(13,9) = 10) or (This_Player.GetV(13,9) = 11) then
    begin
       This_Npc.NpcDialog(This_Player,
       '没想到你竟然赢了我，好吧，我就把下面的告诉你。\ \'+
       '|{cmd}<告诉我下一步/@nextnpc>\'+
       '|{cmd}<退出/@doexit>');
    end else if This_Player.GetV(13,8) =1 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经完成了我给你的任务，我把下面的告诉你吧。\ \'+
       '|{cmd}<好的/@nextnpc>\'+
       '|{cmd}<退出/@doexit>');
    end else if (This_Player.GetV(13,7) >= 1) then
    begin
       R4 := This_Player.GetV(13,7);
       if (R4 >= 1) and (R4 <= 9) then
       begin
          case R4 of
             1:ExtraMis_02('9瓶金创药(小量)');
             2:ExtraMis_02('5张彩票');
             3:ExtraMis_02('6把鹤嘴锄');
             4:ExtraMis_02('4个食人树叶');
             5:ExtraMis_02('2个食人树的果实');
             6:ExtraMis_02('7块肉');
             7:ExtraMis_02('7块银矿');
             8:ExtraMis_02('1块金矿');
             9:ExtraMis_02('6666金币');
          end;
       end else if R4 = 10 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你愿不愿意和我猜拳呢？\ \'+
          '|{cmd}<好的/@give10>\'+
          '|{cmd}<让我再想想/@doexit>');
       end else if R4 = 11 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你愿不愿意和我投骰子，投到六就算你赢？\ \'+
          '|{cmd}<好的/@give11>\'+
          '|{cmd}<让我再想想/@doexit>');
       end else if R4 = 12 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你是不是已经找到志同道合的队友了？\ \'+
          '|{cmd}<已经找到了/@give12>\'+
          '|{cmd}<我还在找呢/@doexit>');
       end else if R4 = 13 then
       begin
          This_Npc.NpcDialog(This_Player,
          '你是否愿意接受挑战，前往消灭怪物？\ \'+
          '|{cmd}<好的/@give13>\'+
          '|{cmd}<让我再想想/@doexit>');
       end;
    end else if (This_Player.GetV(13,6) >= 1) then
    begin
       R3 := This_Player.GetV(13,6);
       if (R3 >= 1) and (R3 <= 9) then
       begin
          case R3 of
             1:ExtraMis('9瓶金创药(小量)',R3);
             2:ExtraMis('5张彩票',R3);
             3:ExtraMis('6把鹤嘴锄',R3);
             4:ExtraMis('4个食人树叶',R3);
             5:ExtraMis('2个食人树的果实',R3);
             6:ExtraMis('7块肉',R3);
             7:ExtraMis('7块银矿',R3);
             8:ExtraMis('1块金矿',R3);
             9:ExtraMis('6666金币',R3);
          end;
       end else if R3 = 10 then
       begin
          This_Npc.NpcDialog(This_Player,
          '这是<玛法见证>吧，过一会我就帮你签。有个小请求，\'+
          '能否陪我玩一会，和我猜拳，只要赢了我就可以，\'+
          '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
          '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
          '|{cmd}<我很忙，先签名吧/@xiansuo>');
       end else if R3 = 11 then
       begin
          This_Npc.NpcDialog(This_Player,
          '这是<玛法见证>吧，过一会我就帮你签。\'+
          '我有个小请求，能否陪我玩一会投骰子，掷到六才可以，\'+
          '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
          '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
          '|{cmd}<我很忙，先签名吧/@xiansuo>');
       end else if R3 = 12 then
       begin
          This_Npc.NpcDialog(This_Player,
          '这是<玛法见证>吧，过一会我就帮你签。\'+
          '我有个小请求，我喜欢热闹，给我找些你的朋友来聊聊吧？\'+
          '（去组1支队伍再来，自己做队长）\'+
          '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
          '|{cmd}<好，先完成你的要求，等会再签名吧/@acception>_02\'+
          '|{cmd}<我很忙，先签名吧/@xiansuo>');
       end else if R3 = 13 then
       begin
          This_Npc.NpcDialog(This_Player,
          '需要你进入挑战，消灭全部怪物即可，限时20分钟，\'+
          '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
          '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
         '|{cmd}<我很忙，先签名吧/@xiansuo>');
       end;
    end else
    begin
        R1 := Random(100);
        if R1 < 20 then
        begin
           R2 := Random(12) + 1;
           if (R2 >= 1) and (R2 <= 9) then
           begin
              case R3 of
                 1:ExtraMis('9瓶金创药(小量)',R2);
                 2:ExtraMis('5张彩票',R2);
                 3:ExtraMis('6把鹤嘴锄',R2);
                 4:ExtraMis('4个食人树叶',R2);
                 5:ExtraMis('2个食人树的果实',R2);
                 6:ExtraMis('7块肉',R2);
                 7:ExtraMis('7块银矿',R2);
                 8:ExtraMis('1块金矿',R2);
                 9:ExtraMis('6666金币',R2);
              end;
           end else if R2 = 10 then
           begin
              This_Npc.NpcDialog(This_Player,
              '这是<玛法见证>吧，过一会我就帮你签。有个小请求，\'+
              '能否陪我玩一会，和我猜拳，只要赢了我就可以，\'+
              '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
              '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
              '|{cmd}<我很忙，先签名吧/@xiansuo>');
              This_Player.SetV(13,6,10);
           end else if R2 = 11 then
           begin
              This_Npc.NpcDialog(This_Player,
              '这是<玛法见证>吧，过一会我就帮你签。\'+
              '我有个小请求，能否陪我玩一会投骰子，掷到六才可以，\'+
              '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
              '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
              '|{cmd}<我很忙，先签名吧/@xiansuo>');
              This_Player.SetV(13,6,11);
           end else if R2 = 12 then
           begin
              This_Npc.NpcDialog(This_Player,
              '这是<玛法见证>吧，过一会我就帮你签。\'+
              '我有个小请求，我喜欢热闹，给我找些你的朋友来聊聊吧？\'+
              '（去组1支队伍再来，自己做队长）\'+
              '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
              '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
              '|{cmd}<我很忙，先签名吧/@xiansuo>');
              This_Player.SetV(13,6,12);
           end else if R2 = 13 then
           begin
              This_Npc.NpcDialog(This_Player,
              '需要你进入挑战，消灭全部怪物即可，限时20分钟，\'+
              '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
              '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
              '|{cmd}<我很忙，先签名吧/@xiansuo>');
              This_Player.SetV(13,6,13);
           end;
        end else
        begin
           _xiansuo;
        end;
    end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你找我有什么事情吗？');
  end;  
end;
 
Procedure _acception_02;
var
R60 : integer;
begin
   R60 := This_Player.GetV(13,6);
   This_Player.SetV(13,7,R60);
   _gonext;
end;  











//以下边界药店原有功能； 
procedure _questionprize;
begin
  This_Npc.NpcDialog(This_Player,
  '我们只经营 <地牢逃脱卷/@teleport>，\但我们听说有 <随机传送卷/@teleport2>，\|{cmd}<回城卷/@steleport>和<修复油/@repairoil>之类的东西。\他们可以从妖怪那里弄到或从其他地方买到。\ \ |{cmd}<返回/@main>'
  );
end;

procedure _teleport;
begin
  This_Npc.NpcDialog(This_Player,
  '地牢逃脱卷是一种可以\把你传到你最后去过的城镇附近的卷轴。\它的能力可能比回城卷要弱一些，\但总归能从危险中救你的命。\ \ |{cmd}<返回/@questionprize>'
  );
end;

procedure _teleport2;
begin
  This_Npc.NpcDialog(This_Player,
  '随机传送卷是一种可以\把你传到当前地图随机位置的卷轴。\这很危险，但如果你还剩有很多药，并且想继续在远方狩猎，\这时候可是非常有用的。\ \ |{cmd}<返回/@questionprize>'
  );
end;

procedure _steleport;
begin
  This_Npc.NpcDialog(This_Player,
  '回城卷据说来自远古\的一种神奇法术。但不幸的是，现在已经丢失了。\但我们听说有些怪物还有这种卷轴，\如果使用它你可以立刻返回村庄。\ \ |{cmd}<返回/@questionprize>'
  ); 
end;

procedure _repairoil;
begin
  This_Npc.NpcDialog(This_Player,
  '修复油可以恢复手中兵器的耐久力。\这并不是特殊修复，所以如果你用的话\不要忘了武器的耐久力会渐渐的减少。\如果武器不是太贵的话，\在长时间狩猎的时候带一瓶还是有用的。\或者干脆带上两瓶。\ \ |{cmd}<返回/@questionprize>'
  );
end;

//==============================================================新手任务 

procedure dorenwu8;
begin
 This_Npc.NpcDialog(This_Player,
  '受伤？那我一会就去看看。谢谢你来告诉我，\'+
  '哦，对了，新手引导员刚才在这边晃悠，不知道是不是在找你。\ \'+
  '|{cmd}<好的 我这就去/@renwu9>'
  );
end;

procedure _renwu9;
begin
if (This_Player.GetV(102,1)=5) then
 begin
 This_Npc.NpcDialog(This_Player,
 '对了，新手引导员刚才在这边晃悠，不知道是不是在找你。\ \ \'+
 '|{cmd}<我这就去问问(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(102,1,5);        //任务标记
  This_Player.UpdateTaskDetail(102,1);
  This_Player.Give('经验',800);
  This_Npc.CloseDialog(This_Player);
  //This_player.AutoGotoMap('0',332,270);//自动寻路新手引到员 
 end;  
end; 

procedure dorenwu9;
begin
 if (This_Player.GetV(102,1)=5) then
 begin
 dorenwu9;
 end
 else if (This_Player.GetV(102,1)=4) then
 begin
 dorenwu8;
 end
 else
 begin
 if (This_Player.GetV(102,1)=5) then
  begin
  This_Npc.NpcDialog(This_Player,
  '对了，新手引导员刚才在这边晃悠，不知道是不是在找你。\ \ \'+
  '|{cmd}<我这就去问问(任务)/@doexit>\'
  );
  end;
 end; 
end; 
//==============================================================新手任务
  
procedure _YXDoMainExtra;
var
  YXRW102 : integer; 
begin
   YXRW102 := This_Player.GetV(102,1);
   if YXRW102 = 5 then
   begin
      dorenwu9;
   end
   else if YXRW102 = 4 then
   begin
      dorenwu8;
   end; 
end;

procedure _hecheng;
begin
  This_Npc.NpcDialog(This_Player,
  '我还没有完全参透其中的秘密，可以合成的物品还很有限，\你就告诉我你想合成什么药品吧。\ \'
  +'|{cmd}<九花玉露/@yulu>'+ addSpace('', 16) + '|{cmd}<九花雪露/@xuelu>\'
  +'|{cmd}<元神丹/@qidan>'+ addSpace('', 16) + '|{cmd}<回气膏/@qigao>\'
  +'|{cmd}<查看合成配方/@lookfor>\'
  +'|{cmd}<关闭/@doexit>'
  );
end;

procedure _yulu;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花玉露需要紫背天葵、铁树果、阴阳仙草各1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@yulu1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _yulu1;
begin
  if This_Player.GetBagItemCount('紫背天葵') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('铁树果') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('阴阳仙草') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('紫背天葵',1);
    This_Player.Take('铁树果',1);
    This_Player.Take('阴阳仙草',1);
    This_Player.Give('九花玉露',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，九花玉露已经合成好了！'
     ); 
  end;
end;

procedure _xuelu;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花玉露需要黄色马枝花，罗布麻叶，\地苦胆, 四叶参这四种草药各1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@xuelu1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _xuelu1;
begin
  if This_Player.GetBagItemCount('黄色马枝花') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('罗布麻叶') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('地苦胆') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('四叶参') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('黄色马枝花',1);
    This_Player.Take('罗布麻叶',1);
    This_Player.Take('地苦胆',1);
    This_Player.Take('四叶参',1);
    This_Player.Give('九花雪露',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，九花雪露已经合成好了！'
     ); 
  end;
end;

procedure _qidan;
begin
  This_Npc.NpcDialog(This_Player,
  '合成元神丹需要毒蜘蛛牙齿、蛆卵、蝎子的尾巴各4个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@qidan1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _qidan1;
begin
  if This_Player.GetBagItemCount('毒蜘蛛牙齿') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('蛆卵') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('蝎子的尾巴') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('毒蜘蛛牙齿',4);
    This_Player.Take('蛆卵',4);
    This_Player.Take('蝎子的尾巴',4);
    This_Player.Give('元神丹',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，元神丹已经合成好了！'
     ); 
  end;
end;

procedure _qigao;
begin
  This_Npc.NpcDialog(This_Player,
  '合成回气膏需要需要鸡肉、肉、食人树叶各4个，\同时还需要食人树的果实1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<开始合成/@qigao1>\ \'
  +'|{cmd}<返回/@hecheng>'+ addSpace('', 16) + '|{cmd}<退出/@doexit>'
  );
end;

procedure _qigao1;
begin
  if This_Player.GetBagItemCount('鸡肉') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('肉') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('食人树叶') < 4 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else if This_Player.GetBagItemCount('食人树的果实') = 0 then
  begin
    This_Npc.NpcDialog(This_Player,
     '很可惜，你没有足够合成需要的材料。\ \|{cmd}<退出/@doexit>'
     );
  end
  else
  begin
    This_Player.Take('鸡肉',4);
    This_Player.Take('肉',4);
    This_Player.Take('食人树叶',4);
    This_Player.Take('食人树的果实',1);
    This_Player.Give('回气膏',1);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，回气膏已经合成好了！'
     ); 
  end;
end;

procedure _lookfor;
begin
  This_Npc.NpcDialog(This_Player,
  '合击威力强大，但使用它必须先要拥有“火龙之心”\我知道你听说过“火龙之心”，但我断定你知其一不知其二\“火龙之心”是用来积蓄怒气的，蓄满方能使用合击\在“火龙之心”中放入火龙神品，怒气会大量增加\神品其实有很多种，不同的配方能合成出不同的火龙神品\我会制作很多种“火龙之心”，现在来看看你想要哪种吧。\'
  +'|{cmd}<九花玉露/@yulu2>'+ addSpace('', 16) + '|{cmd}<九花雪露/@xuelu2>\'
  +'|{cmd}<元神丹/@qidan2>'+ addSpace('', 18) + '|{cmd}<回气膏/@qigao2>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _yulu2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花玉露需要紫背天葵、铁树果、阴阳仙草各1个\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _xuelu2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成九花雪露需要黄色马枝花，罗布麻叶，\地苦胆, 四叶参这四种草药各1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _qidan2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成元神丹需要毒蜘蛛牙齿、蛆卵、蝎子的尾巴各4个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _qigao2;
begin
  This_Npc.NpcDialog(This_Player,
  '合成回气膏需要需要鸡肉、肉、食人树叶各4个，\同时还需要食人树的果实1个，\如果您已经有了这些物品，我就可以帮您进行合成。\ \'
  +'|{cmd}<返回/@main>'+ addSpace('', 16) +'|{cmd}<退出/@doexit>'
  );
end;

procedure _huolong;
begin
  This_Npc.NpcDialog(This_Player,
  '“火龙之心”是用来积蓄怒气的，蓄满方能使用合击，\在“火龙之心”中放入火龙神品，怒气会大量增加，\很多物品都可以增加怒气值，白日门技能书可大量增加怒气，\鸡肉、食人树叶、地苦胆、书页等都可不同程度增加怒气，\九花雪露、九花玉露、元神丹、回气膏、补气丹这些神品，\可以从多至少不同数量增加怒气值。\'
  +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 16) +'|{cmd}<查看合成火龙神品配方/@lookfor>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _talk;
begin
  This_Npc.NpcDialog(This_Player,
  '这些药水可以增加你的攻击，速度，生命值等等，\据说还有人能用它们换取一把魔剑！\这么好的东西当然不是轻易就可以得到的，\不过赤月峡谷好像经常会出现。\\ <返回/@main>'
  );
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '需要什么东西吗？\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '请给我要卖的东西，我会给好价钱的。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(0);
  This_Npc.AddStdMode(3);
  This_Npc.AddStdMode(42);
  This_Npc.FillGoods('金创药(小量)',200,1);
  This_Npc.FillGoods('魔法药(小量)',200,1);
  This_Npc.FillGoods('金创药(小)包',100,1); 
  This_Npc.FillGoods('魔法药(小)包',100,1);
  This_Npc.FillGoods('地牢逃脱卷',1000,1);
  This_Npc.FillGoods('地牢逃脱卷包',100,1);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
var
  YXRW102 : integer; 
begin
  YXRW102 := This_Player.GetV(102,1);
  {$IFDEF Q136_hero}
  if (YXRW102 = 5) or (YXRW102 = 4) then
  begin
    if (This_Player.GetV(13,1) = 2) or (This_Player.GetV(13,1) = 6) or (This_Player.GetV(13,1) = 7) then
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize> '+ addSpace('', 11) 
      //+ '|{cmd}<成长任务：如何成为玛法勇士/@YXDoMainExtra>\'
      +'|{cmd}<退出/@doexit>');
    end else
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize>               \'//^<成长任务：如何成为玛法勇士/@YXDoMainExtra>\'
      +'|{cmd}<退出/@doexit>');
    end;
  end else
  begin
    if (This_Player.GetV(13,1) = 2) or (This_Player.GetV(13,1) = 6) or (This_Player.GetV(13,1) = 7) then
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize> \'
      +'|{cmd}<退出/@doexit>');
    end else
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize> \'
      +'|{cmd}<退出/@doexit>');
    end;
  end;
  {$ELSE}
  if (YXRW102 = 5) or (YXRW102 = 4) then
  begin
    if (This_Player.GetV(13,1) = 2) or (This_Player.GetV(13,1) = 6) or (This_Player.GetV(13,1) = 7) then
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 16) + '|{cmd}<查看合成火龙神品配方/@lookfor>\'
      +'|{cmd}<打听“火龙之心”的秘密/@huolong>       ^<出示玛法见证/@gonext>\'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize> '+ addSpace('', 11) 
      //+ '|{cmd}<成长任务：如何成为玛法勇士/@YXDoMainExtra>\'
      +'|{cmd}<退出/@doexit>');
    end else
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 18) + '|{cmd}<查看合成火龙神品配方/@lookfor>\'
      +'|{cmd}<打听“火龙之心”的秘密/@huolong>\'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize>               \'//^<成长任务：如何成为玛法勇士/@YXDoMainExtra>\'
      +'|{cmd}<退出/@doexit>');
    end;
  end else
  begin
    if (This_Player.GetV(13,1) = 2) or (This_Player.GetV(13,1) = 6) or (This_Player.GetV(13,1) = 7) then
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 16) + '|{cmd}<查看合成火龙神品配方/@lookfor>\'
      +'|{cmd}<打听“火龙之心”的秘密/@huolong>       ^<出示玛法见证/@gonext>\'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize> \'
      +'|{cmd}<退出/@doexit>');
    end else
    begin
      This_Npc.NpcDialog(This_Player,
      '感谢，我能为你做点什么？\ \'
      +'|{cmd}<合成火龙神品/@hecheng>'+ addSpace('', 18) + '|{cmd}<查看合成火龙神品配方/@lookfor>\'
      +'|{cmd}<打听“火龙之心”的秘密/@huolong>\'
      +'|{cmd}<买药/@buy>\'
      +'|{cmd}<卖药/@sell>\'
      +'|{cmd}<询问物品详细情况/@questionprize> \'
      +'|{cmd}<退出/@doexit>');
    end;
  end;
  {$ENDIF}
end.