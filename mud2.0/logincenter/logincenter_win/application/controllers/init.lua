local m = {}
local conn
local say = ngx.say
local n = 0
local thread 
local semaphore
function m.init()
	m.view = 'init.html'
	
end

function m.get(s)
	return "hello world"
end

function m.post(s)
	return {message = s.name}
end

function m.delete()
end

return m