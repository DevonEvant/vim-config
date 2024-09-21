return {
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		config = function()
			-- Error detact
			vim.keymap.set("n", "gxx", function()
				require("trouble").toggle()
			end)
			vim.keymap.set("n", "gxw", function()
				require("trouble").toggle("workspace_diagnostics")
			end)
			vim.keymap.set("n", "gxd", function()
				require("trouble").toggle("document_diagnostics")
			end)
			vim.keymap.set("n", "gxq", function()
				require("trouble").toggle("quickfix")
			end)
			vim.keymap.set("n", "gxl", function()
				require("trouble").toggle("loclist")
			end)
			vim.keymap.set("n", "gxr", function()
				require("trouble").toggle("lsp_references")
			end)
		end,
		-- keys = {
		--     {
		--         "<leader>xx",
		--         "<cmd>Trouble diagnostics toggle<cr>",
		--         desc = "Diagnostics (Trouble)",
		--     },
		--     {
		--         "<leader>xX",
		--         "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		--         desc = "Buffer Diagnostics (Trouble)",
		--     },
		--     {
		--         "<leader>cs",
		--         "<cmd>Trouble symbols toggle focus=false<cr>",
		--         desc = "Symbols (Trouble)",
		--     },
		--     {
		--         "<leader>cl",
		--         "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		--         desc = "LSP Definitions / references / ... (Trouble)",
		--     },
		--     {
		--         "<leader>xL",
		--         "<cmd>Trouble loclist toggle<cr>",
		--         desc = "Location List (Trouble)",
		--     },
		--     {
		--         "<leader>xQ",
		--         "<cmd>Trouble qflist toggle<cr>",
		--         desc = "Quickfix List (Trouble)",
		--     },
		-- },
	},
}
