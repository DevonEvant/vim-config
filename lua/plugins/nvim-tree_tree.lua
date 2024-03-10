local map = vim.api.nvim_set_keymap

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_gitignore = 0

require("nvim-tree").setup({
        hijack_cursor = true,
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
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
    })

