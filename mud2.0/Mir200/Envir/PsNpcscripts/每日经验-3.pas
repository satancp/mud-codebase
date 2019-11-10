{
*******************************************************************}

Program Mir2;



Procedure _doexit;
begin
   This_NPC.CloseDialog(This_Player);
end;

//==============================================================新手任务 

procedure _GetFreeExp; 
var today , num: integer;
begin
    today := GetDateNum(GetNow);// 获取当前日期

    if This_Player.GetV(13,1) <> today then     

    begin
       This_Player.SetV(13,1,today);
       This_Player.SetV(13,2,0);
    end;

             //初始化变量值，每天首次触发，将领取变量设置为0


 


    num := This_Player.GetV(13,2);  //获取已领取次数，**取值时切记写在初始化之后
    if num < 3 then
    begin
        This_Player.Give('经验',1000000);
        This_Player.SetV(13,2, num + 1); //领取变量每领取一次加一
		ServerSay('玩家<' + This_Player.Name + '>领取了每日经验！', 2);
        This_NPC.NpcDialog(This_Player,
        '恭喜你获得100万点经验值'
        +'|{cmd}<继续领取经验/@GetFreeExp>');
         
    end else
    This_NPC.NpcDialog(This_Player,'你今天已领取了3次经验');
end;

 

begin//主函数入口
    This_NPC.NpcDialog(This_Player,
    '玩家每天可免费领取3次经验，每次可领取100万'
    +'|{cmd}<免费经验领取/@GetFreeExp>');
end.

