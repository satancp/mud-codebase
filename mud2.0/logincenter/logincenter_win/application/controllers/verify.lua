local db = require "db"
local cache = require "cache"
local m = {}


function m.get(s)
	if s and s.ticket and s.name then
		--local t = db.get_userid(s.ticket)
		--local t = cache.get_from_cache(tostring(s.ticket))
		local t, err = db.check_ticket(tostring(s.ticket), 60)
		if t then 
			local phone = db.get_userphone(s.ticket)
			local userid = tostring(t)
			local secondpwd = db.get_usersecondpwd(userid)
			if not secondpwd then 
				secondpwd = "" 
			end
			db.set_lastloginserver(t, s.ticket, s.name)
			return '{ "userid":"'..userid..'" ,"phone":"'..tostring(phone)..'" ,"secondpwd":"'..tostring(secondpwd)..'" }'
		else
			return 'null'
		end
	end
end


function m.post(s)

end

return m

-- http://localhost:8080/verify?signature=&ptid=aaaaaaaaa&secondpwd=234567890asd

