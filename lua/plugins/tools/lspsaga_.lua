return {
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			local map = vim.api.nvim_set_keymap
			local buf_map = vim.api.nvim_buf_set_keymap
			local saga = require("lspsaga")

			saga.setup({})
			-- 预览光标下符号的定义
			map("n", "gdp", "<cmd>Lspsaga peek_definition<CR>", { silent = true, noremap = true })
			-- 跳转到光标下符号的定义处
			map("n", "gdl", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, noremap = true })
			-- 当前位置的诊断信息
			map("n", "gdc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true, noremap = true })
			-- 当前行的诊断信息
			map("n", "gdl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
			-- 跳轉到當前光標位置的下一個診斷信息位置
			map("n", "gdo", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true, noremap = true })
			-- 跳轉到當前光標位置的上一個診斷信息位置
			map("n", "gdN", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })
			-- 跳轉到當前光標位置的下一個診斷信息位置
			map("n", "gdn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
			-- define search 调用外部文档查阅工具 Zeal 来查询光标下的单词
			-- map('n', 'gds', '<cmd>!zeal '<cword>'&<CR><CR>', {})

			-- Finder
			map("n", "gf", "<cmd>Lspsaga finder<CR>", { silent = true, noremap = true })
			-- finder
			map("n", "gfi", "<cmd>Lspsaga finder imp<CR>", { silent = true, noremap = true })

			-- Formatter
			map("n", "gF", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true, noremap = true })
			-- Formatter ans Save
			map("n", "gFs", "<cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>", { silent = true, noremap = true })

			-- mouse pointer hover
			map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", {})

			-- 這個命令顯示所有調用當前光標下符號的地方
			map("n", "gci", "<cmd>Lspsaga incoming_calls<CR>", {})
			-- 這個命令顯示當前光標下的符號調用了哪些其他符號
			map("n", "gco", "<cmd>Lspsaga outgoing_calls<CR>", {})

			-- rename
			map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })

			-- code action
			vim.keymap.set({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
		end,
	},
}
