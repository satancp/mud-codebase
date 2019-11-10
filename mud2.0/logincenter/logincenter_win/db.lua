--package.path =  "../?/init.lua;" .. package.path
local config = require "config.application"
local mongo = require "resty.mongol"
local json = require "cjson.safe"
local errcode = require "errorcode"
local m = {}

local timeout = config.timeout or 10000
local max_idle_time = config.max_idle_time or 10000
local pool_size = config.pool_size or 20

local function get_db(dbname, id, key)
	local conn = mongo:new()
	conn:set_timeout(timeout)
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		return "null"
	end

	local db = conn:new_db_handle(dbname)
	local col = db:get_col(dbname)
	
	r = col:find_one({ticket = id})
	if r then
		ok, err = conn:set_keepalive(max_idle_time, pool_size)
		if not ok then ngx.log(ngx.ERR, err) end
		return r[key]
	else
		return ""
		-- return "null"
	end
end

function m.get_acc_guest(machine_id)  --通过机器编号获取游客账号 不存在则新建 返回该ptid码
	if machine_id == "" then return nil, errcode.ERR_NONE_PARAM end

	local errstr = errcode.ERR_INNER_FAILED

	local conn = mongo:new()
	conn:set_timeout(timeout)

	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		ngx.log(ngx.ERR, "get connect occur error ---" .. err)
		return nil, errstr 
	end

	local db = conn:new_db_handle("account")

	if config.mongodbauth then
		ok = db:auth(config.mongodbuser, config.mongodbpsw) 
		if not ok then 
			ngx.log(ngx.ERR, "mongo db auth failed")
			return nil, errstr 
		end 
	end

	local col = db:get_col("guest")
	if not col then 
		ngx.log(ngx.ERR, "get guest collection occur error")
		return nil, errstr
	end

	local ptid = nil
	local r = col:find_one({machine_id = machine_id})	
	if r then
		ptid = r["pt_id"]
		errstr = errcode.ERR_OK
	else
		ptid = "pt"..string.sub(ngx.md5(machine_id..":/"..ngx.time()), 8, -8)		--暂时共20位

		--检查重复
		local normal_col = db:get_col("normal")
		if normal_col and normal_col:find_one({pt_id = ptid}) or col:find_one({pt_id = ptid}) then	
			ngx.log(ngx.ERR, ptid.." this ptid is already exist in db")
			return nil, errstr
		end

		local t = {machine_id = machine_id, pt_id = ptid, create_time = ngx.localtime(), login_time = ngx.localtime()}
         --机器编号		PT账号		创建账号时间	上次登录时间
		ok, err = col:insert({t}, nil, true)

		if ok then 
			errstr = errcode.ERR_OK
		else
			ptid = nil 
			ngx.log(ngx.ERR, err)
		end
	end

	local kep_ok, kep_err = conn:set_keepalive(max_idle_time, pool_size)
	if not kep_ok then ngx.log(ngx.ERR, kep_err) end	

	return ptid, errstr
end

function m.check_acc_normal(id, psw)	--校验正式账号
	if id == "" or psw == "" then return nil, errcode.ERR_NONE_PARAM end

	local errstr = errcode.ERR_INNER_FAILED

	local conn = mongo:new()
	conn:set_timeout(timeout)

	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		ngx.log(ngx.ERR, "get connect occur error ---" .. err)
		return nil, errstr 
	end

	local db = conn:new_db_handle("account")

	if config.mongodbauth then
		ok = db:auth(config.mongodbuser, config.mongodbpsw) 
		if not ok then 
			ngx.log(ngx.ERR, "mongo db auth failed")
			return nil, errstr 
		end 
	end

	local col = db:get_col("normal")
	if not col then 
		ngx.log(ngx.ERR, "get normal collection occur error")
		return nil, errstr
	end

	local ptid = nil
	local r = col:find_one({normal_id = id})	

--正式账号表
--注册账号		PT账号  	密码		创建账号时间	上次登录时间

	if r then
		if  r["password"] == psw then
			ptid = r["pt_id"]
			errstr = errcode.ERR_OK
		else
			errstr = errcode.ERR_PSW_INVALID
		end
	else
		errstr = errcode.ERR_ID_NOT_EXIST
	end
		
	local kep_ok, kep_err = conn:set_keepalive(max_idle_time, pool_size)
	if not kep_ok then ngx.log(ngx.ERR, kep_err) end	

	return ptid, errstr
end

function m.reg_acc_normal(id, psw, safecode)	--注册正式账号
	if id == "" or psw == "" or safecode == "" then return false, errcode.ERR_NONE_PARAM end

	local errstr = errcode.ERR_INNER_FAILED

	local conn = mongo:new()
	conn:set_timeout(timeout)

	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		ngx.log(ngx.ERR, "get connect occur error ---" .. err)
		return false, errstr 
	end

	local db = conn:new_db_handle("account")

	if config.mongodbauth then
		ok = db:auth(config.mongodbuser, config.mongodbpsw) 
		if not ok then 
			ngx.log(ngx.ERR, "mongo db auth failed")
			return false, errstr 
		end 
	end

	local col = db:get_col("normal")
	if not col then 
		ngx.log(ngx.ERR, "get normal collection occur error")
		return false, errstr
	end

	local r = col:find_one({normal_id = id})	
	local flag = false

	if r then
		errstr = errcode.ERR_ID_EXIST
	else
		--新建数据
		local ptid = "pt"..string.sub(ngx.md5(id..":/"..ngx.time()), 8, -8)

		--检查重复
		local guest_col = db:get_col("guest")
		if guest_col and guest_col:find_one({pt_id = ptid}) or col:find_one({pt_id = ptid}) then	
			ngx.log(ngx.ERR, ptid.." this ptid is already exist in db")
			return false, errstr
		end

		local t = {normal_id = id, pt_id = ptid, password = psw, safecode = safecode, create_time = ngx.localtime(), login_time = ngx.localtime()}
--正式账号表
--注册账号		PT账号  	密码		创建账号时间	上次登录时间
		ok, err = col:insert({t}, nil, true)
		if ok then 
			flag = true
			errstr = errcode.ERR_OK
		else
			ngx.log(ngx.ERR, err) 
		end

	end
		
	local kep_ok, kep_err = conn:set_keepalive(max_idle_time, pool_size)
	if not kep_ok then ngx.log(ngx.ERR, kep_err) end	

	return flag, errstr	
end

function m.modify_acc_psw(id, new_psw, safecode)		--修改密码
	if id == "" or new_psw == "" or safecode == "" then return false, errcode.ERR_NONE_PARAM end

	local errstr = errcode.ERR_INNER_FAILED

	local conn = mongo:new()
	conn:set_timeout(timeout)

	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		ngx.log(ngx.ERR, "get connect occur error ---" .. err)
		return false, errstr 
	end

	local db = conn:new_db_handle("account")

	if config.mongodbauth then
		ok = db:auth(config.mongodbuser, config.mongodbpsw) 
		if not ok then 
			ngx.log(ngx.ERR, "mongo db auth failed")
			return false, errstr 
		end 
	end

	local col = db:get_col("normal")
	if not col then 
		ngx.log(ngx.ERR, "get normal collection occur error")
		return false, errstr
	end

	local r = col:find_one({normal_id = id})	
	local flag = false

	if r then		
		if r["safecode"] == safecode then
			local t = {
				normal_id = r["normal_id"], 
				pt_id = r["pt_id"], 
				password = new_psw, 
				safecode = r["safecode"], 
				create_time = r["create_time"], 
				login_time = r["login_time"]
			}
			ok, err = col:update({_id = r["_id"]}, { ["$set"] = { password = new_psw } })	
			if ok then
				flag = true
				errstr = errcode.ERR_OK
			else
				ngx.log(ngx.ERR, err)
			end
		else
			errstr = errcode.ERR_SAFECODE_INVALID
		end
	else
		errstr = errcode.ERR_ID_NOT_EXIST
	end
		
	local kep_ok, kep_err = conn:set_keepalive(max_idle_time, pool_size)
	if not kep_ok then ngx.log(ngx.ERR, kep_err) end	

	return flag, errstr	
end

function m.bind_acc_normal(machine_id, new_normal_id, new_psw, safecode)		--绑定正式账号
	--查询游客表是否存在该机器ID
	--查询正式账号表是否存在该新ID
	--创建账号（PTID用游客表的）创建日期也使用游客表的
	--删除游客表信息

	if machine_id == "" or new_normal_id == "" or new_psw == "" or safecode == "" then return false, errcode.ERR_NONE_PARAM end

	local errstr = errcode.ERR_INNER_FAILED

	local conn = mongo:new()
	conn:set_timeout(timeout)

	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		ngx.log(ngx.ERR, "get connect occur error ---" .. err)
		return false, errstr 
	end

	local db = conn:new_db_handle("account")

	if config.mongodbauth then
		ok = db:auth(config.mongodbuser, config.mongodbpsw)
		if not ok then 
			ngx.log(ngx.ERR, "mongo db auth failed")
			return false, errstr 
		end 
	end

	local guest_col = db:get_col("guest")
	if not guest_col then 
		ngx.log(ngx.ERR, "get guest collection occur error")
		return false, errstr
	end

	local r = guest_col:find_one({machine_id = machine_id})	
	

	if r then
		local normal_col = db:get_col("normal")
		if not normal_col then 
			ngx.log(ngx.ERR, "get normal collection occur error")
			return false, errstr
		end

		local flag = false
		local rnew = normal_col:find_one({normal_id = new_normal_id})	
		
		if rnew then
			errstr = errcode.ERR_ID_EXIST
		else
			--新建数据
			local ptid = r["pt_id"]

			local t = {normal_id = new_normal_id, pt_id = ptid, password = new_psw, safecode = safecode, create_time = r["create_time"], login_time = r["login_time"]}

			ok, err = normal_col:insert({t}, nil, true)
			if ok then 
				flag = true
				errstr = errcode.ERR_OK

				--删除游客表中数据
				ok, err = guest_col:delete({_id = r["_id"]})
				if not ok then
					ngx.log(ngx.ERR, err)
				end
			else
				ngx.log(ngx.ERR, err) 
			end
		end
	else
		errstr = errcode.ERR_MACHINEID_INVALID
	end
		
	local kep_ok, kep_err = conn:set_keepalive(max_idle_time, pool_size)
	if not kep_ok then ngx.log(ngx.ERR, kep_err) end	

	return flag, errstr	
end

function m.save_ticket(ticket, ptid)
	if ticket == "" or ptid == "" then return false, errcode.ERR_NONE_PARAM end

	local errstr = errcode.ERR_INNER_FAILED

	local conn = mongo:new()
	conn:set_timeout(timeout)

	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		ngx.log(ngx.ERR, "get connect occur error ---" .. err)
		return false, errstr 
	end

	local db = conn:new_db_handle("account")

	if config.mongodbauth then
		ok = db:auth(config.mongodbuser, config.mongodbpsw)
		if not ok then 
			ngx.log(ngx.ERR, "mongo db auth failed")
			return false, errstr 
		end 
	end

	local col = db:get_col("ticket_stored")
	if not col then 
		ngx.log(ngx.ERR, "get ticket_stored collection occur error")
		return false, errstr
	end

	local flag = false

	local v = col:find_one({ticket_id = ticket})
	if not v then
		local r = col:find_one({pt_id = ptid})
		if r then
			--ptid已存在则替换新的
			ok, err = col:delete({_id = r["_id"]})
			if not ok then
				ngx.log(ngx.ERR, err)
			end		
		end

		local t = {
			ticket_id = ticket,
			pt_id = ptid, 
			create_tick = ngx.time()
		}
		ok, err = col:insert({t}, nil, true)	

		if ok then 
			flag = true
			errstr = errcode.ERR_OK
		else
			ngx.log(ngx.ERR, err) 
		end
	end

	local kep_ok, kep_err = conn:set_keepalive(max_idle_time, pool_size)
	if not kep_ok then ngx.log(ngx.ERR, kep_err) end	

	return flag, errstr	
end

function m.check_ticket(ticket, exptime)
	if ticket == "" or exptime < 0 then return false, errcode.ERR_NONE_PARAM end

	local errstr = errcode.ERR_INNER_FAILED

	local conn = mongo:new()
	conn:set_timeout(timeout)

	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		ngx.log(ngx.ERR, "get connect occur error ---" .. err)
		return false, errstr 
	end

	local db = conn:new_db_handle("account")

	if config.mongodbauth then
		ok = db:auth(config.mongodbuser, config.mongodbpsw)
		if not ok then 
			ngx.log(ngx.ERR, "mongo db auth failed")
			return false, errstr 
		end 
	end

	local col = db:get_col("ticket_stored")
	if not col then 
		ngx.log(ngx.ERR, "get ticket_stored collection occur error")
		return false, errstr
	end

	local flag = false
	local r = col:find_one({ticket_id = ticket})
	if r then
		if ngx.time() - exptime > r["create_tick"] then -- 超时
			errstr = errcode.ERR_TICKETID_EXPTIME
			ok, err = col:delete({_id = r["_id"]})
			if not ok then
				ngx.log(ngx.ERR, err)
			end
		else
			flag = r["pt_id"]
			errstr = errcode.ERR_OK
		end 
	else
		errstr = errcode.ERR_CHECK_FAILD
	end

	local kep_ok, kep_err = conn:set_keepalive(max_idle_time, pool_size)
	if not kep_ok then ngx.log(ngx.ERR, kep_err) end	

	return flag, errstr
end











function m.get_lastloginserver(id)
	return get_db('login', tostring(id), "servername")
end

function m.get_userid(id)
	return get_db('userid',id, "userid")
end

function m.set_lastloginserver(id, ticket, name)
	local conn = mongo:new()
	conn:set_timeout(timeout) 
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then return "null" end
	local db = conn:new_db_handle('login')
	local col = db:get_col('login')
	id = tostring(id)
	local r = col:find_one({ticket = id})	
	local t = {ticket = id, servername = name}
	if r then
		col:update({_id = r["_id"]}, t)	
	else
		col:insert({t}, nil, true) 
	end
	
	db = conn:new_db_handle('userid')
	col = db:get_col('userid')
	
	ok, err = col:delete({userid = id})
	if not ok then ngx.log(ngx.ERR, err) end
	
	ok, err = conn:set_keepalive(max_idle_time, pool_size)
	if not ok then ngx.log(ngx.ERR, err) end	
end


function m.set_userid(id, userid, phone)
	local conn = mongo:new()
	conn:set_timeout(timeout) 
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		return "null"
	end
	local db = conn:new_db_handle('userid')
	local col = db:get_col('userid')
	local id = tostring(id)	
	local phone = tostring(phone)
	local userid = tostring(userid)
	local r = col:find_one({ticket = id})	
	local t = {ticket = id, userid = userid, phone = phone}
	if r then
		col:update({_id = r["_id"]}, t)	
	else
		r, err = col:insert({t}, nil, true)	
	end

	ok, err = conn:set_keepalive(max_idle_time, pool_size)
	if not ok then ngx.log(ngx.ERR, err) end

end

function m.get_userphone(id)
	if not id then return end
	return get_db('userid',id, "phone")
end


-- function m.set_userphone(id, phone)
-- 	if not (id and phone) then return end
-- 	local conn = mongo:new()
-- 	conn:set_timeout(timeout)
-- 	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
-- 	if not ok then
-- 		return "null"
-- 	end
-- 	local db = conn:new_db_handle("userid")
-- 	local col = db:get_col("userid")
-- 	local id = tostring(id)
-- 	local phone = tostring(phone)
-- 	local r = col:find_one({ticket = id})
-- 	if r then
-- 		local t = {ticket = id, userid = r["userid"], phone = phone}
-- 		col:update({_id = r["_id"]}, t)
-- 	else
-- 		--由于先插入的userid, 故在正常的情况下肯定能找到这个文档,不会出现找不到的情况
-- 	end

-- 	ok, err = conn:set_keepalive(max_idle_time, pool_size)
-- 	if not ok then
-- 		ngx.log(ngx.ERR, err)
-- 	end
-- end

function m.save_userid(userid)   --insert secondpwd.secondpwd
	if not userid then return end
	
	local conn = mongo:new()
	conn:set_timeout(timeout)
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		return "null"
	end
	local db = conn:new_db_handle("secondpwd")
	local col = db:get_col("secondpwd")
	local userid = tostring(userid)
	local r = col:find_one({userid = userid})
	if not r then 
		local t = {userid = userid}
		r, err = col:insert({t}, nil, true)
	end
	ok, err = conn:set_keepalive(max_idle_time, pool_size)
	if not ok then ngx.log(ngx.ERR, err) end
end


function m.get_usersecondpwd(userid)
	if not userid then return end
	local userid = tostring(userid)
	local conn = mongo:new()
	conn:set_timeout(timeout)
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		return "null"
	end

	local db = conn:new_db_handle("secondpwd")
	local col = db:get_col("secondpwd")

	local r = col:find_one({userid = userid})
	if r then
		ok, err = conn:set_keepalive(max_idle_time, pool_size)
		if not ok then ngx.log(ngx.ERR, err) end
		return r["secondpwd"]
	else
		return ""
	end
end


function m.set_usersecondpwd(userid, secondpwd)
	if not (userid and secondpwd) then return end
	local userid = tostring(userid)
	local secondpwd = tostring(secondpwd)
	local conn = mongo:new()
	conn:set_timeout(timeout)
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then 
		return "null"
	end
	local db = conn:new_db_handle("secondpwd")
	local col = db:get_col("secondpwd")
	local r = col:find_one({userid = userid})
	if r then
		local t = {userid = r["userid"], secondpwd = secondpwd}
		col:update({_id = r["_id"]}, t)
		return "success"
	else
		--正常情况下不会出现
		return "fail"
	end
end


function m.insert_order(orderid, gameorderid, productid, extend)
	--ngx.log(1, orderid..'|'..gameorderid..'|'..productid..'|'..extend)
	if not (orderid and gameorderid and extend) then return end  
	local i = string.find(extend, "&")
	if not i then return end
	local playerid = string.sub(extend, 1, i - 1)
	local serverid = string.sub(extend, i + 1, -1)
	if not (playerid and serverid) then return end
	--playerid = playerid
	serverid = tonumber(serverid)
	gameorderid = tonumber(gameorderid)
	local conn = mongo:new()
	conn:set_timeout(timeout) 
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		return "null"
	end

	local db = conn:new_db_handle("order")
	local col = db:get_col("order")

	local r, err = col:insert({{orderid = orderid, gameorderid = gameorderid, playerid = playerid, status = 1, serverid = serverid, productid = productid}}, nil, true)	
	
	ok, err = conn:set_keepalive(max_idle_time, pool_size)
	if not ok then ngx.log(ngx.ERR, err) end
	return r
end

function m.get_orders(serverid)
	if not serverid then return end 
	serverid = tonumber(serverid)
	local conn = mongo:new()
	conn:set_timeout(timeout) 
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		return "null"
	end

	local db = conn:new_db_handle("order")
	local col = db:get_col("order")
	local result
	local data = col:find({status = 1, serverid = serverid})
	local r
	if data then
		r = {}
		for i, v in data:pairs() do
			r[i] = {gameorderid = v["gameorderid"], playerid = v["playerid"], productid = v["productid"]}
			col:update({_id = v["_id"]},  {orderid = v["orderid"], serverid = v["serverid"], gameorderid = v["gameorderid"], playerid = v["playerid"], productid = v["productid"], status = 2})
		end
		result = "success"
	else
		result = "failed"
	end
	ok, err = conn:set_keepalive(max_idle_time, pool_size)
	if not ok then ngx.log(ngx.ERR, err) end
	return result, r
end

function m.get_timeout_orders(serverid)
	if not serverid then return end 
	serverid = tonumber(serverid)
	local conn = mongo:new()
	conn:set_timeout(timeout) 
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		return "null"
	end

	local db = conn:new_db_handle("order")
	local col = db:get_col("order")
	local result
	local data = col:find({status = 2, serverid = serverid})
	local r = {}
	if data then
		for i, v in data:pairs() do
			r[i] = {gameorderid = v["gameorderid"], playerid = v["playerid"], productid = v["productid"]}
		end
	end
	ok, err = conn:set_keepalive(max_idle_time, pool_size)
	if not ok then ngx.log(ngx.ERR, err) end
	return r
end

function m.end_order(gameorderid, playerid, serverid, flag)
	if not (gameorderid and playerid and serverid) then return end
	serverid = tonumber(serverid)
	gameorderid = tonumber(gameorderid)
	local conn = mongo:new()
	conn:set_timeout(timeout) 
	local ok, err = conn:connect(config.mongodbip, config.mongodbport)
	if not ok then
		ngx.log(ngx.ERR, err)
		return "null"
	end

	local db = conn:new_db_handle("order")
	local col = db:get_col("order")
	local result
	local r = col:find_one({gameorderid = gameorderid, playerid = playerid, serverid = serverid})
	if r and r["status"] == 2 then
		local dbbackup = conn:new_db_handle("order_backup")
		local colbackup = dbbackup:get_col("order_backup")
		result = "success"
		local h, e = colbackup:insert({{orderid = r["orderid"], serverid = r["serverid"], productid = r["productid"], gameorderid = gameorderid, playerid = playerid, status = 3, flag = flag}}, nil, true)
		if not h then ngx.log(ngx.ERR, e) result = "failed" end
		h, e = col:delete({_id = r["_id"]})
		if not h then ngx.log(ngx.ERR, e) result = "failed" end	
	else
		result = "failed"
	end
	ok, err = conn:set_keepalive(max_idle_time, pool_size)
	if not ok then ngx.log(ngx.ERR, err) end
	return result
end

function m.end_order_normal(gameorderid, playerid, serverid)
	return m.end_order(gameorderid, playerid, serverid, 1)
end

function m.end_order_timeout(gameorderid, playerid, serverid)
	return m.end_order(gameorderid, playerid, serverid,  2)
end

return m