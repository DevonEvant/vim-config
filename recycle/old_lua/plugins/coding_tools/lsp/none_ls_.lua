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
		"eslint",
		"prettier",
		"shfmt",
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- lua
		null_ls.builtins.formatting.stylua,

		-- cpp
		require("none-ls.diagnostics.cpplint"),

		-- python
		null_ls.builtins.formatting.black,
		-- require("null_ls.builtins.diagnostics.flake8"),

		-- yaml
		null_ls.builtins.formatting.yamlfmt,

		-- cmake
		null_ls.builtins.formatting.cmake_format,

		-- javascript
		null_ls.builtins.formatting.prettier,
		require("none-ls.code_actions.eslint"),

		-- shell script
		null_ls.builtins.formatting.shfmt,

		-- other
		null_ls.builtins.completion.spell.with({
			filetypes = { "i3ConfigComment" },
		}),
		require("none-ls.formatting.jq"),
	},
})
