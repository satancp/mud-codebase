local db = require "db"
local errcode = require "errorcode"
local m = {}


function m.get(s)

	local result = errcode.ERR_DEFAULT

	if s and s.id and s.psw and s.safecode then
		local ok, err = db.modify_acc_psw(tostring(s.id), tostring(s.psw), tostring(s.safecode))
		result = err
	end

	return result
end


function m.post(s)

end

return m
