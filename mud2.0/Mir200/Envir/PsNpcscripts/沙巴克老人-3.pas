{
/***********************************************************************

/************************************************************************}

PROGRAM Mir2;



Procedure _doexit;
Begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

{攻沙注释01：
    //查询最近的沙巴克行会战的日期
    //返回值：   '没有'  表示   ‘短期内没有战 .\ \
    //           ‘正在’表示    '正在当中！\ \
    //           其他的  表示    行会战日期
    function CheckCastleWarDate(): string; 
}
Procedure _aboutwar;
var
S1 : String;
Begin
   S1 :=  This_Npc.CheckCastleWarDate();
   if S1 = '没有' then
   begin
      This_Npc.NpcDialog(This_Player,
      '短期内没有战 .\ \|{cmd}<返回/@main>');
   end else if S1 = '正在' then
   begin
      This_Npc.NpcDialog(This_Player,
      '正在当中！\ \|{cmd}<返回/@main>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '最近一次的战役将在'+S1+'20点开始，\'+
      '你也可以看看战役的时间表，这样你就非常清楚了。\ \'+
      '|{cmd}<看一些战役的时间表/@listwar>\'+
      '|{cmd}<返回/@main>\');
   end;
   
end;


{攻沙注释02：
    //查看战役时间表
    //返回值：  ''    表示     '我们没有确定时间\ \
    //          其他  表示     时间列表
    function GetListOfWar(): string;
}
Procedure _listwar;
var
S : string;
begin
   S := This_Npc.GetListOfWar;
   if S = '' then
   begin
      This_Npc.NpcDialog(This_Player,
      '我们没有确定时间\ \|{cmd}<返回/@main>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      S+'\ \'+
      '|{cmd}<返回/@main>');
   end;
end;
//沙巴克藏宝阁 
Procedure _sabuk;
begin
    if This_NPC.GetCastleGuildName <> '' then
    begin
    This_Npc.NpcDialog(This_Player,
    '藏宝阁在每天晚上22至23点开放，沙巴克行会成员可以免费进入，\'+ 
    '其他勇士需要缴纳一个飞火流星礼花！\ \'+
    '|{cmd}<进入藏宝阁/@sabukenter>                             ^<返回/@main>'
    );
    end else
    This_Npc.NpcDialog(This_Player,
    '只有当沙巴克城真正的主人出现之时，藏宝阁的大门才会被开启，\'+
    '现在还不到时候。\ \'+
    '|{cmd}<返回/@main>'
    ); 
end;

Procedure _sabukenter;
var
temp:integer;
begin
  if This_NPC.GetCastleGuildName <> '' then
  begin
    if (GetHour = 22) then 
    begin
     if compareText(This_Player.MapName, '3') = 0 then
     begin
        temp:= (60 - GetMin)*60;
        if This_Player.IsCastle then
        begin
          This_Player.RandomFlyTo('H204');
          This_Player.CallOut(This_NPC,temp,'sabuk_quanshui');
        end else
        begin
          if This_Player.GetBagItemCount('飞火流星') > 0 then
          begin
          This_Player.Take('飞火流星',1);
          This_Player.RandomFlyTo('H204');
          This_Player.CallOut(This_NPC,temp,'sabuk_quanshui');  
          end else 
          This_Npc.NpcDialog(This_Player,
          '你身上没有携带飞火流星，不能进入沙巴克藏宝阁。\ \'+
          '|{cmd}<返回/@main>'
          );
        end; 
     end;
    end else
    This_Npc.NpcDialog(This_Player,
    '藏宝阁只在每天晚上22至23点开放，现在并没有开启。\ \'+
    '|{cmd}<返回/@main>'
    );
  end else
  This_Npc.NpcDialog(This_Player,
  '只有当沙巴克城真正的主人出现之时，藏宝阁的大门才会被开启，\'+
  '现在还不到时候。\ \'+
  '|{cmd}<返回/@main>'
  );  
end;

procedure sabuk_quanshui;
begin
  if compareText(This_Player.MapName, 'H204') = 0 then
  begin    
  This_Player.RandomFlyTo('3');
  end; 
end;

//申请城主雕像
procedure _sabukOwner;
begin
   This_Npc.NpcDialog(This_Player,
   '金光闪闪的沙巴克城主雕像，象征着玛法大陆最强行会掌门人的无上\'+
   '荣誉，正静静地伫立在沙漠之城中央，等待着它真正的主人。谁将把\'+
   '他的名字永远铭刻在无忧传奇的历史中，我们将拭目以待…\ \'+
   '|<我就是沙城新的主人，我要重建沙巴克城主的雕像/@sabukOwner_1>\'+
   '|<返回/@main>'
   );
end; 

procedure _sabukOwner_1;
var
reqnameType:integer;
reqnameStr:string;
begin
   if This_NPC.GetCastleGuildName <> '' then
   begin
     if compareText(This_Player.Name,This_NPC.GetCastleLoadName) = 0 then
     begin
       reqnameType := This_NPC.ReqCastleOwnerNpc(This_Player);
       case reqnameType of
         0:reqnameStr:='您的城主雕像已经竣工！'; 
         1:
         begin
         reqnameStr:='恭喜你申请重建雕像成功，崭新的城主雕像已经竣工。';
         SetG(36,47,0);
         This_NPC.NpcNotice('以玛法大陆顶级强者，大陆最强行会'+This_NPC.GetCastleGuildName+'掌门人'+This_Player.Name+'为原型，耗费了玛法大陆众多能工巧匠心血的沙巴克城主雕像终于竣工。伫立在城门之前，镇守沙巴克全境，仿佛永久在诠释着对于这座城市的统治。'); 
         end; 
       end;
       This_Npc.NpcDialog(This_Player,reqnameStr);
     end else
     This_NPC.NpcDialog(This_Player,
     '对不起，您并非沙巴克城主，不能重建沙巴克城主雕像！'
     );
   end else
   This_NPC.NpcDialog(This_Player,
   '对不起，你还不满足申请条件，继续努力吧！'
   );  
end; 

Begin
   This_Npc.NpcDialog(This_Player,
   '你想要问我一些什么东西？\ \'+
   '|<想问的时间？/@aboutwar>\'+
   '|<重建沙巴克城主雕像/@sabukOwner>\'+
   '|<沙巴克藏宝阁/@sabuk>\'
   );
end.
