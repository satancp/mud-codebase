local s = {}

s["userId"] = "2573006049"
s["time"] = "1466489017"
s["product"] = "com.yuanbao6"
s["orderNo"] = "791000255PP015160620115117000001"
s["gameOrderNo"] = "1079"
s["extend"] = "180001000000134%26180"

local t = {}

for	k, v in pairs(s) do
	table.insert(t, k..'='..v)
end

local md5 = require 'md5'
local r = ''
for a = 1, #t do
for b = 1, #t do
for c = 1, #t do
for d = 1, #t do
for e = 1, #t do
for f = 1, #t do
	r = t[a]..'&'..t[b]..'&'..t[c]..'&'..t[d]..'&'..t[e]..'&'..t[f].."cb978d25b98573c18e2b8cdf7e42822a"
	local m = md5.sumhexa(r)
	if m == "e5531e2c5bfe21ddd8dc52b341719d5b" then
		print(r, m)
		break
	end
end
end
end
end
end
end

