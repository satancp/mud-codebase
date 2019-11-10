local m = {}
local slist = require "application.controllers.serverlist"

function m.get(s)
	if s and s.ticket and s.name then
		local t = 12345
		local phone = 158008087
		return '[GET] { "userid":"'..tostring(t)..'" ,"phone":"'..tostring(phone)..'" ,"name":"'..s.name..'" }' .. slist.serverlist
	end
end


function m.post(s)
	if s and s.ticket and s.name then
		local t = 12345
		local phone = 158008087
		return '[POST] { "userid":"'..tostring(t)..'" ,"phone":"'..tostring(phone)..'" ,"name":"'..s.name..'" }'
	end
end

return m

-- http://localhost:8080/verify?signature=&ptid=aaaaaaaaa&secondpwd=234567890asd

