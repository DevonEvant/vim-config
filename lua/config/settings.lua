vim.g.python3_host_prog = "/home/noi/pyenv/bin/python3"
vim.cmd("set termguicolors")
-- vim.cmd("set clipboard=unnamedplus")
-- 設置自動縮進
vim.o.cindent = true

-- 在 vimenter 自動執行命令
-- vim.cmd("autocmd vimenter * ++nested colorscheme gruvbox")

-- 設置編碼為 UTF-8
vim.o.encoding = "utf8"

-- 啟用行號和相對行號
vim.wo.number = true
vim.wo.relativenumber = true
--vim.opt.ruler = true

-- 不生成交換文件
vim.o.swapfile = false

-- 啟用游標行高亮
vim.wo.cursorline = true
vim.o.cursorcolumn = true

-- 設置 Tab 為 4 個空格
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- 設置縮進時使用空格
vim.opt.expandtab = true

-- 啟用高亮搜尋結果
vim.o.hlsearch = true

-- 設置光標移動時的縮進
vim.o.cindent = true

-- 設置 backspace 功能
vim.o.backspace = "indent,eol,start"

-- 設置顯示最後一行的狀態列
vim.o.laststatus = 2

-- 啟用自動換行
-- vim.wo.wrap = true
vim.wo.wrap = false

-- 啟用增量搜索
vim.o.incsearch = true

-- 啟用滑鼠支持
vim.o.mouse = "a"

-- 設置滾動時光標位置
vim.o.scrolloff = 4

-- 隱藏未保存的緩存文件
vim.o.hidden = true

-- 啟用自動縮進
vim.o.autoindent = true
--vim.o.smartindent = true

-- 設置編輯歷史記錄數量
vim.o.history = 5000

-- 啟用系統剪貼板
vim.o.clipboard = "unnamedplus"

--當行出現底線
--vim.opt.cursorline = true                          -- 启用当前行高亮显示
vim.cmd("highlight CursorLine cterm=underline gui=underline") -- 设置底线样式

-- 設置文件類型自動檢測和縮進
vim.cmd("filetype plugin indent on")

vim.cmd("syntax enable")
vim.cmd("syntax on")
vim.o.filetype = "on"

vim.o.termguicolors = true

-- vim.cmd("set concealcursor= ")
vim.opt.concealcursor = ""
-- vim.cmd("set conceallevel=0")
-- vim.opt.conceallevel = 0
