{********************************************************************

*******************************************************************}

program Mir2;

{$I common.pas}
{$I ActiveValidateCom.pas} 

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _newYB(); 
begin
    if This_Player.GetV(11,10) <> 888 then
	begin
		This_Player.SetV(11,10,888);
		This_NPC.YBDealDialogShowMode(This_Player,true);
	end else
	begin
		This_NPC.YBDealDialogShowMode(This_Player,false);
	end;
end;

Procedure _GetYB;
var 
d2,d3 : integer;
s1 , td : double;
begin
	s1 := GetNow;
	d2 := This_Player.GetS(23,1);
    td := ConvertDBToDateTime(d2);
	d3 := minusDataTime(s1,td);
	if (d3 >= 300) or (This_Player.GetS(23,2) < 3) then
	begin
		This_Player.QueryAwardCode(This_Player.Name);
		This_Npc.CloseDialog(This_Player);
	end else
	   This_Npc.NpcDialog(This_Player,
	   '你操作太快，连续领取3次没有成功，将锁定5分钟！请' + inttostr(300 - d3) + '秒后再次尝试！'
	   );
end;


Begin     
    This_Npc.NpcDialog(This_Player,
    '您好，有什么可以为你您效劳的？我可以提供关于元宝的各类服务。|\'
	+'点击下方人物血条，右下角充值。本服元宝比例<1:10/c=red> |\'
	+'充值完成后，点击下方的领取元宝就可以了。|\'
    +'|{cmd}<领取元宝/@GetYB>'
    );

end.