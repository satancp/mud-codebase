local m = {}

m['/account'] = require 'application/controllers/account'		--账号验证
m['/reg'] = require 'application/controllers/reg'				--新用户注册
m['/modifypsw'] = require 'application/controllers/modifypsw'	--修改密码
m['/bind'] = require 'application/controllers/bind'				--绑定正式账号

m['/checkorder'] = require 'application/controllers/checkorder'
m['/checktimeoutorder'] = require 'application/controllers/checktimeoutorder'
m['/'] = require 'application/controllers/init'
m['/paycb'] = require 'application/controllers/paycb'
-- m['/serverlist'] = require 'application/controllers/serverlist'
m['/verify'] = require 'application/controllers/verify'
m['/mirsecpwd'] = require 'application/controllers/mirsecpwd'
m['/payapi'] = require 'application/controllers/payapi'

m['/test'] = require 'application/controllers/test'

for	k, v in pairs(m) do
	if v['init'] then v.init() end
end
return m

