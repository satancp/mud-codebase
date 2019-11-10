program Mir2;

{$I ActiveValidateCom.pas}
// @AddDrug~~1
//
//add(x)

function UseYB(nType, nNum: Integer): Boolean;
begin
  Result := True;
end;

function UseLF(nType, nNum: Integer): Boolean;
begin
  Result := True;
end;  

procedure SetAwardCodeCDTime();
var
d1 , d2 , d3 : integer;
s1 , td : double;
temp_2 : integer;
begin
      s1 := GetNow;
      d2 := This_Player.GetS(23,1);
      //将getnow的浮点数转换为整型进行保存； 

      td := ConvertDBToDateTime(d2);
      
      d3 := minusDataTime(s1,td);
      
      temp_2 := This_Player.GetS(23,2);
      
      
      if temp_2 <0 then temp_2 := 0;
      
      if (d3 <= 300)  then
      begin
         This_Player.SetS(23,2,temp_2 + 1);
         This_Player.PlayerNotice('已连续输入错误卡密' + inttostr(temp_2 + 1) + '/3次!',0);
      end 
      else  
      begin                     
          This_Player.SetS(23,1, ConvertDateTimeToDB(s1));
          This_Player.SetS(23,2,1);
      end;
end; 
//卡密
procedure AwardCodeExecCallBack(ExecRes: Integer; const CodeStr: string; AwardCodeType, ActiveParam: Integer);
begin
  //AWARDCODE_EXEC_ERROR        = 0;
  //AWARDCODE_EXEC_QUERY        = 1;
  //AWARDCODE_EXEC_UPDATE       = 2;
  //AWARDCODE_EXEC_ADD          = 3;
  //AWARDCODE_EXEC_DEL          = 4;  
  //
  //This_Player.PlayerNotice('ExecRes：' + inttostr(ExecRes) + '！',0);  
  //This_Player.PlayerNotice('AwardCodeType：' + inttostr(AwardCodeType) + '！',0);  
  //This_Player.PlayerNotice('ActiveParam：' + inttostr(ActiveParam) + '！',0);  
  case ExecRes of
       0 : 
       begin
           SetAwardCodeCDTime();
           This_Player.PlayerNotice('卡密无效!',0);
           
       end;
       1 : 
       begin 
           if ActiveParam = 1 then
           begin
           //This_Player.PlayerNotice('准备增加' + inttostr(AwardCodeType) + '元宝！',0);  

           //This_Player.PlayerNotice('恭喜你获得' + inttostr(AwardCodeType) + '元宝！',0);  
           This_Player.SetAwardCodeActiveParam(CodeStr, -1);
           
           end else
           This_Player.PlayerNotice('该卡密已使用！',0);
       end;
       2 : 
       begin
          This_Player.ScriptRequestAddYBNum(AwardCodeType);
          This_Player.PlayerNotice('卡密兑换成功！',0);  
          This_Player.SetS(23,1,0);
          This_Player.SetS(23,2,0);         
       end;
       5 : This_Player.PlayerNotice('卡密操作失败!',0);
   end;   
end;


//主号升级
procedure PlayerExpLevelUp();
var
  iLev : integer;
begin
   iLev := This_Player.Level;
   
   { case iLev of
       7:
       begin
           case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('基本剑术',1);
                   This_Player.GiveBindItem('魔血石(小)',1);
                   
               end;
               1 : 
               begin
                   This_Player.Give('火球术',1);
                   This_Player.GiveBindItem('魔血石(小)',1);                 
               end;
               2 : 
               begin
                   
                   This_Player.Give('治愈术',1);
                   This_Player.Give('精神力战法',1);
                   This_Player.GiveBindItem('魔血石(小)',1);
               end;
           end;
       end;
       15:
       begin
           case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('八荒',1);
                   This_Player.Give('攻杀剑术',1);
                   if This_Player.Gender = 0 then
                   This_Player.Give('中型盔甲(男)',1)
                   else
                   This_Player.Give('中型盔甲(女)',1);
               end;
               1 : 
               begin
                   This_Player.Give('海魂',1);
                   This_Player.Give('雷电术',1);
                   if This_Player.Gender = 0 then
                   This_Player.Give('中型盔甲(男)',1)
                   else
                   This_Player.Give('中型盔甲(女)',1);
               end;
               2 : 
               begin
                   This_Player.Give('半月',1);
                   This_Player.Give('灵魂火符',1);
                   This_Player.GiveBindItem('超级护身符',2);
                   if This_Player.Gender = 0 then
                   This_Player.Give('中型盔甲(男)',1)
                   else
                   This_Player.Give('中型盔甲(女)',1);
               end;
           end;
       end;
       22:
       begin
            case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('斩马刀',1);
                   if This_Player.Gender = 0 then
                   This_Player.Give('重盔甲(男)',1)
                   else
                   This_Player.Give('重盔甲(女)',1);
               end;
               1 : 
               begin
                   This_Player.Give('偃月',1);
                   if This_Player.Gender = 0 then
                   This_Player.Give('魔法长袍(男)',1)
                   else
                   This_Player.Give('魔法长袍(女)',1);
               end;
               2 : 
               begin
                   This_Player.Give('降魔',1);
                   if This_Player.Gender = 0 then
                   This_Player.Give('灵魂战衣(男)',1)
                   else
                   This_Player.Give('灵魂战衣(女)',1);
               end;
           end;
       end;
       26:
       begin
           case This_Player.Job of
               0 : 
               begin
                   This_Player.Give('道士头盔',1);
                   This_Player.Give('蓝翡翠项链',1);
                   This_Player.Give('死神手套',2);
                   This_Player.Give('珊瑚戒指',2);
               end;
               1 : 
               begin
                   This_Player.Give('道士头盔',1);
                   This_Player.Give('放大镜',1);
                   This_Player.Give('黑檀手镯',2);
                   This_Player.Give('降妖除魔戒指',2);
               end;
               2 : 
               begin
                   This_Player.Give('道士头盔',1);
                   This_Player.Give('竹笛',1);
                   This_Player.Give('道士手镯',2);
                   This_Player.Give('降妖除魔戒指',2);
               end;
           end;
       end; }
   end;
 {  case iLev of
     51 : 
       begin
          This_Player.SetV(111,51,1);                           //接成长篇：白金凭证
          //This_Player.AddTaskToUIList(1051);
          This_Player.UpdateTaskDetail(1051,1);
          //#This_Player.AddTaskToUIList(1055);
       end;
     46 : 
       begin
          This_Player.SetV(111,47,1);                           //接成长篇：热血勇士
          //This_Player.AddTaskToUIList(1047);
          //This_Player.AddTaskToUIList(1046);
          This_Player.UpdateTaskDetail(1047,0);
          //#This_Player.AddTaskToUIList(1051);
       end; 
     35 :
       begin
          This_Player.SetV(111,35,1);                           //接成长篇：探索藏宝阁
          //This_Player.AddTaskToUIList(1035);
          This_Player.UpdateTaskDetail(1035,1);
          //#This_Player.AddTaskToUIList(1047);
       end;        
     22 : 
       begin
          This_Player.SetV(111,22,1);                           //接成长篇：婚姻殿堂
          //This_Player.AddTaskToUIList(1022);
          This_Player.UpdateTaskDetail(1022,1);
          //#This_Player.AddTaskToUIList(1035);
       end;
     15 : 
       begin
          This_Player.SetV(111,15,1);                           //接成长篇：勇者的试炼
          //This_Player.AddTaskToUIList(1015);
          This_Player.UpdateTaskDetail(1015,1);
          //#This_Player.AddTaskToUIList(1022);
       end;
     8  :
       begin
          //This_Player.SetV(111,8,1);                           //接成长篇：魔王岭拒敌
          This_Player.SetV(111,7,1);                           //接成长篇：天关寻宝
          This_Player.SetV(111,6,1);                           //接成长篇：进入庄园
          //This_Player.AddTaskToUIList(1008);
          //This_Player.AddTaskToUIList(1007);
          //This_Player.AddTaskToUIList(1006);
          This_Player.UpdateTaskDetail(1008,1);
          This_Player.UpdateTaskDetail(1007,0);
          This_Player.UpdateTaskDetail(1006,0);
          //#This_Player.AddTaskToUIList(1015);
       end;
     4 : 
       begin
          This_Player.SetV(111,4,1);                            //接成长篇：新手大礼包
          //This_Player.AddTaskToUIList(1004);
          This_Player.UpdateTaskDetail(1004,1);
          //#This_Player.AddTaskToUIList(1006);
          //#This_Player.AddTaskToUIList(1007);
          //This_Player.AddTaskToUIList(1008); 
       end;
     3 : 
       begin
          This_Player.SetV(111,3,1);                            //接成长篇：王师弟子
          //This_Player.AddTaskToUIList(1003);
          This_Player.UpdateTaskDetail(1003,1);
          //#This_Player.AddTaskToUIList(1004);
       end;
     2 : 
       begin
          This_Player.SetV(111,2,1);                            //接成长篇：寻找炼金师
          This_Player.UpdateTaskDetail(1002,0);
          //#This_Player.AddTaskToUIList(1003);
       end;
     1 :
       begin
          //#This_Player.AddTaskToUIList(1002);
       end;
   end;   }
end;                             

//主号内功升级
procedure PlayerForceLevelUp();
begin

end;

//英雄升级
procedure HeroExpLevelUp();
begin

end;

//英雄内功升级
procedure HeroForceLevelUp();
begin

end;
//活跃度系统 
procedure PlayerActivePoint(paytape,payNO,PayNUM:integer;PayName:string);
var
addPoint:integer;
begin

    
end;

procedure PlayerActiveWithMap(MapName:string);
begin

end;

procedure PlayerActiveValidate;
begin
 
end;

procedure OpenTimeWithMap(MapName:string);
begin

end;

begin

end.