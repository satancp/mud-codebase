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

procedure _Normal;
begin
  This_Npc.NpcDialog(This_Player,
  '欢迎..   您想要修理那种武器？\根据这个城堡的主人'+This_npc.GetCastleGuildName+'的命令， \我们特别对'+This_npc.GetCastleGuildName+'成员提供20%的折扣。\'
  +'|{cmd}<特殊修理/@s_repair>\'
  +'|{cmd}<退出/@doexit>'
  );
end;

procedure _S_Repair;
begin
  This_Npc.NpcDialog(This_Player,
    '你这家伙 !你可太幸运了...我正好有所需的材料做特种修补。\但价格嘛……是通常的三倍。\ \ \|{cmd}<返回/@main>'
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


//脚本执行的入口
begin
      _Normal;
end.