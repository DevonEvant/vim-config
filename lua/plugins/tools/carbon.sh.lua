return {
  {
    "ellisonleao/carbon-now.nvim",
    lazy = false,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = function(_, opts)
      local map = vim.api.nvim_set_keymap
      local buf_map = vim.api.nvim_buf_set_keymap
      -- map("n", "<leader>cc", "<cmd>CarbonNowSh<CR>", {})
      -- map("v", "<leader>cc", "<cmd>CarbonNowSh<CR>", {})
      vim.keymap.set("n", "<leader>cp", ":CarbonNow<CR>", { silent = true })
      vim.keymap.set("v", "<leader>cp", ":CarbonNow<CR>", { silent = true })
    end,
  },
}
