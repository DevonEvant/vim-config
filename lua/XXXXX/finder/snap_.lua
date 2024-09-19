return {
	{
		"camspiers/snap",
		dependencies = { "camspiers/luarocks" },
		lazy = false,
		configs = function()
			local snap = require("snap")
			snap.maps({
				-- { "pp", snap.config.file({ producer = "ripgrep.file" }) },
			})
		end,
	},
}
