
local m = {}
local md5 = require "resty.md5"
local str = require "resty.string"
local mysql = require "resty.mysql"

local apikey = "21fe7449c344e93ba835405972232d5e" 
local dbconfig = {"127.0.0.1","gamedata","root","15183335185"} 

local function chongzhi(s)
	local db, err = mysql:new()
	if not db then
		return "failed to instantiate mysql: "
	end
	db:set_timeout(1000) -- 1 sec
	local ok, err, errno, sqlstate = db:connect{
		host = dbconfig[1],
		port = 3306,
		database = dbconfig[2],
		user = dbconfig[3],
		password = dbconfig[4],
		max_packet_size = 1024 * 1024
	}
	if not ok then
		return "failed to connect: "
	else
		local sql = string.format("select ActiveParam,AwardCodeType from awardcodes where  AwardCode = CONVERT(unhex(HEX(CONVERT(CONVERT( unhex('%s') USING utf8) USING gbk))) USING latin1)",str.to_hex(s.account))
		local res1, err1, errno1, sqlState1 = db:query(sql)
		if not res1 then
			sql = string.format("INSERT INTO awardcodes (AwardCode,AwardCodeType,ActiveParam) VALUES (CONVERT(unhex(HEX(CONVERT(CONVERT( unhex('%s') USING utf8) USING gbk))) USING latin1),%d,1)",str.to_hex(s.account),s.money)
		else
			if not res1[1] then
				sql = string.format("INSERT INTO awardcodes (AwardCode,AwardCodeType,ActiveParam) VALUES (CONVERT(unhex(HEX(CONVERT(CONVERT( unhex('%s') USING utf8) USING gbk))) USING latin1),%d,1)",str.to_hex(s.account),s.money)
			else
				if tostring(res1[1].ActiveParam) == "-1" then
					sql = string.format("UPDATE awardcodes SET AwardCodeType = %d,ActiveParam=1 WHERE AwardCode = CONVERT(unhex(HEX(CONVERT(CONVERT( unhex('%s') USING utf8) USING gbk))) USING latin1)",s.money,str.to_hex(s.account)) --update
				else
					sql = string.format("UPDATE awardcodes SET AwardCodeType =AwardCodeType+%d WHERE AwardCode = CONVERT(unhex(HEX(CONVERT(CONVERT( unhex('%s') USING utf8) USING gbk))) USING latin1)",s.money,str.to_hex(s.account))
				end
			end
		end
        local res2, err2, errno2, sqlState2 = db:query(sql,1)
        if not res2 then
            return "bad query:"..sql
        else
			return "<result>www.yuanmanpay.com</result>"
		end
	end
end

local function decodeURI(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end


local function sign(s,apikey)
	local aaa = ""
	local ss={}
	local key_table = {}
	for key,_ in pairs(s) do  
		table.insert(key_table,key)  
	end
	table.sort(key_table)  
	for _,key in pairs(key_table) do
		if s[key]~='' then
			if aaa=="" then
				aaa = key.."="..s[key]
			else
				aaa = aaa.."&"..key.."="..s[key]
			end
		end
	end
	aaa = aaa.."&key="..apikey
	aaa = decodeURI(aaa)
	local minst = md5.new()
	minst:update(aaa)
	return str.to_hex(minst:final())
end

local function explode ( _str,seperator )
	local pos, arr = 0, {}
	for st, sp in function() return string.find( _str, seperator, pos, true ) end do
			table.insert( arr, string.sub( _str, pos, st-1 ) )
			pos = sp + 1
	end
	table.insert( arr, string.sub( _str, pos ) )
	return arr
end

function m.get(s)
	if s and s.sign then
		signkey = s.sign
		s.sign = nil
		signkey2 = sign(s,apikey)
		if signkey2==string.lower(signkey) then
			return chongzhi(s)
		else
			return "sign error"
		end
	else
		return "param error"
	end
end

function m.post(s)
	local args = {}
	local receive_headers = ngx.req.get_headers()
	if string.sub(receive_headers["content-type"],1,20) == "multipart/form-data;" then
		local body_data = ngx.req.get_body_data()
		local boundary = "--" .. string.sub(receive_headers["content-type"],31)
		
		local body_data_table = explode(tostring(body_data),boundary)
		local first_string = table.remove(body_data_table,1)
		local last_string = table.remove(body_data_table)
		for i,v in ipairs(body_data_table) do
				local start_pos,end_pos,capture,capture2 = string.find(v,'Content%-Disposition: form%-data; name="(.+)"; filename="(.*)"')
				--普通参数
				if not start_pos then
					local t = explode(v,"\r\n\r\n")
					local temp_param_name = string.sub(t[1],41,-2)
					local temp_param_value = string.sub(t[2],1,-3)
					args[temp_param_name] = temp_param_value
				end
		end
	end
	s = args
	if s and s.sign then
		signkey = s.sign
		s.sign = nil
		signkey2 = sign(s,apikey)
		if signkey2==string.lower(signkey) then
			return chongzhi(s)
		else
			return "sign error"
		end
	else
		return "param error"
	end
end

return m