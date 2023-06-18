local lspconfig = require("lspconfig")

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
  },
}

require("mason-lspconfig").setup_handlers({
    function (server_name)
      lspconfig[server_name].setup{}
    end,

    -- Next, you can provide targeted overrides for specific servers.
    ["lua_ls"] = function ()
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
    end,

    ["clangd"] = function ()
      lspconfig.clangd.setup {
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
        --cmd = { 'verible-verilog-ls' }, -- 指定 Verible 工具的路径或命令
        filetypes = { 'verilog', 'systemverilog' ,'verilog_systemverilog'}, -- 指定支持的文件类型
        --root_dir = lspconfig.util.root_pattern('.git'), -- 指定根目录的查找模式
        --settings = {
        ---- Verible 的特定设置
        --verible = {
        --lint = true, -- 启用 Verible 的语法检查
        --lintArgs = { '--ruleset=svlint' }, -- 传递给 Verible 的语法检查参数
        --format = true, -- 启用 Verible 的代码格式化
        --formatArgs = { '--inplace' }, -- 传递给 Verible 的代码格式化参数
        --}
        --}
      }
    end
  })
