{
*******************************************************************}

PROGRAM Mir2;


{$I common.pas}



Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

//英雄圣水任务部分；
Procedure ExtraMis(EMItemName : string ; EMNum :integer);
begin
   if (This_Player.GetV(13,10)>=1) and (This_Player.GetV(13,10)<=13) and (This_Player.GetBagItemCount('玛法见证')>=1) then
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
      This_Player.SetV(13,10,EMNum);
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
   R6 := This_Player.GetV(13,10);
   This_Player.SetV(13,11,R6);
   This_Npc.CloseDialog(This_Player);
end;  



Procedure _nextnpc;
var
R9 : integer;
begin
   if This_Player.GetV(13,12) = 1 then
   begin
      R9 := random(2);
      if R9 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <沙巴克的屠夫>吧。\');
         This_Player.SetV(13,1,8);
      end else if R9 = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <苍月岛的天虹法师>吧。\');
         This_Player.SetV(13,1,9);
      end;
   end;
end;
   



Procedure _xiansuo;
var
R5 : integer;
begin
   if (This_Player.GetV(13,1) = 1) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      R5 := random(2);
      if R5 = 1 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <沙巴克的屠夫>吧。\');
         This_Player.SetV(13,1,8);
      end else if R5 = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
         '你再去找一下 <苍月岛的天虹法师>吧。\');
         This_Player.SetV(13,1,9);
      end;
   end;
end;


Procedure ExtraMis_jiang(EMItemName_02 : string ;EMItemNum : integer);
begin
   if (This_Player.GetV(13,11) = 9) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if This_Player.GoldNum >= 6666 then
      begin
         This_Player.DecGold(6666);
         This_Player.SetV(13,12,1);
         _xiansuo;
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你好像还没有完成我给你的事情，还是先做完了再来找我吧。\');
      end;
   end else if (This_Player.GetV(13,11) >= 1) and (This_Player.GetV(13,11) <= 8) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if This_Player.GetBagItemCount(EMItemName_02) >= EMItemNum then
      begin
         This_Player.Take(EMItemName_02,EMItemNum);
         This_Player.SetV(13,12,1);
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
  R7 := This_Player.GetV(13,11);
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
         This_Player.Flyto('11',223,274);
      end else if CheckOtherMapMon('T140~21') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,12,1);
         This_Player.SetV(13,13,13);
         This_Player.Flyto('11',223,274);
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
         This_Player.Flyto('11',223,274);
      end else if CheckOtherMapMon('T140~22') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,12,1);
         This_Player.SetV(13,13,13);
         This_Player.Flyto('11',223,274);
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
         This_Player.Flyto('11',223,274);
      end else if CheckOtherMapMon('T140~23') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,12,1);
         This_Player.SetV(13,13,13);
         This_Player.Flyto('11',223,274);
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
         This_Player.Flyto('11',223,274);
      end else if CheckOtherMapMon('T140~24') = 0 then
      begin
         This_Npc.NpcDialog(This_Player,
         '祝贺你成功通过考验！');
         This_Player.SetV(13,12,1);
         This_Player.SetV(13,13,13);
         This_Player.Flyto('11',223,274);
      end;
   end;
end;


Procedure _give13;
begin
   if This_Player.GetV(13,12) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 13) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if (CheckOtherMapHum('T140~21') = 0) and (compareText(This_Player.MapName, '11') = 0) then
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
   if This_Player.GetV(13,12) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 12) and (This_Player.GetBagItemCount('玛法见证')>=1) then
   begin
      if (This_Player.IsGroupOwner) or (This_Player.IsTeamMember) then
      begin
         This_Player.SetV(13,12,1);
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
   if This_Player.GetV(13,12) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 11) and (This_Player.GetBagItemCount('玛法见证')>=1) then
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
   if  (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 11) and (This_Player.GetBagItemCount('玛法见证')>=1) then
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
      This_Player.SetV(13,12,1);
      This_Player.SetV(13,13,11);
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
   if This_Player.GetV(13,12) = 1 then
   begin
      _xiansuo;
   end else if (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
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
   if  (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
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
         This_Player.SetV(13,12,1);
         This_Player.SetV(13,13,10);
      end;
   end;
end;


Procedure _cst;
var
R802 : Integer;
begin
   if  (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
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
         This_Player.SetV(13,12,1);
         This_Player.SetV(13,13,10);
      end;
   end;
end;


Procedure _cbp;
var
R803 : Integer;
begin
   if  (This_Player.GetV(13,1) = 1) and (This_Player.GetV(13,11) = 10) and (This_Player.GetBagItemCount('玛法见证')>=1) then
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
         This_Player.SetV(13,12,1);
         This_Player.SetV(13,13,10);
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
  if (This_Player.GetV(13,1) = 1) or (This_Player.GetV(13,1) = 8) or (This_Player.GetV(13,1) = 9) then
  begin 
    if This_Player.GetV(13,1) = 8 then
    begin
       This_Npc.NpcDialog(This_Player,
       '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
       '你再去找一下 <沙巴克的屠夫>啊！\');
    end else if This_Player.GetV(13,1) = 9 then
    begin
       This_Npc.NpcDialog(This_Player,
       '这是<玛法见证>啊！我知道怎么做！我现在就签字，\'+
       '你再去找一下 <苍月的天虹法师>啊！\ \');
    end else if This_Player.GetV(13,13) = 13 then
    begin
       This_Npc.NpcDialog(This_Player,
       '看来你果然有很强的实力，消灭了全部怪物，我就把下面的告诉你。\ \'+
       '|{cmd}<告诉我下一步/@nextnpc>\'+
       '|{cmd}<退出/@doexit>');
    end else if (This_Player.GetV(13,13) = 10) or (This_Player.GetV(13,13) = 11) then
    begin
       This_Npc.NpcDialog(This_Player,
       '没想到你竟然赢了我，好吧，我就把下面的告诉你。\ \'+
       '|{cmd}<告诉我下一步/@nextnpc>\'+
       '|{cmd}<退出/@doexit>');
    end else if This_Player.GetV(13,12) =1 then
    begin
       This_Npc.NpcDialog(This_Player,
       '你已经完成了我给你的任务，我把下面的告诉你吧。\ \'+
       '|{cmd}<好的/@nextnpc>\'+
       '|{cmd}<退出/@doexit>');
    end else if (This_Player.GetV(13,11) >= 1) then
    begin
       R4 := This_Player.GetV(13,11);
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
    end else if (This_Player.GetV(13,10) >= 1) then
    begin
       R3 := This_Player.GetV(13,10);
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
          '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
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
           R2 := Random(12)+1;
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
              This_Player.SetV(13,10,10);
           end else if R2 = 11 then
           begin
              This_Npc.NpcDialog(This_Player,
              '这是<玛法见证>吧，过一会我就帮你签。\'+
              '我有个小请求，能否陪我玩一会投骰子，掷到六才可以，\'+
              '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
              '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
              '|{cmd}<我很忙，先签名吧/@xiansuo>');
              This_Player.SetV(13,10,11);
           end else if R2 = 12 then
           begin
              This_Npc.NpcDialog(This_Player,
              '这是<玛法见证>吧，过一会我就帮你签。\'+
              '我有个小请求，我喜欢热闹，给我找些你的朋友来聊聊吧？\'+
              '（去组1支队伍再来，自己做队长）\'+
              '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
              '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
              '|{cmd}<我很忙，先签名吧/@xiansuo>');
              This_Player.SetV(13,10,12);
           end else if R2 = 13 then
           begin
              This_Npc.NpcDialog(This_Player,
              '需要你进入挑战，消灭全部怪物即可，限时20分钟，\'+
              '如果你实在太忙,也可以不帮我,我马上帮你签名。\ \'+ 
              '|{cmd}<好，先完成你的要求，等会再签名吧/@acception_02>\'+
              '|{cmd}<我很忙，先签名吧/@xiansuo>');
              This_Player.SetV(13,10,13);
           end;
        end else
        begin
           _xiansuo;
        end;
    end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '嗯，消息挺灵的嘛，这么快就找到我这！你想去挑战\'+
     '强大的怪物吗？不过为了你的安全我还是不能让你进去。\ \'+
     '|{cmd}<关闭/@doexit>');
  end;  
end;

Procedure _acception_02;
var
R60 : integer;
begin
   R60 := This_Player.GetV(13,10);
   This_Player.SetV(13,11,R60);
   This_Npc.CloseDialog(This_Player);
end;  



 
//原内容； 
Procedure _huwei;
begin
   This_Npc.NpcDialog(This_Player,
   '当年那位的后代现在成了这个样子，真让人伤心啊！\'+
   '听说他还有一个箭手兄弟流落在丛林深处，谁能帮助他们\'+
   '恢复本性呢？\ \'+
   '|{cmd}<确定/@doexit>');
end;

Procedure _superamo;
begin
   This_Npc.NpcDialog(This_Player,
   '古老神秘的苍月岛，在开天辟地初期那时诞生，在魔神\'+
   '战争的时候消失，现在苍月岛又再次出现，魔王的来临\'+
   '......唉，传说中6件圣物难到要重现世间？\'+
   '年轻人多加努力吧，随着苍月岛的出现会有更多不可思\'+
   '议的事情发生，玛法大陆的未来属于你们！\ \'+
   '|{cmd}<天尊!请让我与恶魔较量！/@join>\'+
   '|{cmd}<算了,我还是离开吧/@doexit>\');
end;

Procedure _join;
begin
   This_Npc.NpcDialog(This_Player,
   '你既然下定了决心，那就去寻找白日门的四层石塔，\'+
   '其中的一座是通往试练之地的通道，找到它，战胜里面的恶魔吧！\ \'+
   '|{cmd}<离开/@doexit>');
end;


Procedure _huishou;
begin
   This_Npc.NpcDialog(This_Player,
   '我要提醒你一句，这些物品都是相当重要的，\' +
   '你确认你不再需要包裹中的这些物品了吗？\' +
   '如果你确认的话，那我就把所有这些任务中的物品全部收回了。\ \'+
   '|{cmd}<我确认，我不再需要这些任务物品了/@geidaoju>\' +
   '|{cmd}<返回/@main>');
end;

Procedure _geidaoju;
var
a,b,c,d,e,f,g,h,i,j,k,l : integer;
begin
   a := This_Player.GetBagItemCount('黄金钥匙');
   b := This_Player.GetBagItemCount('白日门门主信物');
   c := This_Player.GetBagItemCount('龙人信物');
   d := This_Player.GetBagItemCount('白日门令牌');
   e := This_Player.GetBagItemCount('神医药具');
   f := This_Player.GetBagItemCount('五毒解药');
   g := This_Player.GetBagItemCount('酒');
   h := This_Player.GetBagItemCount('西瓜');
   i := This_Player.GetBagItemCount('小块西瓜');
   j := This_Player.GetBagItemCount('被下药的西瓜');
   k := This_Player.GetBagItemCount('白玉指环');
   l := This_Player.GetBagItemCount('凤凰羽衣');
   This_Player.Take('黄金钥匙',a);
   This_Player.Take('白日门门主信物',b);
   This_Player.Take('龙人信物',c);
   This_Player.Take('白日门令牌',d);
   This_Player.Take('神医药具',e);
   This_Player.Take('五毒解药',f);
   This_Player.Take('酒',g);
   This_Player.Take('西瓜',h);
   This_Player.Take('小块西瓜',i);
   This_Player.Take('被下药的西瓜',j);
   This_Player.Take('白玉指环',k);
   This_Player.Take('凤凰羽衣',l);
   This_Npc.NpcDialog(This_Player,
   '好吧，这些东西我就收下了！');
end;

//------------------------------------------------------------------------------
//成长任务模块
procedure _mission106_1;
begin
  if (This_Player.Level >= 27) and (This_Player.GetV(105,1) = 10) then
  begin
     This_Npc.NpcDialog(This_Player,
     '我厌倦战争，但是我却从不害怕战争。\'
     +'我们只有战斗，才能保护我们的亲人，保护我们的家园。\'
     +'为了那些牺牲的勇士们，我们更应该振作！\ \'
     +'|{cmd}<天尊……/@mission106_1_1>'
     ); 
   end
   else
   exit;
end;

procedure _mission106_1_1;
begin
  if (This_Player.Level >= 27) and (This_Player.GetV(105,1) = 10) then
  begin
     This_Npc.NpcDialog(This_Player,
     '现在最棘手的是因为雪山崩塌，阻断了我们和神龙帝国的联系。\'
     +'比奇国王虽然正在努力的招募兵勇，但是要训练出一只有战斗力的\'
     +'军队岂是一朝一暮之功。\'
     +'而我手下的门徒却在战争的消耗中死伤无数，\'
     +'还有能力与兽人一战的人日益减少。真是让人担忧啊！\ \'
     +'|{cmd}<神龙帝国？天尊，可以跟我讲讲么？/@mission106_1_2>'
     ); 
   end
   else
   exit;
end;

procedure _mission106_1_2;
begin
  if (This_Player.Level >= 27) and (This_Player.GetV(105,1) = 10) then
  begin
     This_Npc.NpcDialog(This_Player,
     '你的事迹我也有所耳闻。说起来也都是为了保卫家园这同一个目的。\'
     +'姑且就让你知道吧。神龙帝国是我们的母国，\'
     +'我是当年由神龙帝国派过来支援比奇的首领之一。\'
     +'说来惭愧，当年为了保证比奇的安全，我将我的门人兵分两路去\'
     +'沃玛森林引诱恐怖蜘蛛以对抗兽人。\'
     +'后来因为在丛林中迷失了方向，我带领的这只队伍就只能在此驻扎。\'
     +'|{cmd}<天尊您不用自责/@mission106_1_3>。多亏了您带领门人控制这片森林中的毒物，\'
     +'不然毒物们大量入侵比奇，定是会让战争雪上加霜。'
     ); 
   end
   else
   exit;
end;

procedure _mission106_1_3;
begin
  if (This_Player.Level >= 27) and (This_Player.GetV(105,1) = 10) then
  begin
     This_Npc.NpcDialog(This_Player,
     '近期我招募了一批门徒，但是他们磨砺太少，还不足以担当重任。\'
     +'勇士，还望你勤加研习技能， 你能帮助我训练他们。\ \'
     +'|{cmd}<可以么？/@mission106_1_4>\'
    ); 
  end
  else
   exit;
end;

procedure _mission106_1_4;
begin
  if (This_Player.Level >= 27) and (This_Player.GetV(105,1) = 10) then
  begin
     This_Npc.NpcDialog(This_Player,
     '去土城找盟重老兵吧！他会指导你的！\ \'
     +'|{cmd}<天尊，你保重，我会努力锻炼自己的/@mission106_1_5>。\'
     ); 
   end
   else
   exit;
end;

procedure _mission106_1_5;
begin
  if This_Player.GetV(106,1) = 1 then
  begin
    This_npc.CloseDialog(This_Player);
  end
  else if (This_Player.Level >= 27) and (This_Player.GetV(105,1) = 10) then
  begin
    This_Player.SetV(106,1,1);
    This_Player.Give('经验',200000);
    //#This_Player.DeleteTaskFromUIList(105);
    //#This_Player.AddTaskToUIList(106); 
    This_Player.UpdateTaskDetail(106,1);
    This_npc.CloseDialog(This_Player);
  end
  else
  exit;
end;  

//------------------------------------------------------------------------------
 

procedure _normal;
begin
  if (This_Player.GetV(13,1) = 1) or (This_Player.GetV(13,1) = 8) or (This_Player.GetV(13,1) = 9) then
   begin 
      This_Npc.NpcDialog(This_Player,
      '赤月恶魔的势力正在扩展，罪恶正在临近。\'+
      '年轻人，你已经处在危险的边缘，你愿意远征到赤月峡谷吗？\'+
      '我无法传授你任何武功，但我可以透露给你一个秘密：\'+
      '赤月恶魔的唯一弱点就是......\'+
      '听见了吗？好了，你去吧。\ \'+
      '|{cmd}<打听/@huwei>虎卫和鹰卫的消息'+addspace(' ',14)+'|{cmd}<打听苍月岛的真正来由/@superamo>\'+
      '|{cmd}<回收任务中多余的物品/@huishou>\'+
      '|{cmd}<出示玛法见证/@gonext>'+addspace(' ',22)+'|{cmd}<退出/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '赤月恶魔的势力正在扩展，罪恶正在临近。\'+
      '年轻人，你已经处在危险的边缘，你愿意远征到赤月峡谷吗？\'+
      '我无法传授你任何武功，但我可以透露给你一个秘密：\'+
      '赤月恶魔的唯一弱点就是......\'+
      '听见了吗？好了，你去吧。\ \'+
      '|{cmd}<打听/@huwei>虎卫和鹰卫的消息'+addspace(' ',14)+'|{cmd}<打听苍月岛的真正来由/@superamo>\'+
      //天尊处任务的部分因为还未划分好细节，所以还未完成； 
      '|{cmd}<回收任务中多余的物品/@huishou>\'+
      '|{cmd}<退出/@doexit>');
   end;
end;

Begin
   if This_Player.GetV(106,1) >= 1 then
   begin
      _normal; 
   end else if This_Player.GetV(105,1) = 10 then
   begin
      if This_Player.Level >= 27 then
      begin
         This_Npc.NpcDialog(This_Player,
         '这是白日门的信物，怎么会在你手上？莫非……\ \'
         +'|{cmd}<门徒他为了破坏兽人们的计划……哎……/@mission106_1>\ \'
         +'|{cmd}<我有别的事情找你/@normal>');
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '你的等级还没有达到27级，\这么重要的任务我是不会交给你去完成的……\ \'+
         '|{cmd}<我有别的事情找你/@normal>');
      end; 
   end else
   begin
     _normal;
   end;
end.
