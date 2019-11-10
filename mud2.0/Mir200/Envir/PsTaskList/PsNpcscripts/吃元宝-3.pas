  {自动吃元宝灵符 
作者：开心就好
内容：上线点击一次该NPC就会循环检测包里元宝，灵符数目，自动吃！
之处吃1 2 5 10元宝和灵符，需要大额自己在else后面添加
下线后该脚本停止运行，跑酷，泡点，套装触发和该脚本的思路一模一样！ 
}
PROGRAM Mir2;
Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;
procedure domain;
begin
    This_NPC.NpcDialog(This_Player,
       '☆☆☆欢迎光临【笑傲武林】自助中心☆☆☆\|'              
     +' ☆☆本中心为了玩家自动吃包里小额元宝和灵符而设计☆☆\|'
     +' ☆☆下线后再次上线需要重新开启☆☆\|'
    +'{cmd}<开启/@kq> \');
end;

procedure kq;
begin
  if This_Player.GetBagItemCount('1灵符礼包') >0  then
  begin
      This_Player.Take('1灵符礼包', 1);
      This_Player.AddLF(1,1);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('2灵符礼包')>0  then
  begin
      This_Player.Take('2灵符礼包', 1);
      This_Player.AddLF(1,2);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('5灵符礼包')>0  then
  begin
      This_Player.Take('5灵符礼包', 1);
      This_Player.AddLF(1,5);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('10灵符礼包')>0  then
  begin
      This_Player.Take('10灵符礼包', 1);
      This_Player.AddLF(1,10);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('20灵符礼包')>0  then
  begin
      This_Player.Take('20灵符礼包', 1);
      This_Player.AddLF(1,20);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('50灵符礼包')>0  then
  begin
      This_Player.Take('50灵符礼包', 1);
      This_Player.AddLF(1,50);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
  if This_Player.GetBagItemCount('100灵符礼包')>0  then
  begin
      This_Player.Take('100灵符礼包', 1);
      This_Player.AddLF(1,100);
      This_Player.CallOut(This_NPC,5,'kq');
  end else 
   if This_Player.GetBagItemCount('1元宝')>0  then
  begin
      This_Player.Take('1元宝', 1);
      This_Player.ScriptRequestAddYBNum(1);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('2元宝')>0  then
  begin
      This_Player.Take('2元宝', 1);
      This_Player.ScriptRequestAddYBNum(2);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('5元宝')>0  then
  begin
      This_Player.Take('5元宝', 1);
      This_Player.ScriptRequestAddYBNum(5);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('10元宝')>0  then
  begin
      This_Player.Take('10元宝', 1);
      This_Player.ScriptRequestAddYBNum(10);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('20元宝')>0  then
  begin
      This_Player.Take('20元宝', 1);
      This_Player.ScriptRequestAddYBNum(20);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
  if This_Player.GetBagItemCount('20元宝')>0  then
  begin
      This_Player.Take('50元宝', 1);
      This_Player.ScriptRequestAddYBNum(50);
      This_Player.CallOut(This_NPC,5,'kq');
  end else
      This_Player.CallOut(This_NPC,5,'kq');
end; 

procedure _kq;
begin
kq;
end;
begin
domain;
end.