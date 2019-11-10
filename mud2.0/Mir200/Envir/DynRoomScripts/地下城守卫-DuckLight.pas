{
详见 宫殿看守-DM002~1.pas);


}
program Mir2;

const
  CREATE_MON_INTERVAL = 20;  //秒


procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;  
  
procedure TimeOutProc;
var
  nMonNum, nVar : Integer;
begin
  if LowerCase(This_Player.DynRoomName) = 'ducklight' then
  begin
    nVar := This_Player.GetV(26, 3);
    nMonNum := This_Npc.CheckCurrMapMon;
    if nVar >= 9 then
    begin            
      if nMonNum >= This_Player.GetV(26, 6) then
      begin
        This_Player.PlayerNotice('你本次的成绩是'+IntToStr(nMonNum)+'个怪物,恭喜你闯关成功', 0);
        This_Player.Give('千年蛛丝', 1);
      end
      else
      begin
        This_Player.PlayerNotice('你本次的成绩是'+IntToStr(nMonNum)+'个怪物,很可惜，闯关失败', 0);
      end;
      This_Player.SetV(26, 3, 0);
      This_Player.SetV(26, 6, 0);
      This_Player.FlyTo('DM002~1', 0, 0);
    end
    else
    begin
      This_Player.SetV(26, 3, nVar+1);
      This_Npc.CreateMon('', 25, 25, 10, '幻影蜘蛛1029', 1);
      This_Player.CallOut(This_Npc, CREATE_MON_INTERVAL, 'TimeOutProc');
      This_Player.PlayerNotice('20秒后将有新的怪物刷出，现在地图上怪物有'+IntToStr(nMonNum)+'个', 0);
    end;  
  end;
end;

procedure _startDBL;
begin
  if LowerCase(This_Player.DynRoomName) = 'ducklight' then
  begin
    if This_Player.GetV(26, 2) = 1 then
    begin
      This_Player.SetV(26, 2, 0);  // 防刷脚本
      This_Player.SetV(26, 3, 1);
      This_Npc.ClearMon('');
      This_Npc.CreateMon('', 25, 25, 10, '幻影蜘蛛1029', 1);
      This_Player.CallOut(This_Npc, CREATE_MON_INTERVAL, 'TimeOutProc');
      This_Npc.CloseDialog(This_Player);
    end
    else
      This_Npc.NpcDialog(This_Player, '你已经开始挑战了，不能重新开始了');
  end;
end;
  
begin
  This_Npc.NpcDialog(This_Player,
    '这里就是盘丝洞,准备好的话，就开始吧！\'+
    '给你3分钟的时间,你要在保证生存的前提下,\'+
    '让地图内的爆裂蜘蛛的数量在'+IntToStr(This_Player.GetV(26, 6))+'个以上\'+
    '3分钟后，如果任务完成，千年蛛丝就是你的了\'+
    '无论是否成功，我都将送你返回地下宫殿\'+
    '|{cmd}<好的，我要开始任务/@startDBL>\'+
    '|{cmd}<离开/@exit>');
end.
