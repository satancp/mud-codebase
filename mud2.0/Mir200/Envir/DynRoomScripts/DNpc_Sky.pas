program Mir2;

//进入天关触发事件,101号活动变量为闯天关
procedure OnEnter;
begin
  //玩家身上的101号活动2号变量表示当前玩家闯天关的状态
  This_Player.SetS(101, 2, 1);
  SetG(100, 1, 50);
end;

//离开天关触发事件(现在下线或者小退则不触发)
procedure OnLeave;
begin

end;

//玩家死亡触发事件
procedure OnDie;
begin

end;

begin

end.