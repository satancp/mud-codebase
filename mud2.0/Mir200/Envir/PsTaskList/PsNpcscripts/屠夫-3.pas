{********************************************************************

*******************************************************************}


program Mir2;

{$I common.pas}




//原屠夫内容； 
procedure domain;
begin
      This_Npc.NpcDialog(This_Player,
      '欢迎光临,有什么事情需要我帮忙吗？\ \'
      +'|{cmd}<买肉/@buy>' + addspace(' ',26) + '^<卖肉/@sell>\'
      +'|{cmd}<退出/@doexit>'
      );
end;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _buy;
begin
  This_Npc.NpcDialog(This_Player, 
    '请挑选要购买的物品。\ \ \|{cmd}<返回/@main>'
  );
  This_Npc.Click_Buy(This_Player);
end;

procedure _Sell;
begin
  This_Npc.NpcDialog(This_Player, 
    '如有品质好的肉，请卖给我吧。\我会给你好价钱。\ \'
    +'|{cmd}<继续/@main>'
  );
  This_Npc.Click_Sell(This_Player);
end;


//初始化操作
procedure OnInitialize;
begin
  This_Npc.AddStdMode(40);
  This_Npc.AddStdMode(1);
  This_Npc.FillGoods('干肉',1000,1);
  This_Npc.SetRebate(100);
end;  

//脚本执行的入口
begin
  domain;
end.