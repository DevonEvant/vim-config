return {
	{
		"ahmedkhalf/jupyter-nvim",
		run = ":UpdateRemotePlugins",
		enabled = false,
		configs = function()
			require("jupyter-nvim").setup()
		end,
	},
}
