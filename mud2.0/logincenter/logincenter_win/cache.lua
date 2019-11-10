local config = require "config.application"
local redis = require "resty.rediscli"
local m = {}

function m.get_from_cache(key)
    local cache_ngx = ngx.shared.ticket_cache
    local value = cache_ngx:get(key)
    return value
end

function m.set_to_cache(key, value, exptime)
    if not exptime then
        exptime = 0
    end
    local cache_ngx = ngx.shared.ticket_cache
    local succ, err, forcible = cache_ngx:set(key, value, exptime)

    if not succ then	--可考虑用db代替
    	ngx.log(ngx.ERR, err)
    end

    return succ
end

function m.add_to_cache(key, value, exptime)	--key不重复
    if not exptime then
        exptime = 0
    end
    local cache_ngx = ngx.shared.ticket_cache
    local succ, err, forcible = cache_ngx:add(key, value, exptime)

    if not succ then	--可考虑用db代替
    	ngx.log(ngx.ERR, err)
    end

    return succ
end

function m.redis_get_from_cache(key)
	local red = redis.new({host = config.redisip, port = config.redisport})
	local res, err = red:exec(
		function(red)
			return red:get(key)
		end
	)

	return res, err

end

function m.redis_set_to_cache(key, value, exptime)
    if not exptime then
        exptime = 0
    end
	local red = redis.new({host = config.redisip, port = config.redisport})
	local res, err = red:exec(
		function(red)
			red:init_pipeline()
        	red:set(key, value)
        	red:expire(key, exptime)
        	return red:commit_pipeline()
		end
	)

	return res, err
end


return m
