return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "svlangserver" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "svlangserver" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				svlangserver = {
					filetypes = { "verilog", "systemverilog" },
					root_dir = function(fname)
						local lspconfig = require("lspconfig")
						local util = lspconfig.util
						return util.root_pattern("*.sv", "*.svh", "*.v", "*.vh", ".git")(fname) or vim.fn.getcwd()
					end,
					settings = {
						systemverilog = {
							includeIndexing = { "**/*.{sv,svh}" },
							excludeIndexing = { "**/.*", "**/build/**" },
							defines = {},
							launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
							formatCommand = "verible-verilog-format",
						},
					},
				},
			},
		},
	},
}
