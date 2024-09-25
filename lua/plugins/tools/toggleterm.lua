return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function(_, opts)
      local map = vim.api.nvim_set_keymap
      local buf_map = vim.api.nvim_buf_set_keymap

      map("n", "<A-t>", ":ToggleTerm direction=float<CR><ESC>", {})
    end,
  },
}
