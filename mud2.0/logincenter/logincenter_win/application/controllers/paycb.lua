local m = {}
local db = require "db"
local md5 = require "resty.md5"
local str = require "resty.string"
local config = require "config.application"
local http = require "resty.http"
local json = require "cjson.safe"

local function sign(s)
	local minst = md5.new()
	minst:update(s)	
	return str.to_hex(minst:final())
end

function m.get(s)
	if s.gameorderid and s.extend and s.productid and s.iosreceipt then
		local h = http.new()

		local jsonbody = {
			["receipt-data"] = ngx.encode_base64(tostring(s.iosreceipt))
		}

		-- [[
		-- {"signature" = "Am7vrfmY+FJq9g8gJDdYMGWOBJiKUUz80nAHooQFwYEZAL9wdXU7uaMiSZn75JQUjO3XfydLs2bwm9VPoKYKTGcft0LrISl7YNlQAWeVfA62F2E1qgTAGVFoTF1k0o3hJR1D/bLoum3i5PrQiScV90s0V77WVon2+B6vqUtHLsZUAAADVzCCA1MwggI7oAMCAQICCGUUkU3ZWAS1MA0GCSqGSIb3DQEBBQUAMH8xCzAJBgNVBAYTAlVTMRMwEQYDVQQKDApBcHBsZSBJbmMuMSYwJAYDVQQLDB1BcHBsZSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEzMDEGA1UEAwwqQXBwbGUgaVR1bmVzIFN0b3JlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA5MDYxNTIyMDU1NloXDTE0MDYxNDIyMDU1NlowZDEjMCEGA1UEAwwaUHVyY2hhc2VSZWNlaXB0Q2VydGlmaWNhdGUxGzAZBgNVBAsMEkFwcGxlIGlUdW5lcyBTdG9yZTETMBEGA1UECgwKQXBwbGUgSW5jLjELMAkGA1UEBhMCVVMwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMrRjF2ct4IrSdiTChaI0g8pwv/cmHs8p/RwV/rt/91XKVhNl4XIBimKjQQNfgHsDs6yju++DrKJE7uKsphMddKYfFE5rGXsAdBEjBwRIxexTevx3HLEFGAt1moKx509dhxtiIdDgJv2YaVs49B0uJvNdy6SMqNNLHsDLzDS9oZHAgMBAAGjcjBwMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUNh3o4p2C0gEYtTJrDtdDC5FYQzowDgYDVR0PAQH/BAQDAgeAMB0GA1UdDgQWBBSpg4PyGUjFPhJXCBTMzaN+mV8k9TAQBgoqhkiG92NkBgUBBAIFADANBgkqhkiG9w0BAQUFAAOCAQEAEaSbPjtmN4C/IB3QEpK32RxacCDXdVXAeVReS5FaZxc+t88pQP93BiAxvdW/3eTSMGY5FbeAYL3etqP5gm8wrFojX0ikyVRStQ+/AQ0KEjtqB07kLs9QUe8czR8UGfdM1EumV/UgvDd4NwNYxLQMg4WTQfgkQQVy8GXZwVHgbE/UC6Y7053pGXBk51NPM3woxhd3gSRLvXj+loHsStcTEqe9pBDpmG5+sk4tw+GK3GMeEN5/+e1QT9np/Kl1nj+aBw7C0xsy0bFnaAd1cSS6xdory/CUvM6gtKsmnOOdqTesbp0bs8sn6Wqs0C9dgcxRHuOMZ2tm8npLUm7argOSzQ==";
		-- "purchase-info" = "ewoJIm9yaWdpbmFsLXB1cmNoYXNlLWRhdGUtcHN0IiA9ICIyMDE0LTAyLTEyIDAwOjQ1OjUzIEFtZXJpY2EvTG9zX0FuZ2VsZXMiOwoJInVuaXF1ZS1pZGVudGlmaWVyIiA9ICJmNzFjODA0YmNkMDkwMDg1ZDE3Y2YwN2UyODA1YzFiMGRmYTA1M2VhIjsKCSJvcmlnaW5hbC10cmFuc2FjdGlvbi1pZCIgPSAiMTAwMDAwMDEwMTI2NTU1MSI7CgkiYnZycyIgPSAiMS4wIjsKCSJ0cmFuc2FjdGlvbi1pZCIgPSAiMTAwMDAwMDEwMTI2NTU1MSI7CgkicXVhbnRpdHkiID0gIjEiOwoJIm9yaWdpbmFsLXB1cmNoYXNlLWRhdGUtbXMiID0gIjEzOTIxOTQ3NTMzNjgiOwoJInVuaXF1ZS12ZW5kb3ItaWRlbnRpZmllciIgPSAiRjYzRTdBMzUtMDQwNi00NDVGLUE1QUEtQ0M5OTc0RDRDQTlCIjsKCSJwcm9kdWN0LWlkIiA9ICJjb20ueWNtLnBubS53aTEiOwoJIml0ZW0taWQiID0gIjgwMjc5MzM1MiI7CgkiYmlkIiA9ICJjb20ueWNtLnBubSI7CgkicHVyY2hhc2UtZGF0ZS1tcyIgPSAiMTM5MjE5NDc1MzM2OCI7CgkicHVyY2hhc2UtZGF0ZSIgPSAiMjAxNC0wMi0xMiAwODo0NTo1MyBFdGMvR01UIjsKCSJwdXJjaGFzZS1kYXRlLXBzdCIgPSAiMjAxNC0wMi0xMiAwMDo0NTo1MyBBbWVyaWNhL0xvc19BbmdlbGVzIjsKCSJvcmlnaW5hbC1wdXJjaGFzZS1kYXRlIiA9ICIyMDE0LTAyLTEyIDA4OjQ1OjUzIEV0Yy9HTVQiOwp9";
		-- "environment" = "Sandbox";
		-- "pod" = "100";
		-- "signing-status" = "0";
		-- }]]

		local res, err = h:request_uri(
			"https://sandbox.itunes.apple.com/verifyReceipt",
			--"https://buy.itunes.apple.com/verifyReceipt",
			{
                ssl_verify = ssl_verify or false,
                method = "POST",
                body = json.encode(jsonbody),

--ngx.encode_args({["receipt-data"] = tostring(s.iosreceipt)})
                --body = ngx.encode_args({["receipt-data"] = tostring(s.iosreceipt)}),
                headers = {
                	["Content-Type"] = "application/json"
            	}
        	}
		)
		if res and res.status == 200 and res.body then
			local d = json.decode(res.body)
			if not d then return '{"status": -102}' end
			if d.status and tonumber(d.status) == 0 then
				db.insert_order("99999" , s.gameorderid, s.productid, s.extend)			
			end
			result = res.body
		end

		return result
	else
		return '{"status": -99}'
	end
end

function m.post(s)
	--local v = "extend="..s.extend.."&gameOrderNo="..s.gameOrderNo.."&orderNo="..s.orderNo.."&product="..s.product.."&time="..s.time.."&userId="..s.userId..config.appkey

	--if db.insert_order(s.orderNo, s.gameOrderNo, s.product, s.extend) then
	--	return "success"
	--else
	--	return "failed"
	--end

	if s.gameorderid and s.extend and s.productid and s.iosreceipt then
		local h = http.new()
		local jsonbody = {
			["receipt-data"] = ngx.encode_base64(tostring(s.iosreceipt))
		}

		local res, err = h:request_uri(
			--"https://sandbox.itunes.apple.com/verifyReceipt",
			"https://buy.itunes.apple.com/verifyReceipt",
			{
                ssl_verify = ssl_verify or false,
                method = "POST",
                body = json.encode(jsonbody),
                headers = {
                	["Content-Type"] = "application/json"
            	}
        	}
		)
		if res and res.status == 200 and res.body then
			local d = json.decode(res.body)
			if not d then return '{"status": -102}' end
			if d.status and tonumber(d.status) == 0 then
				db.insert_order("99999" , s.gameorderid, s.productid, s.extend)			
			end
			result = res.body
		end

		return result
	else
		return '{"status": -99}'
	end
end

return m