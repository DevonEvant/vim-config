if false then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        verible = {

          single_file_support = true,
          root_dir = function(fname)
            local lspconfig = require("lspconfig")
            local util = lspconfig.util
            return util.root_pattern("*.sv", "*.svh", "*.v", "*.vh", ".git", ".svlangserver")(fname) or vim.fn.getcwd()
          end,
          cmd = { "verible-verilog-ls" },
          filetypes = { "verilog", "systemverilog", "v", "sv", "svh" },
          --capabilities = capabilities,
          --cmd = { 'verible-verilog-ls' }, -- 指定 Verible 工具的路径或命令
          --root_dir = lspconfig.util.root_pattern('.git'), -- 指定根目录的查找模式
          settings = {
            ---- Verible 的特定设置
            verible = {
              lint = true, -- 启用 Verible 的语法检查
              lintArgs = { "--ruleset=svlint" }, -- 传递给 Verible 的语法检查参数
              format = true, -- 启用 Verible 的代码格式化
              formatArgs = { "--inplace" }, -- 传递给 Verible 的代码格式化参数
            },
          },
        },
      },
    },
  },
}
