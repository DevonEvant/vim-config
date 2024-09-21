return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local map = vim.api.nvim_set_keymap
			local buf_map = vim.api.nvim_buf_set_keymap

			map("n", "<A-t>", ":ToggleTerm direction=float<CR><ESC>", {})
		end,
	},
}
