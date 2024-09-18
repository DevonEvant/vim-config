-- 定义递归加载目录下所有文件的函数
local function dofile_recursively(root, exec_condition)
	-- 获取目录下所有文件和子目录
	local files = assert(io.popen("ls -R " .. root))
	local current_directory = ""

	for line in files:lines() do
		-- 如果是目录
		if line:match(":%s*$") then
			current_directory = line:sub(1, -2)
			goto continue
		end

		-- 忽略以点开头的文件（如 .gitignore 等）
		if exec_condition(current_directory, line) then
			-- 构建文件路径
			local filepath = current_directory .. "/" .. line
			-- 去除路径末尾的换行符
			filepath = filepath:gsub("\n$", "")

			dofile(filepath)
		end

		::continue::
	end
	files:close()
end

