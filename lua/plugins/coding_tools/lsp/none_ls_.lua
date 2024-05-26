require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		"black",
		"flask8",
		"cpplint",
		"yamlls", --yaml
		"stylua",
		"yamlfmt",
        "cmake_format",
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		require("none-ls.diagnostics.cpplint"),
		require("none-ls.formatting.jq"),
		require("none-ls.code_actions.eslint"),

		null_ls.builtins.formatting.black,
		-- require("null_ls.builtins.diagnostics.flake8"),

		null_ls.builtins.formatting.yamlfmt,
		null_ls.builtins.formatting.cmake_format,
	},
})
