{********************************************************************

* 单元名称：怒气商人
* 单元作者： 
* 摘    要：
* 备    注：

        
*******************************************************************}
program Mir2;

Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

function Gaoji0LB(price, num: Integer):boolean;
var gongji : integer;
begin 
  This_Player.Give('九花雪露',6);                                                    

  result := true;
end;

procedure _buy01;
begin
  if This_Player.FreeBagNum >5 then
  begin 
    This_Player.PsYBConsum(This_NPC,'Gaoji0LB',20050,1,1);
  end else
  begin
    This_NPC.NpcDialog(This_Player,'您的包裹不足，无法获得九花雪露！'); 
  end;      
end;

procedure _buy;
begin
  This_NPC.NpcDialog(This_Player,
  '九花雪露可增加5000点怒气值。\ \'
  +'|{cmd}<使用1元宝购买6个九花雪露/@buy01>\ \'
  +'|{cmd}<使用100灵符购买6个九花雪露/@buyJHYL02>\'
  +'|{cmd}<使用50灵符购买3个九花雪露/@buyJHYL03>\'
  +'|{cmd}<使用17灵符购买1个九花雪露/@buyJHYL04>\ \'
  +'|{cmd}<返回/@main>\'   
  ); 
end;

procedure buyJHYLCom(NeedGL: integer; sGvitem: string; iGvNum, iNeedBag: integer);
begin
   if This_Player.MyLFnum  < NeedGL then
   begin
      This_NPC.NpcDialog(This_Player,'你没有足够的灵符！');
      exit;
   end;
   
   if This_Player.FreeBagNum < iNeedBag then
   begin
      This_NPC.NpcDialog(This_Player,'您的包裹不足，无法获得九花雪露！');
      exit;
   end;
   

      This_Player.DecLF(20050,NeedGL,false);
      This_Player.Give(sGvitem,iGvNum);

end;

procedure _buyJHYL02;
begin
   buyJHYLCom(100,'九花雪露',6,6);
end;

procedure _buyJHYL03;
begin
   buyJHYLCom(50,'九花雪露',3,3);
end;

procedure _buyJHYL04;
begin
   buyJHYLCom(17,'九花雪露',1,1);
end;

//提升合击熟练度---------begin
Procedure _HeJiSLDu;
var
  ret : Integer;
begin
   ret := This_Player.ChkIfCanAddUSExp;
   if (ret = 0) then
   begin
      This_Npc.NpcDialog(This_Player,
      '看来你在修炼合击的过程中遇到了麻烦。\'+
      '我想我能够帮助你快速提升你的合击熟练度。\'+
      '只要你给我1灵符或限时灵符以及5000点怒气值，\'+
      '我能够立刻为你或你的英雄提升50点合击熟练度，如何？\ \'+
      '|{cmd}<请帮助提升合击熟练度/@TiHeJii>\ \'+
      '|{cmd}<返回/@main>');
   end else if ret < 0 then
   begin
      case ret of
        -1:  This_NPC.NpcDialog(This_Player,
             '您没有招出英雄，请招出英雄再提升合击熟练度。');
             
        -2:  This_NPC.NpcDialog(This_Player,
             '您的英雄没有习得合击，无法提升合击熟练度。');
             
        -3:  This_NPC.NpcDialog(This_Player,
             '请为您的英雄装备火龙之心，否则无法快速提升合击熟练度。'); 
      end;
   end;
end;

Procedure _TiHeJii;
var
  ret : Integer;
  error: string; 
begin
   ret := This_Player.AddUSExp(1, 5000, 50);
   if ret >= 0 then
   begin
     This_Npc.NpcDialog(This_Player,
      '您确定使用1灵符或限时灵符，并消耗5000怒气值，\提升合击熟练度吗？\ \'+
      '|{cmd}<继续提升熟练度/@TiHeJii>\ \'+
      '|{cmd}<返回/@main>');
   end else  
   begin
      case ret of
        -1: error := '您没有招出英雄，请招出英雄再提升合击熟练度。';
        -2: error := '您的英雄没有习得合击，无法提升合击熟练度。';
        -3: error := '请为您的英雄装备火龙之心，否则无法快速提升合击熟练度。';
        -4: error := '您没有足够的灵符或限时灵符，无法快速提升合击熟练度。';
        -5: error := '您没有足够的怒气值，无法快速提升合击熟练度。';
        -6: error := '您的合击熟练度已到达当前合击等级的上限，无法继续提升。';
      end;
      error := error + '\<返回/@HeJiSLDu>';
      This_NPC.NpcDialog(This_Player,error);
   end;
end;
//提升合击熟练度---------end

//回收和购买火龙之心
procedure _Shlong01;
begin
   This_NPC.NpcDialog(This_Player,
   '火龙之心是使用合击的必备之物，你确定要回收包裹中的火龙之心\'+
   '么？\ \'+
   '|{cmd}<确认回收/@Shlong01_1>\ \ \ \'+
   '|{cmd}<返回/@main>\'
  );
end; 

procedure _Shlong01_1;
begin
   if This_Player.GetBagItemCount('火龙之心') < 1 then
   begin
      This_NPC.NpcDialog(This_Player,'你没有火龙之心，不能回收。\ \<返回/@Shlong01>');
   end else
   begin
      This_Player.Take('火龙之心',1);
   end;
end;

procedure _Shlong02;
begin
   This_NPC.NpcDialog(This_Player,
   '火龙之心是使用合击的必备之物，你可以在这里购买火龙之心。\'+
   '|{cmd}<火龙之心，购买时装满怒气并绑定。/c=red>\ \'+
   '|{cmd}<使用1元宝购买一个火龙之心/@Shlong02_1>\'+
   '|{cmd}<使用100灵符购买一个火龙之心/@Shlong02_2>\ \'+
   '|{cmd}<返回/@main>\'
   );
end;

function ShenLYb(price, num: Integer): boolean;
begin
   This_Player.Give('火龙之心',1);
   This_Player.PlayerNotice('你购买获得了：火龙之心。',2);
   result := true;
end; 

procedure _Shlong02_1;
begin
   if This_Player.FreeBagNum < 1 then
   begin
      This_NPC.NpcDialog(This_Player,'你的包裹太满了……\ \<返回/@Shlong02>');
   end else
   begin
      This_Player.PsYBConsum(This_NPC,'ShenLYb',20247,1,1);
   end;
end;

procedure _Shlong02_2;
begin
   if This_Player.MyLFnum  < 100 then
   begin
      This_NPC.NpcDialog(This_Player,'你的灵符不足……\ \<返回/@Shlong02>');
      exit;
   end;
   
   if This_Player.FreeBagNum < 1 then
   begin
      This_NPC.NpcDialog(This_Player,'你的包裹太满了……\ \<返回/@Shlong02>');
   end else
   begin
      This_Player.DecLF(20247,100,false);
      This_Player.Give('火龙之心',1);

   end;
end;

Begin
  This_NPC.NpcDialog(This_Player,
  '货真价实，童叟无欺，随到随卖，货物充足。\ \'
  +'|{cmd}<出售九花雪露/@BUY>\'
  +'|{cmd}<使用灵符提升合击熟练度/@HeJiSLDu>\'
  +'|{cmd}<回收火龙之心/@Shlong01>\'
  +'|{cmd}<购买火龙之心/@Shlong02>\ \'
  +'|{cmd}<退出/@doexit>\'
  );  
end.