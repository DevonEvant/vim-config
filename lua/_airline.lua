-- 设置 Airline 符号
-- vim.g.airline_symbols.linenr = "☰"        -- 当前行号
-- vim.g.airline_symbols.maxlinenr = " ln"  -- 最大行号
-- vim.g.airline_symbols.branch = " BR"      -- 分支符号
-- vim.g.airline_symbols.readonly = "R-"     -- 只读符号
-- vim.g.airline_symbols.dirty = "DT"        -- 脏文件符号
-- vim.g.airline_symbols.crypt = "CR"        -- 加密符号

-- 或者您可以使用其他符号替代上述注释部分的代码

-- 设置 Airline 选项
vim.cmd('set laststatus=2')
vim.g["airline_powerline_fonts"] = 1
vim.g["airline_statusline_ontop"] = 0
vim.g["airline_theme"] = 'base16_twilight'


vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline_extensions_tabline_enabled"] = 1
vim.g["airline_extensions_tabline_formatter"] = 'default'
vim.g["airline_extensions_tabline_left_alt_sep"] = '|'
vim.g["airline_extensions_tabline_buffer_nr_show"] = 0
vim.g["airline_extensions_keymap_enabled"] = 1
vim.g["airline_extensions_tabline_buffer_idx_mode"] = 1
vim.g["airline_extensions_tabline_buffer_idx_format"] = {
  ['0'] = '0 ',
  ['1'] = '1 ',
  ['2'] = '2 ',
  ['3'] = '3 ',
  ['4'] = '4 ',
  ['5'] = '5 ',
  ['6'] = '6 ',
  ['7'] = '7 ',
  ['8'] = '8 ',
  ['9'] = '9 '
}
