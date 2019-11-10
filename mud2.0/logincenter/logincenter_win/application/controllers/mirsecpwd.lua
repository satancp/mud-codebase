local md5 = require "resty.md5"
local config = require "config.application"
local str = require "resty.string"
local db = require "db"
local m = {}


local function sign(s)
	local minst = md5.new()
	minst:update(s)	
	return str.to_hex(minst:final())
end


function m.get(s)
	
end


function m.post(s)
	local result = '-101'
	if s and s.signature and s.ptid and s.secondpwd then
		local signature = tostring(s.signature)
		local ptid = tostring(s.ptid)
		local secondpwd = tostring(s.secondpwd)
		local str = ptid .. ":" .. config.secretkey
		if sign(str) == signature then
			local flag = db.set_usersecondpwd(ptid, secondpwd)
			if tostring(flag) == "fail" then
				result = '-103'
			else
				result = '100'
			end
		else
			result = '-102'
		end
	end
	return result
end

return m