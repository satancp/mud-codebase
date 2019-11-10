local m = {}

m.ERR_OK 				= '{"code":0, 	 "des":"操作成功"}'
m.ERR_DEFAULT 			= '{"code":-101, "des":"未知错误"}'	
m.ERR_NONE_PSW 			= '{"code":-102, "des":"密码为空"}'	
m.ERR_CHECK_FAILD 		= '{"code":-103, "des":"验证失败"}'	 
m.ERR_ID_EXIST 			= '{"code":-104, "des":"用户名已存在"}'
m.ERR_NONE_PARAM		= '{"code":-105, "des":"缺少参数"}'
m.ERR_INNER_FAILED		= '{"code":-106, "des":"内部错误"}'
m.ERR_PSW_INVALID		= '{"code":-107, "des":"密码错误"}'
m.ERR_ID_NOT_EXIST 		= '{"code":-108, "des":"用户名不存在"}'
m.ERR_SAFECODE_INVALID  = '{"code":-109, "des":"安全码无效"}'
m.ERR_MACHINEID_INVALID = '{"code":-110, "des":"机器码无效"}'
m.ERR_TICKETID_EXPTIME  = '{"code":-111, "des":"验证超时"}'
return m
