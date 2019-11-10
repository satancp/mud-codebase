{********************************************************************

*******************************************************************}
   



//=========================  药品仓库   ======================================== 
Procedure _CangKuMed;
begin
   This_NPC.NpcDialog(This_Player,
   '药品仓库：只能存储疗伤药、万年雪霜、强效太阳水。\ \'+
   '|{cmd}<存储药品/@CKMed_sto>                ^<取回药品/@CKMed_GeBak>\ \'+
   '|{cmd}<使用药罐/@CangKuMedGZ1>                ^<获得药罐/@CangKuMedGZ2>\ \'+
   '|{cmd}<返回/@main>'
   );
end;

//药品仓库——存储； 
Procedure _CKMed_sto;
var
  iMed01,iMed02, iMed03: integer;
begin
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);

   if iMed01 < 0 then
   begin
      iMed01 := 0;
   end;

   if iMed02 < 0 then
   begin
      iMed02 := 0;
   end;
   
   if iMed03 < 0 then
   begin
      iMed03 := 0;
   end;    

   This_NPC.NpcDialog(This_Player,
   '你在药品仓库存储的药品数量为（该药品仓库可存储总量为500）。\'+
   '你想要存储什么药品呢？\'+
   '|疗伤药：       <' + inttostr(iMed01) + '/c=red>\'+ 
   '^万年雪霜：     <' + inttostr(iMed02) + '/c=red>\'+
   '|强效太阳水：   <' + inttostr(iMed03) + '/c=red>\'+ 
   '|{cmd}<存1瓶疗伤药/@CKMed_sto01>     ^<存5瓶疗伤药/@CKMed_sfv01>\'+ 
   '|{cmd}<存1个万年雪霜/@CKMed_sto02>   ^<存5个万年雪霜/@CKMed_sfv02>\'+
   '|{cmd}<存1瓶强效太阳水/@CKMed_sto03> ^<存5瓶强效太阳水/@CKMed_sfv03>\'+ 
   '|{cmd}<返回/@CangKuMed>'
   );
end;

//参数1=物品名称；  参数2=对应99号任务号的字段；  参数3=字段号从2开始到几； 参数4=存储物品的数量 
procedure CKMStorage(STItm : string; iVval, ihigh, iTKNum: integer);
var
  iGtv01, iGtv02, iTemp, iST0,iMed01, iMed02, iMed03: integer;
begin
   if not(This_Player.CheckAuthen(1,100)) then exit;
   iGtv01 := 0;
   //计算仓库所存药品的总数量 
   for iTemp := 1 to ihigh do
   begin
      iST0 := This_Player.GetV(98,iTemp);
      //为避免所有物品数量相加之后（可能有-1）减小1，都置零。 
      if iST0 < 0 then
      begin
         This_Player.SetV(98,iTemp,0);
         iST0 := 0;
      end;
      
      iGtv01 := iGtv01 + iST0;
   end;
   //若大于500，表已满
   if iGtv01 >= 500 then
   begin
      This_NPC.NpcDialog(This_Player,
      '你的药品仓库已满，不能再存储药品了！\ \'+
      '|{cmd}<返回/@CangKuMed>');
      Exit;
   end;
   //若存了当前数量的物品后大于500，不可存； 
   if iGtv01 > 500 - iTKNum then
   begin
      This_NPC.NpcDialog(This_Player,
      '你的药品仓库太满，你不能再存储这么多的药品了！\ \'+
      '|{cmd}<返回/@CangKuMed>');
      Exit;
   end;
   
   //若包裹中药品数量不够； 
   if This_Player.GetBagItemCount(STItm) < iTKNum then
   begin
      This_NPC.NpcDialog(This_Player,
      '你没有可存储的' + inttostr(iTKNum) + '个' + STItm + '……\ \'+
      '|{cmd}<返回/@CangKuMed>');
      Exit;
   end else
   begin 
      //获取当前的药品的数量 
      iGtv02 := This_Player.GetV(98,iVval);
      if iGtv02 = -1 then
      begin
         iGtv02 := 0;
      end;
      
      if This_Player.Take(STItm,iTKNum) then
      begin
         //药品累加； 
         iGtv02 := iGtv02 + iTKNum;
         This_Player.SetV(98,iVval,iGtv02);
         iMed01 := This_Player.GetV(98,1);
         iMed02 := This_Player.GetV(98,2);
         iMed03 := This_Player.GetV(98,3);

         if iMed01 < 0 then
         begin
            iMed01 := 0;
         end;

         if iMed02 < 0 then
         begin
            iMed02 := 0;
         end;
   
         if iMed03 < 0 then
         begin
            iMed03 := 0;
         end;
         
         This_NPC.NpcDialog(This_Player,
         '你在药品仓库存储的药品数量为（该药品仓库可存储总量为500）。\'+
         '你想要存储什么药品呢？\'+
         '|疗伤药：       <' + inttostr(iMed01) + '/c=red>\'+ 
         '^万年雪霜：     <' + inttostr(iMed02) + '/c=red>\'+
         '|强效太阳水：   <' + inttostr(iMed03) + '/c=red>\'+
         '|{cmd}<存1瓶疗伤药/@CKMed_sto01>      ^<存5瓶疗伤药/@CKMed_sfv01>\'+ 
         '|{cmd}<存1个万年雪霜/@CKMed_sto02>    ^<存5个万年雪霜/@CKMed_sfv02>\'+
         '|{cmd}<存1瓶强效太阳水/@CKMed_sto03>  ^<存5瓶强效太阳水/@CKMed_sfv03>\'+          
         '|{cmd}<返回/@CangKuMed>'
         );
      end;
   end;
end;

Procedure _CKMed_sto01;
begin
   CKMStorage('疗伤药',1,3,1);
end;

Procedure _CKMed_sto02;
begin
   CKMStorage('万年雪霜',2,3,1);
end;

Procedure _CKMed_sto03;
begin
   CKMStorage('强效太阳水',3,3,1); 
end;

Procedure _CKMed_sfv01;
begin
   CKMStorage('疗伤药',1,3,5);
end;

Procedure _CKMed_sfv02;
begin
   CKMStorage('万年雪霜',2,3,5);
end;

Procedure _CKMed_sfv03;
begin
   CKMStorage('强效太阳水',3,3,5); 
end;

//药品仓库——取回； 
Procedure _CKMed_GeBak;
var
  iMed01,iMed02, iMed03: integer;
begin
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);

   if iMed01 < 0 then
   begin
      iMed01 := 0;
   end;

   if iMed02 < 0 then
   begin
      iMed02 := 0;
   end;
   
   if iMed03 < 0 then
   begin
      iMed03 := 0;
   end;

   This_NPC.NpcDialog(This_Player,
   '你在药品仓库存储的药品数量为（该药品仓库可存储总量为500）。\'+
   '你想要取回什么药品呢？\'+
   '|疗伤药：       <' + inttostr(iMed01) + '/c=red>\'+ 
   '^万年雪霜：     <' + inttostr(iMed02) + '/c=red>\'+
   '|强效太阳水：   <' + inttostr(iMed03) + '/c=red>\'+
   '|{cmd}<取1瓶疗伤药/@CKMed_GeBak01>     ^<取5瓶疗伤药/@CKMed_GBfv01> \'+  
   '|{cmd}<取1个万年雪霜/@CKMed_GeBak02>   ^<取5个万年雪霜/@CKMed_GBfv02>\'+
   '|{cmd}<取1瓶强效太阳水/@CKMed_GeBak03> ^<取5瓶强效太阳水/@CKMed_GBfv03>\'+ 
   '|{cmd}<返回/@CangKuMed>'
   );
end;

//参数1=物品名称；  参数2=对应99号任务号的字段；  参数3=字段号从2开始到几； 参数4=取回物品的数量 
procedure CKMGetBK(STItm : string; iVval,ihigh,iTKNum: integer);
var
  iGtv01, iGtv02, iTemp, iST0,iMed01, iMed02, iMed03: integer;
begin
   iGtv01 := 0;
   for iTemp := 1 to ihigh do
   begin
      iST0 := This_Player.GetV(98,iTemp);
      //为避免所有物品数量相加之后（可能有-1）减小1，都置零。 
      if iST0 < 0 then
      begin
         This_Player.SetV(98,iTemp,0);
         iST0 := 0;
      end;
      
      iGtv01 := iGtv01 + iST0;
   end;
   
   //所存药品总数不能大于500；传家宝5星不能大于800 
   if iGtv01 > 500 then
   begin
      Exit;
   end;
   
   //仓库药品总数小于0，不能取 
   if iGtv01 <= 0 then
   begin
      This_NPC.NpcDialog(This_Player,
      '你的药品仓库里没有任何东西，不能取回药品。\ \'+
      '|{cmd}<返回/@CangKuMed>');
      Exit;
   end;
   
   iGtv02 := This_Player.GetV(98,iVval);
   if iGtv02 < iTKNum then
   begin
      This_NPC.NpcDialog(This_Player,
      '你的药品仓库里没有存储足够的' + STItm + '，不能取回该药品。\ \'+
      '|{cmd}<返回/@CangKuMed>');
      Exit;
   end;
   
   if This_Player.FreeBagNum < iTKNum then
   begin
      This_NPC.NpcDialog(This_Player,
      '你的包裹太满，请整理之后再来取回药品。\ \'+
      '|{cmd}<返回/@CangKuMed>');
      Exit;
   end else
   begin
      iGtv02 := iGtv02 - iTKNum;
      if This_Player.SetV(98,iVval,iGtv02) then
      begin
         This_Player.Give(STItm,iTKNum);
         iMed01 := This_Player.GetV(98,1);
         iMed02 := This_Player.GetV(98,2);
         iMed03 := This_Player.GetV(98,3);
         
         if iMed01 < 0 then
         begin
            iMed01 := 0;
         end;

         if iMed02 < 0 then
         begin
            iMed02 := 0;
         end;
   
         if iMed03 < 0 then
         begin
            iMed03 := 0;
         end;
         
         This_NPC.NpcDialog(This_Player,
         '你在药品仓库存储的药品数量为（该药品仓库可存储总量为500）。\'+
         '你想要取回什么药品呢？\'+
         '|疗伤药：       <' + inttostr(iMed01) + '/c=red>\'+ 
         '^万年雪霜：     <' + inttostr(iMed02) + '/c=red>\'+
         '|强效太阳水：   <' + inttostr(iMed03) + '/c=red>\'+
         '|{cmd}<取1瓶疗伤药/@CKMed_GeBak01>     ^<取5瓶疗伤药/@CKMed_GBfv01> \'+  
         '|{cmd}<取1个万年雪霜/@CKMed_GeBak02>   ^<取5个万年雪霜/@CKMed_GBfv02> \'+  
         '|{cmd}<取1瓶强效太阳水/@CKMed_GeBak03> ^<取5瓶强效太阳水/@CKMed_GBfv03>\'+  
         '|{cmd}<返回/@CangKuMed>'
         );
      end;
   end; 
end;


Procedure _CKMed_GeBak01;
begin
   CKMGetBK('疗伤药',1,3,1);
end;

Procedure _CKMed_GeBak02;
begin
   CKMGetBK('万年雪霜',2,3,1);
end;

Procedure _CKMed_GeBak03;
begin
   CKMGetBK('强效太阳水',3,3,1);
end;

Procedure _CKMed_GBFv01;
begin
   CKMGetBK('疗伤药',1,3,5);
end;

Procedure _CKMed_GBFv02;
begin
   CKMGetBK('万年雪霜',2,3,5);
end;

Procedure _CKMed_GBFv03;
begin
   CKMGetBK('强效太阳水',3,3,5);
end;

//药品仓库--药罐
Procedure _CangKuMedGZ1;
var
  iMed01,iMed02, iMed03: integer;
begin
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);

   if iMed01 < 0 then
   begin
      iMed01 := 0;
   end;

   if iMed02 < 0 then
   begin
      iMed02 := 0;
   end;
   
   if iMed03 < 0 then
   begin
      iMed03 := 0;
   end;    

   This_NPC.NpcDialog(This_Player,
   '你在药品仓库存储的药品数量为（该药品仓库可存储总量为500）。\'+
   '你想要存储什么药品呢？\'+
   '|疗伤药：       <' + inttostr(iMed01) + '/c=red>\'+ 
   '^万年雪霜：     <' + inttostr(iMed02) + '/c=red>\'+
   '|强效太阳水：   <' + inttostr(iMed03) + '/c=red>\'+ 
   '|{cmd}<扣除1个疗伤药罐，增加50瓶库存/@CKMed_sgz01>\'+
   '|{cmd}<扣除1个万年雪霜罐，增加50个库存/@CKMed_sgz02>\'+
   '|{cmd}<扣除1个强效太阳水罐，增加50瓶库存/@CKMed_sgz03>\'+
   '|{cmd}<返回/@CangKuMed>'
   );
end;

Procedure _CangKuMedGZ2;
var
  iMed01,iMed02, iMed03: integer;
begin
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);

   if iMed01 < 0 then
   begin
      iMed01 := 0;
   end;

   if iMed02 < 0 then
   begin
      iMed02 := 0;
   end;
   
   if iMed03 < 0 then
   begin
      iMed03 := 0;
   end;

   This_NPC.NpcDialog(This_Player,
   '你在药品仓库存储的药品数量为（该药品仓库可存储总量为500）。\'+
   '你想要取回什么药品呢？\'+
   '|疗伤药：       <' + inttostr(iMed01) + '/c=red>\'+ 
   '^万年雪霜：     <' + inttostr(iMed02) + '/c=red>\'+
   '|强效太阳水：   <' + inttostr(iMed03) + '/c=red>\'+    
   '|{cmd}<50瓶疗伤药库存兑换1个疗伤药罐/@CKMed_GBgz01>\'+
   '|{cmd}<50个万年雪霜库存兑换1个万年雪霜罐/@CKMed_GBgz02>\'+
   '|{cmd}<50瓶强效太阳水库存兑换1个强效太阳水罐/@CKMed_GBgz03>\'+
   '|{cmd}<返回/@CangKuMed>' 
   );
end;
 

procedure _CKMed_sgz01;
var
iMed01,iMed02,iMed03,iGtv01,iGtv:integer;
begin
   if not(This_Player.CheckAuthen(1,100)) then exit;
   if This_Player.GetV(98,1) < 0 then This_Player.SetV(98,1,0);
   if This_Player.GetV(98,2) < 0 then This_Player.SetV(98,2,0);
   if This_Player.GetV(98,3) < 0 then This_Player.SetV(98,3,0);
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);
   iGtv01 := iMed01 + iMed02 + iMed03;
   iGtv := 500 - iGtv01;
   if iGtv >= 50 then
   begin 
     if This_Player.GetBagItemCount('疗伤药罐') > 0 then
     begin
     This_Player.Take('疗伤药罐',1); 
     This_Player.SetV(98,1,iMed01+50);   
     end else
     begin
     This_Player.PlayerNotice('疗伤药罐不足。',2);
     end;
   end else
   begin
   This_Player.PlayerNotice('药品仓库已满。',2);
   end;  
   _CangKuMedGZ1;
end;

procedure _CKMed_sgz02;
var
iMed01,iMed02,iMed03,iGtv01,iGtv:integer;
begin
   if not(This_Player.CheckAuthen(1,100)) then exit;
   if This_Player.GetV(98,1) < 0 then This_Player.SetV(98,1,0);
   if This_Player.GetV(98,2) < 0 then This_Player.SetV(98,2,0);
   if This_Player.GetV(98,3) < 0 then This_Player.SetV(98,3,0);
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);
   iGtv01 := iMed01 + iMed02 + iMed03;
   iGtv := 500 - iGtv01;
   if iGtv >= 50 then
   begin 
     if This_Player.GetBagItemCount('万年雪霜罐') > 0 then
     begin
     This_Player.Take('万年雪霜罐',1); 
     This_Player.SetV(98,2,iMed02+50);   
     end else
     begin
     This_Player.PlayerNotice('万年雪霜罐不足。',2);
     end;
   end else
   begin
   This_Player.PlayerNotice('药品仓库已满。',2);
   end;  
    _CangKuMedGZ1;
end;

procedure _CKMed_sgz03;
var
iMed01,iMed02,iMed03,iGtv01,iGtv:integer;
begin
   if not(This_Player.CheckAuthen(1,100)) then exit;
   if This_Player.GetV(98,1) < 0 then This_Player.SetV(98,1,0);
   if This_Player.GetV(98,2) < 0 then This_Player.SetV(98,2,0);
   if This_Player.GetV(98,3) < 0 then This_Player.SetV(98,3,0);
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);
   iGtv01 := iMed01 + iMed02 + iMed03;
   iGtv := 500 - iGtv01;
   if iGtv >= 50 then
   begin 
     if This_Player.GetBagItemCount('强效太阳水罐') > 0 then
     begin
     This_Player.Take('强效太阳水罐',1); 
     This_Player.SetV(98,3,iMed03+50);   
     end else
     begin
     This_Player.PlayerNotice('强效太阳水罐不足。',2);
     end;
   end else
   begin
   This_Player.PlayerNotice('药品仓库已满。',2);
   end;  
    _CangKuMedGZ1;
end;

procedure _CKMed_GBgz01;
var
iMed01,iMed02,iMed03:integer;
begin
   if This_Player.GetV(98,1) < 0 then This_Player.SetV(98,1,0);
   if This_Player.GetV(98,2) < 0 then This_Player.SetV(98,2,0);
   if This_Player.GetV(98,3) < 0 then This_Player.SetV(98,3,0);
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);
   if iMed01 >= 50 then
   begin 
     if This_Player.FreeBagNum > 0 then
     begin
     This_Player.Give('疗伤药罐',1); 
     This_Player.SetV(98,1,iMed01-50);   
     end else
     begin
     This_Player.PlayerNotice('包裹空间不足。',2);
     end;
   end else
   begin
   This_Player.PlayerNotice('疗伤药不足。',2);
   end;  
   _CangKuMedGZ2;
end;

procedure _CKMed_GBgz02;
var
iMed01,iMed02,iMed03:integer;
begin
   if This_Player.GetV(98,1) < 0 then This_Player.SetV(98,1,0);
   if This_Player.GetV(98,2) < 0 then This_Player.SetV(98,2,0);
   if This_Player.GetV(98,3) < 0 then This_Player.SetV(98,3,0);
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);
   if iMed02 >= 50 then
   begin 
     if This_Player.FreeBagNum > 0 then
     begin
     This_Player.Give('万年雪霜罐',1); 
     This_Player.SetV(98,2,iMed02-50);   
     end else
     begin
     This_Player.PlayerNotice('包裹空间不足。',2);
     end;
   end else
   begin
   This_Player.PlayerNotice('万年雪霜不足。',2);
   end;  
   _CangKuMedGZ2;
end;

procedure _CKMed_GBgz03;
var
iMed01,iMed02,iMed03:integer;
begin
   if This_Player.GetV(98,1) < 0 then This_Player.SetV(98,1,0);
   if This_Player.GetV(98,2) < 0 then This_Player.SetV(98,2,0);
   if This_Player.GetV(98,3) < 0 then This_Player.SetV(98,3,0);
   iMed01 := This_Player.GetV(98,1);
   iMed02 := This_Player.GetV(98,2);
   iMed03 := This_Player.GetV(98,3);
   if iMed03 >= 50 then
   begin 
     if This_Player.FreeBagNum > 0 then
     begin
     This_Player.Give('强效太阳水罐',1); 
     This_Player.SetV(98,3,iMed03-50);   
     end else
     begin
     This_Player.PlayerNotice('包裹空间不足。',2);
     end;
   end else
   begin
   This_Player.PlayerNotice('强效太阳水不足。',2);
   end;  
   _CangKuMedGZ2;
end;

//=========================  药品仓库   ======================================== 
  