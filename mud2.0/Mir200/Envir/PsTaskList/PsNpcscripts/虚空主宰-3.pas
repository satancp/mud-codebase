{
*******************************************************************}

program Mir2;
{$I TaoZhuang.pas}

procedure _exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _doexit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _getRdmWP;
var Rdm_int : integer; 
WpName : string;
begin
    Rdm_int := random(100);  //获取随机数，随机数为 0-99中随机一个数字
    
    if This_Player.GetBagItemCount('至尊凭证') > 0 then// 查看包裹中是否有足够的金刚石
    begin
        if This_Player.FreeBagNum >=2 then// 查看是否有足够的包裹空间
        begin
            if Rdm_int < 1 then // 随机到0的概率为1% 
            begin
                case random(3) of
                    0 : WpName := '怒斩';
                    1 : WpName := '龙牙';
                    2 : WpName := '逍遥扇';   
                end;
            This_Player.Take('至尊凭证',1);
            This_Player.Give(WpName , 1);
            This_NPC.NpcDialog(This_Player,
            '恭喜您成功获得'+ WpName);
            end else if Rdm_int < 2 then //随机到1-19的概率为5%
            begin
                case random(3) of
                    0 : WpName := '裁决之杖';
                    1 : WpName := '骨玉权杖';
                    2 : WpName := '龙纹剑';
                end;
            This_Player.Take('至尊凭证',1);
            This_Player.Give(WpName , 1);
            This_NPC.NpcDialog(This_Player,
            '恭喜您成功获得'+ WpName);
            end else if Rdm_int < 65 then //随机到20-99的概率为80%
            begin
                case random(3) of
                    0 : WpName := '法神披风';
                    1 : WpName := '天魔神甲';
                    2 : WpName := '天尊道袍';
                end;
            This_Player.Take('至尊凭证',1);
            This_Player.Give(WpName , 1);
            This_NPC.NpcDialog(This_Player,
            '恭喜您成功获得'+ WpName); 
			      end else if Rdm_int < 70 then //随机到20-99的概率为80%
		      	begin
                case random(3) of
                    0 :This_NPC.CreateMon('D5071~88', 22,24,6, '火龙1', 1);
                    1 :This_NPC.CreateMon('D5071~88', 22,24,6, '烈焰魔神', 1);
                    2 :This_NPC.CreateMon('D5071~88', 22,24,6, '暗之黄泉教主', 1);
                end;
                This_Player.Take('至尊凭证',1);
                ServerSay('★玩家<' + This_Player.Name + '>撕裂空间不小心召唤出了强大的远古恶魔BOSS正在虚空之地肆虐，请大家速速前往击杀！★',3);
	          end else if Rdm_int < 80 then //随机到20-99的概率为80%
		      	begin
                case random(2) of
                    0 :This_NPC.CreateMon('D5071~88', 22,24,6, '雷炎蛛王', 1);
                    1 :This_NPC.CreateMon('D5071~88', 22,24,6, '烈焰战熊', 1);
                end;
                This_Player.Take('至尊凭证',1);
                ServerSay('★玩家<' + This_Player.Name + '>撕裂空间不小心召唤出了强大的远古恶魔BOSS正在虚空之地肆虐，请大家速速前往击杀！★',3);
				    end else if Rdm_int < 100 then //随机到20-99的概率为80%
		      	begin
                case random(3) of
                    0 :This_NPC.CreateMon('D5071~88', 22,24,6, '魔龙树妖', 1);
                    1 :This_NPC.CreateMon('D5071~88', 22,24,6, '暗之牛魔王', 1);
                    2 :This_NPC.CreateMon('D5071~88', 22,24,6, '烈焰战熊', 1);
                end;
                This_Player.Take('至尊凭证',1);
                ServerSay('★玩家<' + This_Player.Name + '>撕裂空间不小心召唤出了强大的远古恶魔BOSS正在虚空之地肆虐，请大家速速前往击杀！★',3);
		        end;
		          
        end else
        This_NPC.NpcDialog(This_Player,
        '没有足够的包裹空间!\|'
        +'{cmd}<返回/@main>');
    end else
    This_NPC.NpcDialog(This_Player,
    '背包没有至尊凭证，不可抽取\|'
    +'{cmd}<返回/@main>');
end;

 

begin  //脚本入口  使用<返回/@main> 可跳转到此处
TZJH_NPC;
    This_NPC.NpcDialog(This_Player,
    '如果您有多余的<《至尊凭证》/c=red>可以在我这里撕裂\|'+
	'一次空间。至于会发生什么我自己也不清楚,有可\'+
	'能获得上古宝藏,也可能会召唤出令你命丧当场的\'+
	'远古恶魔,一切都是未知的！\|'
    +'{cmd}<递交凭证看看会发生什么/@getRdmWP>');

end.
