PROGRAM Mir2;

const                                       // 赤金钥匙|白银钥匙|紫铜钥匙|神秘钥匙|                                                                                                                                                                         传音筒|
  C_NeedLoadGoodsNames_001 = '烟花|个性发型|金条|气血石(小)|魔血石(大)|比奇传送石|盟重传送石|坚硬的桦木|乾坤令包|双倍秘籍|双倍宝典|书页|金砖|随机传送石|勋章之心|1000元宝|修复神水|雪霜捆药绳|疗伤药捆药绳|太阳水捆药绳|千里传音|千里传音(大)|50倍卷轴|5声望包|10声望包|20声望包|50声望包|100声望包|50金刚石|100金刚石|200金刚石|500金刚石|1元宝|5元宝|10元宝|50元宝|100元宝|飞火流星|召唤强化卷|至尊凭证';
  C_NeedLoadGoodsNames_002 = '烟花|个性发型|金条|气血石(小)|魔血石(大)|比奇传送石|盟重传送石|坚硬的桦木|乾坤令包|双倍秘籍|双倍宝典|书页|金砖|随机传送石|勋章之心|1000元宝|修复神水|雪霜捆药绳|疗伤药捆药绳|太阳水捆药绳|千里传音|千里传音(大)|50倍卷轴|5声望包|10声望包|20声望包|50声望包|100声望包|50金刚石|100金刚石|200金刚石|500金刚石|1元宝|5元宝|10元宝|50元宝|100元宝|飞火流星|召唤强化卷|至尊凭证';

var                                      
  UsingGoodsName: string;

//提供加载配置商品接口 入参：需要加载的商品(格式：商品1|商品2|...)  返回：成功失败
//function SendYBShopConfig(const NeedLoadGoodsNames: string): Boolean;

//提供记录日志和记录销售排行接口 入参：商品名称 商品编号(查日志用) 商品数量 总价  返回：写入数据库的Idx， > 0为成功， <= 0为失败
//function AddToBuyGoodsLogByScript(const GoodsName: string; const GoodsIdx, GoodsWantNum, TotalPrice: Integer): Integer;

//设置配置信息刷新时间，更新此设置需重新加载脚本 入参：时间格式HH:MM:SS
//procedure SetYBShopRefreshTime(const str: string);

function IsUsingGoodsName(const GoodsName: string): Boolean;
var
  Str, TempStr: string;
begin
  Result := False;
  Str := UsingGoodsName;
  while Str <> '' do
  begin
    Str := GetValidStr(Str, TempStr, '|');
    if TempStr = GoodsName then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function GetYBShopConfig(GoodsName: string; out vClassName: string; out vItemList: string; out vGoodsIdx, vSrcPrice, vCurPrice, vLimitType, vLimitCount: Word): string;
var
  vEffectImg: Integer;     //传递给客户端显示属性
  vEffectCount: Word;   //传递给客户端显示属性
  vGoodsExplain: string;   //传递给客户端显示属性
begin
  //返回值提供给程序加载 因为程序无法通过var修改参数
  //var提供脚本直接使用
  //vClassCode需按序
  vClassName := '';
  vItemList := '';
  vGoodsIdx := 0;
  vSrcPrice := 0;
  vCurPrice := 0;
  vEffectImg := 0;
  vEffectCount := 0;
  vGoodsExplain := '';
  vLimitType := 0;    //0不限购 1每日限购 2终身限购
  vLimitCount := 0;

  case GoodsName of
        '烟花': 
        begin 
          vClassName := '装饰'; 
          vItemList := '烟花:1'; 
          vGoodsIdx := 209; 
          vSrcPrice := 50; //原价  
          vCurPrice := 50; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 450; 
          vEffectCount := 8; 
          vGoodsExplain := '蛋糕烟花效果|使用后产生绚丽烟花效果|效果共持续1分钟|并伴有红字公告|购买后与角色绑定'; 
        end; 
        '个性发型': 
        begin 
          vClassName := '装饰'; 
          vItemList := '个性发型:1'; 
          vGoodsIdx := 222; 
          vSrcPrice := 30; //原价  
          vCurPrice := 30; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 520; 
          vEffectCount := 18; 
          vGoodsExplain := '可改变发型|男性使用获得光头效果|女性使用获得蓝发效果|更加突现出您的个性|购买后与角色绑定'; 
        end; 
        '反璞归真': 
        begin 
          vClassName := '装饰'; 
          vItemList := '反璞归真:1'; 
          vGoodsIdx := 223; 
          vSrcPrice := 2; //原价  
          vCurPrice := 2; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 540; 
          vEffectCount := 1; 
          vGoodsExplain := '可改变发型|使用后恢复成原来的发型|购买后与角色绑定'; 
          
        end; 
        '10声望包': 
        begin 
          vClassName := '装饰'; 
          vItemList := '10声望包:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 20; //原价  
          vCurPrice := 20; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得10点声望||使用方法:双击|'; 
        end; 
        '5声望包': 
        begin 
          vClassName := '装饰'; 
          vItemList := '5声望包:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得5点声望||使用方法:双击|'; 
        end; 
        '20声望包': 
        begin 
          vClassName := '装饰'; 
          vItemList := '20声望包:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 40; //原价  
          vCurPrice := 40; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得20点声望||使用方法:双击|'; 
        end; 
        '50声望包': 
        begin 
          vClassName := '装饰'; 
          vItemList := '50声望包:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 70; //原价  
          vCurPrice := 70; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得50点声望||使用方法:双击|'; 
        end; 
        '100声望包': 
        begin 
          vClassName := '装饰'; 
          vItemList := '100声望包:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 120; //原价  
          vCurPrice := 120; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得100点声望||使用方法:双击|'; 
        end; 
        '50金刚石': 
        begin 
          vClassName := '装饰'; 
          vItemList := '50金刚石:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 20; //原价  
          vCurPrice := 20; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得50金刚石||使用方法:双击|'; 
        end; 
        '100金刚石': 
        begin 
          vClassName := '装饰'; 
          vItemList := '100金刚石:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 40; //原价  
          vCurPrice := 40; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得100金刚石||使用方法:双击|'; 
        end; 
        '200金刚石': 
        begin 
          vClassName := '装饰'; 
          vItemList := '200金刚石:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 80; //原价  
          vCurPrice := 80; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得200金刚石||使用方法:双击|'; 
        end;
        '500金刚石': 
        begin 
          vClassName := '装饰'; 
          vItemList := '500金刚石:1'; 
          vGoodsIdx := 262; 
          vSrcPrice := 180; //原价  
          vCurPrice := 180; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可开启获得500金刚石||使用方法:双击|'; 
        end;             
        '金条': 
        begin 
          vClassName := '补给'; 
          vItemList := '金条:1'; 
          vGoodsIdx := 390; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '价值100万金币|双击即可使用|也可至庄园仓库|管理员处兑换100万金币|每次扣除2000金币手续费'; 
        end; 
        '书页': 
        begin 
          vClassName := '补给'; 
          vItemList := '书页:1'; 
          vGoodsIdx := 202; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 479; 
          vEffectCount := 7; 
          vGoodsExplain := '交给比奇皇宫的大学士，可以用于兑换47级技能书'; 
        end; 
        '乾坤令包': 
        begin 
          vClassName := '补给'; 
          vItemList := '乾坤令包:1'; 
          vGoodsIdx := 203; 
          vSrcPrice := 5; //原价  
          vCurPrice := 5; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 479; 
          vEffectCount := 7; 
          vGoodsExplain := '双击获得5个乾坤令，用于进入藏宝阁'; 
        end; 
        '气血石(小)': 
        begin 
          vClassName := '补给'; 
          vItemList := '气血石(小):1'; 
          vGoodsIdx := 204; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 479; 
          vEffectCount := 7; 
          vGoodsExplain := '补充40000HP|装备于角色栏中|自动恢复总量40000HP|每次持续回复10点|1点持久等于10000HP|购买后与角色绑定'; 
        end; 
        '幻魔石(小)': 
        begin 
          vClassName := '补给'; 
          vItemList := '幻魔石(小):1'; 
          vGoodsIdx := 205; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 459; 
          vEffectCount := 7; 
          vGoodsExplain := '补充60000MP|装备于角色栏中|自动恢复总量60000MP|每次持续回复10点|1点持久等于10000MP|购买后与角色绑定'; 
        end; 
        '幻魔石(中)': 
        begin 
          vClassName := '补给'; 
          vItemList := '幻魔石(中):1'; 
          vGoodsIdx := 206; 
          vSrcPrice := 20; //原价  
          vCurPrice := 20; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 459; 
          vEffectCount := 7; 
          vGoodsExplain := '补充140000MP|装备于角色栏中|自动恢复总量140000MP|每次持续回复10点|1点持久等于10000MP|购买后与角色绑定'; 
        end; 
        
        '魔血石(大)': 
        begin 
          vClassName := '补给'; 
          vItemList := '魔血石(大):1'; 
          vGoodsIdx := 254; 
          vSrcPrice := 100; //原价  
          vCurPrice := 100; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '自动恢复HP和MP|兼气血石和幻魔石的效果|于一体,装备于角色栏|恢复HP和MP,总量达20W|使用方法同气血石|购买后与角色绑定'; 
        end; 
        '比奇传送石': 
        begin 
          vClassName := '强化'; 
          vItemList := '比奇传送石:1'; 
          vGoodsIdx := 217; 
          vSrcPrice := 20; //原价  
          vCurPrice := 20; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 410; 
          vEffectCount := 10; 
          vGoodsExplain := '传送到比奇|直接传送回比奇|让您随意穿梭于玛法大陆|可使用20次'; 
        end; 
        '盟重传送石': 
        begin 
          vClassName := '强化'; 
          vItemList := '盟重传送石:1'; 
          vGoodsIdx := 218; 
          vSrcPrice := 20; //原价  
          vCurPrice := 20; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 410; 
          vEffectCount := 10; 
          vGoodsExplain := '传送到盟重|直接传送回盟重|让您随意穿梭于玛法大陆|可使用20次'; 
        end; 
        '随机传送石': 
        begin 
          vClassName := '强化'; 
          vItemList := '随机传送石:1'; 
          vGoodsIdx := 247; 
          vSrcPrice := 20; //原价  
          vCurPrice := 20; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '随机传送|双击即可在当前地图内|随机传送|让您随意穿梭于玛法大陆|可使用50次，非绑定物品'; 
        end; 
        '修复神水': 
        begin 
          vClassName := '强化'; 
          vItemList := '修复神水:1'; 
          vGoodsIdx := 248; 
          vSrcPrice := 5; //原价  
          vCurPrice := 5; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '修复全部装备|放于包裹中|双击即可特修所有|已穿戴装备|可累计修复100点持久|非绑定物品'; 
        end; 
        '坚硬的桦木': 
        begin 
          vClassName := '强化'; 
          vItemList := '坚硬的桦木:1'; 
          vGoodsIdx := 402; 
          vSrcPrice := 30; //原价  
          vCurPrice := 30; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '扩充仓库|在仓库保管员处|可增扩大仓库'; 
        end; 
        '金砖': 
        begin 
          vClassName := '强化'; 
          vItemList := '金砖:1'; 
          vGoodsIdx := 235; 
          vSrcPrice := 60; //原价  
          vCurPrice := 60; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '金砖,价值500W'; 
        end; 
        '雪霜捆药绳': 
        begin 
          vClassName := '强化'; 
          vItemList := '雪霜捆药绳:1'; 
          vGoodsIdx := 215; 
          vSrcPrice := 6; //原价  
          vCurPrice := 6; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 470; 
          vEffectCount := 8; 
          vGoodsExplain := '捆绑万年雪霜|将6个万年雪霜捆绑起来|以节约更多的空间|可使用10次'; 
        end; 
        '疗伤药捆药绳': 
        begin 
          vClassName := '强化'; 
          vItemList := '疗伤药捆药绳:1'; 
          vGoodsIdx := 216; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 470; 
          vEffectCount := 8; 
          vGoodsExplain := '捆绑疗伤药|将6个疗伤药捆绑起来|以节约更多的空间|可使用10次'; 
        end; 
        '太阳水捆药绳': 
        begin 
          vClassName := '强化'; 
          vItemList := '太阳水捆药绳:1'; 
          vGoodsIdx := 214; 
          vSrcPrice := 3; //原价  
          vCurPrice := 3; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 470; 
          vEffectCount := 8; 
          vGoodsExplain := '捆绑强效太阳水|将6个强效太阳水捆绑起来|以节约更多的空间|可使用20次'; 
        end; 
        '千里传音': 
        begin 
          vClassName := '好友'; 
          vItemList := '千里传音:1'; 
          vGoodsIdx := 208; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 429; 
          vEffectCount := 7; 
          vGoodsExplain := '向全服喊话|装备于角色栏中|使用　@传　命令|向所有玩家发布紫色公告|购买后与角色绑定|可使用10次'; 
        end; 
        '千里传音(大)': 
        begin 
          vClassName := '好友'; 
          vItemList := '千里传音(大):1'; 
          vGoodsIdx := 225; 
          vSrcPrice := 30; //原价  
          vCurPrice := 30; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 429; 
          vEffectCount := 7; 
          vGoodsExplain := '向全服喊话|装备于角色栏中|使用　@传　命令|向所有玩家发布紫色公告|购买后与角色绑定|可使用20次'; 
        end; 
        
        '礼花(中)': 
        begin 
          vClassName := '好友'; 
          vItemList := '礼花(中):1'; 
          vGoodsIdx := 341; 
          vSrcPrice := 2; //原价  
          vCurPrice := 2; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可兑换5种焰火|可在盟重镇魔守将处兑换|成一心一意包、|心心相印包、飞火流星包|浪漫星雨包、绮梦幻想包|双击每种焰火包即可|变为6个礼花'; 
        end; 
        '礼花(小)': 
        begin 
          vClassName := '好友'; 
          vItemList := '礼花(小):1'; 
          vGoodsIdx := 342; 
          vSrcPrice := 1; //原价  
          vCurPrice := 1; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '可兑换2种焰火|可在盟重镇魔守将处兑换|成长空火舞包、|如雾似梦包|双击兑换获得的焰火包|即可变为6个礼花'; 
        end; 
        '50倍卷轴': 
        begin 
          vClassName := '限量'; 
          vItemList := '50倍卷轴:1'; 
          vGoodsIdx := 337; 
          vSrcPrice := 50; //原价  
          vCurPrice := 50; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 490; 
          vEffectCount := 8; 
          vGoodsExplain := '2小时50倍经验|获得2小时50倍经验|让您事半功倍|购买后与角色绑定'; 
        end;
        '双倍宝典': 
        begin 
          vClassName := '限量'; 
          vItemList := '双倍宝典:1'; 
          vGoodsIdx := 337; 
          vSrcPrice := 20; //原价  
          vCurPrice := 20; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 490; 
          vEffectCount := 8; 
          vGoodsExplain := '24小时双倍经验|获得24小时双倍经验|让您事半功倍|购买后与角色绑定'; 
        end;
        '双倍秘籍': 
        begin 
          vClassName := '限量'; 
          vItemList := '双倍秘籍:1'; 
          vGoodsIdx := 337; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 490; 
          vEffectCount := 8; 
          vGoodsExplain := '12小时双倍经验|获得12小时双倍经验|让您事半功倍|购买后与角色绑定'; 
        end; 
        '勋章之心': 
        begin 
          vClassName := '限量'; 
          vItemList := '勋章之心:1'; 
          vGoodsIdx := 335; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 490; 
          vEffectCount := 8; 
          vGoodsExplain := '合成勋章必备'; 
        end; 
        '1000元宝': 
        begin 
          vClassName := '限量'; 
          vItemList := '1000元宝:1'; 
          vGoodsIdx := 336; 
          vSrcPrice := 1000; //原价  
          vCurPrice := 1000; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 490; 
          vEffectCount := 8; 
          vGoodsExplain := '双击使用|获得等额元宝'; 
        end; 
        '1元宝': 
        begin 
          vClassName := '强化'; 
          vItemList := '1元宝:1'; 
          vGoodsIdx := 403; 
          vSrcPrice := 1; //原价  
          vCurPrice := 1; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '双击使用|获得等额元宝'; 
        end; 
        '5元宝': 
        begin 
          vClassName := '强化'; 
          vItemList := '5元宝:1'; 
          vGoodsIdx := 403; 
          vSrcPrice := 5; //原价  
          vCurPrice := 5; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '双击使用|获得等额元宝'; 
        end; 
        '10元宝': 
        begin 
          vClassName := '强化'; 
          vItemList := '10元宝:1'; 
          vGoodsIdx := 403; 
          vSrcPrice := 10; //原价  
          vCurPrice := 10; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '双击使用|获得等额元宝'; 
        end; 
        '50元宝': 
        begin 
          vClassName := '强化'; 
          vItemList := '50元宝:1'; 
          vGoodsIdx := 403; 
          vSrcPrice := 50; //原价  
          vCurPrice := 50; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '双击使用|获得等额元宝'; 
        end; 
        '100元宝': 
        begin 
          vClassName := '强化'; 
          vItemList := '100元宝:1'; 
          vGoodsIdx := 403; 
          vSrcPrice := 100; //原价  
          vCurPrice := 100; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '双击使用|获得等额元宝'; 
        end; 
        '召唤强化卷': 
        begin 
          vClassName := '限量'; 
          vItemList := '召唤强化卷:1'; 
          vGoodsIdx := 214; 
          vSrcPrice := 200; //原价  
          vCurPrice := 200; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 470; 
          vEffectCount := 8; 
          vGoodsExplain := '道士专属卷轴|可将神兽瞬间提升至7级'; 
        end;
		'飞火流星': 
        begin 
          vClassName := '限量'; 
          vItemList := '飞火流星:1'; 
          vGoodsIdx := 214; 
          vSrcPrice := 5; //原价  
          vCurPrice := 5; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 470; 
          vEffectCount := 8; 
          vGoodsExplain := '进入沙巴克藏宝阁的必要品'; 
        end;
        '至尊凭证': 
        begin 
          vClassName := '限量'; 
          vItemList := '至尊凭证:1'; 
          vGoodsIdx := 403; 
          vSrcPrice := 200; //原价  
          vCurPrice := 200; //折扣价  
          vLimitType := 0; //限购类型  
          vLimitCount := 0; //限购数量  
          vEffectImg := 380; 
          vEffectCount := 1; 
          vGoodsExplain := '至尊土豪的象征|用于召唤虚空怪物|有几率获得装备'; 
        end; 		
  end;

  if (vClassName <> '') and IsUsingGoodsName(GoodsName)  then
    Result := vClassName + '$'
            + vItemList + '$'
            + IntToStr(vGoodsIdx) + '$'
            + IntToStr(vSrcPrice) + '$'
            + IntToStr(vCurPrice) + '$'
            + IntToStr(vLimitType) + '$'
            + IntToStr(vLimitCount) + '$'
            + IntToStr(vEffectImg) + '$'
            + IntToStr(vEffectCount) + '$'
            + vGoodsExplain
  else
    Result := '';
end;

function GetLimitValue(const GoodsName: string): Integer;
begin
  //客户端需要通过该方法取得当前限购次数，不要去掉
  Result := 0;
  case GoodsName of
       //   '金条': Result := This_Player.GetV(89, 1);
   // '随机传送石': Result := This_Player.GetV(91, 1);
      '王者之剑': Result := This_Player.GetV(91, 2);
  end;
end;

procedure SetLimitValue(const GoodsName: string; const Value: Integer);
begin
  //暂定91为每日清空
  case GoodsName of
   //       '金条': This_Player.SetV(89, 1, Value);
   // '随机传送石': This_Player.SetV(91, 1, Value);
      '王者之剑': This_Player.SetV(91, 2, Value);
  end;
end;

procedure EverydayClearLimitValue;
var
  I: Integer;
begin
  for I := 1 to 50 do
  begin
    This_Player.SetV(91, I, 0);
    
    if This_Player.GetV(89, I) < 0 then
    This_Player.SetV(89, I, 0);
  end;
end;

procedure ClientBuy(const GoodsName: string; const WantNum, NeedNum: Integer; const IsUseGloryPoint: Boolean);
var
  vClassName: string;
  vItemList: string;
  vGoodsIdx, vSrcPrice, vCurPrice, vLimitType, vLimitCount: Word;
  Price: Integer;
  CurLimitValue: Integer;
begin
  if This_Player.GetS(80, 40) <> GetDateNum(GetNow) then
  begin
    EverydayClearLimitValue;
    This_Player.SetS(80, 40, GetDateNum(GetNow));
  end;

  if This_Player.FreeBagNum >= NeedNum then
  begin
    if GetYBShopConfig(GoodsName, vClassName, vItemList, vGoodsIdx, vSrcPrice, vCurPrice, vLimitType, vLimitCount) <> '' then
    begin
      if (WantNum > 0) and (WantNum < 1000) then
      begin
        CurLimitValue := GetLimitValue(GoodsName);

        if not ((vLimitType > 0) and (CurLimitValue + WantNum > vLimitCount)) then   //限购类型判断
        begin
          Price := WantNum * vCurPrice;   //总价

          if This_Player.YBNum >= Price then
          begin
            if This_Player.AddToBuyGoodsLogByScript(GoodsName, vGoodsIdx, WantNum, Price) > 0 then
            begin
              if This_Player.PsYBConsumEx(2, 'YBShopBuy_YB', GoodsName, vGoodsIdx, vCurPrice, WantNum) then
              begin
                //提交扣费成功
                if vLimitType > 0 then
                begin
                  SetLimitValue(GoodsName, CurLimitValue + WantNum);
                end;
              end
              else
                This_Player.PlayerDialog('申请扣元宝失败！');
            end
            else
              This_Player.PlayerDialog('系统繁忙，操作失败。');
          end
          else
            This_Player.PlayerDialog('身上没有足够的元宝。');
        end
        else
          This_Player.PlayerDialog('已达到限购数上限。');
      end
      else
        This_Player.PlayerDialog('购买数量不合法。');
    end
    else
      This_Player.PlayerDialog('商城未出售此物品。');
  end
  else
    This_Player.PlayerDialog('您身上没有足够的空间。');
end;

function YBShopBuy_YB(const DescName: string; const Price, Num: Integer): Boolean;
var
  vClassName,T_name : string;
  vItemList: string;
  vGoodsIdx, vSrcPrice, vCurPrice, vLimitType, vLimitCount: Word;
  Str, TempStr, SubTempStr: string;
begin
  Result := False;
  if GetYBShopConfig(DescName, vClassName, vItemList, vGoodsIdx, vSrcPrice, vCurPrice, vLimitType, vLimitCount) <> '' then
  begin
    if This_Player.FreeBagNum > 0 then
    begin
      Str := vItemList;
      while Str <> '' do
      begin
        Str := GetValidStr(Str, TempStr, '/');
        if TempStr <> '' then
        begin
          TempStr := GetValidStr(TempStr, SubTempStr, ':');

          //SubTempStr 物品名
          //TempStr 物品数量
          if copy(SubTempStr,length(SubTempStr) - 3 , length(SubTempStr)) = '(绑)' then
          This_Player.GiveBindItem(SubTempStr, StrToIntDef(TempStr, 0))
          else
          This_Player.Give(SubTempStr, StrToIntDef(TempStr, 0));

          This_Player.AddLogRec(51, SubTempStr, 333333, StrToIntDef(TempStr, 0), '商城购入' + DescName);
        end;
      end;

      Result := True;
    end
    else
      This_Player.PlayerDialog('您身上没有空间，请联系GM补领物品。');
  end
  else
    This_Player.PlayerDialog('商品被下架，获取物品失败，请联系GM补领物品。');
end;

procedure Execute;
var
  nowDay: Integer;
begin
  nowDay := StrToIntDef(MirDateTimeToStr('yyyyMMdd' , GetNow), -1);

  if (nowDay >= 20160802) and (nowDay <= 20160927) then
    UsingGoodsName := C_NeedLoadGoodsNames_001
  else
    UsingGoodsName := C_NeedLoadGoodsNames_002;

  if not SendYBShopConfig(UsingGoodsName) then
    DebugOut('[Error]YBShopScript加载' + UsingGoodsName + '失败！');
end;

procedure Initialize;
begin
  UsingGoodsName := C_NeedLoadGoodsNames_001;     //脚本加载的初始值

  SetYBShopRefreshTime('00:00:00');
  SetYBShopRefreshTime('06:00:00');
  SetYBShopRefreshTime('12:00:00');

  Execute;
end;

Begin
end.