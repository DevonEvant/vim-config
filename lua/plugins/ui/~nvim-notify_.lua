return {
	{
		"rcarriga/nvim-notify",
		enabled = false,
		configs = function()
			require("notify").setup()
		end,
	},
}
