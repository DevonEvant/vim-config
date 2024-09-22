return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufNewFile", "BufReadPre", "BufWritePost", "InsertLeave" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "stevearc/conform.nvim",
      "mfussenegger/nvim-lint",
      "rcarriga/nvim-notify",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local util = lspconfig.util

      -- Setup IDE notify
      vim.notify = require("notify")

      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "verible", "svlangserver" },
        handlers = {
          ["svlangserver"] = function()
            lspconfig.svlangserver.setup({
              on_init = function(client)
                client.config.settings.systemverilog = {
                  formatCommand = "verible-verilog-format --indentation_spaces 2",
                }
              end,

              --              filetypes = { "verilog", "systemverilog" },
              --              on_init = function(client)
              --                client.config.settings.systemverilog = {
              --                  formatCommand = "verible-verilog-format --indentation_spaces 2",
              --                }
              --                client.notify("workspace/didChangeConfiguration")
              --                return true
              --              end,
            })
          end,
        },
      })

      -- Setup conform.nvim for formatting
      require("conform").setup({
        formatters_by_ft = {
          verilog = { "verible_verilog_format" },
          systemverilog = { "verible_verilog_format" },
        },
        formatters = {
          verible_verilog_format = {
            command = "verible-verilog-format",
            -- "-" means read from current buffer,
            -- other settings: https://github.com/chipsalliance/verible/tree/master/verilog/tools/formatter
            args = { "--indentation_spaces", "2", "-" },
          },
        },
      })
      --
      ---- Setup lint
      --local lint = require("lint")
      --
      --lint.linters_by_ft = {
      --verilog = { "verible_verilog_lint" },
      --systemverilog = { "verible_verilog_lint" },
      --}
      --
      --lint.linters.verible_verilog_lint = {
      --name = "verible_verilog_lint",
      --cmd = "verible-verilog-lint",
      --stdin = false,
      --append_fname = true,
      --ignore_exitcode = true,
      --args = {},
      --stream = "stdout",
      --parser = require("lint.parser").from_pattern(
      --"(.+):(%d+):(.+):(.+)",
      --{ "filename", "lnum", "col", "message" },
      --{ vim.diagnostic.severity.WARN },
      --{ ["source"] = "verible_verilog_lint" }
      --),
      --}

      -- Optional: Set up autoformatting on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.v", "*.sv" },
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
          require("lint").try_lint("verible_verilog_lint")
        end,
      })
    end,
  },
}
