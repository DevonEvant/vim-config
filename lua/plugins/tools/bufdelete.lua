return {
	{
		"famiu/bufdelete.nvim",
		config = function()
			local map = vim.api.nvim_set_keymap
			local buf_map = vim.api.nvim_buf_set_keymap

			-- buffer
			map("n", "tr", "<esc>:BufferLineTabRename ", {})
			map("n", "tp", "<cmd>BufferLineTogglePin<CR>", {})
			-- group
			map("n", "tgg", "<esc>:BufferLineGroupToggl ", {})
			map("n", "tgc", "<esc>:BufferLineGroupClose ", {})
			-- buffer
			map("n", "th", "<cmd>BufferLineCyclePrev<CR>", {})
			map("n", "tj", "<cmd>BufferLineCyclePrev<CR>", {})
			map("n", "tk", "<cmd>BufferLineCycleNext<CR>", {})
			map("n", "tl", "<cmd>BufferLineCycleNext<CR>", {})
			map("n", "t1", '<cmd>lua require("bufferline").go_to(1, true)<CR>', {})
			map("n", "t2", '<cmd>lua require("bufferline").go_to(2, true)<CR>', {})
			map("n", "t3", '<cmd>lua require("bufferline").go_to(3, true)<CR>', {})
			map("n", "t4", '<cmd>lua require("bufferline").go_to(4, true)<CR>', {})
			map("n", "t5", '<cmd>lua require("bufferline").go_to(5, true)<CR>', {})
			map("n", "t6", '<cmd>lua require("bufferline").go_to(6, true)<CR>', {})
			map("n", "t7", '<cmd>lua require("bufferline").go_to(7, true)<CR>', {})
			map("n", "t8", '<cmd>lua require("bufferline").go_to(8, true)<CR>', {})
			map("n", "t9", '<cmd>lua require("bufferline").go_to(9, true)<CR>', {})

			map("n", "tqa", "<cmd>bdelete !<CR>", {})
			map("n", "tqq", "<cmd>bdelete<CR>", {})
			map("n", "tq1", '<cmd>lua require("bufdelete").bufdelete(1, true)<CR>', {})
			map("n", "tq2", '<cmd>lua require("bufdelete").bufdelete(2, true)<CR>', {})
			map("n", "tq3", '<cmd>lua require("bufdelete").bufdelete(3, true)<CR>', {})
			map("n", "tq4", '<cmd>lua require("bufdelete").bufdelete(4, true)<CR>', {})
			map("n", "tq5", '<cmd>lua require("bufdelete").bufdelete(5, true)<CR>', {})
			map("n", "tq6", '<cmd>lua require("bufdelete").bufdelete(6, true)<CR>', {})
			map("n", "tq7", '<cmd>lua require("bufdelete").bufdelete(7, true)<CR>', {})
			map("n", "tq8", '<cmd>lua require("bufdelete").bufdelete(8, true)<CR>', {})
			map("n", "tq9", '<cmd>lua require("bufdelete").bufdelete(9, true)<CR>', {})
		end,
	},
}
