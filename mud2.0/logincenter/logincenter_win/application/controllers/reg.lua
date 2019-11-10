local http = require "resty.http"
local config = require "config.application"
local db = require "db"
local md5 = require "resty.md5"
local str = require "resty.string"
local json = require "cjson.safe"
local errcode = require "errorcode"
local m = {}
local index = 1

local function sign(s)
	local minst = md5.new()
	minst:update(s)	
	return str.to_hex(minst:final())
end

function m.get(s) 

	local result = errcode.ERR_DEFAULT

	if s and s.id and s.psw and s.safecode then
		local id = tostring(s.id)
		local psw = tostring(s.psw)
		local safecode = tostring(s.safecode)

		local ok, err = db.reg_acc_normal(id, psw, safecode)
		result = err
	end

	return result
end

function m.post(s)

end

return m
