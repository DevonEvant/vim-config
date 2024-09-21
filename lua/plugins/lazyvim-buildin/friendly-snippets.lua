return {
	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = vim.fn.stdpath("config") .. "lua/snippets/verilog/verilog.json",
			})
			require("luasnip.loaders.from_snipmate").lazy_load({
				paths = { vim.fn.stdpath("config") .. "lua/snippets/verilog/verilog.snippets" },
			})
			-- Im 100% sure this is bad, and it can be achieved in a better way
			-- but i couldn't find the proper way.
		end,
	},
}
