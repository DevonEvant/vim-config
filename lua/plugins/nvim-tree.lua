local map = vim.api.nvim_set_keymap

-- NERDCommenterToggle
map('v', string.char(31), ':NvimTreeToggle<CR>', {})
map('n', string.char(31), ':NvimTreeToggle<CR>', {})
-- 切换 NERDTree 窗口的快捷键
map('n', '<C-b>', ':NvimTreeToggle<CR>', {})
-- 切换 NERDTree 窗口并自动刷新的快捷键
-- map('n', '<C-b>', ':NERDTreeToggle<CR><Esc><Esc>', {})

require('nvim-tree').setup {
    -- 关闭文件时自动关闭
    auto_close = true,
    -- 显示 git 状态图标
    git = {
        enable = true
    }
}

