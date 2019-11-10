local lfs = require 'lfs'
local function findindir(path, vpath, wefind, dir)  
    for file in lfs.dir(path) do  
        if file ~= "." and file ~= ".." then  
            local f = path..'/'..file 
            --print ("/t "..f)  
            if string.find(f, wefind) ~= nil then  				
				if dir[vpath] == nil then dir[vpath] = {} end				
				table.insert(dir[vpath], string.sub(file, 1, -5))  
            end  
            local attr = lfs.attributes (f)  
            assert (type(attr) == "table")  
            if attr.mode == "directory" then  
                findindir(f, vpath..file..'/' , wefind, dir)  
            end  
        end  
    end  
end
local t = {}
findindir('application/controllers', '/', '.lua', t)

local f = io.open('controllers.lua', "w+")
function emit_route(dir, development)
	f:write("local m = {}\n\n")
	local file1, file2
	for	k, v1 in pairs(dir) do		
		for	_, v in pairs(v1) do
			print(k,v)
			if v == 'init' then file1 = k else file1 = k..v end
			file2 = k..v
			
			if development then f:write("package.loaded['application/controllers"..file.."'] = nil\n") end
			f:write("m['"..file1.."'] = require 'application/controllers"..file2.."'\n")
		end
	end
	f:write('\nfor	k, v in pairs(m) do\n')
	f:write("	if v['init'] then v.init() end\n")
	f:write('end\n')
	f:write('return m\n')
	f:close()
end
emit_route(t, false)