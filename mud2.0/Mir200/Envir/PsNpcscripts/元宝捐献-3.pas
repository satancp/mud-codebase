program mir2;
var
s1,s2,s3,s4,s5 : integer;
n1,n2,n3,n4,n5 : string;
str :string;
num,num1,num2 :integer;
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
str := This_NPC.InputStr; 
num1 :=  StrToIntDef(This_NPC.InputStr,-1); 
if getg(78,1) < 0 then
    SetG(78,1,0);
if getg(78,2) < 0 then
    SetG(78,2,0);
if getg(78,3) < 0 then
    SetG(78,3,0);
if getg(78,4) < 0 then
    SetG(78,4,0);
if getg(78,5) < 0 then
    SetG(78,5,0);
s1 := getg(78,1);
s2 := getg(78,2);
s3 := getg(78,3);
s4 := getg(78,4);
s5 := getg(78,5);
This_NPC.NpcDialog(This_Player,
 '你目前的元宝捐献数为'+inttostr(This_Player.GetV(78,1))+' \|'
 
   +'<1.玛法大陆的兴衰，得靠各位勇士的慷慨解囊!/c=red>\|'
   +'<2.在我这里捐献元宝，可以获得一定的属性加成/c=red>\|'
   +'|第一名：获得全属性30-30。 获得者<'+n1+'捐献元宝数'+inttostr(s1)+' /c=red>\'
   +'|第二名：获得全属性25-25。 获得者<'+n2+'捐献元宝数'+inttostr(s2)+' /c=red>\'
   +'|第三名：获得全属性20-20。 获得者<'+n3+'捐献元宝数'+inttostr(s3)+' /c=red>\'
   +'|第四名：获得全属性15-15。 获得者<'+n4+'捐献元宝数'+inttostr(s4)+' /c=red>\'
   +'|第五名：获得全属性10-10。 获得者<'+n5+'捐献元宝数'+inttostr(s5)+' /c=red>\'
   +'|第六名后：获得全属性5-5。 \' 
   +'|{cmd}<捐献/@jxyb>   ^<领取属性/@lqsx>      ^<刷新/@main>');
end;
procedure _lqsx;
begin
   if This_Player.GetV(78,1) = s1 then 
   begin 
   This_Player.AddPlayerAbil(0,10,3600);
   This_Player.AddPlayerAbil(1,10,3600);
   This_Player.AddPlayerAbil(2,10,3600);
   This_Player.AddPlayerAbil(4,50,3600);
   end else
   if This_Player.GetV(78,1) = s2 then 
   begin 
   This_Player.AddPlayerAbil(0,10,3600);
   This_Player.AddPlayerAbil(1,10,3600);
   This_Player.AddPlayerAbil(2,10,3600);
   This_Player.AddPlayerAbil(4,50,3600);
   end else
   if This_Player.GetV(78,1) = s3 then 
   begin 
   This_Player.AddPlayerAbil(0,10,3600);
   This_Player.AddPlayerAbil(1,10,3600);
   This_Player.AddPlayerAbil(2,10,3600);
   This_Player.AddPlayerAbil(4,50,3600);
   end else
    if This_Player.GetV(78,1) = s4 then 
   begin 
   This_Player.AddPlayerAbil(0,5,3600);
   This_Player.AddPlayerAbil(1,5,3600);
   This_Player.AddPlayerAbil(2,5,3600);
   This_Player.AddPlayerAbil(4,20,3600);
   end else
   if This_Player.GetV(78,1) = s5 then 
   begin 
   This_Player.AddPlayerAbil(0,5,3600);
   This_Player.AddPlayerAbil(1,5,3600);
   This_Player.AddPlayerAbil(2,5,3600);
   This_Player.AddPlayerAbil(4,20,3600);
   end else
   if (This_Player.GetV(78,1) < s5) and (This_Player.GetV(78,1) > 0) then 
   begin 
   This_Player.AddPlayerAbil(0,5,3600);
   This_Player.AddPlayerAbil(1,5,3600);
   This_Player.AddPlayerAbil(2,5,3600);
   This_Player.AddPlayerAbil(4,10,3600);
   end;
end;
procedure _jxyb; 
begin    
        This_NPC.InputDialog(This_Player,'请输入你要买的数额',0,111) ;
end;
 
procedure p111;
begin
   num :=  StrToIntDef(This_NPC.InputStr,-1);//输入非阿拉伯数字的字符都返回-1
   if This_NPC.InputOK  then             
    begin
        if (num < 50) or  (num > 65534)  then 
       begin 
       This_NPC.NpcDialog(This_Player,'捐献一次至少50元宝，总额不能大于65534，只能使用阿拉伯数字!') ;
       end 
        else if (num >= 50) and (num1 < 65535) then
         begin
           if  This_Player.YBNum >= num then 
           begin
                This_Player.PsYBConsum(This_NPC,'xin',20001,num,1);
               This_Player.CallOut(This_NPC,1,'jxyb'); 
			   ServerSay('土豪玩家<' + This_Player.Name + '>捐献了元宝，将可以领取属性加成！', 2);
				
           end else
           This_NPC.NpcDialog(This_Player,'你没有足够的元宝捐献!' +'{cmd}<返回/@main>') ;
         end;
    end; 
 end;
 
 
 
procedure jxyb;
begin
num :=  StrToIntDef(This_NPC.InputStr,-1);//输入非阿拉伯数字的字符都返回-1
if This_Player.getV(78,1) < 0 then  This_Player.SetV(78,1,0);
num1 := This_Player.getV(78,1);
num2 :=num + num1;
s1 := getg(78,1);
s2:= getg(78,2);       
s3 := getg(78,3);    
s4 := getg(78,4);
s5 := getg(78,5);
if num2 > s1 then 
 begin
    if (num1 < s5) or (num1 = s5) then
    begin 
    SetG(78,5,s4);
    SetG(78,4,s3);
    SetG(78,3,s2);
    SetG(78,2,s1);
    SetG(78,1,num2);   
    This_Player.SetV(78,1,num1+num); 
    n1 := This_Player.Name;
     end else 
     if num1 = s4 then 
      begin 
    SetG(78,4,s3);
    SetG(78,3,s2);
    SetG(78,2,s1);
    SetG(78,1,num2);   
    This_Player.SetV(78,1,num1+num); 
    n1 := This_Player.Name;
     end else
     if num1 = s3 then 
      begin 
    SetG(78,3,s2);
    SetG(78,2,s1);
    SetG(78,1,num2);   
    This_Player.SetV(78,1,num1+num); 
    n1 := This_Player.Name;
     end else
      if num1 = s2 then 
      begin 
    SetG(78,2,s1);
    SetG(78,1,num2);   
    This_Player.SetV(78,1,num1+num); 
    n1 := This_Player.Name;
     end else
      if num1 = s1 then 
      begin 
    SetG(78,1,num2);   
    This_Player.SetV(78,1,num1+num); 
    n1 := This_Player.Name;
     end;
     
         
 end else 
 if (s2 < num2) and ((num2< s1) or (num2 = s1)) then
 begin
    if (num1 < s5) or (num1 = s5) then
    begin 
    SetG(78,5,s4);
    SetG(78,4,s3);
    SetG(78,3,s2);
    SetG(78,2,num2);   
    This_Player.SetV(78,1,num1+num); 
    n2 := This_Player.Name;
     end else 
     if num1 = s4 then 
      begin 
    SetG(78,4,s3);
    SetG(78,3,s2);
    SetG(78,2,num2);   
    This_Player.SetV(78,1,num1+num); 
    n2 := This_Player.Name;
     end else
     if num1 = s3 then 
      begin 
    SetG(78,3,s2);
    SetG(78,2,num2);   
    This_Player.SetV(78,1,num1+num); 
    n2 := This_Player.Name;
     end else
      if num1 = s2 then 
      begin 
    SetG(78,2,num2);   
    This_Player.SetV(78,1,num1+num); 
    n2 := This_Player.Name;
     end;               

end else 
if (s3 < num2) and ((num2< s2) or (num2 = s2)) then
 begin
    if (num1 < s5) or (num1 = s5) then
    begin 
    SetG(78,5,s4);
    SetG(78,4,s3); 
    SetG(78,3,num2);   
    This_Player.SetV(78,1,num1+num); 
    n3 := This_Player.Name;
     end else 
     if num1 = s4 then 
      begin 
    SetG(78,4,s3);
    SetG(78,3,num2);   
    This_Player.SetV(78,1,num1+num); 
    n3 := This_Player.Name;
     end else
     if num1 = s3 then 
      begin 
    SetG(78,3,num2);   
    This_Player.SetV(78,1,num1+num); 
    n3 := This_Player.Name;
     end;                           
end else 
if (s4 < num2) and ((num2< s3) or (num2 = s3)) then
 begin
    if (num1 < s5) or (num1 = s5) then
    begin 
    SetG(78,5,s4); 
    SetG(78,4,num2);   
    This_Player.SetV(78,1,num1+num); 
    n4 := This_Player.Name;
     end else 
     if num1 = s4 then 
      begin 
    SetG(78,4,num2);   
    This_Player.SetV(78,1,num1+num); 
    n4 := This_Player.Name;
     end;                   
end else 
if (s5 < num2) and ((num2< s4) or (num2 = s5)) then
                                              begin
                                           SetG(78,5,num2);
                                          This_Player.SetV(78,1,num1+num);
                                           n5:=This_Player.Name;

end else 
if num2 < s5 then  
begin
This_Player.SetV(78,1,num1+num);
end;
end;
begin
domain;
end. 