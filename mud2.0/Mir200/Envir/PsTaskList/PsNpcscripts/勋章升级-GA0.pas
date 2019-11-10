           {
*******************************************************************}

Program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;                         
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _wangz;                         
begin
   This_Npc.NpcDialog(This_Player,
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
   '<材料不够不要点兑换，扣了声望，概不负责!/c=red> \'+
   '|{cmd}<兑换王者勋章(战)/@wz1>\ \'+
   '|{cmd}<兑换王者勋章(法)/@wz2>\ \'+
   '|{cmd}<兑换王者勋章(道)/@wz3>\ \'+

    '|{cmd}<返回/@main>');


end;



procedure _yongzhe;                         
begin
   This_Npc.NpcDialog(This_Player,
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
   '|{cmd}<兑换勇者勋章(战)/@yz1>\ \'+
   '|{cmd}<兑换勇者勋章(法)/@yf2>\ \'+
   '|{cmd}<兑换勇者勋章(道)/@yd3>\ \'+

    '|{cmd}<返回/@main>');


end;

procedure _yz1;                         
begin
   This_Npc.NpcDialog(This_Player,
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
    '|{cmd}<兑换勇者勋章一级(战)/@yong1>\ \'+
    '|{cmd}<升级二级勇者勋章(战)/@yong2>\ \'+
    '|{cmd}<升级三级勇者勋章(战)/@yong3>\ \'+
    '|{cmd}<升级四级勇者勋章(战)/@yong4>\ \'+ 
    '|{cmd}<升级五级勇者勋章(战)/@yong5>\ \'+ 
    '|{cmd}<返回/@main>');


end;

procedure _yf2;                                                
begin                                                          
   This_Npc.NpcDialog(This_Player,                             
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
    '|{cmd}<兑换勇者勋章一级(法)/@yong6>\ \'+
    '|{cmd}<升级二级勇者勋章(法)/@yong7>\ \'+
    '|{cmd}<升级三级勇者勋章(法)/@yong8>\ \'+
    '|{cmd}<升级四级勇者勋章(法)/@yong9>\ \'+
    '|{cmd}<升级五级勇者勋章(法)/@yong10>\ \'+
    '|{cmd}<返回/@main>');

end; 


procedure _yd3;                                                          
begin                                                                    
   This_Npc.NpcDialog(This_Player,                                       
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+          
    '|{cmd}<兑换勇者勋章一级(道)/@yong11>\ \'+                                  
    '|{cmd}<升级二级勇者勋章(道)/@yong12>\ \'+                             
    '|{cmd}<升级三级勇者勋章(道)/@yong13>\ \'+                             
    '|{cmd}<升级四级勇者勋章(道)/@yong14>\ \'+                                     
    '|{cmd}<升级五级勇者勋章(道)/@yong15>\ \'+                                
    '|{cmd}<返回/@main>');                                                                                        

end;  



procedure _yinx;                         
begin
   This_Npc.NpcDialog(This_Player,
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
   '|{cmd}<兑换银星勋章(战)/@yxi1>\ \'+
   '|{cmd}<兑换银星勋章(法)/@yxi2>\ \'+
   '|{cmd}<兑换银星勋章(道)/@yxi3>\ \'+

    '|{cmd}<返回/@main>');


end;

procedure _yxi1;                         
begin
   This_Npc.NpcDialog(This_Player,
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
    '|{cmd}<兑换银星勋章一级(战)/@yx1>\ \'+
    '|{cmd}<升级二级银星勋章(战)/@yx2>\ \'+
    '|{cmd}<升级三级级银星勋章(战)/@yx3>\ \'+
    '|{cmd}<升级四级级银星勋章(战)/@yx4>\ \'+ 
    '|{cmd}<升级五级银星勋章(战)/@yx5>\ \'+ 
    '|{cmd}<返回/@main>');


end;

procedure _yxi2;                                                
begin                                                          
   This_Npc.NpcDialog(This_Player,                             
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+
    '|{cmd}<兑换银星勋章一级(法)/@yx6>\ \'+
    '|{cmd}<升级二级银星勋章(法)/@yx7>\ \'+
    '|{cmd}<升级三级银星勋章(法)/@yx8>\ \'+
    '|{cmd}<升级四级银星勋章(法)/@yx9>\ \'+
    '|{cmd}<升级五级银星勋章(法)/@yx10>\ \'+
    '|{cmd}<返回/@main>');

end; 


procedure _yxi3;                                                          
begin                                                                    
   This_Npc.NpcDialog(This_Player,                                       
   '请选择想要兑换的勋章，只要有足够的原料，就放心交给我吧。\'+          
    '|{cmd}<兑换银星勋章一级(道)/@yx11>\ \'+                                  
    '|{cmd}<升级二级银星勋章(道)/@yx12>\ \'+                             
    '|{cmd}<升级三级银星勋章(道)/@yx13>\ \'+                             
    '|{cmd}<升级四级银星勋章(道)/@yx14>\ \'+                                     
    '|{cmd}<升级五级银星勋章(道)/@yx15>\ \'+                                
    '|{cmd}<返回/@main>');                                                                                        

end;  





Procedure DuanZaoMB(tu01:string; tu02:string; tu03:string; tu04:string; DZItem:string);
begin
if ( This_Player.GetBagItemCount(tu01) >= 1 ) and ( This_Player.GetBagItemCount(tu02) >= 1 ) 
      and ( This_Player.GetBagItemCount(tu03) >= 1 ) and ( This_Player.GetBagItemCount(tu04) >= 1 ) 
      and ( This_Player.MyShengwan >= 50) then
   begin
      This_Player.Take(tu01,1);
      This_Player.Take(tu02,1);
      This_Player.Take(tu03,1);
      This_Player.Take(tu04,1);
      
      This_Player.Give(DZItem,1);
      This_NPC.NpcDialog(This_Player,
      '恭喜您，锻造已经成功，快去看看您的包裹吧！');
   end else 
   begin
      This_NPC.NpcDialog(This_Player,
      '很可惜，您没有锻造所需的足够原料。');
   end;
end;

procedure _yong1;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者勇者战章①所需物品：\'+
   '声望：50，\'+
   '勋章之心4个\ \'+
   '进行<锻造/@makey1>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey1;
begin
   
   
      if This_Player.MyShengwan >= 50 then
      begin
   
       
        DuanZaoMB('勋章之心','勋章之心','勋章之心','勋章之心','勇者战章①');
        This_Player.MyShengwan := This_Player.MyShengwan - 50;
      end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
   
end;
procedure _yong6;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者法章①所需物品：\'+
   '声望：50，\'+
   '勋章之心4个\ \'+
   '进行<锻造/@makey2>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey2;

begin
     if This_Player.MyShengwan >= 50 then
     begin
   
   DuanZaoMB('勋章之心','勋章之心','勋章之心','勋章之心','勇者法章①');
   This_Player.MyShengwan := This_Player.MyShengwan - 50;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;

procedure _yong11;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者道章①所需物品：\'+
   '声望：50，\'+
   '勋章之心4个\ \'+
   '进行<锻造/@makey3>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey3;
begin
    if This_Player.MyShengwan >= 50 then
    begin
   
   DuanZaoMB('勋章之心','勋章之心','勋章之心','勋章之心','勇者道章①');
   This_Player.MyShengwan := This_Player.MyShengwan - 50;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;


procedure _yong2;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者战章②所需物品：\'+
   '声望：50，\'+
   '勇者战章①，勋章之心3个\ \'+
   '进行<锻造/@makey4>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey4;
begin
    if This_Player.MyShengwan >= 50 then
    begin

   DuanZaoMB('勇者战章①','勋章之心','勋章之心','勋章之心','勇者战章②');
      This_Player.MyShengwan := This_Player.MyShengwan - 50;
      end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;


procedure _yong7;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者法章②所需物品：\'+
   '声望：150，\'+
   '勇者法章①，勋章之心3个\ \'+
   '进行<锻造/@makey5>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey5;
begin
    if This_Player.MyShengwan >= 150 then
    begin
   
   DuanZaoMB('勇者法章①','勋章之心','勋章之心','勋章之心','勇者法章②');
   This_Player.MyShengwan := This_Player.MyShengwan - 150;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;


procedure _yong12;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者道章②所需物品：\'+
   '声望：150，\'+
   '勇者道章①，勋章之心3个\ \'+
   '进行<锻造/@makey6>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey6;
begin
    if This_Player.MyShengwan >= 150 then
    begin
   
   DuanZaoMB('勇者道章①','勋章之心','勋章之心','勋章之心','勇者道章②');
   This_Player.MyShengwan := This_Player.MyShengwan - 150;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;



procedure _yong3;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者战章③所需物品：\'+
   '声望：300，\'+
   '勇者战章②，勋章之心3个\ \'+
   '进行<锻造/@makey7>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey7;
begin
    if This_Player.MyShengwan >= 300 then
    begin
  
   DuanZaoMB('勇者战章②','勋章之心','勋章之心','勋章之心','勇者战章③');
    This_Player.MyShengwan := This_Player.MyShengwan - 300;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yong8;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者法章③所需物品：\'+
   '声望：300，\'+
   '勇者法章②，勋章之心3个\ \'+
   '进行<锻造/@makey8>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey8;
begin
    if This_Player.MyShengwan >= 300 then
    begin
  
   DuanZaoMB('勇者法章②','勋章之心','勋章之心','勋章之心','勇者法章③');
    This_Player.MyShengwan := This_Player.MyShengwan - 300;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yong13;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者道章③所需物品：\'+
   '声望：300，\'+
   '勇者道章②，勋章之心3个\ \'+
   '进行<锻造/@makey9>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey9;
begin
    if This_Player.MyShengwan >= 300 then
    begin
  
   DuanZaoMB('勇者道章②','勋章之心','勋章之心','勋章之心','勇者道章③');
    This_Player.MyShengwan := This_Player.MyShengwan - 300;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end; 


procedure _yong4;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者战章④所需物品：\'+
   '声望：400，\'+
   '勇者战章③，勋章之心3个\ \'+
   '进行<锻造/@makey10>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey10;
begin
    if This_Player.MyShengwan >= 400 then
    begin
   
    DuanZaoMB('勇者战章③','勋章之心','勋章之心','勋章之心','勇者战章④');
     This_Player.MyShengwan := This_Player.MyShengwan - 400;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yong9;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者法章④所需物品：\'+
   '声望：400，\'+
   '勇者法章③，勋章之心3个\ \'+
   '进行<锻造/@makey11>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey11;
begin
    if This_Player.MyShengwan >= 400 then
    begin
  
   DuanZaoMB('勇者法章③','勋章之心','勋章之心','勋章之心','勇者法章④');
    This_Player.MyShengwan := This_Player.MyShengwan - 400;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yong14;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者道章④所需物品：\'+
   '声望：400，\'+
   '勇者道章③，勋章之心3个\ \'+
   '进行<锻造/@makey12>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey12;
begin
    if This_Player.MyShengwan >= 400 then
    begin
   
   DuanZaoMB('勇者道章③','勋章之心','勋章之心','勋章之心','勇者道章④');
   This_Player.MyShengwan := This_Player.MyShengwan - 400;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end; 

procedure _yong5;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者战章⑤所需物品：\'+
   '声望：500，\'+
   '勇者战章④，勋章之心3个\ \'+
   '进行<锻造/@makey13>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey13;
begin
    if This_Player.MyShengwan >= 500 then
    begin
  
    DuanZaoMB('勇者战章④','勋章之心','勋章之心','勋章之心','勇者战章⑤');
    This_Player.MyShengwan := This_Player.MyShengwan - 500;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yong10;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者法章⑤所需物品：\'+
   '声望：500，\'+
   '勇者法章④，勋章之心3个\ \'+
   '进行<锻造/@makey14>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey14;
begin
    if This_Player.MyShengwan >= 500 then
    begin
  
   DuanZaoMB('勇者法章④','勋章之心','勋章之心','勋章之心','勇者法章⑤');
    This_Player.MyShengwan := This_Player.MyShengwan - 500;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yong15;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换勇者道章⑤所需物品：\'+
   '声望：500，\'+
   '勇者道章④，勋章之心3个\ \'+
   '进行<锻造/@makey15>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey15;
begin
    if This_Player.MyShengwan >= 500 then
    begin
  
   DuanZaoMB('勇者道章④','勋章之心','勋章之心','勋章之心','勇者道章⑤');
    This_Player.MyShengwan := This_Player.MyShengwan - 500;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  
                                                                                                  
procedure _yx1;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星银星战章①所需物品：\'+
   '声望：600，\'+
   '勇者战章⑤,勋章之心3个\ \'+
   '进行<锻造/@makey16>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey16;
begin
    if This_Player.MyShengwan >= 600 then
  begin
  
   DuanZaoMB('勇者战章⑤','勋章之心','勋章之心','勋章之心','银星战章①');
    This_Player.MyShengwan := This_Player.MyShengwan - 600;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;

procedure _yx6;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星法章①所需物品：\'+
   '声望：600，\'+
   '勇者法章⑤，勋章之心3个\ \'+
   '进行<锻造/@makey17>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey17;
begin
    if This_Player.MyShengwan >= 600 then
    begin
 
   DuanZaoMB('勇者法章⑤','勋章之心','勋章之心','勋章之心','银星法章①');
     This_Player.MyShengwan := This_Player.MyShengwan - 600;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;

procedure _yx11;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星道章①所需物品：\'+
   '声望：600，\'+
   '勇者道章⑤勋章之心3个\ \'+
   '进行<锻造/@makey18>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey18;
begin
    if This_Player.MyShengwan >= 600 then
    begin
  
   DuanZaoMB('勇者道章⑤','勋章之心','勋章之心','勋章之心','银星道章①');
    This_Player.MyShengwan := This_Player.MyShengwan - 600;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;


procedure _yx2;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星战章②所需物品：\'+
   '声望：700，\'+
   '银星战章①，勋章之心3个\ \'+
   '进行<锻造/@makey19>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey19;
begin
    if This_Player.MyShengwan >= 700 then
    begin

   DuanZaoMB('银星战章①','勋章之心','勋章之心','勋章之心','银星战章②');
      This_Player.MyShengwan := This_Player.MyShengwan - 700;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;


procedure _yx7;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星法章②所需物品：\'+
   '声望：800，\'+
   '银星法章①，勋章之心3个\ \'+
   '进行<锻造/@makey20>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey20;
begin
    if This_Player.MyShengwan >= 800 then
    begin

   DuanZaoMB('银星法章①','勋章之心','勋章之心','勋章之心','银星法章②');
      This_Player.MyShengwan := This_Player.MyShengwan - 800;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;


procedure _yx12;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星道章②所需物品：\'+
   '声望：800，\'+
   '银星道章①，勋章之心3个\ \'+
   '进行<锻造/@makey21>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey21;
begin
    if This_Player.MyShengwan >= 800 then
    begin

   DuanZaoMB('银星道章①','勋章之心','勋章之心','勋章之心','银星道章②');
      This_Player.MyShengwan := This_Player.MyShengwan - 800;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;



procedure _yx3;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星战章③所需物品：\'+
   '声望：900，\'+
   '银星战章②，勋章之心3个\ \'+
   '进行<锻造/@makey22>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey22;
begin
    if This_Player.MyShengwan >= 900 then
    begin

   DuanZaoMB('银星战章②','勋章之心','勋章之心','勋章之心','银星战章③');
      This_Player.MyShengwan := This_Player.MyShengwan - 900;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yx8;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星法章③所需物品：\'+
   '声望：900，\'+
   '银星法章②，勋章之心3个\ \'+
   '进行<锻造/@makey23>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey23;
begin
    if This_Player.MyShengwan >= 900 then
  begin
   
   DuanZaoMB('银星法章②','勋章之心','勋章之心','勋章之心','银星法章③');
   This_Player.MyShengwan := This_Player.MyShengwan - 900;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yx13;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星道章③所需物品：\'+
   '声望：900，\'+
   '银星道章②，勋章之心3个\ \'+
   '进行<锻造/@makey24>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey24;
begin
    if This_Player.MyShengwan >= 900 then
  begin
  
   DuanZaoMB('银星道章②','勋章之心','勋章之心','勋章之心','银星道章③');
    This_Player.MyShengwan := This_Player.MyShengwan - 900;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end; 


procedure _yx4;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星战章④所需物品：\'+
   '声望：1000，\'+
   '银星战章③，勋章之心3个\ \'+
   '进行<锻造/@makey25>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey25;
begin
    if This_Player.MyShengwan >= 1000 then
 begin
  
   DuanZaoMB('银星战章③','勋章之心','勋章之心','勋章之心','银星战章④');
    This_Player.MyShengwan := This_Player.MyShengwan - 1000;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yx9;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星法章④所需物品：\'+
   '声望：1100，\'+
   '银星法章③，勋章之心3个\ \'+
   '进行<锻造/@makey26>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey26;
begin
    if This_Player.MyShengwan >= 1100 then
    begin
  
   DuanZaoMB('银星法章③','勋章之心','勋章之心','勋章之心','银星法章④');
    This_Player.MyShengwan := This_Player.MyShengwan - 1100;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yx14;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星道章④所需物品：\'+
   '声望：1100，\'+
   '银星道章③，勋章之心3个\ \'+
   '进行<锻造/@makey27>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey27;
begin
    if This_Player.MyShengwan >= 1100 then
   begin
  
   DuanZaoMB('勇道道章③','勋章之心','勋章之心','勋章之心','银星道章④');
    This_Player.MyShengwan := This_Player.MyShengwan - 1100;
   end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end; 

procedure _yx5;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星战章⑤所需物品：\'+
   '声望：1200，\'+
   '银星战章④，勋章之心3个\ \'+
   '进行<锻造/@makey28>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey28;
begin
    if This_Player.MyShengwan >= 1200 then
    begin
  
    DuanZaoMB('银星战章④','勋章之心','勋章之心','勋章之心','银星战章⑤');
      This_Player.MyShengwan := This_Player.MyShengwan - 1200;
    end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yx10;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星法章⑤所需物品：\'+
   '声望：1200，\'+
   '银星法章④，勋章之心3个\ \'+
   '进行<锻造/@makey29>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey29;
begin
    if This_Player.MyShengwan >= 1200 then
    begin
    
    DuanZaoMB('银星法章④','勋章之心','勋章之心','勋章之心','银星法章⑤');
    This_Player.MyShengwan := This_Player.MyShengwan - 1200;
    end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;                                                                                                  


procedure _yx15;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星道章⑤所需物品：\'+
   '声望：1200，\'+
   '银星道章④，勋章之心3个\ \'+
   '进行<锻造/@makey30>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey30;
begin
    if This_Player.MyShengwan >= 1200 then
    begin
   
    DuanZaoMB('银星道章④','勋章之心','勋章之心','勋章之心','银星道章⑤');
     This_Player.MyShengwan := This_Player.MyShengwan - 1200;
    end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
end;        

procedure _wz1;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换王者勋章(战)所需物品：\'+
   '声望：1500，\'+
   '银星战章⑤，勋章之心3个\ \'+
   '进行<锻造/@makey31>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey31;
 begin
     if This_Player.MyShengwan >= 1500 then
    begin
          
        DuanZaoMB('银星战章⑤','勋章之心','勋章之心','勋章之心','王者勋章(战)');
        This_Player.MyShengwan := This_Player.MyShengwan - 1500; 
        
    end  
    else                                                                                        
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;
 end;
 
 
procedure _wz2;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换王者勋章(法)所需物品：\'+
   '声望：1500，\'+
   '银星法章⑤，勋章之心3个\ \'+
   '进行<锻造/@makey32>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey32;
begin
    if This_Player.MyShengwan >= 1500 then
  begin
     DuanZaoMB('银星法章⑤','勋章之心','勋章之心','勋章之心','王者勋章(法)');
     This_Player.MyShengwan := This_Player.MyShengwan - 1500;
  end  else
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;


end;                                                                                                  


procedure _wz3;                         
begin
   This_Npc.NpcDialog(This_Player,
   '兑换银星道章⑤所需物品：\'+
   '声望：1500，\'+
   '银星道章⑤，勋章之心3个\ \'+
   '进行<锻造/@makey33>\'+
  
   '|{cmd}<关闭/@exit>');
end;

Procedure _makey33;
begin
    if This_Player.MyShengwan >= 1500 then
   begin
    
     DuanZaoMB('银星道章⑤','勋章之心','勋章之心','勋章之心','王者勋章(道)');
      This_Player.MyShengwan := This_Player.MyShengwan - 1500;
     end  else
    begin
    This_Npc.NpcDialog(This_Player,          
    '声望不足，无法锻造。\ \');
    end;

end;       


                                                                                          
                                                                                                    


//脚本执行的入口
Begin
   This_Npc.NpcDialog(This_Player,
   '我这里可以用声望升级勋章！\'+
   '升级物品不需要消耗时间，百分百升级成功，\'+
   '<材料不够不要点兑换，扣了声望，概不负责!/c=red> \'+
   '勋章分为勇者勋章，银星勋章，和王者勋章，\'+   
   '勇者勋章升级到5级，才可以升级成银星勋章，\'+
   '勋章拥有强大灵力，需要200点以上声望才能佩戴\'+    
   '|{cmd}<兑换勇者勋章/@yongzhe>\'+     
   '|{cmd}<兑换银星勋章/@yinx>\'+     
   '|{cmd}<兑换王者勋章/@wangz>'); 

end.    