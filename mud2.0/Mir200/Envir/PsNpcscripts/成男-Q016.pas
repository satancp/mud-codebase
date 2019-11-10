{********************************************************************

*******************************************************************}
program mir2;

{$I common.pas}

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;

Procedure domain;
begin
   //if This_Player.GetV(9,18) = 1 then
   if This_Player.GetV(11,1) >= 14 then 
   This_NPC.NpcDialog(This_Player,
   '我做的东西给人之后，也就是一旦进行了一次交易之后，\'
   +'是不会再做交易的. 快回去吧 \ \'
   +'|{cmd}<取消/@exit>'
   ) 
   else
   This_NPC.NpcDialog(This_Player,
   '你到来到这里了, 我总不能看着不管. \'
   +'我在这里生活这么长时间，做了几件东西. \'
   +'这些东西在外面卖多少钱我不知道. \'
   +'但是我对这些宝贝充满信心. \'
   +'要观看这些东西吗?? \ \'
   +'|{cmd}<观看/@Q316_1> \'
   +'|{cmd}<不看/@Q316_2>'
   );

end;

procedure _Q316_2;
begin
   This_NPC.NpcDialog(This_Player,
   '不看是吧? 好..可以理解, 那么请回去吧... \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q316_1;
begin
    case This_Player.Job  of
        0 : 
        begin
           This_NPC.NpcDialog(This_Player,
           '我只给你看一次我制作的东西.看好了.\'
           +'不要关闭窗口.\ '
           +'|{cmd}<拜托/@Q316_1_1>制作炼狱(金条1,纯度18以上的金矿5个) \'
           +'|{cmd}<拜托/@Q316_1_4>制作祝福油(金币50万，强效太阳水5) \'
           +'|{cmd}<购买/@book1>半月弯刀(120万金币)\'
           +'|{cmd}<取消/@exit>'
           );
        
          
        end;
        1 :
        begin
        
           This_NPC.NpcDialog(This_Player,
           '我只给你看一次我制作的东西.看好了.\'
           +'不要关闭窗口.\ '
           +'|{cmd}<拜托/@Q316_1_3> 制作魔杖(金条1，纯度18以上的金矿3)\'
           +'|{cmd}<拜托/@Q316_1_4>制作祝福油(金币50万, 强效太阳水5) \'
           +'|{cmd}<购买/@book2>魔法盾(120万金币)\'
           +'|{cmd}<取消/@exit>'
           
           );
        end;
        2 : 
        begin
           This_NPC.NpcDialog(This_Player,
           '我只给你看一次我制作的东西.看好了.\'
           +'不要关闭窗口.\ '
           +'|{cmd}<拜托/@Q316_1_2>制作银蛇(金条1，纯度18以上的金矿4) \'
           +'|{cmd}<拜托/@Q316_1_4>制作祝福油(金币50万, 强效太阳水5) \'
           +'|{cmd}<购买/@book3>困魔咒(120万金币)\'
           +'|{cmd}<取消/@exit>'
           );
        end;
    end;
end;



procedure _book1;
begin
    if This_Player.GoldNum >= 1200000 then
    begin
        This_Player.DecGold(1200000);
        This_Player.Give('半月弯刀',1);
        This_Player.SetV(9,18,1); 
       This_NPC.NpcDialog(This_Player,
       '书已经给你了。\\'
       +'|{cmd}<返回/@main>'
       );

    end else
   This_NPC.NpcDialog(This_Player,
   '你的金币不够，\'
   +'需要120万才能买书。\\'
   +'|{cmd}<返回/@main>'
   );


end;



procedure _book2;
begin
    if This_Player.GoldNum >= 1200000 then
    begin
        This_Player.DecGold(1200000);
        This_Player.Give('魔法盾',1);
        This_Player.SetV(9,18,1); 
       This_NPC.NpcDialog(This_Player,
       '书已经给你了。\\'
       +'|{cmd}<返回/@main>'
       );

    end else
   This_NPC.NpcDialog(This_Player,
   '你的金币不够，\'
   +'需要120万才能买书。\\'
   +'|{cmd}<返回/@main>'
   
   );

end;



procedure _book3;
begin
    if This_Player.GoldNum >= 1200000 then
    begin
        This_Player.DecGold(1200000);
        This_Player.Give('困魔咒',1);
        This_Player.SetV(9,18,1); 
       This_NPC.NpcDialog(This_Player,
       '书已经给你了。\\'
       +'|{cmd}<返回/@main>'
       );

    end else
   This_NPC.NpcDialog(This_Player,
   '你的金币不够，\'
   +'需要120万才能买书。\\'
   +'|{cmd}<返回/@main>'
   );

end;

procedure _Nopay1;
begin
   This_NPC.NpcDialog(This_Player,
   '很抱歉. 炼狱目前只能制作一个. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q316_1_1;
var
num,duramax,duraav : integer;
begin
   This_Player.CheckBagItemEx('金矿',num,duramax,duraav);
  // This_Player.PlayerNotice('金矿' + inttostr(num) + '-' + inttostr(duramax) ,2);
  if This_Player.GetV(11,1) = 13 then
  begin
     if (num >= 5) and (duramax > 17500) and (This_Player.GetBagItemCount('金条') > 0) then
     begin
        This_Player.Take('金矿',5);
        This_Player.Take('金条',1);
        This_Player.Give('炼狱',1);
        This_Player.RandomFlyTo('D002');
        //This_Player.SetV(9,18,1); 
        This_Player.SetV(11,1,14);
     end else
     This_NPC.NpcDialog(This_Player,
     '制作炼狱, 需要刚才说的那些材料. \'
     +'把材料准备好了，才能制作炼狱, \'
     +'没有材料怎么制作呢? \ \'
     +'|{cmd}<取消/@exit>'
     );
  end;
end;

procedure _Nopay2;
begin
   This_NPC.NpcDialog(This_Player,
   '很抱歉. 目前银蛇目前只能制作一个. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q316_1_2;
var
num,duramax,duraav : integer;
begin
   if This_Player.GetV(11,1) = 13 then
   begin 
       This_Player.CheckBagItemEx('金矿',num,duramax,duraav);
       This_Player.PlayerNotice('金矿' + inttostr(num) + '-' + inttostr(duramax) ,2);
       if (num >= 4) and (duramax > 17500) and (This_Player.GetBagItemCount('金条') > 0) then
       begin
          This_Player.Take('金矿',4);
          This_Player.Take('金条',1);
          This_Player.Give('银蛇',1);
          This_Player.RandomFlyTo('D002');
          //This_Player.SetV(9,18,1); 
          This_Player.SetV(11,1,14);
       end else
       This_NPC.NpcDialog(This_Player,
       '制作银蛇, 需要刚才说的那些材料. \'
       +'把材料准备好了，才能制作银蛇, \'
       +'没有材料怎么制作呢? \ \'
       +'|{cmd}<取消/@exit>'
       );
   end;
end;

procedure _Nopay3;
begin
   This_NPC.NpcDialog(This_Player,
   '很抱歉. 目前魔杖只能制作一个. \ \'
   +'|{cmd}<取消/@exit>'
   
   );

end;

procedure _Q316_1_3;
var
num,duramax,duraav : integer;
begin
   if This_Player.GetV(11,1) = 13 then
   begin 
       This_Player.CheckBagItemEx('金矿',num,duramax,duraav);
       This_Player.PlayerNotice('金矿' + inttostr(num) + '-' + inttostr(duramax) ,2);
       if (num >= 3) and (duramax > 17500) and (This_Player.GetBagItemCount('金条') > 0) then
       begin
          This_Player.Take('金矿',3);
          This_Player.Take('金条',1);
          This_Player.Give('魔杖',1);
          This_Player.RandomFlyTo('D002');
          //This_Player.SetV(9,18,1); 
          This_Player.SetV(11,1,14);
       end else
       This_NPC.NpcDialog(This_Player,
       '制作魔杖, 需要刚才说的那些材料. \'
       +'把材料准备好了，才能制作魔杖, \'
       +'没有材料怎么制作呢? \ \'
       +'|{cmd}<取消/@exit>'
       
       );
   end;
end;


procedure _Nopay4;
begin
   This_NPC.NpcDialog(This_Player,
   '很抱歉. 目前祝福油只有5个. \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

procedure _Q316_1_4;
begin
    if This_Player.GetV(11,1) = 13 then
   begin 
    if (This_Player.GoldNum >= 500000) and (This_Player.GetBagItemCount('强效太阳水') >= 5) then
    begin
        This_Player.DecGold(500000);
        This_Player.Take('强效太阳水',5);
        This_Player.Give('祝福油',1);
          This_Player.RandomFlyTo('D002');
          //This_Player.SetV(9,18,1); 
          This_Player.SetV(11,1,14); 
    end;
   This_NPC.NpcDialog(This_Player,
   '制作祝福油, 需要刚才说的那些材料. \'
   +'把材料准备好了，才能制作, \'
   +'没有材料怎么制作呢? \ \'
   +'|{cmd}<取消/@exit>'
   );
   end;
end;

procedure _Q317;
begin
   This_NPC.NpcDialog(This_Player,
   '我做的东西给人之后，也就是一旦进行了一次交易之后，\'
   +'是不会再做交易的. 快回去吧 \ \'
   +'|{cmd}<取消/@exit>'
   );

end;

begin
  domain;
end. 