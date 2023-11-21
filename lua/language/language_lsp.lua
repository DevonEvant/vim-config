local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.set_log_level("OFF","svlangserver")
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
    "tsserver", -- typescript
    "quick_lint_js", --js
    "html", --html
    "svlangserver",
    "jsonls", --json
    "kotlin_language_server", --kotlin
    "marksman", --markdown
    "taplo", --toml
    "sqlls", --sql
    "lemminx", --xml
    "yamlls", --yaml
  },
}

require("mason-lspconfig").setup_handlers({
    function (server_name)
      lspconfig[server_name].setup{}
    end,

    -- Next, you can provide targeted overrides for specific servers.
    ["lua_ls"] = function ()
      lspconfig.lua_ls.setup {
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


    ["svlangserver"] = function ()
      lspconfig.svlangserver.setup {
        filetypes = { 'verilog', 'systemverilog' ,'verilogsystemverilog' ,'verilog_systemverilog'}, -- 指定
      }
    end,


    ["rust_analyzer"] = function ()
      lspconfig.rust_analyzer.setup {
        --capabilities = capabilities,
        --root_dir = lspconfig.util.root_pattern('.git'), -- 指定根目录的查找模式
        --settings = {
        --['rust-analyzer'] = {},
        --},
      }
    end,

    ["pyright"] = function ()
      lspconfig.pyright.setup({
          capabilities = capabilities,
          -- 可選：自訂 LSP 選項
          -- 詳細參數列表可參考官方文件：https://github.com/microsoft/pyright/blob/main/docs/configuration.md
          settings = {
            python = {
              -- 自訂 pyright 的設定選項
            }
          },

          -- 可選：在特定檔案類型時啟用 LSP
          filetypes = { 'python' },

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

    ["clangd"] = function ()
      lspconfig.clangd.setup {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--header-insertion=never",
          "--query-driver=/opt/homebrew/opt/llvm/bin/clang",
          "--all-scopes-completion",
          "--completion-style=detailed",
        }
      }
    end,

    ["verible"] = function ()
      lspconfig.verible.setup {
        --capabilities = capabilities,
        --cmd = { 'verible-verilog-ls' }, -- 指定 Verible 工具的路径或命令
        filetypes = {"a"}, -- 指定支持的文件类型
        --root_dir = lspconfig.util.root_pattern('.git'), -- 指定根目录的查找模式
        settings = {
          ---- Verible 的特定设置
          verible = {
            lint = true, -- 启用 Verible 的语法检查
            lintArgs = { '--ruleset=svlint' }, -- 传递给 Verible 的语法检查参数
            format = true, -- 启用 Verible 的代码格式化
            formatArgs = { '--inplace' }, -- 传递给 Verible 的代码格式化参数
          }
        }
      }
    end,

    ["svls"] = function ()
      lspconfig.svls.setup {
        --filetypes = { 'verilog', 'systemverilog' ,'verilogsystemverilog' ,'verilog_systemverilog'}, -- 指定
        filetypes = { 'a'}, -- 指定
      }
    end,

    ["jsonls"] = function ()
      lspconfig.jsonls.setup {
      }
    end,

    ["kotlin_language_server"] = function ()
      lspconfig.kotlin_language_server.setup {
      }
    end,

    ["marksman"] = function ()
      lspconfig.marksman.setup {
      }
    end,

    ["taplo"] = function ()
      lspconfig.taplo.setup {
      }
    end,

    ["sqlls"] = function ()
      lspconfig.sqlls.setup {
      }
    end,

    ["lemminx"] = function ()
      lspconfig.lemminx.setup {
      }
    end,

    ["yamlls"] = function ()
      lspconfig.yamlls.setup {
      }
    end,

    ["quick_lint_js"] = function ()
      lspconfig.quick_lint_js.setup {
      }
    end,

    ["tsserver"] = function ()
      lspconfig.tsserver.setup {
      }
    end,

    ["html"] = function ()
      lspconfig.html.setup {
      }
    end,
  })
