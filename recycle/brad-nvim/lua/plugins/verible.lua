local lspconfig = require("lspconfig")
local util = lspconfig.util

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "verible" },
  automatic_installation = true,
  handlers = {
    ["verible"] = function()
      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        -- Helper function to set keymap only if the command exists
        local function safe_keymap_set(mode, lhs, rhs, opts)
          if type(rhs) == "string" then
            rhs = vim.lsp.buf[rhs]
          end
          if rhs then
            vim.keymap.set(mode, lhs, rhs, opts)
          end
        end

        safe_keymap_set("n", "gD", "declaration", bufopts)
        safe_keymap_set("n", "gd", "definition", bufopts)
        safe_keymap_set("n", "K", "hover", bufopts)
        safe_keymap_set("n", "gi", "implementation", bufopts)
        safe_keymap_set("n", "<C-k>", "signature_help", bufopts)
        safe_keymap_set("n", "<space>wa", "add_workspace_folder", bufopts)
        safe_keymap_set("n", "<space>wr", "remove_workspace_folder", bufopts)
        safe_keymap_set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        safe_keymap_set("n", "<space>D", "type_definition", bufopts)
        safe_keymap_set("n", "<space>rn", "rename", bufopts)
        safe_keymap_set("n", "<space>ca", "code_action", bufopts)
        safe_keymap_set("n", "gr", "references", bufopts)

        -- Check if the client supports formatting
        if client.server_capabilities.documentFormattingProvider then
          safe_keymap_set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, bufopts)
        end
      end

      require("lspconfig").verible.setup({
        on_attach = on_attach,
        root_dir = function(fname)
          return util.root_pattern(".git", "*.sv", "*.v")(fname) or util.path.dirname(fname)
        end,
        cmd = { "verible-verilog-ls" },
        filetypes = { "verilog", "systemverilog", "v", "sv", "svh" },
      })
    end,
  },
})
-- Setup nvim-treesitter for syntax highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "verilog",
    "systemverilog",
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
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
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
      args = {
        "--indentation_spaces=2",
        "--wrap_end_else_clauses=false",
        "-",
      },
    },
  },
})

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

local lint = require("lint")

lint.linters_by_ft = {
  verilog = { "verible_verilog_lint" },
  systemverilog = { "verible_verilog_lint" },
}

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre", "BufWritePost", "TextChanged" }, {
  callback = function()
    lint.linters.verible_verilog_lint = {
      name = "verible_verilog_lint",
      cmd = "verible-verilog-lint",
      stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
      append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
      args = { get_custum_rule_path() }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
      stream = "both", -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
      ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
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
