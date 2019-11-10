{********************************************************************

*******************************************************************}

PROGRAM Mir2;


{$I common.pas}



Procedure _doexit;
begin
   This_Npc.CloseDialog(This_Player);
end;

procedure _Exit;
begin
  This_Npc.CloseDialog(This_Player);
end;


 
//原内容； 
Procedure _huwei;
begin
   This_Npc.NpcDialog(This_Player,
   '当年那位的后代现在成了这个样子，真让人伤心啊！\'+
   '听说他还有一个箭手兄弟流落在丛林深处，谁能帮助他们\'+
   '恢复本性呢？\ \'+
   '|{cmd}<确定/@doexit>');
end;

Procedure _superamo;
begin
   This_Npc.NpcDialog(This_Player,
   '古老神秘的苍月岛，在开天辟地初期那时诞生，在魔神\'+
   '战争的时候消失，现在苍月岛又再次出现，魔王的来临\'+
   '......唉，传说中6件圣物难到要重现世间？\'+
   '年轻人多加努力吧，随着苍月岛的出现会有更多不可思\'+
   '议的事情发生，玛法大陆的未来属于你们！\ \'+
   '|{cmd}<天尊!请让我与恶魔较量！/@join>\'+
   '|{cmd}<算了,我还是离开吧/@doexit>\');
end;

Procedure _join;
begin
   This_Npc.NpcDialog(This_Player,
   '你既然下定了决心，那就去寻找白日门的四层石塔，\'+
   '其中的一座是通往试练之地的通道，找到它，战胜里面的恶魔吧！\ \'+
   '|{cmd}<离开/@doexit>');
end;



 

procedure _normal;
begin
      This_Npc.NpcDialog(This_Player,
      '赤月恶魔的势力正在扩展，罪恶正在临近。\'+
      '年轻人，你已经处在危险的边缘，你愿意远征到赤月峡谷吗？\'+
      '我无法传授你任何武功，但我可以透露给你一个秘密：\'+
      '赤月恶魔的唯一弱点就是......\'+
      '听见了吗？好了，你去吧。\ \'+
      '|{cmd}<打听/@huwei>虎卫和鹰卫的消息' + addspace(' ',14) + '|{cmd}<打听苍月岛的真正来由/@superamo>\'+
      '|{cmd}<退出/@doexit>');
end;

Begin
     _normal;
end.