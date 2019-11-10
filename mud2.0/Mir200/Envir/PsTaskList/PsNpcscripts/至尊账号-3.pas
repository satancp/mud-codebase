{
*******************************************************************}

program Mir2;

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _doexit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _about_zhizun;
begin
  This_Npc.NpcDialog(This_Player,
   '勇士们应当享受至尊的荣耀。\'
   +'只要你是"至尊账号"，当你等级达到规定级别后，\'
   +'便可在我这里领取奖励，相信将会大大提升你的能力。\'
   +'你是来领取奖励的吗？\'
   +'|{cmd}<如何成为至尊账号/@zhizun_1>              ^<领取至尊凭证/@ReqPodPrize>\'
   +'|{cmd}<递交至尊凭证成为至尊账号/@zhizun_2>      |<递交多余的至尊凭证/@zhizun_3>\'
   +'|{cmd}<查询至尊账号奖励/@zhizun_4>              ^<领取至尊账号奖励/@zhizun_5>\'     
   +'|{cmd}<关闭/@doexit>'
   ); 
end;

procedure _zhizun_1;
begin
  This_Npc.NpcDialog(This_Player,
   '你可以通过官网进行至尊账号激活，\成功激活后登入游戏即可在我这里领取一张至尊凭证，\'
   +'将凭证交给我，就可成为至尊账号。\ \'
   +'|{cmd}<返回/@about_zhizun>'
   ); 
end;

procedure _ReqPodPrize();
begin
  //领取活动奖励 
  This_Npc.ReqPopGift(This_Player);
end;

procedure _zhizun_2;
begin
  if This_Player.GetS(12,9) = 888 then
  begin
    This_Npc.NpcDialog(This_Player,
    '您已经成为至尊账号，不能再次申请。\ \'
    +'|{cmd}<返回/@about_zhizun>'
    ); 
  end
  else if This_Player.GetBagItemCount('至尊凭证') > 0 then
  begin
    This_Player.Take('至尊凭证',1);
    This_Player.SetS(12,9,888);
    This_Npc.NpcDialog(This_Player,
    '恭喜您，您已经成为至尊账号，现在就可以领取奖励了。\ \'
    +'|{cmd}<返回/@about_zhizun>'
    ); 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你已经带来了至尊凭证，就赶快交给我吧！\ \'
    +'|{cmd}<返回/@about_zhizun>'
    );
  end; 
end;

procedure _zhizun_3;
begin
  if This_Player.GetBagItemCount('至尊凭证') > 0 then
  begin
    This_Player.Take('至尊凭证',1);
    This_Npc.NpcDialog(This_Player,
    '你还要继续递交多余的至尊凭证吗？\ \'
    +'|{cmd}<继续递交/@zhizun_3>\ \'
    +'|{cmd}<返回/@about_zhizun>'
    ); 
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '如果你已经带来了多余的至尊凭证，就赶快交给我吧！\ \'
    +'|{cmd}<返回/@about_zhizun>'
    );
  end; 
end;

procedure _zhizun_4;
begin
  This_Npc.NpcDialog(This_Player,
   '当你等级达到35、40、45级时，均可在我这里领取一次奖励，\'
   +'对于高等级的至尊账号，也可领取小于当前等级的所有奖品。\ \'
   +'|{cmd}<查询35级至尊账号奖励/@zhizun_4_1>          ^<查询40级至尊账号奖励/@zhizun_4_2>\'
   +'|{cmd}<查询45级至尊账号奖励/@zhizun_4_3>\ \'      
   +'|{cmd}<返回/@about_zhizun>'
   ); 
end;

procedure _zhizun_4_1;
begin
  This_Npc.NpcDialog(This_Player,
   '35级至尊账号可以获得以下物品：\'
   +'组队卷轴随机1个、神秘天赐1个、双倍卷轴1个\ \' 
   +'|{cmd}<返回/@zhizun_4>'
   );
end;

procedure _zhizun_4_2;
begin
  This_Npc.NpcDialog(This_Player,
   '40级至尊账号可以获得以下物品：\'
   +'气血石(大)1个、圣战、天尊、法神系列首饰随机1件、\双倍宝典1个\ \' 
   +'|{cmd}<返回/@zhizun_4>'
   );
end;

procedure _zhizun_4_3;
begin
  This_Npc.NpcDialog(This_Player,
   '45级至尊账号可以获得以下物品：\'
   +'双倍秘籍1个、个性发型1个\ \' 
   +'|{cmd}<返回/@zhizun_4>'
   );
end;

procedure _zhizun_5;
begin
  This_Npc.NpcDialog(This_Player,
   '只要你是"至尊账号"，这里的奖品就有你一份！\'
   +'在领取奖品前，请确保有8个以上的包裹空间，否则不能正常领取 \'
   +'|{cmd}<领取奖励/@get_prize>\ \'
   +'|{cmd}<返回/@about_zhizun>'
   );
end;

procedure _get_prize;
var
  temp:integer;
begin  
  if This_Player.GetS(12,9) = 888 then
  begin
    if This_Player.GetS(12,10) = 300 then
    begin
      This_Npc.NpcDialog(This_Player,
      '你已经领取了至尊账号的所有奖励，不能再次领取！\ \'
      );
    end
    else if This_Player.FreeBagNum >= 8 then
    begin
      if This_Player.Level >= 45 then
      begin
        if This_Player.GetS(12,10) = 200 then
        begin
          This_Player.Give('双倍秘籍',1);
          This_Player.Give('个性发型',1);
          This_Player.SetS(12,10,300); 
          This_Npc.NpcDialog(This_Player,
          '至尊账号的奖励已经给你了，赶快打开包裹查看一下吧！\ \'
          ); 
        end
        else if This_Player.GetS(12,10) = 100 then
        begin
          This_Player.Give('双倍秘籍',1);
          This_Player.Give('个性发型',1);
          This_Player.Give('气血石(大)',1);
          This_Player.Give('双倍宝典',1);
          This_NPC.GiveConfigPrize(This_Player,42,'');
          This_Player.SetS(12,10,300); 
          This_Npc.NpcDialog(This_Player,
          '至尊账号的奖励已经给你了，赶快打开包裹查看一下吧！\ \'
          );
        end
        else if This_Player.GetS(12,10) < 100 then
        begin
          This_Player.Give('双倍秘籍',1);
          This_Player.Give('个性发型',1);
          This_Player.Give('气血石(大)',1);
          This_Player.Give('双倍宝典',1);
          This_NPC.GiveConfigPrize(This_Player,42,'');
          This_NPC.GiveConfigPrize(This_Player,43,'');
          This_Player.Give('神秘天赐',1);
          This_Player.Give('双倍卷轴',1);
          This_Player.SetS(12,10,300); 
          This_Npc.NpcDialog(This_Player,
          '至尊账号的奖励已经给你了，赶快打开包裹查看一下吧！\ \'
          );
        end;
      end
      else if This_Player.Level >= 40 then
      begin
        if This_Player.GetS(12,10) = 200 then
        begin
          This_Npc.NpcDialog(This_Player,
          '你还未达到领取下一次奖励的等级，不能领取下一等级的奖励！\ \'
          );
        end
        else if This_Player.GetS(12,10) = 100 then
        begin
          This_Player.Give('气血石(大)',1);
          This_Player.Give('双倍宝典',1);
          This_NPC.GiveConfigPrize(This_Player,42,'');
          This_Player.SetS(12,10,200); 
          This_Npc.NpcDialog(This_Player,
          '至尊账号的奖励已经给你了，赶快打开包裹查看一下吧！\ \'
          );
        end
        else if This_Player.GetS(12,10) < 100 then
        begin
          This_Player.Give('气血石(大)',1);
          This_Player.Give('双倍宝典',1);
          This_NPC.GiveConfigPrize(This_Player,42,'');
          This_NPC.GiveConfigPrize(This_Player,43,'');
          This_Player.Give('神秘天赐',1);
          This_Player.Give('双倍卷轴',1);
          This_Player.SetS(12,10,200); 
          This_Npc.NpcDialog(This_Player,
          '至尊账号的奖励已经给你了，赶快打开包裹查看一下吧！\ \'
          );
        end;
      end
      else if This_Player.Level >= 35 then
      begin
        if This_Player.GetS(12,10) = 100 then
        begin
          This_Npc.NpcDialog(This_Player,
          '你还未达到领取下一次奖励的等级，不能领取下一等级的奖励！\ \'
          );
        end
        else if This_Player.GetS(12,10) < 100 then
        begin
          This_NPC.GiveConfigPrize(This_Player,43,'');
          This_Player.Give('神秘天赐',1);
          This_Player.Give('双倍卷轴',1);
          This_Player.SetS(12,10,100); 
          This_Npc.NpcDialog(This_Player,
          '至尊账号的奖励已经给你了，赶快打开包裹查看一下吧！\ \'
          );
        end;
      end
      else
      begin
        This_Npc.NpcDialog(This_Player,
          '你还未达到领取至尊账号奖励的等级，不能领取奖励！\ \'
          );
      end;
    end
    else
    begin
      This_Npc.NpcDialog(This_Player,
      '请确保有8个以上的包裹空间，否则不能正常领取！\ \'
      );
    end;
  end
  else
  begin
    This_Npc.NpcDialog(This_Player,
    '你还不是至尊账号，不能领取奖励！\ \'
    );
  end;
end;

begin
  This_Npc.NpcDialog(This_Player,
   '年轻的勇士，' + This_Player.Name
   +'\欢迎来到玛法大陆，你将在这里重温曾经的激情、创造将来的辉煌\'
   +'你是来领取奖励的吗？\ \'
   +'|{cmd}<关于至尊账号/@about_zhizun>'
   );          
end. 