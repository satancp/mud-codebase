{
/*******************************************************************************

/*******************************************************************************
}

program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _gettitle;
begin
  This_Npc.NpcDialog(This_Player,
  '能够成为沙巴克城主的人，绝对担得起一代天骄这四个字。\'
  +'领取称号需要雕像荣耀值达到1100点以上，并且每次领取称号需要消\'
  +'耗荣耀值100点。\ \'
  +'|{cmd}<确认领取/@gettitle_1>         ^<了解称号/@gettitle_2>\ \'
  +'|{cmd}<返回/@main>' 
  );         
end;

procedure _gettitle_1;
var
temp:integer;
HaveTitle:integer;
begin
      //雕像名是本人 
  
    temp := This_NPC.GetPlayerHonorValue; 
    
    
      
      begin
      This_NPC.SubPlayerHonorValue(100);
      if This_NPC.GetPlayerHonorValue >= 6000 then This_NPC.ChgCelebColor(1) else This_NPC.ChgCelebColor(0);
      
      This_Npc.NpcDialog(This_Player,
      '恭喜你获得了称号：“一代天骄”！\'
      );
     end; 
     
end; 
   
procedure _gettitle_2;
begin
  This_Npc.NpcDialog(This_Player,
  '沙巴克城主会获得独一无二的称号：\'
  +'一代天骄：体力值上限+100 \ \'
  +'|{cmd}<返回/@gettitle>' 
  );         
end;



  
  begin
  This_Npc.NpcDialog(This_Player,
  '尊敬的沙巴克城主'+This_Player.Name+'\'
  +'现在您的雕像荣耀值为'+inttostr(This_NPC.GetPlayerHonorValue)+'点，\'
  +'请接受万千勇士对您的敬仰与膜拜吧。\ \'
  +'|{cmd}<膜拜沙城城主/@worship>               ^<领取一代天骄称号/@gettitle> \'
  +'|{cmd}<退出/@doexit>'
  );
  
end.