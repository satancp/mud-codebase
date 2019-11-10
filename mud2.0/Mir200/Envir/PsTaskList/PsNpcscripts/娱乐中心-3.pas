
{娱乐中心 
作者：开心就好
内容：☆☆本中心只供娱乐，严禁用于赌博，一切后果自负☆☆
人机对赌模式
}
PROGRAM Mir2;
var 
str :string;
num,num1 :integer;
i : Integer;
j : Integer;
k : Integer;
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;
procedure domain;
begin
This_Player.SetV(0, 1, (Random(6) + 1));
This_Player.SetV(0, 2, (Random(6) + 1));
This_Player.SetV(0, 3, (Random(6) + 1)); 
i:=This_Player.GetV(0, 1);
j:=This_Player.GetV(0, 2);
k:=This_Player.GetV(0, 3);
num:= i+j+k ;
    str := This_NPC.InputStr;
    This_NPC.NpcDialog(This_Player,
       '☆☆☆欢迎光临【拉斯维加斯】娱乐中心☆☆☆\|'
      +'                   '+'<每次投注至少需要100元宝/c=red>！|\'
     +' ☆☆本中心只供娱乐，严禁用于赌博，一切后果自负☆☆\|'
    +'{cmd}<我要买大/@md> ^<我要买小/@mx> ^<我要买豹子/@mbz> \|'
      +'{cmd}<买定开骰/@DoPlayDice>');
end;

procedure _mx;
begin


 begin
  if This_Player.GetV(74,1)< 1  then 
  begin    
        This_NPC.InputDialog(This_Player,'请输入你要买的数额',0,111) ;
  end else This_NPC.NpcDialog(This_Player,'你已经投过注了！'+'{cmd}<返回/@main>') ;
 end;
end;
procedure p111;
begin
   num1 :=  StrToIntDef(This_NPC.InputStr,-1);//输入非阿拉伯数字的字符都返回-1
   if This_NPC.InputOK  then             
    begin
        if (num1 < 100) or  (num1 > 65534)  then 
       begin 
       This_NPC.NpcDialog(This_Player,'投注必须使用大于100小于65534的阿拉伯数字!') ;
       end 
        else if (num1 >= 100) and (num1 < 65535) then
         begin
           if  This_Player.YBNum >= num1 then 
           begin
                This_Player.PsYBConsum(This_NPC,'xin',20001,num1,1);
                This_NPC.NpcDialog(This_Player,'你买了'+inttostr(num1)+'元宝的小！'+'{cmd}<返回/@main>') ;
                This_Player.setv(74,1,1);   //限定能投骰子的玩家，及只能在3个选项中同一时间选一个
                This_Player.setv(73,1,1); // 限定选择的下注的类型，改类型为选了小
				
           end else
           This_NPC.NpcDialog(This_Player,'你没有足够的元宝买'+inttostr(num1)+'的小!' +'{cmd}<返回/@main>') ;
         end;
    end; 
 end;
procedure _md;

 begin
  if This_Player.GetV(74,1)< 1  then 
  begin    
        This_NPC.InputDialog(This_Player,'请输入你要买的数额',0,112) ;
  end else This_NPC.NpcDialog(This_Player,'你已经投过注了！'+'{cmd}<返回/@main>') ;
 end;

procedure p112;
begin 
    num1 :=  StrToIntDef(This_NPC.InputStr,-1);//输入非阿拉伯数字的字符都返回-1
   if This_NPC.InputOK  then 
        if (num1 < 100) or  (num1 > 65534) then 
       begin 
       This_NPC.NpcDialog(This_Player,'投注必须使用大于100小于65534的阿拉伯数字!') ;
       end 
        else if (num1 >= 100) and (num1 < 65535) then
         begin
           if  This_Player.YBNum >= num1 then 
           begin
                This_Player.PsYBConsum(This_NPC,'xin',20001,num1,1);
                This_NPC.NpcDialog(This_Player,'你买了'+inttostr(num1)+'元宝的大！'+'{cmd}<返回/@main>') ;
                This_Player.setv(74,1,1);   //限定能投骰子的玩家，及只能在3个选项中同一时间选一个
                This_Player.setv(73,2,1); // 限定选择的下注的类型，改类型为选了大 
           end else
           This_NPC.NpcDialog(This_Player,'你没有足够的元宝买'+inttostr(num1)+'的大!' +'{cmd}<返回/@main>') ;
         end;
    end;

procedure _mbz;

 begin
  if This_Player.GetV(74,1)< 1  then 
  begin    
        This_NPC.InputDialog(This_Player,'请输入你要买的数额',0,113) ;
  end else This_NPC.NpcDialog(This_Player,'你已经投过注了！'+'{cmd}<返回/@main>') ;
 end;

procedure p113;
begin 
    num1 :=  StrToIntDef(This_NPC.InputStr,-1);//输入非阿拉伯数字的字符都返回-1
   if This_NPC.InputOK  then  
        if  (num1 < 100) or  (num1 > 65534) then 
       begin 
       This_NPC.NpcDialog(This_Player,'投注必须使用大于100小于65534的阿拉伯数字!') ;
       end 
        else if (num1 >= 100) and (num1 < 65535) then
         begin
           if  This_Player.YBNum >= num1 then 
           begin
                This_Player.PsYBConsum(This_NPC,'xin',20001,num1,1);
                This_NPC.NpcDialog(This_Player,'你买了'+inttostr(num1)+'元宝的豹子！'+'{cmd}<返回/@main>') ;
                This_Player.setv(74,1,1);   //限定能投骰子的玩家，及只能在3个选项中同一时间选一个
                This_Player.setv(73,3,1); // 限定选择的下注的类型，改类型为选了豹子 
           end else
           This_NPC.NpcDialog(This_Player,'你没有足够的元宝买'+inttostr(num1)+'的豹子!' +'{cmd}<返回/@main>') ;
         end;
    
end;

procedure _AfterPlayDice();//注意这里需要下画线
begin
 
     if (This_Player.getv(73,1)=1) //限定选了小的玩家并且3骰子点数在3到10包括豹子执行以下奖励代码
	 and (num >2) and (num <11)// and ((i <> j) or (i <> k) or (k <> j)) 
   then
      begin
      This_Npc.NpcDialog(This_Player,'你扔的骰子数是' + IntToStr(i) + IntToStr(j)+IntToStr(k)+'一共|\'
       +inttostr(num)+'点，恭喜你你买中了小，获得一倍赔率！') ;
       This_Player.ScriptRequestAddYBNum(num1 *2);
       This_Player.setv(74,1,0);//保险起见，所有变量初始化化，跳出
       This_Player.setv(73,1,0); 
       num1 := 0;
      This_Player.SetV(0, 1, 0);
      This_Player.SetV(0, 2, 0);
      This_Player.SetV(0, 3, 0);
      end
      else 
      if(This_Player.getv(73,2)=1)//限定选了大的玩家并且3骰子点数在11到18并且包括豹子的情况下执行以下奖励代码
	  and (num >=11) and (num <19)// and ((i <> j) or (i <> k) or (k <> j))
     then
      begin
      
       This_Player.ScriptRequestAddYBNum(num1 *2);
       This_Player.setv(74,1,0);//部分变量初始化是非必须的，保险起见所有变量初始化化
       This_Player.setv(73,2,0); 
       str:= '';
      This_Player.SetV(0, 1, 0);
      This_Player.SetV(0, 2, 0);
      This_Player.SetV(0, 3, 0);
      This_Npc.NpcDialog(This_Player,'你扔的骰子数是' + IntToStr(i) + IntToStr(j)+IntToStr(k)+'一共|\'
       +inttostr(num)+'点，恭喜你你买中了大，获得一倍赔率！'+'{cmd}<继续投注/@main>') ;
      end else 
      
      if (This_Player.getv(73,3)=1) //限定选了豹子的玩家并且3骰子点数相等情况下 执行以下奖励代码
	  and ((i = j) and (i = k) and (k = j))  then 
	  
      begin
      
       This_Player.ScriptRequestAddYBNum(num1 *4);
       This_Player.setv(74,1,0);//部分变量初始化是非必须的，保险起见所有变量初始化化
       This_Player.setv(73,3,0);
       Str := '';
       This_Player.SetV(0, 1, 0);
      This_Player.SetV(0, 2, 0);
      This_Player.SetV(0, 3, 0);
        This_Npc.NpcDialog(This_Player,'你扔的骰子数是' + IntToStr(i) + IntToStr(j)+IntToStr(k)+'一共|\'
       +inttostr(num)+'点，恭喜你你买中了豹子，获得三倍赔率！'+'{cmd}<继续投注/@main>') ;
      end else  
      begin
      This_Player.setv(74,1,0);//即使失败也需要变量初始化化，部分变量初始化是非必须的
       This_Player.setv(73,3,0);
       This_Player.setv(73,2,0); 
       This_Player.setv(73,1,0);
      Str := '';
      This_Player.SetV(0, 1, 0);
      This_Player.SetV(0, 2, 0);
      This_Player.SetV(0, 3, 0);
      This_Npc.NpcDialog(This_Player,'你扔的骰子数是' + IntToStr(i) + IntToStr(j)+IntToStr(k)+'一共|\'
       +inttostr(num)+'点，很抱歉你没有买中！'+'{cmd}<继续投注/@main>') ;
      end;
end;
procedure DoPlayDice();
begin    
         if  This_Player.getv(73,1)=1  then   //买小 
         begin 
           if num < 11 then
           begin if random(100) < 90  then //摇到小后有90%的机会更换骰子 ，更换后出现如果继续是小则继续循环90%的机会更换骰子大小 
		             begin		         
           This_Player.SetV(0, 1, (Random(6) + 1));
           This_Player.SetV(0, 2, (Random(6) + 1));
           This_Player.SetV(0, 3, (Random(6) + 1));
           i:=This_Player.GetV(0, 1);
           j:=This_Player.GetV(0, 2);
           k:=This_Player.GetV(0, 3);
           num:= i+j+k ;
           This_Player.CallOut(This_NPC, 1, 'DoPlayDice'); // 
                 end else This_Npc.PlayDice(This_Player, 3, '@AfterPlayDice');		   
           end else
           begin
           This_Npc.PlayDice(This_Player, 3, '@AfterPlayDice');
           end ;
         end else
         if  This_Player.getv(73,2)=1  then
         begin if random(100) < 90  then
         begin
           if num > 10 then
           begin
           This_Player.SetV(0, 1, (Random(6) + 1));
           This_Player.SetV(0, 2, (Random(6) + 1));
           This_Player.SetV(0, 3, (Random(6) + 1));
           i:=This_Player.GetV(0, 1);
           j:=This_Player.GetV(0, 2);
           k:=This_Player.GetV(0, 3);
           num:= i+j+k ;
           This_Player.CallOut(This_NPC, 1, 'DoPlayDice'); 
            end else This_Npc.PlayDice(This_Player, 3, '@AfterPlayDice');	
           end else
           begin
           This_Npc.PlayDice(This_Player, 3, '@AfterPlayDice');
           end;
         end else 
         if  This_Player.getv(73,3)=1  then
         begin if random(100) < 90  then
         begin
           if (i=j) and (j=k) then
           begin
           This_Player.SetV(0, 1, (Random(6) + 1));
           This_Player.SetV(0, 2, (Random(6) + 1));
           This_Player.SetV(0, 3, (Random(6) + 1));
           i:=This_Player.GetV(0, 1);
           j:=This_Player.GetV(0, 2);
           k:=This_Player.GetV(0, 3);
           num:= i+j+k ;
           This_Player.CallOut(This_NPC, 1, 'DoPlayDice'); //注意这里需要@
            end else This_Npc.PlayDice(This_Player, 3, '@AfterPlayDice');	
           end else 
           begin 
           This_Npc.PlayDice(This_Player, 3, '@AfterPlayDice');
           end;
         end else  This_Player.CallOut(This_NPC, 1, 'DoPlayDice');
end;
procedure _DoPlayDice(); //扔骰子//注意这里需要下画线
begin
if This_Player.getv(74,1)=1 then 
    begin    
           This_Player.CallOut(This_NPC, 1, 'DoPlayDice');
           This_NPC.NpcDialog(This_Player,'1到3秒后开始投骰子！') ; 
    end else 
  This_Npc.NpcDialog(This_Player,'你没有下注不可以投骰子!'	) ;
end;
function xin(price, num: Integer):boolean; 
begin
   result := true;  
end;
Begin
  domain;
end.