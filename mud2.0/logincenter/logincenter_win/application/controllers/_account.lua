local http = require "resty.http"
local config = require "config.application"
local serverlist = require "application.controllers.serverlist"
local db = require "db"
local md5 = require "resty.md5"
local str = require "resty.string"
local json = require "cjson.safe"
local m = {}
local index = 1

local function sign(s)
	local minst = md5.new()
	minst:update(s)	
	return str.to_hex(minst:final())
end

function m.get(s) 
	local result = '{"code": -101}'
	if s and s.ticket then
		local ticket = tostring(s.ticket)
		local h = http.new()
		local t =  tostring(ngx.time())
		local s = "appid="..config.appid.."&sequence="..t..tostring(index).."&ticket_id="..ticket.."&timestamp="..t
		s = s..'&sign='..sign(s .. config.appkey)
		local res, err = h:request_uri(
		"http://api.mygm.sdo.com/v1/open/ticket?"..s)
		index = index + 1
		if res and res.status == 200 and res.body then
			local d = json.decode(res.body)
			if not d then return '{"code": -102}' end
			if d.code == 0 then
				userid = d.data.userid
				phone = d.data.phone;
				local n = db.get_lastloginserver(userid)
				result = string.format('{"code":0, "list":%s,"last":%q, "phone": %q}', serverlist.serverlist, n, d.data.phone)
			else
				userid = -d.code
				phone = ""
				result = '{"code": '..userid..'}'
			end
			db.set_userid(ticket, userid, phone)
			db.save_userid(userid)
		end
	end

	-- if s and s.ticket and s.userid and s.phone then
	-- 	db.set_userid(s.ticket, s.userid, s.phone)
	-- 	db.save_userid(s.userid)
	-- 	result = '{"code": -102}'
	-- 	-- http://localhost:8080/account?ticket=2&userid=aaaaaaaaa&phone=123456789
	-- end
	return result
end

function m.post(s)
	return '{"serverlist":'..serverlist.serverlist..',"last":"null"}'	
end

return m
