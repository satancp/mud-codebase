local http = require "resty.http"
local config = require "config.application"
local serverlist = require "application.controllers.serverlist"
local db = require "db"
local md5 = require "resty.md5"
local str = require "resty.string"
local json = require "cjson.safe"
local errcode = require "errorcode"
local cache = require "cache"
local m = {}
local index = 1

local function sign(s)	
	local minst = md5.new()
	minst:update(s)	
	return str.to_hex(minst:final())
end


function m.get(s) 

	local result = errcode.ERR_DEFAULT

	if s and s.id then
		local id = tostring(s.id)
		local ptid = nil
		local err = ""

		if s.guest and tonumber(s.guest) == 1 then  
			--游客登录

			--查找游客表是否存在ptid
			ptid, err = db.get_acc_guest(id)

		else	
			--正式登录
			if s.psw then
				--查找正式账号表是否存在ptid
				ptid, err = db.check_acc_normal(s.id, tostring(s.psw))

			else
				return errcode.ERR_NONE_PSW
			end
		end

		--通过验证则生成ticket，并返回给客户端
		if ptid then
			--缓存ticket等待verify验证
			--cache.del_to_cache(ptid)

			--local ok = cache.add_to_cache(new_ticket, ptid, 60)  --s 超时
			local new_ticket = ngx.md5(ptid .. '/' .. tostring(ngx.time())..'/'..ngx.var.pid)
			local ok, rerr = db.save_ticket(new_ticket, ptid)
			if not ok then
				return rerr
			end

			local phone = 0
			local n = db.get_lastloginserver(ptid)
			result = string.format('{"code":0, "list":%s, "last":%q, "phone":%q, "ticket":"%s"}', serverlist.serverlist, n, phone, new_ticket) --暂时无手机号
		else
			result = string.format('{"code":1011000,"RemainDays":2365,"AllowCount":2365}', serverlist.serverlist, n, phone, new_ticket)
		end	

	end

	return result
end

function m.post(s)
	return '{"serverlist":'..serverlist.serverlist..',"last":"null"}'	
end

return m
