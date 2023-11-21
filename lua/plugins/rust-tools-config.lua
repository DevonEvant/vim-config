local rt = require("rust-tools")

rt.setup({
    server = {
      on_attach = function(_, bufnr)
        -- vim.keymap.set("n", "<Leader>s", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
  })

vim.api.nvim_set_keymap("n", "<C-space>",  ':lua require("rust-tools").hover_actions.hover_actions()<CR>', {})
vim.api.nvim_set_keymap("n", "<Leader>a",  ':lua require("rust-tools").code_action_group.code_action_group()<CR>', {})
