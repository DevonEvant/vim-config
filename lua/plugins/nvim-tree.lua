local map = vim.api.nvim_set_keymap

-- NERDCommenterToggle
map('v', string.char(31), ':NvimTreeToggle<CR>I<ESC>', {})
map('n', string.char(31), ':NvimTreeToggle<CR>I<ESC>', {})
-- 切换 NERDTree 窗口的快捷键
map('n', '<C-b>', ':NvimTreeToggle<CR>I<ESC>', {})
map('n', '<Leader>b', ':NvimTreeToggle<CR>I<ESC>', {})
-- 切换 NERDTree 窗口并自动刷新的快捷键
-- map('n', '<C-b>', ':NERDTreeToggle<CR><Esc><Esc>', {})

require("nvim-tree").setup({
        -- hide_dotfiles = false,
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
            git_clean = false,
            no_buffer = false,
            custom = { 'node_modules' },
        },
        show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
        },
    })
vim.g.nvim_tree_gitignore = 0
