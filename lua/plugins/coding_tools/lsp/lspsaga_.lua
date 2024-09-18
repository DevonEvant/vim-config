return {
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		configs = function()
			local saga = require("lspsaga")
			saga.setup({})
		end,
	},
}
