{

/*  脚本内容 :
/*  对应NPC  : 白金帐号的奖励配置 

}


{/**********************这部分代码用于生成白金帐号的奖励配置**********************/}
const REWARD_KIND = 82; //定义奖励的种类
const START_LEVEL = 50; //白金账号的起始等级 

//给予玩家对应白金帐号等级的奖励 
procedure GivePlatinaReward();
var
  //这里简化处理,所有奖励只有一种物品,且数量为1 
  name  : array[1..REWARD_KIND] of string;
  pos   : array[1..REWARD_KIND] of Integer;
  total : Integer;
  i     : Integer;
  rand  : Integer;    //生成随机数
  temp  : Integer;    //
  platina_level : Integer;  //白金账号等级 
begin
  //防止无玩家或者无NPC对象的错误调用
  if (This_Player = nil) or (This_Npc = nil) then
  begin
    Exit;
  end;
  
  //方便与人物等级比较 
  platina_level := This_Player.PlatLv + START_LEVEL;
  
  //不是白金账号,只有51级到66级的白金帐号有奖励可以领取 
  if (platina_level < 51) then
  begin
    This_Npc.NpcDialog(This_Player,
    '您不是白金账号,不能到我这里领取奖励！\'); 
    Exit;   
  end;
  
  //已领取完所有的白金账号的奖励,66级就已领取完所有奖励
  if (platina_level > 66) then
  begin
    This_Npc.NpcDialog(This_Player,
    '您已领取完所有的白金账号的奖励！\'); 
    Exit;   
  end;  
  
  //当前等级的奖励是否已经领取 
  if (This_Player.Level < platina_level) then
  begin
    This_Npc.NpcDialog(This_Player,
    '我记得您已经领取当前等级的白金账号的奖励！\'); 
    Exit;   
  end;
  
  //发奖励之前,判断是否有足够的空格
  if This_Player.FreeBagNum < 1 then
  begin
    This_Npc.NpcDialog(This_Player,
    '您的包裹太满,不能领取,请整理包裹后再领取！\');   
    Exit;
  end; 
  
//专门处理最高等级66级的白金帐号奖励
  if platina_level = 66 then
  begin
    This_Npc.NpcDialog(This_Player,
    '你是来领取66级的白金奖励的吗？\'
    + '除了实力的象征，“白金”更意味着一种责任！\'
    + '想要指定领取三神器中的一把，首先必须给我5个白金积分包。\'
    + '你想要领取哪一把神器呢？\'
    + '|{cmd}<开天/@kaitian>            ^<镇天/@zhentian>            ^<玄天/@xuantian>');
    Exit;
  end;
       
//处理51-65级白金帐号的奖励配置 

  //初始化
  for i := 1 to REWARD_KIND do
  begin
    name[i] := '';
    pos[i]  := 0;
  end;

  //初始化奖励的物品和数量
//51级的奖励 
  name[1]   := '雷霆战戒';
  name[2]   := '雷霆护腕';
  name[3]   := '雷霆项链';  
  name[4]   := '雷霆腰带';
  name[5]   := '雷霆战靴';
  name[6]   := '光芒道戒';
  name[7]   := '光芒护腕';
  name[8]   := '光芒项链';
  name[9]   := '光芒道靴';
  name[10]  := '光芒腰带';
  name[11]  := '烈焰腰带';
  name[12]  := '烈焰护腕';
  name[13]  := '烈焰项链';
  name[14]  := '烈焰魔靴';
  name[15]  := '烈焰魔戒';
  
//52级的奖励 
  name[16]  := '强化雷霆战戒';
  name[17]  := '强化雷霆护腕';
  name[18]  := '强化雷霆项链';  
  name[19]  := '强化雷霆腰带';
  name[20]  := '强化雷霆战靴';
  name[21]  := '强化光芒道戒';
  name[22]  := '强化光芒护腕';
  name[23]  := '强化光芒项链';
  name[24]  := '强化光芒道靴';
  name[25]  := '强化光芒腰带';
  name[26]  := '强化烈焰腰带';
  name[27]  := '强化烈焰护腕';
  name[28]  := '强化烈焰项链';
  name[29]  := '强化烈焰魔靴';
  name[30]  := '强化烈焰魔戒';
//53级的奖励
  name[31]  := '狂战戒指';
  name[32]  := '狂战手镯';
  name[33]  := '混世戒指';
  name[34]  := '混世手镯';
  name[35]  := '太极手镯';
  name[36]  := '太极戒指';
//54级的奖励
  name[37]  := '狂战戒指';
  name[38]  := '狂战手镯';
  name[39]  := '混世戒指';
  name[40]  := '混世手镯';
  name[41]  := '太极手镯';
  name[42]  := '太极戒指';
//55级的奖励
  name[43]  := '誓言腰带(禁锢)';
  name[44]  := '预言头盔(禁锢)';
  name[45]  := '传说魔靴(禁锢)';
//56级的奖励
  name[46]  := '狂战戒指';
  name[47]  := '狂战手镯';
  name[48]  := '混世戒指';
  name[49]  := '混世手镯';
  name[50]  := '太极戒指';
  name[51]  := '战神项链';
  name[52]  := '战神手镯';
  name[53]  := '战神戒指';
  name[54]  := '圣魔项链';
  name[55]  := '圣魔手镯';
  name[56]  := '圣魔戒指';
  name[57]  := '真魂项链';
  name[58]  := '真魂手镯';
  name[59]  := '真魂戒指';
  name[60]  := '太极手镯';
//57级的奖励
  name[61]  := '战神手镯';
  name[62]  := '战神戒指';
  name[63]  := '圣魔项链';
  name[64]  := '圣魔手镯';
  name[65]  := '圣魔戒指';
  name[66]  := '真魂项链';
  name[67]  := '真魂手镯';
  name[68]  := '真魂戒指';
  name[69]  := '战神项链';
//58级的奖励
  name[70]  := '银星勋章(禁锢)';
  name[71]  := '寂静之手(禁锢)';
//59级的奖励
  name[72]  := '银星勋章(禁锢)';
  name[73]  := '寂静之手(禁锢)';
//60级的奖励 
  name[74]  := '星王靴(禁锢)';
  name[75]  := '星王腰带(禁锢)';
  name[76]  := '星王冠(禁锢)';

//61-62级的奖励 
  name[77]  := '星王靴(禁锢)';
  name[78]  := '星王腰带(禁锢)';
  name[79]  := '星王冠(禁锢)';
//63-65级的奖励 
  name[80]  := '星王项链(禁锢)';
  name[81]  := '星王护腕(禁锢)';
  name[82]  := '星王戒指(禁锢)';


  //设置奖励的概率（如果需要可以考虑玩家的属性因素）
  total  := 300;   //total表示奖励得到的概率都是300分之几
  //根据白金账号的等级不同,配置不同奖励
  //同时改变白金账号等级,并对于61-66级的白金账号收取白金积分包 
  case platina_level of
    51:
    begin
      pos[1] := 20;
      pos[2] := 20;
      pos[3] := 20;
      pos[4] := 20;
      pos[5] := 20;
      pos[6] := 20;
      pos[7] := 20;
      pos[8] := 20;
      pos[9] := 20;
      pos[10] := 20;
      pos[11] := 20;
      pos[12] := 20;
      pos[13] := 20;
      pos[14] := 20;
      pos[15] := 20; 
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end;
    52:
    begin
      pos[16] := 20;
      pos[17] := 20;
      pos[18] := 20;
      pos[19] := 20;
      pos[20] := 20;
      pos[21] := 20;
      pos[22] := 20;
      pos[23] := 20;
      pos[24] := 20;
      pos[25] := 20;
      pos[26] := 20;
      pos[27] := 20;
      pos[28] := 20;
      pos[29] := 20;
      pos[30] := 20;                        
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end;
    53:
    begin
      pos[31] := 50;
      pos[32] := 50;
      pos[33] := 50;
      pos[34] := 50;
      pos[35] := 50;
      pos[36] := 50;
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end; 
    54:
    begin
      pos[37] := 50;
      pos[38] := 50;
      pos[39] := 50;
      pos[40] := 50;
      pos[41] := 50;
      pos[42] := 50;                       
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end;
    55:
    begin
      pos[43] := 100;
      pos[44] := 100;
      pos[45] := 100;      
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end;
    56:
    begin
      pos[46] := 20;
      pos[47] := 20;
      pos[48] := 20;
      pos[49] := 20;
      pos[50] := 20;
      pos[51] := 20;
      pos[52] := 20;
      pos[53] := 20;
      pos[54] := 20;
      pos[55] := 20;
      pos[56] := 20;
      pos[57] := 20;
      pos[58] := 20;
      pos[59] := 20;
      pos[60] := 20;                        
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end;
    57:
    begin
      pos[61] := 33;
      pos[62] := 33;
      pos[63] := 33;  
      pos[64] := 33;
      pos[65] := 34;
      pos[66] := 34;
      pos[67] := 33;
      pos[68] := 33;
      pos[69] := 33;           
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end; 
    58:
    begin
      pos[70] := 150;
      pos[71] := 150;
      This_Player.PlatLv := This_Player.PlatLv + 1;   
    end;
    59:
    begin
      pos[72] := 150;
      pos[73] := 150;
      This_Player.PlatLv := This_Player.PlatLv + 1;  
    end; 
    60:
    begin
      pos[74] := 100;
      pos[75] := 100;
      pos[76] := 100;
      This_Player.PlatLv := This_Player.PlatLv + 1;
    end;  
    61, 62:
    begin
      if This_Player.GetBagItemCount('白金积分包') >= 1 then
      begin
        pos[77] := 100;
        pos[78] := 100;
        pos[79] := 100;
        This_Player.Take('白金积分包', 1);
        This_Player.PlatLv := This_Player.PlatLv + 1;
      end
      else                        
      begin                          
        This_Npc.NpcDialog(This_Player,
        '你好像没有足够的白金积分包,我不能给你奖励');
      end;      
    end; 
    63, 64, 65:
    begin
      if This_Player.GetBagItemCount('白金积分包') >= 1 then
      begin
        pos[80] := 100;
        pos[81] := 100;
        pos[82] := 100;      
        This_Player.Take('白金积分包', 1);
        This_Player.PlatLv := This_Player.PlatLv + 1;
      end
      else                        
      begin                          
        This_Npc.NpcDialog(This_Player,
        '你好像没有足够的白金积分包,我不能给你奖励');
      end; 
    end; 
    else   
    begin
      //....
    end;    
  end;

  //进行随机生成奖励
  rand := Random(total) + 1;
  temp := 0;
  for i := 1 to REWARD_KIND do
  begin
    temp := temp + pos[i];
    if rand <= temp then
    begin
      if (name[i] <> '')then
      begin
        This_Player.Give(name[i], 1);
      end;      
      Exit;
    end;
  end;
end;

//处理66级白金账号的终极奖励
procedure GiveFinalReward(index : Integer);
var
  item_name : string;
begin
  if (This_Player = nil) or (This_Npc = nil) then
  begin
    Exit;
  end;
  
  if This_Player.GetBagItemCount('白金积分包') < 5 then
  begin
    This_Npc.NpcDialog(This_Player,
        '你好像没有足够的白金积分包啊，我不能给你奖励');   
    Exit;
  end; 
  
  case index of
  1: item_name := '开天';
  2: item_name := '镇天';
  3: item_name := '玄天';
  else
     Exit;
  end; 
  
  //测试!!!!!!!!!!!!!!!!!!!!!!!! 
  if (This_Player.PlatLv + START_LEVEL) = 66 then
  begin
     This_Player.Take('白金积分包', 5);
     This_Player.PlatLv := This_Player.PlatLv + 1;      
     This_Player.Give(item_name, 1);
     This_Npc.NpcDialog(This_Player, 
     '恭喜你，你领取了66级的白金角色奖励物品：' + item_name + '！');
     This_Npc.NpcNotice('恭喜：“' + This_Player.Name + '”，领取了66级的白金角色奖励物品：' + item_name + '！');
  end
  else
  begin
     This_Npc.NpcDialog(This_Player,
        '你已经领取过了66级的白金角色奖励，不能再次领取'); 
  end;
end; 

procedure _kaitian;
begin
  GiveFinalReward(1); //领开天 
end;

procedure _zhentian;
begin
  GiveFinalReward(2); //领镇天
end;

procedure _xuantian;
begin
  GiveFinalReward(3); //领玄天
end;