{
/*******************************************************************************
}

program Mir2;

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;

procedure _reqname;
var 
reqnameType:integer;
reqnameStr:string;
begin
  if This_Npc.GetCelebName = This_Player.Name then 
  begin
    reqnameType := This_Npc.ReqBecomeCeleb(This_Player);
    case reqnameType of
      0:
      begin
      reqnameStr:='申请成功，你成功更新了雕像等级！';
      end;
      -1:reqnameStr:='改天再来尝试吧!'; 
      -2:reqnameStr:='继续修炼，你的等级不够35!'; 
      -3:reqnameStr:='你似乎找错申请对象了吧！';
      -4:reqnameStr:='前一个勇士成功申请还不到10分钟，你过几分钟再来....';
      -5:reqnameStr:='继续修炼，你只差一点点就可以上榜了!'; 
    end;  
  end else
  begin
    reqnameType := This_Npc.ReqBecomeCeleb(This_Player); 
    case reqnameType of
      0:
      begin

      reqnameStr:='申请成功！';
      end;
      -1:reqnameStr:='改天再来尝试吧!'; 
      -2:reqnameStr:='继续修炼，你的等级不够35!'; 
      -3:reqnameStr:='你似乎找错申请对象了吧！';
      -4:reqnameStr:='前一个勇士成功申请还不到10分钟，你过几分钟再来....';
      -5:reqnameStr:='继续修炼，你只差一点点就可以上榜了!'; 
    end;          
  end; 
  This_Npc.NpcDialog(This_Player,reqnameStr); 
end;

procedure OnInitialize;
begin
  This_Npc.AddNpcProp(8);
  This_Npc.AddNpcProp(13);
  This_Npc.AddNpcProp(2);
end;

begin

  This_Npc.NpcDialog(This_Player,
  '想为自己树立一尊雕像，从此天下扬名？机会来了！\'
  +'如果你对自己的等级和经验值有充分的自信，\'
  +'那就在这里提交申请吧。\'
  +'只要你的等级和经验值比本雕像当前显示的这位英雄高，\'
  +'本雕像就将以你为名！\' 
  +'注意：申请的时候可别搞错职业和性别哦。\ \'
  +'|{cmd}<申请/@reqname>                       ^<退出/@doexit>'
  );
end.