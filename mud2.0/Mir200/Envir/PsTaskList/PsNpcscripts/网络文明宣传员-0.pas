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
  This_Player.Name
  + ',我知道你是个好玩家啦!\再看看文明公约也没坏处,对吗?\别忘了把公约内容告诉你朋友啊!\有人说告诉一百个人的话,\你的名字会自动变成金黄色,还会闪烁呢!\不过我不太相信,因为我都告诉几十万人了...\\'
  +'|{cmd}<查看/@gongyue>《传奇用户文明自律公约》\'
  +'|{cmd}<关闭/@doexit>'
  );
end;

procedure _gongyue;
begin
  This_Npc.NpcDialog(This_Player,
  '首先提醒您,\游戏只为休闲娱乐，请勿沉溺其中。\适当的休息比升级更重要：）\|{cmd}<下一页/@gongyue1>'
  );
end;

procedure _gongyue1;
begin
  This_Npc.NpcDialog(This_Player,
  '《传奇用户文明自律公约》  \\　　为贯彻落实党中央、国务院对互联网管理工作的指示精神，\根据国务院整顿和规范市场经济秩序工作会议的要求和全国整顿\和规范文化市场秩序电视电话会议的总体部署，切实加强网络游\戏的管理，特拟订以下网络文明公约 ：\　　1.《传奇》游戏玩家在游戏中应该主动维护网络文明，使用\文明用语言，不随意辱骂他人或是做出其他引人反感的行为。\　　2.《传奇》游戏玩家在游戏中应该自觉维护游戏中的良好氛|{cmd}<下一页/@gongyue2>\'
  );
end;

procedure _gongyue2;
begin
  This_Npc.NpcDialog(This_Player,
  '围，不传播反动、封建、迷信和色情信息。同时，也不应以此类\信息作为网络游戏中人物的名称。\　　3.《传奇》游戏玩家在游戏中，一旦发现他人有违反国家政\策和反动、色情的言论和行为时，有责任和义务及时向游戏的管\理人员举报，管理人员在接到举报，会根据情节轻重对其处以不\同程度的处罚。情节特别恶劣者，将移交至公安机关解决。\　　4.未成年玩家在参与网络游戏时，需有监护人陪同，同时每\次游戏的时间也不应过长。|{cmd}<下一页/@gongyue3>\'
  );
end;

procedure _gongyue3;
begin
  This_Npc.NpcDialog(This_Player,
  '5.《传奇》游戏玩家在游戏中应该主动发扬互助友爱精神，\帮助需要帮助的玩家。\　　6. 游戏玩家在不得利用网络游戏进行赌博等违反国家法律规\定的活动，如果发现有人利用网络游戏从事不法活动，应及时向\游戏管理人员举报。\　　7.《传奇》游戏玩家在发现游戏的BUG后，应及时向游戏管理\人员反映，而不是利用其为己牟利。同时，也不应该使用外挂等\非法工具破坏游戏的平衡性。 \|{cmd}<确定/@doexit>'
  );
end;

//脚本执行的入口
begin
  domain;
end.   