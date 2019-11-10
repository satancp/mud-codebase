      {
*******************************************************************}

program Mir2;

procedure _shibao;
begin   
     if This_Player.MyLFnum >= 100 then
      begin
       if This_Player.FreeBagNum > 10 then
      
        begin
         This_Player.PsYBConsum(This_NPC,'YB_NewComeBag',20331,100,1);

         This_Player.Give('疗伤药包',10);
        end 
         else  
        begin
          This_Player.PlayerDialog(
         '对不起，包裹空间不足，请预留10个以上再次开启！'
         ); 
        end;
      end 
      else 
      begin
          This_Player.PlayerDialog(
          '对不起，您的元宝不足100个！\'
          ); 
      end;
end;


function YB_NewComeBag(price, num: Integer):boolean; //YB_NewComeBag为自定义回调函数名称，其余参数为固定格式 ，不可以改变 
begin
   result := true; 
   
end;




begin
  This_Npc.NpcDialog(This_Player,
    '我这里可以购买到疗伤药包，PK必备？\' +
    
    
    '|{cmd}<提使用100元宝购买10包疗伤药/@shibao>\' +
    '|{cmd}<取消/@main>\');



end.