local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap


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
map('n', '<C-w>q', '<Esc>:q<CR>', {})
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
map('n', '<C-f>', ':w<CR>:Autoformat<CR>', {})
map('i', '<C-f>', '<Esc>:w<CR>:Autoformat<CR>a', {})


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

-- 跳转到声明
map("n" , "gd"  , "<cmd>Lspsaga peek_definition<CR>"         , { silent = true , noremap = true })
map("n" , "gD"  , "<cmd>lua vim.lsp.buf.definition()<CR>"    , { silent = true , noremap = true })
map("n" , "gf"  , "<cmd>Lspsaga finder<CR>"                  , { silent = true , noremap = true })
map("n" , "gF"  , "<cmd>lua vim.lsp.buf.format()<CR>"        , { silent = true , noremap = true })
map('n' , "gh"  , '<cmd>Lspsaga hover_doc<CR>'               , {})
map("n" , "gi"  , "<cmd>Lspsaga finder imp<CR>"              , { silent = true , noremap = true })
map("n" , "gr"  , "<cmd>Lspsaga rename<CR>"                  , { silent = true , noremap = true })
map("n" , "go"  , "<cmd>lua vim.diagnostic.open_float()<CR>" , { silent = true , noremap = true })
map("n" , "gN"  , "<cmd>lua vim.diagnostic.goto_prev()<CR>"  , { silent = true , noremap = true })
map("n" , "gn"  , "<cmd>lua vim.diagnostic.goto_next()<CR>"  , { silent = true , noremap = true })
map("n" , "gdc" , "<cmd>Lspsaga show_cursor_diagnostics<CR>" , { silent = true , noremap = true })
map("n" , "gdl" , "<cmd>Lspsaga show_line_diagnostics<CR>"   , { silent = true , noremap = true })
map("n" , "ga"  , "<cmd>Lspsaga code_action<CR>"             , { silent = true , noremap = true })
map("v" , "ga"  , "<cmd>Lspsaga code_action<CR>"             , { silent = true , noremap = true })

-- 设置用户定义的 emmet_leader 键为 f,
-- vim.cmd [[let g:user_emmet_leader_key='<C-r>']]


-- NERDCommenterToggle
--map('v', string.char(31), ':NvimTreeToggle<CR>I<ESC>', {})
--map('n', string.char(31), ':NvimTreeToggle<CR>I<ESC>', {})
-- 切换 NERDTree 窗口的快捷键
map('n', '<A-m>', ':NvimTreeToggle<CR>I<ESC>', {})
-- map('n', '<C-b>', ':NERDTreeToggle<CR><Esc><Esc>', {})

map("n", "tN", ":BufferLineCyclePrev<CR>", {})
map("n", "tn", ":BufferLineCycleNext<CR>", {})
map('n', 't1', '<cmd>BufferLineGoToBuffer 1<CR>', {})
map('n', 't2', '<cmd>BufferLineGoToBuffer 2<CR>', {})
map('n', 't3', '<cmd>BufferLineGoToBuffer 3<CR>', {})
map('n', 't4', '<cmd>BufferLineGoToBuffer 4<CR>', {})
map('n', 't5', '<cmd>BufferLineGoToBuffer 5<CR>', {})
map('n', 't6', '<cmd>BufferLineGoToBuffer 6<CR>', {})
map('n', 't7', '<cmd>BufferLineGoToBuffer 7<CR>', {})
map('n', 't8', '<cmd>BufferLineGoToBuffer 8<CR>', {})
map('n', 't9', '<cmd>BufferLineGoToBuffer 9<CR>', {})


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
map('n', 'tq', "<cmd>bdelete<CR>", {})
