{********************************************************************
* 单元名称： 
* 单元作者：
* 摘    要：
* 备    注：

*******************************************************************}


Program Mir2;






procedure _M9; 
begin
This_Player.Flyto('11',357,248);
ServerSay('玩家<' + This_Player.Name + '>进入初级打宝地图赤月峡谷，祝他好运！', 2);
end;

procedure _M2; 
begin
This_Player.Flyto('3',855,186);
ServerSay('玩家<' + This_Player.Name + '>进入初级打宝地图祖玛寺庙，祝他好运！', 2);
end;


procedure _M7; 
begin
This_Player.Flyto('5',660,465);
ServerSay('玩家<' + This_Player.Name + '>进入初级打宝地图牛魔洞穴，祝他好运！', 2);
end;





begin
This_Npc.NpcDialog(This_Player,
'<★★★★★★中级打宝★★★★★★/c=red>\'+
   '|我这里可以免费进入中级打宝地图，\ '+
   '|爆率，祖玛级装备，赤月级装备，技能书等\'+
   '|BOSS：赤月恶魔，祖玛教主，牛魔王，双头金刚等\'+
   '|{cmd}<前往祖玛寺庙/@M2>\' +
   '|{cmd}<前往牛魔洞穴/@M7>\' +
   '|{cmd}<前往赤月峡谷/@M9>\' 

    );  

end.