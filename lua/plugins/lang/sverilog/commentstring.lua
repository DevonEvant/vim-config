-- 設置 Verilog 和 SystemVerilog 的 commentstring
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "verilog", "systemverilog" },
  callback = function()
    vim.opt_local.commentstring = "// %s" -- C-style 註釋
  end,
})

return {}
