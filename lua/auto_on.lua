require('language/init')
-- vim.cmd("autocmd VimEnter * NERDTree")
-- vim.cmd([[autocmd VimEnter * AirlineEnable]])
vim.api.nvim_exec([[
  augroup PythonFormat
  autocmd!
  autocmd FileType python setlocal formatprg=autopep8\ --in-place\ --aggressive\ --aggressive\ -\ --max-line-length=120\ --ignore=E402,E501,E302
  augroup END
]], true) -- auto format when you save python file
