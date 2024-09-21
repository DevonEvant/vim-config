return {
	{
		"godlygeek/tabular",
		config = function()
			local map = vim.api.nvim_set_keymap
			local buf_map = vim.api.nvim_buf_set_keymap

			-- Tabularize 快捷键设置
			map("n", ",=", ":Tabularize /^[^=]*\\zs=<CR>", {})
			map("v", ",=", ":Tabularize /^[^=]*\\zs=<CR>", {})
			map("n", ",==", ":Tabularize /^[^=]*\\zs=/r0c0l0<CR>", {})
			map("v", ",==", ":Tabularize /^[^=]*\\zs=/r0c0l0<CR>", {})
			map("n", ",:", ":Tabularize /:\\zs<CR>", {})
			map("v", ",:", ":Tabularize /:\\zs<CR>", {})
			map("n", ",|", ":Tabularize /|<CR>", {})
			map("v", ",|", ":Tabularize /|<CR>", {})
			map("n", ",,", ":Tabularize /,<CR>", {})
			map("v", ",,", ":Tabularize /,<CR>", {})
			map("n", ",<", ":Tabularize /^[^<]*\\zs</l1r0<CR>", {})
			map("v", ",<", ":Tabularize /^[^<]*\\zs</l1r0<CR>", {})
			map("n", ",;", ":Tabularize /^[^;]*\\zs;/l0r0<CR>", {})
			map("v", ",;", ":Tabularize /^[^;]*\\zs;/l0r0<CR>", {})
			map("n", ",)", ":Tabularize /^[^)]*\\zs)/l0r0<CR>", {})
			map("v", ",)", ":Tabularize /^[^)]*\\zs)/l0r0<CR>", {})
			map("n", ",}", ":Tabularize /^[^}]*\\zs}/l0r1<CR>", {})
			map("v", ",}", ":Tabularize /^[^}]*\\zs}/l0r1<CR>", {})
			map("n", ",{", ":Tabularize /^[^{]*\\zs{/l1r0<CR>", {})
			map("v", ",{", ":Tabularize /^[^{]*\\zs{/l1r0<CR>", {})
		end,
	},
}
