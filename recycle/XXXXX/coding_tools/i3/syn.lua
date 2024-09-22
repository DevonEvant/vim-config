-- 設定一個自動命令，當檔案載入時執行這個函數
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { -- 使用表來定義事件
	pattern = "*.i3", -- 僅對以 .i3 結尾的檔案執行
	callback = function()
		-- 獲取當前緩衝區的檔案名
		local filename = vim.fn.expand("%:t")
		-- 檢查檔案名是否以 .i3 結尾
		if filename:match("%.i3$") then
			-- 設定檔案類型為 i3config
			vim.bo.filetype = "i3config"
		end
	end,
})
