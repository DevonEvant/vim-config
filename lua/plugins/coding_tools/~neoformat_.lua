return {
	{
		"sbdchd/neoformat",
		enabled = false,
		configs = function()
			local neoformat = require("neoformat")
			neoformat.setup({})
		end,
	},
}
