local m = {}
local controllers = require "controllers"
function m.GET(cmd)
	local controller = controllers[cmd]
	if controller and controller['get'] then
		local s = controller.get(ngx.req.get_uri_args())
		local t = type(s)
		if t == 'string' then
			ngx.say(s)
		elseif t == 'table' then
			local template = require "resty.template"
			ngx.say(template.render(controller.view, s))			
		end
	end
end

local parserargs = {
['application/json'] = function(s)
	local json = require 'cjson.safe'
	return json.decode(s)
end,
['application/xml'] = function(s)
	local xml = require 'xml'
end,
}

function m.POST(cmd)
	local controller = controllers[cmd]
	if controller and controller['post'] then
		ngx.req.read_body()
		local s
		if parserargs[ngx.var.content_type] then
			s = parserargs[ngx.var.content_type](ngx.req.get_body_data())
		else
			s = ngx.req.get_post_args()
		end
		s = controller.post(s)
		local t = type(s)
		if t == 'string' then
			ngx.say(s)
		elseif t == 'table' then
			local template = require "resty.template"
			ngx.say(template.render(controller.view, s))			
		end
	end
end

function m.DELETE(cmd)
	local controller = controllers[cmd]
	if controller and controller['delete'] then
		local s = controller.delete()
		if s then ngx.say(s) end
	end
end

return function(s)
	local method = ngx.var.request_method
	if m[method] then 		
		m[method](s)
	else
		ngx.say('the request method '..method..' unknown')
	end
end