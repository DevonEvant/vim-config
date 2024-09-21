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
			-- manage integration of LSP and neovim(upper level, because of the existence of Mason)
			servers = {
				-- use svlangserver to gd, formatting(verible), hover
				-- svlangserver hover has a bug, `define macro hover` will not work after saving current file.
				-- Must save the `define macro file` again to make `define macro hover` work again.
				svlangserver = {

					filetypes = { "verilog", "systemverilog" }, -- 指定
					-- on_init = function(client)
					-- 	client.config.settings.systemverilog = {
					-- 		-- includeIndexing     = { "**/*.{sv,svh}" },
					-- 		-- excludeIndexing     = { "test/**/*.sv*" },
					-- 		-- defines             = {},
					-- 		-- launchConfiguration = "verilator -sv -Wall --lint-only",
					-- 		formatCommand = "verible-verilog-format --indentation_spaces 4 ",
					-- 		-- formatCommand = "verible-verilog-format --indentation_spaces=4 --column_limit=300 --assignment_statement_alignment=align --named_port_alignment=align  --port_declarations_alignment=align --module_net_variable_alignment=align ",
					-- 	}
					--
					-- 	return true
					-- end,
					root_dir = function(fname)
						local lspconfig = require("lspconfig")
						local util = lspconfig.util
						return util.root_pattern("*.sv", "*.svh", "*.v", "*.vh", ".git", ".svlangserver")(fname)
							or vim.fn.getcwd()
					end,
					settings = {
						systemverilog = {
							includeIndexing = { "*.{v,vh,sv,svh}", "**/*.{v,vh,sv,svh}" },
							excludeIndexing = { "**/.*", "**/build/**" },
							defines = {},
							launchConfiguration = "verible-verilog-format --indentation_spaces 4 ",
							formatCommand = "verible-verilog-format",
						},
					},
					single_file_support = true,
				},
			},
		},
	},
}
