local db = require "db"
local errcode = require "errorcode"
local m = {}


function m.get(s)

	local result = errcode.ERR_DEFAULT

	if s and s.machineid and s.id and s.psw and s.safecode then
		local ok, err = db.bind_acc_normal(tostring(s.machineid), tostring(s.id), tostring(s.psw), tostring(s.safecode))
		result = err
	end

	return result

end


function m.post(s)

end

return m

-- http://localhost:8080/verify?signature=&ptid=aaaaaaaaa&secondpwd=234567890asd

