-- 定义递归加载目录下所有文件的函数
local function require_all_files_in_directory(directory)
    -- 获取目录下所有文件和子目录
    local files = assert(io.popen('ls -R ' .. directory))
    local current_directory = ""

    for line in files:lines() do
        -- 如果是目录
        if line:match(':%s*$') then
            current_directory = line:sub(1, -2)
            goto continue
        end

        -- 忽略以点开头的文件（如 .gitignore 等）
        if not line:match('^[~%.]') then
            -- 构建文件路径
            local filepath = current_directory .. '/' .. line
            -- 去除路径末尾的换行符
            filepath = filepath:gsub('\n$', '')

            -- 如果是 Lua 文件，则加载
            if filepath:match('%.lua$') then
                -- local file_without_ext = filepath:gsub('%.lua$', '')
                -- print("Loading file: " .. filepath)
                dofile(filepath)
            end
        end

        ::continue::
    end
    files:close()
end

local config_dir
if vim ~= nil then
    config_dir = vim.fn.stdpath("config") .. "/lua/"
else
    config_dir = "/home/noi/.config/nvim" .. "/lua/"
end

-- print(config_dir)

require_all_files_in_directory(config_dir)
