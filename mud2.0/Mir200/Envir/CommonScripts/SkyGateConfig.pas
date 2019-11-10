{
/*******************************************************************************
/*  脚本内容 :
/*  对应NPC  : 天关配置(刷怪和奖励配置) 
/*  修订记录 :
/*
/*******************************************************************************
}

{/**********************这部分代码用于生成天关的刷怪配置**********************/}
//生成天关怪物
const MONSTER_KIND = 50; //定义一共有多少套刷怪方案
const MONSTER_NUM  = 3 ; //每套刷怪方案最多有多少种怪物
procedure CreateSkyGateMon(level: Integer);
var
  name  : array[1..MONSTER_KIND] of array[1..MONSTER_NUM] of string;
  num   : array[1..MONSTER_KIND] of array[1..MONSTER_NUM] of Integer;
  pos   : array[1..MONSTER_KIND] of Integer;
  total : Integer;
  i     : Integer;
  j     : Integer;
  rand  : Integer;    //生成随机数
  temp  : Integer;    //
begin
  //防止NPC空指针,或者非法包
  if This_Npc = nil then
  begin
    Exit;
  end;

  //初始化
  for i := 1 to MONSTER_KIND do
  begin
    for j := 1 to MONSTER_NUM do
    begin
      name[i][j] := '';
      num[i][j]  := 0;
    end;
    pos[i] := 0;
  end;

  //初始化怪物的名称和数量
  //第一套怪物
  name[1][1] := '角蝇';
  name[1][2] := '半兽人';
  num[1][1] := 3;
  num[1][2] := 3;

  //第二套怪物
  name[2][1] := '黑色恶蛆';
  name[2][2] := '跳跳蜂';
  num[2][1] := 2;
  num[2][2] := 8;

  //第三套怪物
  name[3][1] := '蜈蚣';
  name[3][2] := '钳虫';
  num[3][1] := 3;
  num[3][2] := 3;

  //第四套怪物
  name[4][1] := '红野猪';
  name[4][2] := '黑野猪';
  num[4][1] := 2;
  num[4][2] := 6;

  //第五套怪物
  name[5][1] := '沃玛勇士';
  name[5][2] := '沃玛战士';
  num[5][1] := 2;
  num[5][2] := 2;

  //第六套怪物
  name[6][1] := '尸王';
  name[6][2] := '僵尸';
  num[6][1] := 2;
  num[6][2] := 4;

  //第七套怪物
  name[7][1] := '祖玛弓箭手';
  name[7][2] := '天狼蜘蛛';
  num[7][1] := 3;
  num[7][2] := 2;

  //第八套怪物
  name[8][1] := '祖玛卫士';
  name[8][2] := '黑暗战士';
  num[8][1] := 2;
  num[8][2] := 5;

  //第九套怪物
  name[9][1] := '骷髅精灵';
  name[9][2] := '牛头魔';
  num[9][1] := 3;
  num[9][2] := 2;

  //第十套怪物
  name[10][1] := '牛魔战士';
  name[10][2] := '牛魔斗士';
  num[10][1] := 4;
  num[10][2] := 4;

  //第5关的小BOSS
  name[11][1] := '牛魔祭司';
  name[11][2] := '';
  num[11][1] := 10;
  num[11][2] := 4;

  //第10关的小BOSS
  name[12][1] := '双头血魔500';
  name[12][2] := '双头金刚500';
  num[12][1] := 8;
  num[12][2] := 8;

  //第15关的大BOSS
  name[13][1] := '蓝影刀客';
  name[13][2] := '蓝影刀客';
  num[13][1] := 10;
  num[13][2] := 10;



  //设置刷怪的的概率
  total  := 100;   //total表示奖励得到的概率都是50分之几

  //根据关卡刷怪

  if level = 5 then
  begin
    pos[11] := 100;
  end
  else if level = 10 then
  begin
    pos[12] := 100;
  end
  else if level = 15 then
  begin
    pos[13] := 100;
  end
  else if level <= 8 then
  begin
    for i := 1 to 5 do
    begin
      pos[i] := 20;
    end;
  end
  else
  begin
    for i := 6 to 10 do
    begin
      pos[i] := 20;
    end;
  end;



  //进行随机刷怪(在NPC所在的当前地图上刷)
  rand := Random(total) + 1;
  temp := 0;
  for i := 1 to MONSTER_KIND do
  begin
    if (pos[i] < 0) then
    begin
      break;
    end;
    temp := temp + pos[i];
    if rand <= temp then
    begin
      //刷第i类怪物
      for j := 1 to MONSTER_NUM do
      begin
        if (name[i][j] <> '') and (num[i][j] > 0) then
        begin
          This_Npc.CreateMon('', This_Npc.My_X, This_Npc.My_Y, 5, name[i][j], num[i][j]);
        end;
      end;
      Exit;
    end;
  end;
end;



{/**********************这部分代码用于生成天关的奖励配置**********************/}
const REWARD_KIND = 15; //定义奖励的种类
const REWARD_NUM  = 5 ; //每种奖励最大有多少件物品
//返回0表示发奖成功，－1表示空格不够， －2表示没有发奖品
function GiveSkyGateReward(): Integer;
var
  name  : array[1..REWARD_KIND] of array[1..REWARD_NUM] of string;
  num   : array[1..REWARD_KIND] of array[1..REWARD_NUM] of Integer;
  pos   : array[1..REWARD_KIND] of Integer;
  total : Integer;
  i     : Integer;
  j     : Integer;
  rand  : Integer;    //生成随机数
  temp  : Integer;    //
begin
  //发奖励之前,判断是否有足够的空格
  if This_Player.FreeBagNum < REWARD_NUM then
  begin
    Result := -1;
    Exit;
  end;       

  //初始化
  for i := 1 to REWARD_KIND do
  begin
    for j := 1 to REWARD_NUM do
    begin
      name[i][j] := '';
      num[i][j]  := 0;
    end;
    pos[i] := 0;
  end;

  //初始化奖励的物品和数量
  //1号奖励内容
  name[1][1] := '屠龙';
  name[1][2] := '半月';
  name[1][3] := '神火魔甲';
  num[1][1] := 1;
  num[1][2] := 1;
  num[1][3] := 1;

  //2号奖励内容
  name[2][1] := '开天';
  name[2][2] := '幽灵战衣(男)';
  name[2][3] := '上古道袍';
  num[2][1] := 1;
  num[2][2] := 0;
  num[2][3] := 0;
  //设置奖励的概率（如果需要可以考虑玩家的属性因素）
  total  := 100;   //total表示奖励得到的概率都是50分之几

  //根据人物属性可以调整不同奖项的获得几率
  //0战士，1法师，2道士
  if This_Player.Job = 2 then
  begin
    pos[1] := 40;
    pos[2] := 10;
  end
  else
  begin
    pos[1] := 10;
    pos[2] := 40;
  end;

  //进行随机生成奖励
  rand := Random(total) + 1;
  temp := 0;
  for i := 1 to REWARD_KIND do
  begin
    temp := temp + pos[i];
    if rand <= temp then
    begin
      //发放i号奖励,
      for j := 1 to REWARD_NUM do
      begin
        if (name[i][j] <> '') and (num[i][j] > 0) then
        begin
          This_Player.Give(name[i][j], num[i][j]);
        end;
      end;
      Result := 0;
      Exit;
    end;
  end;
  Result := -2;  
end;

