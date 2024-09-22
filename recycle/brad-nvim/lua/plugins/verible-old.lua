return {
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "verilog",
      "systemverilog",
    },
    highlight = {
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<TAB>",
      },
    },
    indent = {
      enable = true,
    },
  }),
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local util = lspconfig.util

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "verible" },
        automatic_installation = true,
        handlers = {
          ["verible"] = function()
            require("lspconfig").verible.setup({
              root_dir = function(fname)
                return util.root_pattern(".git", "*.sv", "*.v")(fname) or util.path.dirname(fname)
              end,
              cmd = { "verible-verilog-ls" },
              filetypes = { "verilog", "systemverilog", "v" },
            })
          end,
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    dependencies = {
      "stevearc/conform.nvim",
    },
    opts = {
      formatters_by_ft = {
        verilog = { "verible_verilog_format" },
        systemverilog = { "verible_verilog_format" },
      },

      formatters = {
        verible_verilog_format = {
          command = "verible-verilog-format",
          args = {
            "--indentation_spaces=2",
            "--wrap_end_else_clauses=",
            "-",
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "mfussenegger/nvim-lint",
    },
    config = function()
      local lint = require("lint")

      -- look for custom rules in ~/.config/nvim/verible/custom_rules
      -- local custom_rule_path = vim.fn.expand("~/.config/nvim/verible/custom_rules")
      -- look for custom rules in buffer's directory
      local function get_custum_rule_path()
        local custom_rule_path = vim.fn.expand("%:p:h") .. "/custom_rules"
        if vim.fn.isdirectory(custom_rule_path) == 1 then
          return "--rules_config=" .. custom_rule_path
        else
          return ""
        end
      end

      vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre", "BufWritePost", "TextChanged" }, {
        callback = function()
          lint.linters.verible_verilog_lint = {
            name = "verible_verilog_lint",
            cmd = "verible-verilog-lint",
            stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
            append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
            args = { get_custum_rule_path() }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
            stream = "both", -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
            ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
            env = nil, -- custom environment
            parser = require("lint.parser").from_pattern(
              "(.+):(%d+):(%d+).-(%d+): (.+)",
              { "filename", "lnum", "col", "end_col", "message" },
              {
                ["error"] = vim.diagnostic.severity.ERROR,
                ["warning"] = vim.diagnostic.severity.WARN,
              },
              {
                ["severity"] = vim.diagnostic.severity.WARN,
              }
            ),
          }
          lint.try_lint()
        end,
      })
    end,
  },
}
---- verible formatter, configered by conform.nvim
--require("conform").setup({
--  formatters_by_ft = {
--    verilog = { "verible_verilog_format" },
--    systemverilog = { "verible_verilog_format" },
--  },
--  formatters = {
--    verible_verilog_format = {
--      command = "verible-verilog-format",
--      args = {
--        "--indentation_spaces 2",
--        "--wrap_end_else_clauses=true"
--      },
--    },
--  },
--})
--
---- verible linter, configered by nvim-lint
--local lint = require("lint")
--
--vim.api.nvim_create_autocmd(
--  { "BufNewFile", "BufReadPre", "BufWritePost", "TextChanged" },
--  {
--    callback = function()
--      lint.linters.verible_verilog_lint = {
--        cmd = "verible-verilog-lint",
--        stdin = true,            -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
--        append_fname = true,     -- Automatically append the file name to `args` if `stdin = false` (default: true)
--        args = {},               -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
--        stream = both,           -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
--        ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
--        env = nil,               -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
--        -- from_pattern(pattern, groups, severity_map, defaults, opts)
--        parser = require("lint.parser").from_pattern(
--          "(.+):(%d+):(%d+).-(%d+): (.+)",
--          { "filename", "lnum", "col", "end_col", "message" },
--          {
--            ["error"] = vim.diagnostic.severity.ERROR,
--            ["warning"] = vim.diagnostic.severity.WARN,
--          },
--          {
--            ["severity"] = vim.diagnostic.severity.WARN
--          }
--        ),
--      }
--    end,
--  })
--
--
--
---- verible languaue server, configered by mason-lspconfig and lspconfig
--require("mason").setup()
--require("mason-lspconfig").setup({
--  ensure_installed = { "verible" },
--  automatic_installation = true,
--  handlers = {
--    ["verible"] = function()
--      require("lspconfig").verible.setup({
--        cmd = { "verible-verilog-ls" },
--        filetypes = { "verilog", "systemverilog" },
--      })
--    end,
--  },
--})
