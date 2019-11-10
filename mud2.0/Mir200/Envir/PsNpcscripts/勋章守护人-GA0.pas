{
/*******************************************************************************
}
program Mir2;


procedure _huan5;
begin
  This_Npc.NpcDialog(This_Player,
    '五级勋章的领取将只能指定进行兑换，而不能随机进行兑换\' +
    '指定兑换五级勋将需要付出声望值640点\ \' +
    '|{cmd}<领取指定五级勋章/@zhiding5>\' +
    '|{cmd}<返回/@main>');
end;

procedure _zhiding5;
begin
  This_Npc.NpcDialog(This_Player,
    '请选择需要领取的荣誉勋章,五级勋章是指定领取的\' +
    '指定兑换需要付出640点声望值\ \' +
    '|{cmd}<指定兑换荣誉勋章51号/@winmedal~51>\' +
    '|{cmd}<指定兑换荣誉勋章52号/@winmedal~52>\' +
    '|{cmd}<指定兑换荣誉勋章53号/@winmedal~53>\' +
    '|{cmd}<指定兑换荣誉勋章54号/@winmedal~54>\' +
    '|{cmd}<指定兑换荣誉勋章55号/@winmedal~55>\');
end;

procedure _winmedal(str: string);
begin
  This_Npc.SpeGetMedalBySw(This_Player, str);
end;

procedure _huan;
begin
  This_Npc.NpcDialog(This_Player,
    '想要领取荣誉勋章的话你必须要有足够的声望值，\' +
    '指定兑换和随机兑换都可以使用声望进行兑换\' +
    '|{cmd}<领取随机勋章/@feizhiding>\' +
    '|{cmd}<领取指定勋章/@zhiding>\ ' +
    '|{cmd}<返回/@main>');
end;

procedure _lingxunz(str: string);
begin
  This_Npc.RndGetMedal(This_Player, str);
end;

procedure _feizhiding;
begin
  This_Npc.NpcDialog(This_Player,
    '请选择需要领取的荣誉勋章，这里是随机领取的。\\' +
    '|{cmd}<随机领取11至15号荣誉勋章/@lingxunz~1>\' +
    '|{cmd}<随机领取21至25号荣誉勋章/@lingxunz~2>\' +
    '|{cmd}<随机领取31至35号荣誉勋章/@lingxunz~3>\' +
    '|{cmd}<随机领取41至45号荣誉勋章/@lingxunz~4>\' +
    '|{cmd}<返回/@main>');
end;

procedure _zhidxunz(str: string);
begin
  This_Npc.SpeGetMedalByRy(This_Player, str);
end;

procedure _zhiding;
begin
  This_Npc.NpcDialog(This_Player,
    '这里你可以领取指定的荣誉勋章，\' +
    '当然，你要付出更多的声望。\\' +
    '|{cmd}<荣誉勋章11号/@zhidxunz~1> ^<荣誉勋章12号/@zhidxunz~2> |<荣誉勋章13号/@zhidxunz~3> ^<荣誉勋章14号/@zhidxunz~4> |<荣誉勋章15号/@zhidxunz~5>\' +
    '|{cmd}<荣誉勋章21号/@zhidxunz~6> ^<荣誉勋章22号/@zhidxunz~7> |<荣誉勋章23号/@zhidxunz~8> ^<荣誉勋章24号/@zhidxunz~9> |<荣誉勋章25号/@zhidxunz~10>\' +
    '|{cmd}<荣誉勋章31号/@zhidxunz~11> ^<荣誉勋章32号/@zhidxunz~12> |<荣誉勋章33号/@zhidxunz~13> ^<荣誉勋章34号/@zhidxunz~14> |<荣誉勋章35号/@zhidxunz~15>\' +
    '|{cmd}<荣誉勋章41号/@zhidxunz~16> ^<荣誉勋章42号/@zhidxunz~17> |<荣誉勋章43号/@zhidxunz~18> ^<荣誉勋章44号/@zhidxunz~19> |<荣誉勋章45号/@zhidxunz~20>\' +
    '|{cmd}<返回/@main>');
end;

procedure _sj;
begin
  This_Npc.NpcDialog(This_Player,
    '勋章可成功升级的次数与勋章的等级一致,即1级勋章只能成功升级1次\' +
    '首先请将需要升级的荣誉勋章佩戴在身上而不是放在你的包裹内；\' +
    '其次你需要在包裹内放好升级荣誉勋章的各种原料；\' +
    '每次升级荣誉勋章都会收走你包裹内的所有原料,请保管好重要物品。\' +
    '勋章升级分为两种，一种是常规升级，一种是“惊彩”升级。\\' +
    '|{cmd}<查看升级配方/@cksj>\' +
    '|{cmd}<选择勋章常规升级/@cgsj>\' +
    '|{cmd}<选择勋章惊彩升级/@jcsj>\' +
    '|{cmd}<返回/@main>');
end;

procedure _cksj;
begin
  This_Npc.NpcDialog(This_Player,
    '常规升级中,1级和2级勋章的配方中需要加入和勋章属性对应的祖玛首饰,\' +
    '3级和4级勋章的配方中需要加入圣战、法神、天尊三职业对应套装首饰,\' +
    '防御和魔法防御类勋章的升级配方中可以放入对应类型的随意属性首饰,\' +
    '每次升级必须具备5种物品:首饰,祈福项链,勋章之心,绿宝石矿,紫水晶矿\' +
    '5种物品的数量需要你来配,这个我帮不了你,总之越接近配方成功率越高\' +
    '勋章常规升级失败了勋章不会破碎，但失败一次勋章的总持久将减少5点\' +
    '惊彩升级中，你可以知道明确的配方，但是只有50％的成功机会，\' +
    '失败的话勋章就会破碎，如果未符合配方要求的话也肯定会破碎的。\\' +
    '|{cmd}<返回上页/@sj>');
end;

procedure _cgsj;
begin
  This_Npc.NpcDialog(This_Player,
    '第一次升级需要的首饰为:戒指；\' +
    '成功一次以后第二次需要的首饰是:手镯，\' +
    '第三次需要的首饰是:项链；第四次则需要的是:头盔。\' +
    '勋章常规升级失败了也不会破碎，但失败一次勋章的总持久将减少5点。\' +
    '当勋章的总持久低于或者等于5点时将不能再进行勋章的常规升级。\' +
    '每次常规升级都需要消耗3点的声望值\\' +
    '|{cmd}<开始常规升级/@kscgsj>\' +
    '|{cmd}<返回/@sj>');
end;

procedure _uplvmedal;
begin
  This_Npc.UpMedalAbil(This_Player);
end;

procedure _kscgsj;
begin
  This_Npc.NpcDialog(This_Player,
    '不管你的包裹内是否有足够的配方材料，\' +
    '一旦点击“确认升级”即开始升级荣誉勋章，\' +
    '即使你的包裹内什么也没有，或者有大量的首饰，\' +
    '都会被视为升级原料收走，因此在升级前你要仔细考虑，\' +
    '在包裹内放入你认为最合适的配方原料。\' +
    '能不能升级成功就看你的领悟力了！\\' +
    '|{cmd}<确认升级/@uplvmedal>\' +
    '|{cmd}<返回/@sj>');
end;

procedure _jcsj;
begin
  This_Npc.NpcDialog(This_Player,
    '想要进行荣誉勋章的“惊彩”升级？\' +
    '这个……\' +
    '你还是等等再来吧！\\' +
    '|{cmd}<返回/@sj>');
end;

procedure _sj5;
begin
  This_Npc.NpcDialog(This_Player,
    '五级荣誉勋章可不简单，要升级也没那么容易。\' +
    '一旦升级后，勋章的魔力就会被释放，威力大的无法形容！\' +
    '但是传说这个勋章同时也隐藏着惊人的秘密。\' +
    '你知道这个秘密了吗？\' +
    '|{cmd}<我知道了/@zhidao>\' +
    '|{cmd}<我不知道/@buzhidao>');
end;

procedure _zhidao;
begin
  This_Npc.NpcDialog(This_Player,
    '那就请你告诉我吧...\ \' +
    '|{cmd}<返回/@main>');
end;

procedure _buzhidao;
begin
  This_Npc.NpcDialog(This_Player,
    '既然不知道，那还有什么好说的？\' +
    '你还是再去打听打听再来吧。\ \' +
    '|{cmd}<返回/@main>');
end;

procedure _checkswry;
begin
  This_Npc.NpcDialog(This_Player,
    '你目前的声望是：' + inttostr(This_Player.MyShengwan));
end;

procedure domain;
begin
  This_Npc.NpcDialog(This_Player,
    '这里可以领取荣誉勋章,只要有足够的声望,\' +
    '等级越高的勋章需要越多的声望。各级勋章所需条件如下：\' +
    '一级勋章需要:20点,兑换指定编号的一级勋章需要:80点\' +
    '二级勋章需要:40点,兑换指定编号的二级勋章需要:160点\' +
    '三级勋章需要:60点,兑换指定编号的三级勋章需要:240点\' +
    '四级勋章需要:80点,兑换指定编号的四级勋章需要:320点\' +
    '|{cmd}<兑换荣誉勋章/@huan>                   ^<兑换五级荣誉勋章/@huan5>\' +
    '|{cmd}<升级荣誉勋章/@sj>                   ^<升级五级荣誉勋章/@sj5>\' +
    '|{cmd}<查询声望点数/@checkswry>');
end;


begin
  domain;
end.