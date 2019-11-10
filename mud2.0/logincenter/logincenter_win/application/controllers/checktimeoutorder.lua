local m = {}
local db = require "db"
local json = require "cjson.safe"

function m.get(s)
	local s = db.get_timeout_orders(s.serverid)
	s = json.encode(s)	
	if s then return s end
	return ""
end

function m.post(s)
	return db.end_order_timeout(s.gameorderid, s.playerid, s.serverid)
end

return m