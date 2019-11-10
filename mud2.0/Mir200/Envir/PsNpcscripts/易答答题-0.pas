{ 
/************************************************************************}

program mir2;

{$I common.pas}

Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

procedure domain;
begin
  if This_Player.GetS(17,1) = 100 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你已经回答过我关于易答的问题了，你想再回答一次啊吗？\ \'
    +'|{cmd}<是的，还想回答一次/@xzchuti>       ^<还是算了吧/@doexit>\'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你好，我是盛大易答考官，您可在了解盛大易答的功能之后\'
    +'来回答我所提出的问题。全部答对，还能赢得奖励哦！\'
    +'你可以查看(http://eda.sdo.com/webchat/)查看什么是盛大易答。\ \'
    +'|{cmd}<好的，我要答题/@xianzaidt>           ^<我再了解下吧，下次再来/@doexit>\'
    );
  end;
end;

procedure _xianzaidt;
begin
  if This_Player.GetS(17,1) = 100 then
  exit;  
  else if This_Player.GetS(17,1) = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '盛大易答有什么用？\ \'
    +'1、<当我遇到游戏问题时，我可以使用易答平台进行提问，/@youshayong>\'
    +'|{cmd}<稍等片刻后，便有可爱的易答会员解答我的问题！/@youshayong>\ \'
    +'2、<盛大易答是媒体播放器/@wrong_01>\ \' 
    +'3、<盛大易答是用来斗地主的/@wrong_01>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '盛大易答是什么，你知道吗？呵呵，一看你就是个新手，\'
    +'这样吧，你打开右边的圈圈从中找到“盛大易答”图标后再来找我吧。\ \'
    +'1、<好的，我这就去点击“盛大易答”/@qudatixz>\ \'
    +'2、<我找不到图标/@cantfd>\'
    );
  end;
end;

procedure _cantfd;
begin
  This_Npc.NpcDialog(This_Player,
  '屏幕左下方写着“圈圈”字样的长方形按钮就是你所要找的图标。\'
  +'点击可以打开他，如果圈圈里没有盛大易答图标“盛大易答”，\'
  +'可以通过点击“+”，在面板中找到这个图标后添加即可。(如果\'
  +'你还是不了解，您可以登录到盛大易答的主页eda.sdo.com查看\'
  +'详细的介绍噢。)\ \'
  +'|{cmd}<谢谢你的提示，我这就去看下介绍/@doexit>\'
  );
end;

procedure _qudatixz;
begin
  if This_Player.GetS(17,1) = 100 then
  exit;  
  else if This_Player.GetS(17,1) = 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '看来你已经找到“盛大易答”了，接下来请接受我的提问吧！\ \'
    +'1、<那你快出题吧/@xzchuti>\ \'
    +'2、<我还是再去了解一下“盛大易答”/@doexit>\'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '看来你已经找到“盛大易答”了，接下来请接受我的提问吧！\ \'
    +'1、<那你快出题吧/@xzchuti>\ \'
    +'2、<我还是再去了解一下“盛大易答”/@doexit>\'
    );
    This_Player.SetS(17,1,1);
  end;
end;

procedure _xzchuti;
begin
  if This_Player.Level >= 10 then
  begin
    This_Npc.NpcDialog(This_Player,
    '盛大易答有什么用？\ \'
    +'1、<当我遇到游戏问题时，我可以使用易答平台进行提问，/@youshayong>\'
    +'|{cmd}<稍等片刻后，便有可爱的易答会员解答我的问题！/@youshayong>\ \'
    +'2、<盛大易答是媒体播放器/@wrong_01>\ \' 
    +'3、<盛大易答是用来斗地主的/@wrong_01>'
    );
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你的等级尚未达到10级以上，还是先去玛法大陆历练一下再来找我吧！\'
    +'在历练过程中，有任何疑问，都可以通过易答寻找解答。\' 
    );
  end; 
end;

procedure _youshayong;
begin
  This_Npc.NpcDialog(This_Player,
  '易答会员从何而来？\ \'
  +'1、<易答会员是盛大工作人员。/@wrong_02>\ \'
  +'2、<易答会员都是游戏中的玩家/@congnalai>'
  );
end;

procedure _congnalai;
begin
  This_Npc.NpcDialog(This_Player,
  '使用盛大易答需要注意什么？\ \'
  +'1、<我有任何问题都能向易答会员提问，包括我的个人信息，/@wrong_03>\'
  +'|{cmd}<比如帐号、密码、注册资料等。/@wrong_03>\ \'
  +'2、<易答会员全都是由游戏中的玩家申请，因此我们在提问的时候，/@caibutoul>\'
  +'|{cmd}<不能透露我的个人信息，比如帐号、密码、注册资料等。/@caibutoul>'
  );
end;

procedure _caibutoul;
begin
  if This_Player.Level >= 10 then
  begin
    if This_Player.getS(17,1) = 100 then
    begin
      This_Npc.NpcDialog(This_Player,
      '很不错，看来你已经基本了解了“盛大易答”。今后你在游戏里\'
      +'遇到任何问题，都不要忘了，有盛大易答可以帮到你，你可以\'
      +'向易答会员进行提问，祝你在传奇里玩得开心。\ \'
      +'|{cmd}<好的，谢谢！/@doexit>\'
      );
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '很不错，看来你已经基本了解了“盛大易答”。今后你在游戏里\'
      +'遇到任何问题，都不要忘了，有盛大易答可以帮到你，你可以\'
      +'向易答会员进行提问，祝你在传奇里玩得开心。\ \'
      +'|{cmd}<好的，谢谢！/@doexit>\'
      );
      This_Player.Give('经验',20000);
      This_Player.SetS(17,1,100);
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你的等级尚未达到10级以上，还是先去玛法大陆历练一下再来找我吧！\'
    +'在历练过程中，有任何疑问，都可以通过易答寻找解答。\' 
    );
  end;
end;

procedure _wrong_01;
begin
  This_Npc.NpcDialog(This_Player,
  '看来你答错了，再给你一次机会吧。\'
  +'盛大易答有什么用？\ \'
  +'1、<当我遇到游戏问题时，我可以使用易答平台进行提问，/@youshayong>\'
  +'|{cmd}<稍等片刻后，便有可爱的易答会员解答我的问题！/@youshayong>\ \'
  +'2、<盛大易答是媒体播放器/@wrong_01>\ \' 
  +'3、<盛大易答是用来斗地主的/@wrong_01>'
  );
end;

procedure _wrong_02;
begin
  This_Npc.NpcDialog(This_Player,
  '看来你答错了，再给你一次机会吧。\'
  +'易答会员从何而来？\ \'
  +'1、<易答会员是盛大工作人员。/@wrong_02>\ \'
  +'2、<易答会员都是游戏中的玩家/@congnalai>'
  );
end;

procedure _wrong_03;
begin
  This_Npc.NpcDialog(This_Player,
  '看来你答错了，再给你一次机会吧。\'
  +'使用盛大易答需要注意什么？\ \'
  +'1、<我有任何问题都能向易答会员提问，包括我的个人信息，/@wrong_03>\'
  +'|{cmd}<比如帐号、密码、注册资料等。/@wrong_03>\ \'
  +'2、<易答会员全都是由游戏中的玩家申请，因此我们在提问的时候，/@caibutoul>\'
  +'|{cmd}<不能透露我的个人信息，比如帐号、密码、注册资料等。/@caibutoul>'
  );
end;

begin
  domain;
end.
 