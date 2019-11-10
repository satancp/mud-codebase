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

procedure domain;
begin
    if (This_Player.GetBagItemCount('疗伤药') >= 1) and (This_Player.GetV(11,7) = 9) then
    begin
        if This_Player.Level >= 11 then
        begin
        This_Player.Take('疗伤药',1);
        This_Player.SetV(11,7,100);
        This_Player.AddGold(2000);
        This_Npc.NpcDialog(This_Player,
              '那好我就收下我父亲给我的东西!\'
              +'非常感谢你!\'
              +'这一点钱就算是我对你的报答吧!\\'
              +'|{cmd}<再见!/@exit>'
              );
        end else
        This_Npc.NpcDialog(This_Player,
              '你是从银杏山谷来的吧?\'
              +'那可是我出生的地方!\'
              +'你一定从村子的小敏那里学了不少知识\'
              +'我考考你,如果你都答对的话\'
              +'我会送你一样礼物的\'
              +'你愿意试试吗?\\'
              +'顺便说一句,银杏山谷的小敏可是我女朋友,不要有歪念哦\'
              +'|{cmd}<愿意/@quest11>\'
              +'|{cmd}<不愿意/@quest12>'
              );
    end else
    begin
        if (This_Player.GetBagItemCount('祈福项链') >= 1) and (This_Player.GetV(11,7) = 13) then
        begin
        
            if This_Player.Level >= 11 then
            begin
            This_Player.Take('祈福项链',1);
            This_Player.AddGold(2000);
            This_Npc.NpcDialog(This_Player,
                  '那好我就收下我叔父送我的东西!\'
                  +'非常感谢你!\'
                  +'这一点钱就算是我对你的报答吧!\\'
                  +'|{cmd}<再见!/@exit>'
                  );
            end else
            This_Npc.NpcDialog(This_Player,
              '你是从边界村镇来的吧?\'
              +'那可是我学习知识的地方!\'
              +'你一定从村子的阿妍那里学了不少知识\'
              +'我考考你,如果你都答对的话\'
              +'我会送你一样礼物的\'
              +'你愿意试试吗?\\'
              +'顺便说一句,边界村镇的阿妍可是我的表妹,不要有歪念哦\'
              +'|{cmd}<愿意/@quest11>\'
              +'|{cmd}<不愿意/@quest13>'
              );
        end else
        
        This_Npc.NpcDialog(This_Player,
          '我是飞天武馆的练功师傅黄飛龍\'
          +'如果你没有什么事情的话\'
          +'请不要打搅我,我正在运气凝神,修练绝世神功\\'
          +'|{cmd}<打听情报/@ask>\'
          +'|{cmd}<确定/@exit>'
          );
    end;
end;



procedure _ask;
begin
This_Npc.NpcDialog(This_Player,
      '听说祖玛教主和沃玛教主都改造了自己的寺庙\'
      +'现在想见他们一面可不容易啊!\\'
      +'|{cmd}<确定/@exit>'
      );
end;

procedure _quest12;
begin

    if This_Player.Take('疗伤药',1) then
    This_Player.AddGold(2000);
    This_Npc.NpcDialog(This_Player,
      '既然如此,我也不勉强你\'
      +'这点钱就算是我对你的报答\'
      +'收下吧!\'
      +'|{cmd}<再见/@exit>'
      );
end;

procedure _quest13;
begin
    if This_Player.Take('祈福项链',1) then
    This_Player.AddGold(2000);

This_Npc.NpcDialog(This_Player,
      '既然如此,我也不勉强你\'
      +'这点钱就算是我对你的报答\'
      +'收下吧!\'
      +'|{cmd}<再见/@exit>'
      );

end;

procedure _quest11;
begin
This_Npc.NpcDialog(This_Player,
      '好,我开始问了,看清楚答案啊!\'
      +'第一道:\'
      +'打开包裹的快捷键是什么?\\'
      +'|{cmd}<F9/@quest2>\'
      +'|{cmd}<F10/@wrong>\'
      +'|{cmd}<F11/@wrong>\'
      +'|{cmd}<F12/wrong>'
      );

end;

procedure _wrong;
begin
This_Npc.NpcDialog(This_Player,
      '很抱歉,你回答错了\'
      +'你还需要继续学习\'
      +'才能在这个大陆生存下去\'
      +'|{cmd}<再试一次/@quest11>\'
      +'|{cmd}<好的/@exit>'
      );

end;

procedure _quest2;
begin
This_Npc.NpcDialog(This_Player,
      '不错,再来第二道:\'
      +'攻击方式一共有多少种?\\'
      +'|{cmd}<3种/@wrong>\'
      +'|{cmd}<4种/@wrong>\'
      +'|{cmd}<5种/@quest3>\'
      );

end;

procedure _quest3;
begin
This_Npc.NpcDialog(This_Player,
      '答对了,不过你清楚每种攻击模式的用法吗?\'
      +'再来第三道:\'
      +'跟同一个组队里的所有说话的命令是什么?\\'
      +'|{cmd}<!/@wrong>\'
      +'|{cmd}<!!/@quest4>\'
      +'|{cmd}<!~/@wrong>'
      );

end;

procedure _quest4;
begin
This_Npc.NpcDialog(This_Player,
      '厉害厉害，再来一道\'
      +'如何查看别人的装备?\\'
      +'|{cmd}<ctrl+左键/@wrong>\'
      +'|{cmd}<alt+左键/@wrong>\'
      +'|{cmd}<ctrl+右键/@quest5>\'
      +'|{cmd}<alt+右键/@wrong>'
      );

end;

procedure _quest5;
begin
This_Npc.NpcDialog(This_Player,
      '答对了,已经是最后一题了哦\'
      +'最后一道是这样的:\'
      +'我的名字叫什么?\\'
      +'|{cmd}<龚亮/@wrong>\'
      +'|{cmd}<王一/@wrong>\'
      +'|{cmd}<黄飛龍/@right>\'
      +'|{cmd}<马超/@wrong>'
      );

end;

procedure _right;
begin
This_Npc.NpcDialog(This_Player,
      '年轻人不错嘛\'
      +'我可以送你件武器,你可以挑选其中你认为称手的兵器\\'
      +'|{cmd}<半月/@wuqi1>\'
      +'|{cmd}<海魂/@wuqi2>\'
      +'|{cmd}<八荒/@wuqi3>\'
      );

end;

procedure _wuqi1;
var BL : boolean;
begin
    BL := false;
    
    if This_Player.FreeBagNum <= 0 then
    begin
        This_Npc.NpcDialog(This_Player,
          '你的包裹也太满了吧！\\'
          ); 
        exit;
    end;
    
    if (This_Player.GetBagItemCount('疗伤药') >= 1) and (This_Player.GetV(11,7) = 9) then
    begin
        This_Player.Take('疗伤药',1);
        This_Player.Give('半月',1);
        This_Player.SetV(11,7,14);
        BL := true
    end else
    if (This_Player.GetBagItemCount('祈福项链') >= 1) and (This_Player.GetV(11,7) = 13) then
    begin
        This_Player.Take('祈福项链',1);
        This_Player.Give('半月',1);
        This_Player.SetV(11,7,14);
        BL := true
    end; 
    
    if BL then
     This_Npc.NpcDialog(This_Player,
      '' + This_Player.Name + ',特别说一下有些怪物身上掉落的武器\'
      +'是带有特殊属性和能力的哦，要是得到了，\'
      +'是会有意想不到的效果发生的啊\'
      +'' + This_Player.Name + '，努力成为大陆第一强者吧!\'
      +'广阔的大陆任你驰骋!\\'
      )
    else
    This_Npc.NpcDialog(This_Player,
    '我要的东西是不是弄丢了？\\'
      );
end;

procedure _wuqi2;
var BL : boolean;
begin
    BL := false;
    
    if This_Player.FreeBagNum <= 0 then
    begin
        This_Npc.NpcDialog(This_Player,
          '你的包裹也太满了吧！\\'
          ); 
        exit;
    end;
    
    if (This_Player.GetBagItemCount('疗伤药') >= 1) and (This_Player.GetV(11,7) = 9) then
    begin
        This_Player.Take('疗伤药',1);
        This_Player.Give('海魂',1);
        This_Player.SetV(11,7,14);
        BL := true
    end else
    if (This_Player.GetBagItemCount('祈福项链') >= 1) and (This_Player.GetV(11,7) = 13) then
    begin
        This_Player.Take('祈福项链',1);
        This_Player.Give('海魂',1);
        This_Player.SetV(11,7,14);
        BL := true
    end; 
    
    if BL then
      This_Npc.NpcDialog(This_Player,
      '' + This_Player.Name + ',特别说一下有些怪物身上掉落的武器\'
      +'是带有特殊属性和能力的哦，要是得到了，\'
      +'是会有意想不到的效果发生的啊\'
      +'' + This_Player.Name + '，努力成为大陆第一强者吧!\'
      +'广阔的大陆任你驰骋!\\'
      )
      else
    This_Npc.NpcDialog(This_Player,
          '我要的东西是不是弄丢了？\\'
          );
end;

procedure _wuqi3;
var BL : boolean;
begin
    BL := false;
    
    if This_Player.FreeBagNum <= 0 then
    begin
        This_Npc.NpcDialog(This_Player,
          '你的包裹也太满了吧！\\'
          ); 
        exit;
    end;
    
    if (This_Player.GetBagItemCount('疗伤药') >= 1) and (This_Player.GetV(11,7) = 9) then
    begin
        This_Player.Take('疗伤药',1);
        This_Player.Give('八荒',1);
        This_Player.SetV(11,7,14);
        BL := true
    end else
    if (This_Player.GetBagItemCount('祈福项链') >= 1) and (This_Player.GetV(11,7) = 13) then
    begin
        This_Player.Take('祈福项链',1);
        This_Player.Give('八荒',1);
        This_Player.SetV(11,7,14);
        BL := true
    end; 
    
    if BL then
      This_Npc.NpcDialog(This_Player,
      '' + This_Player.Name + ',特别说一下有些怪物身上掉落的武器\'
      +'是带有特殊属性和能力的哦，要是得到了，\'
      +'是会有意想不到的效果发生的啊\'
      +'' + This_Player.Name + '，努力成为大陆第一强者吧!\'
      +'广阔的大陆任你驰骋!\\'
      )
      else
    This_Npc.NpcDialog(This_Player,
          '我要的东西是不是弄丢了？\\'
          );
end;
//脚本执行的入口
begin
  domain;
end.