local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap

-- <enter> 增量选择

-- inoremap
map('i', 'jk', '<ESC>', {})
--map('i', '(', '()<ESC>i', {})
--map('i', '"', '""<ESC>i', {})
--map('i', "'", "''<ESC>i", {})
--map('i', '[', '[]<ESC>i', {})

map('i', '<C-h>', '<Left>', {})
map('i', '<C-j>', '<Down>', {})
map('i', '<C-k>', '<Up>', {})
map('i', '<C-l>', '<Right>', {})
map('i', '<C-d>', '<DELETE>', {})
map('i', '<C-y>', '<CR>', {})
map('i', '<C-e>', '<ESC>', {})
map('i', '<C-u>', '<Esc>ui', {})

-- nmap
map('n', '<C-s>', '<Esc>:w<CR>', {})
map('n', '<C-s>a', '<Esc>:wa<CR>', {})
map('n', '<C-s>5', '<Esc>:w<CR>:so %<CR>', {})
map('i', '<C-s>', '<Esc>:w<CR>a', {})
map('i', '<C-s>a', '<Esc>:wa<CR>a', {})
map('i', '<C-s>5', '<Esc>:w<CR>:so %<CR>', {})

-- nmap
map('n', 'da', '<Esc>ggdG', {})
map('n', 'ya', '<Esc>ggyG', {})
map('n', 'va', '<Esc>gg0vG$', {})
map('n', '<C-w>qq', '<Esc>:q<CR>', {})
map('n', '<C-w>q1', '<Esc>:q!<CR>', {})
map('n', '<C-w>qa', '<Esc>:qa<CR>', {})
map('n', '<C-w>qa1', '<Esc>:qa!<CR>', {})
map('n', 'U', '<C-r>', { noremap = true })

-- inoremap
map('i', string.char(31), '<Esc>\\cia', {})
map('n', string.char(31), '\\ci', {})

-- Easymotion 配置
vim.g.EasyMotion_do_mapping = 0
map('n', '<Leader>f', '<Plug>(easymotion-bd-f)', {})
-- map('n', '<Leader>s', '<Plug>(easymotion-s2)', {})
map('n', '<Leader>L', '<Plug>(easymotion-bd-jk)', {})
map('n', '<Leader>w', '<Plug>(easymotion-bd-w)', {})
map('n', '/', '<Plug>(easymotion-sn)', {})
map('o', '/', '<Plug>(easymotion-tn)', {})
map('n', 'n', '<Plug>(easymotion-next)', {})
map('n', 'N', '<Plug>(easymotion-prev)', {})
map('n', '<Leader>l', '<Plug>(easymotion-lineforward)', {})
map('n', '<Leader>j', '<Plug>(easymotion-j)', {})
map('n', '<Leader>k', '<Plug>(easymotion-k)', {})
map('n', '<Leader>h', '<Plug>(easymotion-linebackward)', {})


-- 设置切换标签页的快捷键 <leader> + <i> 切换到第i个标签页
map('n', '<Leader>1', '<Plug>AirlineSelectTab1', {})
map('n', '<Leader>2', '<Plug>AirlineSelectTab2', {})
map('n', '<Leader>3', '<Plug>AirlineSelectTab3', {})
map('n', '<Leader>4', '<Plug>AirlineSelectTab4', {})
map('n', '<Leader>5', '<Plug>AirlineSelectTab5', {})
map('n', '<Leader>6', '<Plug>AirlineSelectTab6', {})
map('n', '<Leader>7', '<Plug>AirlineSelectTab7', {})
map('n', '<Leader>8', '<Plug>AirlineSelectTab8', {})
map('n', '<Leader>9', '<Plug>AirlineSelectTab9', {})
-- 设置切换标签页的快捷键 <leader> + <-> 切换到前一个标签页
map('n', '<Leader>-', '<Plug>AirlineSelectPrevTab', {})
-- 设置切换标签页的快捷键 <leader> + <+> 切换到后一个标签页
map('n', '<Leader>=', '<Plug>AirlineSelectNextTab', {})
-- 设置切换标签页的快捷键 <leader> + <q> 退出当前的标签页
map('n', '<Leader>q', ':bp<cr>:bd #<cr>', {})


-- Tabularize 快捷键设置
map('n', ',=', ':Tabularize /^[^=]*\\zs=<CR>', {})
map('v', ',=', ':Tabularize /^[^=]*\\zs=<CR>', {})
map('n', ',==', ':Tabularize /^[^=]*\\zs=/r0c0l0<CR>', {})
map('v', ',==', ':Tabularize /^[^=]*\\zs=/r0c0l0<CR>', {})
map('n', ',:', ':Tabularize /:\\zs<CR>', {})
map('v', ',:', ':Tabularize /:\\zs<CR>', {})
map('n', ',|', ':Tabularize /|<CR>', {})
map('v', ',|', ':Tabularize /|<CR>', {})
map('n', ',,', ':Tabularize /,<CR>', {})
map('v', ',,', ':Tabularize /,<CR>', {})
map('n', ',<', ':Tabularize /^[^<]*\\zs</l1r0<CR>', {})
map('v', ',<', ':Tabularize /^[^<]*\\zs</l1r0<CR>', {})
map('n', ',;', ':Tabularize /^[^;]*\\zs;/l0r0<CR>', {})
map('v', ',;', ':Tabularize /^[^;]*\\zs;/l0r0<CR>', {})
map('n', ',)', ':Tabularize /^[^)]*\\zs)/l0r0<CR>', {})
map('v', ',)', ':Tabularize /^[^)]*\\zs)/l0r0<CR>', {})
map('n', ',}', ':Tabularize /^[^}]*\\zs}/l0r1<CR>', {})
map('v', ',}', ':Tabularize /^[^}]*\\zs}/l0r1<CR>', {})
map('n', ',{', ':Tabularize /^[^{]*\\zs{/l1r0<CR>', {})
map('v', ',{', ':Tabularize /^[^{]*\\zs{/l1r0<CR>', {})

-- j/k will move virtual lines (lines that wrap)
map('n', 'j', "(v:count == 0 ? 'gj' : 'j')", { expr = true, silent = true })
map('n', 'k', "(v:count == 0 ? 'gk' : 'k')", { expr = true, silent = true })

-- Shift+Arrow selection
map('n', '<S-Up>', 'v<Up>', {})
map('n', '<S-Down>', 'v<Down>', {})
map('n', '<S-Left>', 'v<Left>', {})
map('n', '<S-Right>', 'v<Right>', {})
map('v', '<S-Up>', '<Up>', {})
map('v', '<S-Down>', '<Down>', {})
map('v', '<S-Left>', '<Left>', {})
map('v', '<S-Right>', '<Right>', {})
map('i', '<S-Up>', '<Esc>v<Up>', {})
map('i', '<S-Down>', '<Esc>v<Down>', {})
map('i', '<S-Left>', '<Esc>v<Left>', {})
map('i', '<S-Right>', '<Esc>v<Right>', {})

-- Visual mode mappings
map('v', '<C-c>', 'y<Esc>i', {})
map('v', '<C-x>', 'd<Esc>i', {})
map('i', '<C-v>', '<Esc>pi', {})

-- Autoformat on save
-- vim.api.nvim_command('autocmd BufWritePre * :Autoformat')

-- Custom mappings for Autoformat
-- map('n', '<C-f>', ':w<CR>:Autoformat<CR>', {})
-- map('i', '<C-f>', '<Esc>:w<CR>:Autoformat<CR>a', {})


-- map('n', '<C-f>', ':w<CR>:Neoformat<CR>', {})
-- map('i', '<C-f>', '<Esc>:w<CR>:Neoformat<CR>a', {})

-- Use <Tab> and <S-Tab> to navigate the completion list
map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Use <Ctrl-F> to format documents with prettier
-- vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.formatFile')
-- map('n', '<C-F>', ':Autoformat<CR>', {})
-- map('i', '<C-F>', ':Autoformat<CR>', {})

-- map('n', "lsphov", ':lua vim.lsp.buf.hover()<CR>', {})

-- local opts = { buffer = bufnr, remap = false }
-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
-- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
-- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
-- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
-- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
-- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
-- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
-- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--

-- 跳转到声明
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true, noremap = true })
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, noremap = true })
map("n", "gf", "<cmd>Lspsaga finder<CR>", { silent = true, noremap = true })
map("n", "gF", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true, noremap = true })
map("n", "gFs", "<cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>", { silent = true, noremap = true })
map('n', "gh", '<cmd>Lspsaga hover_doc<CR>', {})
map('n', "gHo", '<cmd>Lspsaga incoming_calls<CR>', {})
map('n', "gHi", '<cmd>Lspsaga outgoing_calls<CR>', {})
map("n", "gi", "<cmd>Lspsaga finder imp<CR>", { silent = true, noremap = true })
map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
map("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true, noremap = true })
map("n", "gN", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })
map("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
map("n", "gdc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true, noremap = true })
map("n", "gdl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
map("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
map("v", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })

-- 设置用户定义的 emmet_leader 键为 f,
-- vim.cmd [[let g:user_emmet_leader_key='<C-r>']]


-- NERDCommenterToggle
--map('v', string.char(31), ':NvimTreeToggle<CR>I<ESC>', {})
--map('n', string.char(31), ':NvimTreeToggle<CR>I<ESC>', {})
-- 切换 NERDTree 窗口的快捷键
map('n', '<A-m>', ':Neotree toggle<CR><ESC>', {})
map('n', '<A-t>', ':ToggleTerm<CR><ESC>', {})
-- map('n', '<C-b>', ':NERDTreeToggle<CR><Esc><Esc>', {})

map("n", "tj", ":BufferLineCyclePrev<CR>", {})
map("n", "tk", ":BufferLineCycleNext<CR>", {})
map('n', 't1', '<cmd>BufferLineGoToBuffer 1<CR>', {})
map('n', 't2', '<cmd>BufferLineGoToBuffer 2<CR>', {})
map('n', 't3', '<cmd>BufferLineGoToBuffer 3<CR>', {})
map('n', 't4', '<cmd>BufferLineGoToBuffer 4<CR>', {})
map('n', 't5', '<cmd>BufferLineGoToBuffer 5<CR>', {})
map('n', 't6', '<cmd>BufferLineGoToBuffer 6<CR>', {})
map('n', 't7', '<cmd>BufferLineGoToBuffer 7<CR>', {})
map('n', 't8', '<cmd>BufferLineGoToBuffer 8<CR>', {})
map('n', 't9', '<cmd>BufferLineGoToBuffer 9<CR>', {})

map('n', 'tQ', "<cmd>bdelete !<CR>", {})
map('n', 'tqq', "<cmd>bdelete<CR>", {})
map('n', 'tq1', "<cmd>bdelete 1<CR>", {})
map('n', 'tq2', "<cmd>bdelete 2<CR>", {})
map('n', 'tq3', "<cmd>bdelete 3<CR>", {})
map('n', 'tq4', "<cmd>bdelete 4<CR>", {})
map('n', 'tq5', "<cmd>bdelete 5<CR>", {})
map('n', 'tq6', "<cmd>bdelete 6<CR>", {})
map('n', 'tq7', "<cmd>bdelete 7<CR>", {})
map('n', 'tq8', "<cmd>bdelete 8<CR>", {})
map('n', 'tq9', "<cmd>bdelete 9<CR>", {})

local function bufQuit()
    local current_bufnr = vim.api.nvim_get_current_buf()
    local other_visible_count = vim.api.nvim_buflist_filter({
        start = 1,
        end_ = vim.api.nvim_buf_get_number(), -- Get the last buffer number
        -- vim.api.nvim_buf_get_number(), -- Get the last buffer number
        predicate = function(bufnr)
            return vim.api.nvim_buf_is_listed(bufnr) and vim.api.nvim_buf_is_visible(bufnr) and bufnr ~= current_bufnr
        end,
    })

    if other_visible_count > 1 then
        -- Close all buffers except current
        vim.api.nvim_command("bdelete")
    else
        -- Quit Neovim
        vim.cmd("quit")
    end
end

-- map('n', 'tq', bufQuit(), {})


-- vim.api.nvim_set_keymap("n", "<C-space>",  ':lua require("rust-tools").hover_actions.hover_actions()<CR>', {})
-- vim.api.nvim_set_keymap("n", "<Leader>a",  ':lua require("rust-tools").code_action_group.code_action_group()<CR>', {})

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
--["<Esc>"] = cmp.mapping({
--i = cmp.mapping.abort(),
--c = cmp.mapping.close()
--}),
-- 上一个
--["<C-k>"] = cmp.mapping.select_prev_item(),
--["<C-j>"] = cmp.mapping.select_next_item(),


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>p', ":Telescope find_files<CR>", {})
vim.keymap.set('n', '<C-p><C-p>', ":Telescope find_files<CR>", {})
vim.keymap.set('n', '<C-p>', ":Telescope ", {})

-- map('n', '<C-\\>', '<cmd>FloatermToggle<CR>', {})
-- map('i', '<C-\\>', '<cmd>FloatermToggle<CR>', {})


local gs = package.loaded.gitsigns
-- stylua: ignore start
vim.keymap.set("n", "gt[", gs.next_hunk, { desc = "Next Hunk" })
vim.keymap.set("n", "gt]", gs.prev_hunk, { desc = "Prev Hunk" })
vim.keymap.set("n", "gtS", gs.stage_buffer, { desc = "Stage Buffer" })
vim.keymap.set("n", "gtu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
vim.keymap.set("n", "gtR", gs.reset_buffer, { desc = "Reset Buffer" })
vim.keymap.set("n", "gtp", gs.preview_hunk_inline, { desc = "Preview Hunk Inline" })
vim.keymap.set("n", "gtb", function() gs.blame_line({ full = true }) end, { desc = "Blame Line" })
vim.keymap.set("n", "gtd", gs.diffthis, { desc = "Diff This" })
vim.keymap.set("n", "gtD", function() gs.diffthis("~") end, { desc = "Diff This ~" })
vim.keymap.set('n', 'gts', gs.stage_hunk)
vim.keymap.set('n', 'gtr', gs.reset_hunk)
vim.keymap.set('v', 'gts', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('v', 'gtr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('n', 'gtp', gs.preview_hunk)
vim.keymap.set('n', 'gTb', gs.toggle_current_line_blame)
vim.keymap.set('n', 'gTd', gs.toggle_deleted)
vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })
vim.keymap.set({ "n", "v" }, "ghs", gs.stage_hunk, { desc = "Stage Hunk" })
vim.keymap.set({ "n", "v" }, "ghr", gs.reset_hunk, { desc = "Reset Hunk" })


-- Lua
vim.keymap.set("n", "gxx", function() require("trouble").toggle() end)
vim.keymap.set("n", "gxw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "gxd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "gxq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "gxl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gxr", function() require("trouble").toggle("lsp_references") end)


vim.keymap.set('n', 'gbc', require 'dap'.continue)
vim.keymap.set('n', 'gbn', require 'dap'.step_over)
vim.keymap.set('n', 'gbN', require 'dap'.step_into)
vim.keymap.set('n', 'gbo', require 'dap'.step_out)
vim.keymap.set('n', 'gbb', require 'dap'.toggle_breakpoint)

vim.keymap.set('n', 'gl', ':TlistToggle<CR>',{})
