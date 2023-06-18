local lspconfig = require('lspconfig')

lspconfig.svls.setup({
    filetypes = { 'verilog', 'systemverilog' },  -- 指定支持的文件类型
    settings = {  -- 针对 svls 的特定设置
      svls = {
        lint = {
          enable = true,
          disable = { 'no-implicit-wire' }
        },
        completion = {
          enable = true,
          depth = 3
        }
      }
    }
  })
