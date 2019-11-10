{
*******************************************************************}

program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

//==============================================================新手任务

procedure dorenwu15;
begin
This_Npc.NpcDialog(This_Player,
  '最近，附近的半兽人总是偷袭我们，真是烦死人了！\'+
  '好心人，能帮我去<杀15个半兽人/c=red>吗？我会好好报答你的！ \ \'+
  '|{cmd}<我接受(任务)/@renwu16>'
  );
end;

procedure _renwu16;
begin
if (This_Player.GetV(102,1)=11) then
 begin
  This_Npc.NpcDialog(This_Player,
 '附近的半兽人总是偷袭我们，真是烦死人了！\'+
 '好心人，赶快帮我去<杀15个半兽人/c=red>吧。\ \ '+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
 end else
 begin
  This_Player.SetV(102,1,11);        //任务标记
  This_Player.SetV(102,3,0);
  This_Player.UpdateTaskDetail(102,1);
  This_Player.Give('经验',10000);
  This_Npc.CloseDialog(This_Player);
  //自动寻路神秘蛤蟆 
 end;  
end;

procedure dorenwu16;
begin
 This_Npc.NpcDialog(This_Player,
 '附近的半兽人总是偷袭我们，真是烦死人了！\'+
 '好心人，赶快帮我去<杀15个半兽人/c=red>吧。\ \ '+
 '|{cmd}<我这就去(任务)/@doexit>\'
 );
end;

procedure dorenwu17;
begin
 This_Npc.NpcDialog(This_Player,
 '太好了，终于摆脱了烦人的半兽人，真是太谢谢你了！\'+
 '以后你要是有贵重的物品，可以放在我这里，帮你免费保存！ \ \'+
 '|{cmd}<完成(任务)/@renwu18>\'
 );
end;

procedure _renwu18;
begin
 if (This_Player.GetV(102,1)=13) then
 begin
 This_Npc.NpcDialog(This_Player,
 '据探子回报,最近沃玛森林的怪物异常活跃！麻烦你去沃玛森林的\'+
 '入口处找一下<流浪汉/c=red>，他对沃玛森林的情况会比较了解！\ \'+
 '|{cmd}<好的,我接受(任务)/@renwu19>\'
 );
 end else
 begin
 This_Player.SetV(102,1,13);        //任务标记
 This_Player.UpdateTaskDetail(102,1);
 This_Player.Give('经验',10000);
 This_Npc.NpcDialog(This_Player,
 '据探子回报，最近沃玛森林的怪物异常活跃！麻烦你去沃玛森林的\'+
 '入口处找一下<流浪汉/c=red>。他对沃玛森林的情况会比较了解！\ \'+
 '|{cmd}<好的,我接受(任务)/@renwu19>\'
 );
 end;  
end; 

procedure dorenwu18;
begin
 This_Npc.NpcDialog(This_Player,
 '据探子回报，最近沃玛森林的怪物异常活跃！麻烦你去沃玛森林的\'+
 '入口处找一下<流浪汉/c=red>。他对沃玛森林的情况会比较了解！\ \'+
 '|{cmd}<好的,我接受(任务)/@renwu19>\'
 );
end;

procedure _renwu19;
begin
 if (This_Player.GetV(103,1)=1) then
 begin
 This_Npc.NpcDialog(This_Player,
 '麻烦你去沃玛森林的入口处找一下<流浪汉/c=red>。\'+
 '他对沃玛森林的情况会比较了解！\ \'+
 '|{cmd}<好的，我这就去(任务)/@doexit>\'
 );
 end else
 begin
 This_Player.SetV(103,1,1);        //任务标记
 This_Player.SetV(102,1,9999);
 //#This_Player.DeleteTaskFromUIList(102);                 //先删除上一个任务号的内容，再添加下一个任务号的内容，顺序不能错！
 //#This_Player.AddTaskToUIList(103);
 This_Player.UpdateTaskDetail(103,1);
 This_Player.Give('经验',20000);
 This_Npc.CloseDialog(This_Player);
 //This_player.AutoGotoMap('0',330,47);   // 自动寻路 流浪汉 
 end;  
end; 

procedure dorenwu19;
begin
 This_Npc.NpcDialog(This_Player,
 '麻烦你去沃玛森林的入口处找一下<流浪汉/c=red>。 \'+
 '他对沃玛森林的情况会比较了解！\ \'+
 '|{cmd}<好的,我这就去(任务)/@doexit>\'
 );
end;

//==============================================================新手任务

procedure _DoMainExtra;
var
  CKRW102, CKRW103: integer;
begin
   CKRW102 := This_Player.GetV(102,1);
   CKRW103 := This_Player.GetV(103,1);
   if CKRW103 = 1 then
   begin
     dorenwu19;
   end
   else if CKRW102 = 13 then
   begin
     dorenwu18;
   end 
   else if CKRW102 = 12 then
   begin
     dorenwu17;
   end
   else if CKRW102 = 11 then
   begin
     dorenwu16;
   end
   else if CKRW102 = 10 then
   begin
     dorenwu15;
   end;
end;

Procedure domain;
var
  CKRW102, CKRW103: integer;
begin
   CKRW102 := This_Player.GetV(102,1);
   CKRW103 := This_Player.GetV(103,1);
   if CKRW103 = 1 then
   begin
      This_Npc.NpcDialog(This_Player,
      '需要帮什么忙吗？\目前不收保管费，请多利用。\ \' 
      +//'|{cmd}<开启仓库/@DoInputDialog1>\'
      +'|{cmd}<仓库管理/@storage>\'
      //+'|{cmd}<找回东西/@getback>                    \'//^<成长任务：探索沃玛森林/@DoMainExtra>\'
      +'|{cmd}<捆各种卷书和药水/@mbind>\'
      +'|{cmd}<退出/@doexit>');
   end else if (CKRW102 >= 10) and (CKRW102 <= 13) then
   begin
      This_Npc.NpcDialog(This_Player,
      '需要帮什么忙吗？\目前不收保管费，请多利用。\ \' 
      +//'|{cmd}<开启仓库/@DoInputDialog1>\'
      +'|{cmd}<仓库管理/@storage>\'
      //+'|{cmd}<找回东西/@getback>                  \'//^<成长任务：如何成为玛法勇士/@DoMainExtra>\'
      +'|{cmd}<捆各种卷书和药水/@mbind>\'
      +'|{cmd}<退出/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '需要帮什么忙吗？\目前不收保管费，请多利用。\ \' 
      +//'|{cmd}<开启仓库/@DoInputDialog1>\'
      +'|{cmd}<仓库管理/@storage>\'
      //+'|{cmd}<找回东西/@getback>\'
      +'|{cmd}<捆各种卷书和药水/@mbind>\'
      +'|{cmd}<退出/@doexit>');
   end;
end;

procedure _DoInputDialog1;
begin
  This_Npc.InputDialog(This_Player, '请输入：', 0, 100);
end;

procedure P100;
begin
  if This_Npc.InputOK then
    begin
      This_Player.ReqOpenStorage(This_Npc.InputStr);
    end;
end;

procedure _storage;
begin
  This_Npc.NpcDialog(This_Player,
  '需要保管什么东西？\ \ \ |{cmd}<返回/@main>'
  );
  This_Npc.Click_GetBack(This_Player);
end;

procedure _getback;
begin
  This_Npc.NpcDialog(This_Player,
  '请看目录决定找什么东西。\ \ \ |{cmd}<返回/@main>'
  );
  This_Npc.Click_GetBack(This_Player);
end;

procedure _mbind;
begin
  This_Npc.NpcDialog(This_Player,
  '你知道我是什么人吗？ \我做的是这样的事情... \你要试一下吗？有什么要拜托的就说吧 \ \'
  +'|{cmd}<金币换金条./@chgtobar> \'
  +'|{cmd}<金条换金币./@bartogold> \'
  +'|{cmd}<捆/@bind> \'
  +'|{cmd}<取消/@doexit>'
  );
end;

procedure _chgtobar;
begin
  This_Npc.Click_GoldChgBar(This_Player);
end;

procedure _bartogold;
begin
  This_Npc.Click_BartoGold(This_Player);
end;

procedure _bind;
begin
  This_Npc.NpcDialog(This_Player,
  '目前我能捆的只有卷书和药水 \你要捆吗？ \要捆东西需要100金币. \ \'
  +'|{cmd}<捆药水/@P_bind> \'
  +'|{cmd}<捆卷书/@Z_bind> \'
  );
end;

procedure _P_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<强效金创药捆/@ch_bind1>  \'
  +'|{cmd}<捆强效魔法药/@ma_bind1> \' 
  +'|{cmd}<捆金创药（中）/@ch_bind2> \'
  +'|{cmd}<捆魔法药（中）/@ma_bind2> \'
  +'|{cmd}<捆金创药/@ch_bind3> \'
  +'|{cmd}<捆魔法药/@ma_bind3> \'
  +'|{cmd}<返回/@bind>'
  );
end; 

procedure _Z_bind;
begin
  This_Npc.NpcDialog(This_Player,
  '|{cmd}<捆地牢逃脱卷/@zum_bind1> \'
  +'|{cmd}<捆随机传送卷/@zum_bind2> \'
  +'|{cmd}<捆回城卷/@zum_bind3>  \'
  +'|{cmd}<捆行会回城卷/@zum_bind4>  \'
  +'|{cmd}<返回/@bind>' 
  );
end;

//捆药模板
//item_src待捆绑的东西， item_des捆绑成的东西 
procedure DoBindDrug(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@P_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有要捆的药水，还捆什么? \'+
     '等准备好药水之后再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;
end;

procedure _ma_bind3;
begin
  DoBindDrug('魔法药(小量)', '魔法药(小)包');
end;

Procedure _ch_bind3;
begin
  DoBindDrug('金创药(小量)', '金创药(小)包');    
end;

Procedure _ma_bind2;
begin
  DoBindDrug('魔法药(中量)', '魔法药(中)包');  
end;

Procedure _ch_bind2;
begin
  DoBindDrug('金创药(中量)', '金创药(中)包');    
end;

Procedure _ma_bind1;
begin
  DoBindDrug('强效魔法药', '超级魔法药');     
end;

Procedure _ch_bind1;
begin
  DoBindDrug('强效金创药', '超级金创药');   
end;

//捆书卷模板
//item_src待捆绑的东西， item_des捆绑成的东西 
procedure DoBindBook(item_src, item_des: string);
begin
  if This_Player.GetBagItemCount(item_src) >= 6 then
  begin
     if (This_Player.GoldNum >=100) then
     begin
        This_Player.DecGold(100);
        This_Player.Take(item_src,6);
        This_Player.Give(item_des,1);
        This_Npc.NpcDialog(This_Player,
        '已经捆好了... 我的技术不错吧... \'+
        '还有要捆的就拿给我吧.. \ \'+
        '|{cmd}<继续捆/@Z_bind> \'+
        '|{cmd}<取消/@doexit>');
     end else
     begin
        This_Npc.NpcDialog(This_Player,
        '你都没有钱捆东西，\'+
        '还捆什么? 快走吧... \ \'+
        '|{cmd}<取消/@doexit>');
     end;
  end else
  begin
     This_Npc.NpcDialog(This_Player,
     '你都没有可以捆的卷书，还捆什么? \'+
     '等准备好之后，再来找我吧.. \ \'+
     '|{cmd}<取消/@doexit>');
  end;   
end; 

procedure _zum_bind4;
begin
  DoBindBook('行会回城卷', '行会回城卷包');
end;

Procedure _zum_bind3;
begin
  DoBindBook('回城卷', '回城卷包');  
end;

Procedure _zum_bind2;
begin
  DoBindBook('随机传送卷', '随机传送卷包');  
end;

Procedure _zum_bind1;
begin
  DoBindBook('地牢逃脱卷', '地牢逃脱卷包');  
end;

begin
  domain;
end. 