require("toggleterm")

vim.g.floaterm_title = ''
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_autoclose = 0
vim.g.floaterm_opener = 'edit'
vim.g.toggleterm_direction = 'float'

vim.g.floaterm_keymap_new = '<ESC>.o'
vim.g.floaterm_keymap_prev = '<ESC>n'
vim.g.floaterm_keymap_next = '<ESC>m'
vim.g.floaterm_keymap_toggle = '.t'


-- vim.api.nvim_set_keymap("n", ".t", "<cmd>lua require('toggleterm').toggle()<CR>", { noremap = true, silent = true })
