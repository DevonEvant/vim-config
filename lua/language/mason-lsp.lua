local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

vim.lsp.set_log_level("OFF", "svlangserver")
--vim.lsp.set_log_level("TRACE")

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "rust_analyzer",
    "lua_ls",
    "bashls",
    "jdtls",
    "clangd",
    "cmake",
    "pyright",
    "verible",
    "svls",
    "tsserver",               -- typescript
    "quick_lint_js",          --js
    "html",                   --html
    "svlangserver",
    "jsonls",                 --json
    "kotlin_language_server", --kotlin
    "marksman",               --markdown
    "taplo",                  --toml
    "sqlls",                  --sql
    "lemminx",                --xml
    "yamlls",                 --yaml
    "emmet_language_server",
    "cssmodules_ls"           --css
  },
}

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup {}
  end,

  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      filetypes = { "lua" },
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,


  ["svlangserver"] = function()
    lspconfig.svlangserver.setup {
      filetypes = { 'verilog', 'systemverilog', 'verilogsystemverilog', 'verilog_systemverilog' }, -- 指定
      on_init   = function(client)
        client.config.settings.systemverilog = {
          -- includeIndexing     = { "**/*.{sv,svh}" },
          -- excludeIndexing     = { "test/**/*.sv*" },
          -- defines             = {},
          -- launchConfiguration = "verilator -sv -Wall --lint-only",
          formatCommand = "verible-verilog-format --indentation_spaces 4",
        }

        return true
      end
    }
  end,


  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup {
      filetypes = { "rust" },
      --capabilities = capabilities,
      --root_dir = lspconfig.util.root_pattern('.git'), -- 指定根目录的查找模式
      --settings = {
      --['rust-analyzer'] = {},
      --},
    }
  end,

  ["pyright"] = function()
    lspconfig.pyright.setup({
      filetypes = { 'python' },
      capabilities = capabilities,
      -- 可選：自訂 LSP 選項
      -- 詳細參數列表可參考官方文件：https://github.com/microsoft/pyright/blob/main/docs/configuration.md
      settings = {
        python = {
          -- 自訂 pyright 的設定選項
        }
      },

      -- 可選：在特定檔案類型時啟用 LSP

      -- 可選：自訂處理器選項
      handlers = {
        -- 自訂處理特定 LSP 通知的邏輯
      },

      -- 可選：在啟動 LSP 之前執行額外的邏輯
      --on_attach = function(client, bufnr)
      -- 自訂執行當 LSP 附加到緩衝區時的邏輯
      --end
    })
  end,

  ["clangd"] = function()
    lspconfig.clangd.setup {
      filetypes = { 'c', 'c++', 'cpp' },
      capabilities = cmp_nvim_lsp.default_capabilities(),
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      }
    }
  end,

  ["verible"] = function()
    lspconfig.verible.setup {
      filetypes = { 'a' }, -- 指定支持的文件类型
      --filetypes = { 'verilog', 'systemverilog' ,'verilogsystemverilog' ,'verilog_systemverilog'}, -- 指定
      --capabilities = capabilities,
      --cmd = { 'verible-verilog-ls' }, -- 指定 Verible 工具的路径或命令
      --root_dir = lspconfig.util.root_pattern('.git'), -- 指定根目录的查找模式
      settings = {
        ---- Verible 的特定设置
        verible = {
          lint = true,                       -- 启用 Verible 的语法检查
          lintArgs = { '--ruleset=svlint' }, -- 传递给 Verible 的语法检查参数
          format = true,                     -- 启用 Verible 的代码格式化
          formatArgs = { '--inplace' },      -- 传递给 Verible 的代码格式化参数
        }
      }
    }
  end,

  ["svls"] = function()
    lspconfig.svls.setup {
      filetypes = { 'a' }, -- 指定支持的文件类型
      --filetypes = { 'verilog', 'systemverilog' ,'verilogsystemverilog' ,'verilog_systemverilog'}, -- 指定
    }
  end,

  ["jsonls"] = function()
    lspconfig.jsonls.setup {
      filetypes = { 'json' }, -- 指定支持的文件类型
    }
  end,

  ["kotlin_language_server"] = function()
    lspconfig.kotlin_language_server.setup {
      filetypes = { 'kotlin' }, -- 指定支持的文件类型
    }
  end,

  ["marksman"] = function()
    lspconfig.marksman.setup {
      filetypes = { 'markdown' }, -- 指定支持的文件类型
    }
  end,

  ["taplo"] = function()
    lspconfig.taplo.setup {
      filetypes = { 'toml' }, -- 指定支持的文件类型
      -- capabilities = cmp_nvim_lsp.default_capabilities(),
    }
  end,

  ["typos_lsp"] = function()
    lspconfig.typos_lsp.setup {
      filetypes = {}, -- 指定支持的文件类型
    }
  end,

  ["sqlls"] = function()
    lspconfig.sqlls.setup {
      filetypes = {}, -- 指定支持的文件类型
    }
  end,

  ["lemminx"] = function()
    lspconfig.lemminx.setup {
      filetypes = { 'xml' }, -- 指定支持的文件类型
    }
  end,

  ["yamlls"] = function()
    lspconfig.yamlls.setup {
      filetypes = { 'yaml' }, -- 指定支持的文件类型
    }
  end,

  ["quick_lint_js"] = function()
    lspconfig.quick_lint_js.setup {
      filetypes = { "javascript" },
    }
  end,

  ["tsserver"] = function()
    lspconfig.tsserver.setup {
      filetypes = { 'typescript', 'typescriptreact' },
    }
  end,

  ["html"] = function()
    lspconfig.html.setup {
      filetypes = { 'html' },
    }
  end,

  ["emmet_language_server"] = function()
    lspconfig.emmet_language_server.setup({
      filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
      -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
      -- **Note:** only the options listed in the table are supported.
      init_options = {
        ---@type table<string, string>
        includeLanguages = {},
        --- @type string[]
        excludeLanguages = {},
        --- @type string[]
        extensionsPath = {},
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
        preferences = {},
        --- @type boolean Defaults to `true`
        showAbbreviationSuggestions = true,
        --- @type "always" | "never" Defaults to `"always"`
        showExpandedAbbreviation = "always",
        --- @type boolean Defaults to `false`
        showSuggestionsAsSnippets = false,
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
        syntaxProfiles = {},
        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
        variables = {},
      },
    })
  end,

  ["cssmodules_ls"] = function()
    lspconfig.cssmodules_ls.setup({
      filetypes = { "css", "less", "sass", "scss" },
      on_attach = function(client)
        -- avoid accepting `definitionProvider` responses from this LSP
        client.server_capabilities.definitionProvider = false
        -- custom_on_attach(client)
      end,
    })
  end,


})
