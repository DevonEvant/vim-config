local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap

-- <enter> 增量选择

-- inoremap
-- map("i", "jk", "<ESC>", {})
--map('i', '(', '()<ESC>i', {})
--map('i', ''', '''<ESC>i', {})
--map('i', ''', '''<ESC>i', {})
--map('i', '[', '[]<ESC>i', {})

-- map("i", "<C-h>", "<Left>", {})
-- map("i", "<C-j>", "<Down>", {})
-- map("i", "<C-k>", "<Up>", {})
-- map("i", "<C-l>", "<Right>", {})
-- map("i", "<C-d>", "<DELETE>", {})
-- map("i", "<C-y>", "<CR>", {})
-- map("i", "<C-e>", "<ESC>", {})
-- map("i", "<C-u>", "<Esc>ui", {})

-- nmap
map("n", "<C-s>", "<Esc>:w<CR>", {})
map("n", "<C-s>5", "<Esc>:w<CR>:so %<CR>", {})
map("i", "<C-s>", "<Esc>:w<CR>a", {})
map("i", "<C-s>5", "<Esc>:w<CR>:so %<CR>", {})

-- nmap
map("n", "da", "<Esc>ggdG", {})
map("n", "ya", "<Esc>ggyG", {})
map("n", "va", "<Esc>gg0vG$", {})
-- map("n", "<C-w>qq", "<Esc>:q<CR>", {})
-- map("n", "<C-w>q1", "<Esc>:q!<CR>", {})
-- map("n", "<C-w>qa", "<Esc>:qa<CR>", {})
-- map("n", "<C-w>qa1", "<Esc>:qa!<CR>", {})
map("n", "U", "<C-r>", { noremap = true })

-- inoremap
-- map("i", string.char(31), "<Esc>\\cia", {})
-- map("n", string.char(31), "\\ci", {})

-- -- 设置切换标签页的快捷键 <leader> + <i> 切换到第i个标签页
-- map('n', '<Leader>1', '<Plug>AirlineSelectTab1', {})
-- map('n', '<Leader>2', '<Plug>AirlineSelectTab2', {})
-- map('n', '<Leader>3', '<Plug>AirlineSelectTab3', {})
-- map('n', '<Leader>4', '<Plug>AirlineSelectTab4', {})
-- map('n', '<Leader>5', '<Plug>AirlineSelectTab5', {})
-- map('n', '<Leader>6', '<Plug>AirlineSelectTab6', {})
-- map('n', '<Leader>7', '<Plug>AirlineSelectTab7', {})
-- map('n', '<Leader>8', '<Plug>AirlineSelectTab8', {})
-- map('n', '<Leader>9', '<Plug>AirlineSelectTab9', {})
-- -- 设置切换标签页的快捷键 <leader> + <-> 切换到前一个标签页
-- map('n', '<Leader>-', '<Plug>AirlineSelectPrevTab', {})
-- -- 设置切换标签页的快捷键 <leader> + <+> 切换到后一个标签页
-- map('n', '<Leader>=', '<Plug>AirlineSelectNextTab', {})
-- -- 设置切换标签页的快捷键 <leader> + <q> 退出当前的标签页
-- map('n', '<Leader>q', ':bp<cr>:bd #<cr>', {})

-- j/k will move virtual lines (lines that wrap)
map("n", "j", '(v:count == 0 ? "gj" : "j")', { expr = true, silent = true })
map("n", "k", '(v:count == 0 ? "gk" : "k")', { expr = true, silent = true })

-- Shift+Arrow selection
map("n", "<S-Up>", "v<Up>", {})
map("n", "<S-Down>", "v<Down>", {})
map("n", "<S-Left>", "v<Left>", {})
map("n", "<S-Right>", "v<Right>", {})
map("v", "<S-Up>", "<Up>", {})
map("v", "<S-Down>", "<Down>", {})
map("v", "<S-Left>", "<Left>", {})
map("v", "<S-Right>", "<Right>", {})
map("i", "<S-Up>", "<Esc>v<Up>", {})
map("i", "<S-Down>", "<Esc>v<Down>", {})
map("i", "<S-Left>", "<Esc>v<Left>", {})
map("i", "<S-Right>", "<Esc>v<Right>", {})

-- Visual mode mappings
map("v", "<C-c>", "y<Esc>i", {})
map("v", "<C-x>", "d<Esc>i", {})
map("i", "<C-v>", "<Esc>pi", {})

-- Use <Tab> and <S-Tab> to navigate the completion list
map("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Use <Ctrl-F> to format documents with prettier
-- vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.formatFile')
-- map('n', '<C-F>', ':Autoformat<CR>', {})
-- map('i', '<C-F>', ':Autoformat<CR>', {})

-- map('n', 'lsphov', ':lua vim.lsp.buf.hover()<CR>', {})

-- local opts = { buffer = bufnr, remap = false }
-- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
-- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
-- vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
-- vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
-- vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
-- vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
-- vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
-- vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
-- vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
-- vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
--

-- git status
-- gg
-- G
-- map("n", "gG", ":Neotree toggle git_status<CR>", {})

--
vim.keymap.set("n", "gl", ":TlistToggle<CR>", {})

-- zip
-- 使用 :set foldenable! 命令切換折疊功能。
-- 使用 zo 命令展開折疊，使用 zc 命令折疊代碼塊。
-- 使用 :set foldcolumn=0 可以暫時關閉折疊列顯示，這樣你可以更容易地看到折疊狀態。
vim.keymap.set("n", "gz", "za", {})

-- telescope
-- local builtin = require('telescope.builtin')
vim.keymap.set("n", "<C-p>p", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<C-p><C-p>", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<C-p>", ":Telescope ", {})

-- require("gitsigns").setup()
-- local gs = package.loaded.gitsigns
-- -- stylua: ignore start
-- vim.keymap.set('n', 'gt[', gs.next_hunk, { desc = 'Next Hunk' })
-- vim.keymap.set('n', 'gt]', gs.prev_hunk, { desc = 'Prev Hunk' })
-- vim.keymap.set('n', 'gtS', gs.stage_buffer, { desc = 'Stage Buffer' })
-- vim.keymap.set('n', 'gtu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
-- vim.keymap.set('n', 'gtR', gs.reset_buffer, { desc = 'Reset Buffer' })
-- vim.keymap.set('n', 'gtp', gs.preview_hunk_inline, { desc = 'Preview Hunk Inline' })
-- vim.keymap.set('n', 'gtb', function() gs.blame_line({ full = true }) end, { desc = 'Blame Line' })
-- vim.keymap.set('n', 'gtd', gs.diffthis, { desc = 'Diff This' })
-- vim.keymap.set('n', 'gtD', function() gs.diffthis('~') end, { desc = 'Diff This ~' })
-- vim.keymap.set('n', 'gts', gs.stage_hunk)
-- vim.keymap.set('n', 'gtr', gs.reset_hunk)
-- vim.keymap.set('v', 'gts', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
-- vim.keymap.set('v', 'gtr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
-- vim.keymap.set('n', 'gtp', gs.preview_hunk)
-- vim.keymap.set('n', 'gTb', gs.toggle_current_line_blame)
-- vim.keymap.set('n', 'gTd', gs.toggle_deleted)
-- vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'GitSigns Select Hunk' })
-- vim.keymap.set({ 'n', 'v' }, 'ghs', gs.stage_hunk, { desc = 'Stage Hunk' })
-- vim.keymap.set({ 'n', 'v' }, 'ghr', gs.reset_hunk, { desc = 'Reset Hunk' })

-- vim.keymap.set('n', 'llll', '<cmd>BufferLineTogglePin %d<CR>',{})
-- nnoremap <silent> gb :BufferLinePick<CR>
-- :lua require'bufferline'.sort_by('extension')`
-- :lua require'bufferline'.sort_by('directory')`
-- :lua require'bufferline'.sort_by('tabs')`

-- 设置用户定义的 emmet_leader 键为 f,
-- vim.cmd [[let g:user_emmet_leader_key='<C-r>']]

-- NERDCommenterToggle
-- map('n', '<C-b>', ':NERDTreeToggle<CR><Esc><Esc>', {})

-- 切换 NERDTree 窗口的快捷键
-- map('n', '<A-m>', ':Neotree toggle left<CR><ESC>', {})

-- map('n', 'tq', bufQuit(), {})

-- vim.api.nvim_set_keymap('n', '<C-space>',  ':lua require('rust-tools').hover_actions.hover_actions()<CR>', {})
-- vim.api.nvim_set_keymap('n', '<Leader>a',  ':lua require('rust-tools').code_action_group.code_action_group()<CR>', {})

-- local cmp = require('cmp')
-- map('i', '<C-b>', cmp.mapping.scroll_docs(-4), {})
-- map('c', '<C-b>', cmp.mapping.scroll_docs(-4), {})
-- map('i', '<C-u>', cmp.mapping.scroll_docs(4), {})
-- map('c', '<C-u>', cmp.mapping.scroll_docs(4), {})
-- map('n', '<C-Space>', cmp.mapping.complete(), {})
-- map('n', '<C-e>', cmp.mapping.abort(), {})
-- map('n', '<CR>', cmp.mapping.confirm({ select = true }), {})
-- map('n', '<S-Tab>', cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }))
-- map('n', '<Tab>', cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }))

-- 取消补全
--['<Esc>'] = cmp.mapping({
--i = cmp.mapping.abort(),
--c = cmp.mapping.close()
--}),
-- 上一个
--['<C-k>'] = cmp.mapping.select_prev_item(),
--['<C-j>'] = cmp.mapping.select_next_item(),

-- map('n', '<C-\\>', '<cmd>FloatermToggle<CR>', {})
-- map('i', '<C-\\>', '<cmd>FloatermToggle<CR>', {})
