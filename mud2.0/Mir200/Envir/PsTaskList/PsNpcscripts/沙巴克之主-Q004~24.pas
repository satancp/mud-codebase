{********************************************************************


*******************************************************************}

program Mir2;

{$I ActiveValidateCom.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _buildCorpsnow;
begin
  This_Npc.InputDialog(This_Player, '请输入新战队名称：', 0, 101);
end;

procedure P101;
var str_dlg , str_input : string; 
begin
  if This_Npc.InputOk then
  begin
    if (This_Player.Level >= 35) and (This_Player.GoldNum >= 1000000) then
    begin
      str_input := This_Npc.InputStr;
      if (length(str_input) > 0) and (length(str_input) < 15) then
      begin  
        case This_Player.CreateSelfCorps(str_input) of  
            0 : 
            begin
                This_Player.DecGold(1000000);
                str_dlg := '战队创建成功。';
            end;
            1 : str_dlg := '创建失败，战队名包含违规字符。';
            2 : str_dlg := '创建失败，战队名已存在。';
            3 : str_dlg := '您已有战队，请先退出再创建。';
            4 : str_dlg := '玩家不在线';
            5 : str_dlg := '玩家没有战队';
            6 : str_dlg := '已有行会';
            7 : str_dlg := '目标不存在';
            8 : str_dlg := '请求已经存在';
            9 : str_dlg := '成员不符合条件(战队招募条件)';
            10 : str_dlg := '请求不存在';
            11 : str_dlg := '请求的类型错误';
            12 : str_dlg := '战队不存在';
            13 : str_dlg := '战队成员已满';
            14 : str_dlg := '关系类型错误';
            15 : str_dlg := '关系已存在';
            16 : str_dlg := '战队人数已满';
            17 : str_dlg := '数据大小不对';
            18 : str_dlg := '成员不存在';
            19 : str_dlg := '不能操作自己';
            20 : str_dlg := '尝试删除队长(战队队长不能被删除)';
            21 : str_dlg := '职位已满';
            22 : str_dlg := '无效的目标';
            23 : str_dlg := '类型不匹配';
            24 : str_dlg := '信息长度太长';
            25 : str_dlg := '没有找到目标';
            26 : str_dlg := '成员已经存在';
            27 : str_dlg := '关系不存在';
            28 : str_dlg := '在战队战区域(无法退出战队)';
            29 : str_dlg := '在攻城区域(无法退出战队)';
            30 : str_dlg := '没有更多日志';
            31 : str_dlg := '该成员已有职务';
            32 : str_dlg := '已联盟不可宣战';
            33 : str_dlg := '已宣战不可联盟';
            34 : str_dlg := '目标战队的联盟开关关闭';
            
            555 : str_dlg := '无操作权限';
            1000 : str_dlg := '未知错误';
    
            
        end;
        
         This_Npc.NpcDialog(This_Player,
         str_dlg + '。\ \'
         +'|{cmd}<返回/@main>');
       end else
        This_Npc.NpcDialog(This_Player,
        '战队名称不能超过7个汉字或14个英文字母！\ \'
        +'|{cmd}<返回/@main>');
    end else
    This_Npc.NpcDialog(This_Player,
    '想要成立战队，你首先需要证明你是否有这个资格才行哦。\'
    +'成立战队需要创建者等级达到35级，并且递交100万金币才行\ \'
    +'|{cmd}<返回/@main>');
   
  end;
end;

procedure _buildguildnow;
begin
  This_Npc.InputDialog(This_Player, '请输入新行会名称：', 0, 102);
end;

procedure P102;
var str_dlg , str_input : string; 
begin
  if This_Npc.InputOk then
  begin
    if (This_Player.GetBagItemCount('沃玛号角') >= 1) and (This_Player.GoldNum >= 5000000) then
    begin 
      str_input := This_Npc.InputStr;
      if (length(str_input) > 0) and (length(str_input) < 15) then
      begin  
        case This_Player.CreateSelfGild(str_input) of  
            0 : 
            begin
              This_Player.Take('沃玛号角',1);
              This_Player.DecGold(5000000); 
            str_dlg := '行会创建成功。';
            
            end; 
            1 : str_dlg := '创建失败，行会名包含违规字符。';
            2 : str_dlg := '创建失败，行会名已存在。';
            3 : str_dlg := '您已有行会，请先退出再创建。';
            4 : str_dlg := '玩家不在线';
            5 : str_dlg := '玩家没有战队';
            6 : str_dlg := '已有行会';
            7 : str_dlg := '目标不存在';
            8 : str_dlg := '请求已经存在';
            9 : str_dlg := '成员不符合条件(战队招募条件)';
            10 : str_dlg := '请求不存在';
            11 : str_dlg := '请求的类型错误';
            12 : str_dlg := '行会不存在';
            13 : str_dlg := '行会成员已满';
            14 : str_dlg := '关系类型错误';
            15 : str_dlg := '关系已存在';
            16 : str_dlg := '战队人数已满';
            17 : str_dlg := '数据大小不对';
            18 : str_dlg := '成员不存在';
            19 : str_dlg := '不能操作自己';
            20 : str_dlg := '尝试删除队长(战队队长不能被删除)';
            21 : str_dlg := '职位已满';
            22 : str_dlg := '无效的目标';
            23 : str_dlg := '类型不匹配';
            24 : str_dlg := '信息长度太长';
            25 : str_dlg := '没有找到目标';
            26 : str_dlg := '成员已经存在';
            27 : str_dlg := '关系不存在';
            28 : str_dlg := '在行会战区域(无法退出行会)';
            29 : str_dlg := '在攻城区域(无法退出行会)';
            30 : str_dlg := '没有更多日志';
            31 : str_dlg := '该成员已有职务';
            32 : str_dlg := '已联盟不可宣战';
            33 : str_dlg := '已宣战不可联盟';
            34 : str_dlg := '目标行会的联盟开关关闭';
            
            555 : str_dlg := '战队队长才可以创建行会';
            1000 : str_dlg := '未知错误';
    
            
        end;
        
      
       This_Npc.NpcDialog(This_Player,
       str_dlg + '。\ \'
       +'|{cmd}<返回/@main>');
      end else
      This_Npc.NpcDialog(This_Player,
      '行会名称不能超过7个汉字或14个英文字母！\ \'
      +'|{cmd}<返回/@main>'); 
    end else
    This_Npc.NpcDialog(This_Player,
     '想要成立行会，你首先需要证明你是否有这个资格才行哦。\'
     +'成立行会需要<500万金币/c=red>和<一个沃玛号角/c=red>为条件的，沃玛教主\'
     +'只是在沃玛寺庙出现的哦，你要是想杀死他，需要你自己足\'
     +'够强大才行！\ \'
     +'|{cmd}<知道了/@exit>');
  end;
end;

procedure _requestcastlewarnow;
begin  
   //if AutoOpen(6) then
   
    if This_Player.ReqCastleWar then
       begin
		This_NPC.DelStrFromFile('\CastleWar\inmap.txt','mapUser=1');
		This_NPC.AddStrToFile('\CastleWar\inmap.txt','mapUser=0');
   
		This_NPC.DelStrFromFile('\CastleWar\complete.txt','Start=0');
		This_NPC.AddStrToFile('\CastleWar\complete.txt','Start=1');
   
		This_Player.RandomFlyTo('3');
		This_NPC.NpcNotice('重要信息：行会《'+This_Player.GuildName+'》已申请攻沙战，今晚将是一场血雨腥风！');
       end;
end;


procedure _requestcastlewar;
begin
    
    This_Npc.NpcDialog(This_Player,
    '要求攻城战斗，你必须要有一个祖玛头像，你有了吗？\' +
    '如果你在服务器里面的申请被允许了的话，那么攻城战役\' +
    '将在<今晚/c=red>进行。\ \' +
    '|{cmd}<提供一个祖玛头像/@requestcastlewarnow>\' +
    '|{cmd}<取消/@main>\');
end;

procedure _buildCorpsexp;
begin
    This_Npc.NpcDialog(This_Player,

    '成立战队需要创建者等级达到35级，并且递交100万金币.\ \' +
    '|{cmd}<返回/@main>\');
end;


procedure _buildguildexp;
begin
     This_Npc.NpcDialog(This_Player,
     '战队队长才可以创建行会，\'
     +'成立行会需要<500万金币/c=red>和<一个沃玛号角/c=red>为条件的，沃玛教主\'
     +'只是在沃玛寺庙出现的哦，你要是想杀死他，需要你自己足\'
     +'够强大才行！\ \'
     +'|{cmd}<返回/@main>');
end;
////////////////////////////////////
procedure _sha_YF; 
begin
This_Player.Flyto('3',672 + random(5),280 + random(4));
end;
procedure _sha_WQ; 
begin
This_Player.Flyto('3',632 + random(5),320 + random(4));
end;
procedure _sha_CK; 
begin
This_Player.Flyto('3',648 + random(4),262 + random(4));
end;
procedure _sha_DM; 
begin
This_Player.Flyto('3',664 + random(4),320 + random(4));
end;
procedure _sha_HG; 
begin
   if This_Player.GoldNum >= 20000 then
   begin
      if compareText(This_Player.MapName,'3') = 0 then
      begin
         This_Player.DecGold(20000);
         This_Player.RandomFlyTo('0150');
      end;
   end else
   begin 
      This_NPC.NpcDialog(This_Player,
      '2W金币都没有还想直飞皇宫？我很忙,赶紧滚开！\ \');
   end;
end;

Procedure _move;

   begin
      This_Player.Flyto('3',330,330);
   end;


procedure domain;
begin

      This_Npc.NpcDialog(This_Player,
      '既然已经来到了我这里证明你已经完全想好了，那就把祖玛头像和金砖给我吧。\'
	  +'|提交后攻沙战将在<今晚/c=red>开启，尽情的杀戮吧！\'
	  +'|{cmd}<开启攻沙战/@requestcastlewarnow>\' 
      +'|{cmd}<返回盟重/@move>\' 	  
      );  

end;



begin

  domain;    
end.