local m = {}
local db = require "db"
local json = require "cjson.safe"

function m.get(s)
	local r, s = db.get_orders(s.serverid)
	if r == "success" then
		s = json.encode(s)	
		if s then return s end
	end
	return ""
end

function m.post(s)
	return db.end_order_normal(s.gameorderid, s.playerid, s.serverid)
end

return m