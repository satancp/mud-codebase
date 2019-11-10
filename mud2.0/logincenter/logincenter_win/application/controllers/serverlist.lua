local c = require "config.application"

local m = {serverlist = ''}
local function reload()
	-- os.execute([[cd > D:\\a.tmp]])  win默认路径是C:\Windows\system32

	-- local f = io.open("/usr/local/logincenter/config/serverlist.json", "r")
	local f = assert(io.open(ngx.var.realpath_root .. "/../config/serverlist.json", "r"))
	--local f = io.open("../logincenter_win/config/serverlist.json", "r")
	m.serverlist = f:read("*a")
	f:close()
end

function m.init()
	reload()
end

function m.post(s)
end

function m.get(s)
	return '{"serverlist":{"kaifubiao":1,"servers":[{"isactive":1,"serverid":"1997dw","rank1":1,"rank2":1,"serverip":"192.168.50.29:8088","servername":"逐鹿中原","desc":" 正常开区中"},{"isactive":2,"serverid":"1997dw","rank1":2,"rank2":2,"serverip":"192.168.50.29:8088","servername":"逐鹿中原","desc":" 正式运营中：、180版测试中！"}],"imglist":[{"pos":"1","url":"http://www.gowlom2.com/gg/1.png"},{"pos":"2","url":"http://www.gowlom2.com/gg/2.png"},{"pos":"3","url":"http://www.gowlom2.com/gg/3.png"}],"notice":"<b><param size=20 textcolor=255|222|173 /><t \n\n欢迎使用来到凤舞网络 \n\n\n要了解更多详情请访问我们的站点： /></b><b><param size=20 urlcolor=255|222|173 urltext=www.023wa.net urladdr=http://www.023wa.net /></b>"}}'
end

reload()

return m
