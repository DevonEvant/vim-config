local map = vim.api.nvim_set_keymap

-- NERDCommenterToggle
map('v', string.char(31), ':NvimTreeToggle<CR>', {})
map('n', string.char(31), ':NvimTreeToggle<CR>', {})
-- 切换 NERDTree 窗口的快捷键
map('n', '<C-b>', ':NvimTreeToggle<CR>', {})
-- 切换 NERDTree 窗口并自动刷新的快捷键
-- map('n', '<C-b>', ':NERDTreeToggle<CR><Esc><Esc>', {})


require("nvim-tree").setup({
        auto_close = true,
        sort_by = "case_sensitive",
        hijack_cursor = true,
        system_open = {
            -- cmd = "open",
        },
        view = {
            -- width = 5,
            -- adaptive_size = true,
        },
        renderer = {
            group_empty = true,
            icons = {
                show = {
                    git = true,
                    file = true,
                    folder = true,
                    folder_arrow = true,
                },
                glyphs = {
                    bookmark = " ",
                    folder = {
                        arrow_closed = "⏵",
                        arrow_open = "⏷",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "⌥",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "⊖",
                        ignored = "◌",
                    },
                },
            },
        },
        filters = {
            dotfiles = false,
        },
    })
