return {
	{
		"easymotion/vim-easymotion",
		enabled = false,
		config = function()
			local map = vim.api.nvim_set_keymap
			local buf_map = vim.api.nvim_buf_set_keymap

			-- Easymotion 配置
			vim.g.EasyMotion_do_mapping = 0
			vim.g.EasyMotion_smartcase = 1
			map("n", "<Leader>f", "<Plug>(easymotion-bd-f)", {})
			-- map('n', '<Leader>s', '<Plug>(easymotion-s2)', {})
			map("n", "<Leader>L", "<Plug>(easymotion-bd-jk)", {})
			map("n", "<Leader>w", "<Plug>(easymotion-bd-w)", {})
			-- map("n", "/", "<Plug>(easymotion-sn)", {})
			map("o", "/", "<Plug>(easymotion-tn)", {})
			map("n", "n", "<Plug>(easymotion-next)", {})
			map("n", "N", "<Plug>(easymotion-prev)", {})
			map("n", "<Leader>l", "<Plug>(easymotion-lineforward)", {})
			map("n", "<Leader>j", "<Plug>(easymotion-j)", {})
			map("n", "<Leader>k", "<Plug>(easymotion-k)", {})
			map("n", "<Leader>h", "<Plug>(easymotion-linebackward)", {})
		end,
	},
}
