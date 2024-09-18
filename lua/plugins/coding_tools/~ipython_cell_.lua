return {
	{
		"hanschen/vim-ipython-cell",
		ft = "python",
		enabled = false,
		configs = function()
			-- -----------------------------------------------------------------------------
			-- ipython-cell 配置
			-- -----------------------------------------------------------------------------
			-- require('ipython-cell').setup {}

			-- 鍵盤映射。默認情況下，<Leader> 是 \ (反斜線)

			-- 將 <Leader>s 映射為啟動 IPython
			vim.api.nvim_set_keymap("n", "<Leader>s", ":SlimeSend1 ipython --matplotlib<CR>", { noremap = true })

			-- 將 <Leader>r 映射為運行腳本
			vim.api.nvim_set_keymap("n", "<Leader>r", ":IPythonCellRun<CR>", { noremap = true })

			-- 將 <Leader>R 映射為運行腳本並計時執行
			vim.api.nvim_set_keymap("n", "<Leader>R", ":IPythonCellRunTime<CR>", { noremap = true })

			-- 將 <Leader>c 映射為執行當前單元格
			vim.api.nvim_set_keymap("n", "<Leader>c", ":IPythonCellExecuteCell<CR>", { noremap = true })

			-- 將 <Leader>C 映射為執行當前單元格並跳轉到下一個單元格
			vim.api.nvim_set_keymap("n", "<Leader>C", ":IPythonCellExecuteCellJump<CR>", { noremap = true })

			-- 將 <Leader>l 映射為清除 IPython 界面
			vim.api.nvim_set_keymap("n", "<Leader>l", ":IPythonCellClear<CR>", { noremap = true })

			-- 將 <Leader>x 映射為關閉所有 Matplotlib 圖形窗口
			vim.api.nvim_set_keymap("n", "<Leader>x", ":IPythonCellClose<CR>", { noremap = true })

			-- 將 [c 和 ]c 映射為跳轉到上一個和下一個單元格標題
			vim.api.nvim_set_keymap("n", "[c", ":IPythonCellPrevCell<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "]c", ":IPythonCellNextCell<CR>", { noremap = true })

			-- 將 <Leader>h 映射為將當前行或選擇內容發送到 IPython
			vim.api.nvim_set_keymap("n", "<Leader>h", "<Plug>SlimeLineSend", {})
			vim.api.nvim_set_keymap("x", "<Leader>h", "<Plug>SlimeRegionSend", {})

			-- 將 <Leader>p 映射為運行上一個命令
			vim.api.nvim_set_keymap("n", "<Leader>p", ":IPythonCellPrevCommand<CR>", { noremap = true })

			-- 將 <Leader>Q 映射為重新啟動 IPython
			vim.api.nvim_set_keymap("n", "<Leader>Q", ":IPythonCellRestart<CR>", { noremap = true })

			-- 將 <Leader>d 映射為啟動調試模式
			vim.api.nvim_set_keymap("n", "<Leader>d", ":SlimeSend1 %debug<CR>", { noremap = true })

			-- 將 <Leader>q 映射為退出調試模式或 IPython
			vim.api.nvim_set_keymap("n", "<Leader>q", ":SlimeSend1 exit<CR>", { noremap = true })

			-- 將 <F9> 和 <F10> 映射為在上方/下方插入單元格標題並進入插入模式
			vim.api.nvim_set_keymap("n", "<F9>", ":IPythonCellInsertAbove<CR>a", { noremap = true })
			vim.api.nvim_set_keymap("n", "<F10>", ":IPythonCellInsertBelow<CR>a", { noremap = true })

			-- 讓 <F9> 和 <F10> 也在插入模式下生效
			vim.api.nvim_set_keymap("i", "<F9>", "<C-o>:IPythonCellInsertAbove<CR>", { noremap = true })
			vim.api.nvim_set_keymap("i", "<F10>", "<C-o>:IPythonCellInsertBelow<CR>", { noremap = true })
		end,
	},
}
