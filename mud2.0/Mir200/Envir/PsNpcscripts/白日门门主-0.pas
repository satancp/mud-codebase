{********************************************************************

* 单元名称：白日门门主——神秘人  bairimenzhu-B354
* 摘    要：
* 备    注：用到任务号12的1，2，3号变量

*******************************************************************}


program mir2;

{$I common.pas}

procedure _DoExit;
begin
  This_Npc.CloseDialog(This_Player);
end;


procedure _gotianzun;
begin
   if This_Player.Level >= 1 then
   begin
      This_Player.SetV(12,1,1);
      This_Npc.NpcDialog(This_Player,
      '那你快去找盟重门徒吧！\'+
      '他正率领一批新招募的英雄学习白日门技能，\'+
      '你可以去帮助他带领这些新勇士。\ \'+
      '|{cmd}<好的，我去找盟重门徒/@doexit>');
   end else
   begin
      This_Npc.NpcDialog(This_Player,
      '朋友，你的内力不足，很难通过盟重门徒的考验，\'+
      '还是等你多修炼几日再来吧！');
   end;
end;


procedure _gointo;
begin
  { if This_Player.Level < 40 then
   begin
      This_Npc.NpcDialog(This_Player,
      '朋友，你的内力不足，很难通过盟重门徒的考验，\'+
      '还是等你多修炼几日再来吧！');
   end else }
   if compareText(This_Player.MapName,'0') = 0 then
   begin
      This_Player.SetV(12,1,3);
      This_Player.Flyto('hero001',26,27);      
   end;
end;


//脚本执行的入口
var
  nRetJ, nRetB : integer;
begin
   nRetJ := This_Player.MyHeroState(1);        //检查酒馆英雄返回值 ，0=无，1=有，2=寄放 
   nRetB := This_Player.MyHeroState(0);        //检查白日门英雄返回值 ，0=无，1=有，2=寄放
   if ( nRetJ = 1 ) or ( nRetB = 1 ) then
   begin
      This_Npc.NpcDialog(This_Player,
      '年轻人，白日门合击技的威力让所有的邪恶力量都为之胆怯，\'+
      '但是在那场白日门的叛乱中，合击技已经被毁坏的残却不全，\'+
      '幸好白日门的先祖们为了防止以后合击技落入兽人的手中，\'+
      '在修炼合击技之时，就将秘密隐藏在白日门的各种技能书中，\'+
      '不过打开技能书中隐藏的秘密需要很精密的手法，你可以去\'+
      '找龙人，他会给你一定帮助的。\ \'+
      '|{cmd}<好的，我这就去找他/@doexit>');
   end else if nRetB = 2 then
   begin  
      This_Npc.NpcDialog(This_Player,
      '你的白日门英雄已经被寄放在酒馆了。\ \'+
      '|{cmd}<离开/@doexit>');
   end else if nRetB = 0 then
   begin
      if This_Player.Level >= 1 then
      begin
         This_Npc.NpcDialog(This_Player,
      //'祝贺你通过了考验，看来你的实力果然强大，\'+
         '我决定现在就送你去英雄地，把天尊刚招募的英雄托付给你，\'+
         '守护在那里的长老会给你一个英雄。\ \'+
         '|{cmd}<好的，我去找他/@gointo>');
      end else
      begin
         This_Npc.NpcDialog(This_Player,
         '年轻人，你能来帮助我们白日门我真的很高兴，经过许多\'+
         '人的努力，已经有一部分英雄被解救出来，如果你要去解\'+
         '救目前还被囚禁的英雄，那我感激不尽。');
      end;
   //end else if  This_Player.GetV(12,1) = 1 then
   //begin
   //   This_Npc.NpcDialog(This_Player,
   //   '你快去找盟重门徒吧！\'+
   //   '他正率领一批新招募的英雄学习白日门技能，\'+
   //   '你可以去帮助他带领这些新勇士。\ \'+
   //   '|{cmd}<好的，我去找盟重门徒/@doexit>');
   //end else
   //begin
   //   This_Npc.NpcDialog(This_Player,
   //   '年轻人，你能来帮助我们白日门我真的很高兴，经过许多\'+
   //   '人的努力，已经有一部分英雄被解救出来，如果你要去解\'+
   //   '救目前还被囚禁的英雄，那我感激不尽。\'+
   //   '此外，听说白日门天尊也刚刚招募了一批英雄，现在，正\'+
   //   '由盟重门徒率领这些新招募的英雄接受磨炼，你是否愿意\'+
   //   '帮助盟重门徒，去训练这些新勇士呢？\ \'+
   //   '|{cmd}<我愿意帮盟重门徒训练新招募的英雄/@gotianzun>\');
   end;
end.    