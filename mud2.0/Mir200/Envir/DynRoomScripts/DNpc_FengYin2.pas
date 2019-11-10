program Mir2;


procedure OnEnter;
begin
  This_Player.SetV(0, 16, 0);
  This_Player.SetV(0, 17, 0);
end;


procedure OnLeave;
begin
  This_Player.SetV(0, 15, 0);
end;

procedure OnDie;
begin

end;


begin

end.