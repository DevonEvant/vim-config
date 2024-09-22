return {
	{
		"norcalli/nvim-colorizer.lua",
		configs = function()
			local colorizer = require("colorizer")

			colorizer.setup({
				"css",
				"javascript",
				html = { mode = "background" },
			}, { mode = "foreground" })
		end,
	},
}
