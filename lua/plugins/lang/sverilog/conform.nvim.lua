return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, {
        verilog = { "verible-verilog-format" },
        systemverilog = { "verible-verilog-format" },
      })

      -- opts.formatters= vim.tbl_deep_extend("force", opts.formatters, {
      --     ['verible-verilog-format'] = {
      --       prepend_args = { "-i", "2", "-ci" },
      --     },
      -- })
    end,
  },
}
