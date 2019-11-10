
//**************信用分验证NPC 
function ActiveValidateStr:string; 
begin
  if This_Player.CheckAuthen(1,100) then
  begin 
  result:='|{cmd}<药品仓库/@CangKuMed>\'; 
  end else
  begin
  result:='|{cmd}<验证传奇信用分，成为验证用户/@PlayerActiveValidate>\';
  end; 
end;
//-------------信用分验证NPC

//****************自动开放模块
function AutoOpen(AutoType:integer) :boolean;  //按开区时间自动开放 
var
AutoDay:integer; 
begin
  case AutoType of
  1:AutoDay:= 0;      //无效 
  2:AutoDay:= 6;      //信用分限制开启 
  3:AutoDay:= 7;     //47技能书开启
  4:AutoDay:= 39;     //藏宝图开启
  5:AutoDay:= 6;     //申请沙巴克 
  end;
  
  if GetDateNum(GetNow) - GetDateNum(GetOpenGameTime) >= AutoDay then result:= true else result:= false;
   
end;

function AutoOpenDay(AutoType:integer) :integer;  //按开区时间自动开放
var
AutoDay:integer; 
begin

  case AutoType of
  1:AutoDay:= 0;      //衣服点开启 
  2:AutoDay:= 6;      //信用分限制开启 
  3:AutoDay:= 7;     //47技能书开启
  4:AutoDay:= 39;     //藏宝图开启
  5:AutoDay:= 6;     //申请沙巴克 
  end;

  result:= AutoDay + GetDateNum(GetOpenGameTime) - GetDateNum(GetNow);
   
end;

//----------------自动开放模块 

//***************验证传奇信用分 
procedure _PlayerActiveValidate;
begin
  if AutoOpen(2) then
  begin 
  This_Player.PlayerDialog(
  '尊敬的玛法勇士，您当前为未验证用户。您可以通过体验游戏内容，\'
  +'提高传奇信用分至30分，在<各仓库管理员和传送员处成为验证用户/c=red>。\'
  +'您当前的的传奇信用分为<'+inttostr(This_Player.GetActivePoint)+'/c=red>分，其中临时分为<'+inttostr(This_Player.GetTmpActivePoint)+'分/c=red>。\'
  +'未验证的角色可以体验以下游戏内容：\'
  +'|1.可携带200万金币和使用20格仓库。\'
  +'|2.可以获得所有物品，但无法转移、丢弃物品给其他玩家。\ \'
  +'|{cmd}<了解增强传奇信用分的方式/@AboutActive>\'
  +'|{cmd}<验证传奇信用分，成为验证用户/@ValidateActive>'
  );
  end else
  This_Player.PlayerDialog(
  '尊敬的玛法勇士，您当前为未验证用户。您可以通过体验游戏内容，\'
  +'提高传奇信用分至30分，在<各仓库管理员和传送员处成为验证用户/c=red>。\'
  +'您当前的的传奇信用分为<'+inttostr(This_Player.GetActivePoint)+'/c=red>分，其中临时分为<'+inttostr(This_Player.GetTmpActivePoint)+'分/c=red>。\'
  +'未验证的角色可以体验以下游戏内容：\'
  +'|1.可携带200万金币和使用20格仓库。\'
  +'|2.可以获得所有物品，但无法转移、丢弃物品给其他玩家。\'
  +'|<将于'+inttostr(AutoOpenDay(2))+'天后开启信用分验证，在此之前您可以正常体验游戏，/c=red>\'
  +'|<当然您也可以提前验证传奇信用分，更好的体验游戏内容。/c=red>\' 
  +'|{cmd}<了解增强传奇信用分的方式/@AboutActive>\'
  +'|{cmd}<验证传奇信用分，成为验证用户/@ValidateActive>'
  );
end;
//-------------验证传奇信用分 