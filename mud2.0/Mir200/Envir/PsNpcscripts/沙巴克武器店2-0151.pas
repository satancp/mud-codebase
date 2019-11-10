{
/*******************************************************************************
}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Normal;
begin
  This_Npc.NpcDialog(This_Player,
  '感谢…… 您想要修理那种武器？\根据这个城堡的主人'+This_npc.GetCastleGuildName+'的命令， \我们特别对'+This_npc.GetCastleGuildName+'成员提供20%的折扣。\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙，你可太幸运了，我正好有材料做特殊修补\但费用是普通的3倍！'
  );
  This_Npc.Click_SRepair(This_Player);
end;

procedure SRepairDone;
begin
  This_Npc.NpcDialog(This_Player,
    '看上去它已经修好了...\请好好的使用它.\ \' +
    '|{cmd}<返回/@main>'
  );
end;



//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.SetRebate(100);
end;

procedure _SWUQi109_01;
begin
   This_Npc.NpcDialog(This_Player,
   '沙巴克？哦，我想想，这是很久以前的事情了。\'+
   '在对抗兽人时，一些志趣相投的前辈在此战略要地建立了\'+
   '这座城堡。任何占领这座城堡的行会都能得到巨额的利益！\'+
   '比如沙巴克任务，沙巴克收益等等。\ \'+
   '|{cmd}<怪不得我看见这里冲突不断。那么如何夺取沙巴克呢？/@SWUQi109_02>');
end;

procedure _SWUQi109_02;
begin
   This_Npc.NpcDialog(This_Player,
   '首先，申请攻打沙巴克必须钥匙行会会长。\'+
   '其次，行会会长要携带一个祖玛头像和一块金砖去比奇皇宫找\'+
   '比奇国王申请攻打沙巴克。申请成功后，\'+
   '战争将在第三天的20：00—23：00之间打响。如果当前有行会\'+
   '在攻打沙巴克是不能申请的，要等到战争结束才可以申请。\ \'+
   '|{cmd}<沙巴克意味着要杀死敌对行会才能取得胜利喽？/@SWUQi109_03>');
end;

Procedure _SWUQi109_03;
begin
   if This_Player.GetV(109,1) = 5 then
   begin
      This_Npc.NpcDialog(This_Player,
      '是的，攻打沙巴克的时候，在区域杀人是不计算PK值的！\'+
      '等你实力强大了，我期待有一天，沙巴克的城主就是你！\'+
      '去和这里的居民认识一下吧。这份是刚才你送来的货物的单据，\'+
      '把它交给沙巴克布店老板吧。\'+
      '（任务目标：把货物单据送到沙巴克布店老板）\ \'+ 
      '|{cmd}<好的，我这就去/@doexit>');
      This_Player.Give('经验',600000);
      This_Player.SetV(109,1,6);
      This_Player.UpdateTaskDetail(109,1);
   end;
end;

procedure _HeiTK109;
begin
   This_Npc.NpcDialog(This_Player,
   '经过多年的钻研，我终于掌握了武器升级的方法。\'+
   '黑铁矿石就是升级武器所必须的一种原料，在比奇或者毒蛇山谷的\'+
   '矿洞可以挖到。等你要升级武器的时候，可以在我这里查到\'+
   '升级武器所需的条件。不过，我年纪大了，难免出点问题，\'+
   '锻造失败的话，武器是会直接破损的。\ \'+
   '|{cmd}<等我有了材料，我会再来找你的/@HeiTK109_01>');
end;

procedure _HeiTK109_01;
begin
   if This_Player.GetV(109,1) = 7 then
   begin
      This_Npc.NpcDialog(This_Player,
      '刚才伙计通知我，盟重指挥官在找你。\'+
      '他好像在自然洞穴有什么发现。\'+
      '（任务目标：去盟重指挥官那里看看）\ \'+
      '|{cmd}<好的，我这就去/@doexit>');
      This_Player.Give('经验',600000);
      This_Player.SetV(109,1,8);                               //30-35级任务结束 
      This_Player.UpdateTaskDetail(109,1);
   end;
end;


//脚本执行的入口
var
  SwQ109 : integer;
begin
   SwQ109 := This_Player.GetV(109,1);
   if SwQ109 = 8 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你见到盟重指挥官了么？\ \'+
      '|{cmd}<我这就去/@doexit>\ \'+
      '|{cmd}<我有其他的事情找你/@Normal>');
   end else if SwQ109 = 7 then
   begin
      This_Npc.NpcDialog(This_Player,
      '哦，这个是珍贵的黑铁矿石啊！\'+
      '还真是多亏了沙巴克布店老板了。\ \'+
      '|{cmd}<黑铁矿石？有什么用的？/@HeiTK109>\ \'+
      '|{cmd}<我有其他的事情找你/@Normal>');
   end else if SwQ109 = 6 then
   begin
      This_Npc.NpcDialog(This_Player,
      '你已经把单据交给沙巴克布店老板了么？\ \'+
      '|{cmd}<我这就去/@doexit>\ \'+
      '|{cmd}<我有其他的事情找你/@Normal>');
   end else if SwQ109 = 5 then
   begin
      This_Npc.NpcDialog(This_Player,
      '我还以为盟重铁匠会完不成任务呢。\'+
      '可惜我这里是也忙的不可开交，帮不上他，只能干瞪眼。\'+
      '这次还要多谢你啊！\ \'+
      '|{cmd}<举手之劳而已。不过我能向你打听下沙巴克么？/@SWUQi109_01>\ \'+
      '|{cmd}<我有其他的事情找你/@Normal>');
   end else
      _Normal;
end.
