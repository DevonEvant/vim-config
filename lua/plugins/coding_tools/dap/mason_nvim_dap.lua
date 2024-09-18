return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{ "jay-babu/mason-nvim-dap.nvim" },
	{
		"mfussenegger/nvim-dap",
		dependencies = { "mason", "mason-nvim-dap" },
		configs = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local neodev = require("neodev")

			vim.keymap.set("n", "gbc", dap.continue)
			vim.keymap.set("n", "gbn", dap.step_over)
			vim.keymap.set("n", "gbN", dap.step_into)
			vim.keymap.set("n", "gbo", dap.step_out)
			vim.keymap.set("n", "gbb", dap.toggle_breakpoint)

			require("mason").setup()
			require("mason-nvim-dap").setup({
				ensure_installed = { "python", "delve", "stylua", "jq" },
				handlers = {
					function(config)
						-- all sources with no handler get passed here

						-- Keep original functionality
						require("mason-nvim-dap").default_setup(config)
					end,
					python = function(config)
						-- config.adapters = {
						--  type = "executable",
						--  command = "/usr/bin/python3",
						--  args = {
						--   "-m",
						-- "debugpy.adapter",
						-- },
						-- }
						-- require('mason-nvim-dap').default_setup(config) -- don't forget this!
					end,
				},
			})
		end,
	},
}
