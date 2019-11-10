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

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
  '没有一个人来光顾，顾客，请进！\我的自尊使我不允许对这个物品的价格再要求打折！\ \'
  +'|{cmd}<开始武器升级/@upgrade>\' 
  +'|{cmd}<返回武器升级/@getbackupgnow>\'
  +'|{cmd}<听更多的歌/@heardsing>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _upgrade;
begin
  This_Npc.NpcDialog(This_Player,
  '你像是想要升级你的武器？\给我看你的武器，升级价格是10000金币，\修炼这个武器需要原料<黑铁矿石/@Biron>，<饰品/@Etc>，<武器/@Weapon>\和<金币/@Gold>。你确定要它吗？\别的原料你可以使用你包内的物品，\你想委托你的武器进入修炼系统吗？\ \'
  +'|{cmd}<确认修炼/@confirmupgrade>\'
  +'|{cmd}<取消/@main>\'
  );
end;

procedure _Biron;
begin
  This_Npc.NpcDialog(This_Player,
  '你可以在矿山里采到黑铁矿石。\如果你想修炼过程得到一个好得结果，\你最好拿给我更高纯度的黑铁矿石。\顺便请记得，在修炼期间如果没有足够数\量的黑色铁矿，那怕你的矿石纯度再高\修练的结果也可能不好。\ \|{cmd}<返回/@upgrade>'
  );
end;

procedure _Etc;
begin
  This_Npc.NpcDialog(This_Player,
  '装饰品，项链，手镯\当你的特殊技能融入了这种装饰\物的时候，能够加强你的武器\如果你给我好原料我能给你好结果\如果你给我糟糕的装饰品\那可能会失败，除非你有很好的运气\ \|{cmd}<返回/@upgrade>'
  );
end;

procedure _Weapon;
begin
  This_Npc.NpcDialog(This_Player,
  '只能对武器进行炼制，没有试刀的武器无法炼制，\如果你想要升级武器，\请给我你携带的武器...\ \|{cmd}<返回/@upgrade>'
  );
end;

procedure _Gold;
begin
  This_Npc.NpcDialog(This_Player,
  '修练武器的金子太少...\你真的认为我的技术的价值就这么点数量的程度？\这个价格我不能做这个工作...\ \|{cmd}<返回/@upgrade>'
  );
end;

procedure _confirmupgrade;
begin
  This_Npc.NpcDialog(This_Player,
  '给我看你给我的原料\修炼你的'+This_Player.GetItemNameOnBody(1)+'，我的视力不好，\我想从你的包里取得更多的饰品和黑铁矿石。\如果你有重要的物品，在你寄存在仓库后请回来。\ \'
  +'|{cmd}<请求修炼/@upgradenow>\'
  +'|{cmd}<在安排好以后再回来/@doexit>\'
  );
end;

procedure _upgradenow;
var
URet : integer; 
begin
   URet := This_Npc.ClickUpWeaponNow(This_Player);
   if URet = 0 then
   begin
      This_Npc.NpcDialog(This_Player, 
      '材料不够。或是你刚升级的武器还没有试刀， \' +
      '您下次来的时候准备好所有的矿石，武器和饰品， \' +
      '当然，我的工作才是最基本的...\ \' +
      '|{cmd}<返回/@main>\');
   end else if URet = 1 then
   begin
      This_Npc.NpcDialog(This_Player, 
      '我们工作的规则是一个人只能进行一个项目，\' +
      '请下次再来 ...\ \' +
      '|{cmd}<返回/@main>');
   end else if URet = 2 then
   begin
      This_Npc.NpcDialog(This_Player, 
      '我会把它弄得像新的一样，所以请一个小时后再回来。\ \' +
      '|{cmd}<返回/@main>\');
   end; 
end;

procedure _getbackupgnow;
var
nret : integer;
begin
  nret := This_Npc.ClickGetBackUpWeapon(This_Player);
  if nret = 2 then                  //升级成功 
  begin
     This_Npc.NpcDialog(This_Player, 
     '就这样了，我尽我最大努力精炼了你的武器，' +
     '结果是否<成功/@Success>，\' +
     '只有在你使用过一次后才知道，出去试试吧。\ \' +
     '|{cmd}<退出/@doexit>\'); 
  end else if nret = -1 then       //包裹已满 
  begin
     This_Npc.NpcDialog(This_Player, 
     '你的包裹已满，请整理好之后再来吧。');
  end else if nret = 1 then        //升级时间未到 
  begin
     This_Npc.NpcDialog(This_Player, 
     '这个工作正忙着呢，请稍等片刻...\ \' +
     '|{cmd}<返回/@main>\');
  end else if nret = 0 then        //没有升级物品 
  begin
     This_Npc.NpcDialog(This_Player, 
     '以前你是不是寄存了很多东西？\' +
     '如果你找我是为了取回你很\' +
     '久前寄存在这里的物品，那你还是回去吧，\' +
     '我可记不起来了，这也过去太长时间了……\ \' +
     '|{cmd}<返回/@main>\');
  end;
end;

procedure _Success;
begin
  This_Npc.NpcDialog(This_Player,
  '通过使用它，你可以体会到它精炼的好处。\无论你的战斗对象是其他玩家还是怪物...\你都会发现这个成果...\ \|{cmd}<退出/@exit>\'
  );
end;

procedure _heardsing;
begin
  This_Npc.NpcDialog(This_Player,
  '如果你给我3万金子我会再考虑一下...\'
  +'|{cmd}<支付3万金币/@paythree>\'
  +'|{cmd}<退出/@main>\'
  );
end;

procedure _paythree;
begin
  This_Npc.NpcDialog(This_Player,
  '不知名的杂草...\ \|{cmd}<退出/@doexit>\'
  );
end;



//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(5);
  This_Npc.AddStdMode(6);
  This_Npc.SetRebate(100);
end;

//脚本执行的入口
begin
  domain;
end.