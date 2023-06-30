-- 創建默認映射
vim.g.NERDCreateDefaultMappings = 1

-- 在註解分隔符後添加空格（默認開啟）
vim.g.NERDSpaceDelims = 1

-- 使用簡潔的語法美化多行註解
vim.g.NERDCompactSexyComs = 1

-- 將單行註解分隔符對齊到行首，而不是按照代碼縮進對齊
vim.g.NERDDefaultAlign = 'left'

-- 設置特定語言使用其替代的註解分隔符（例如 java）
--vim.g.NERDAltDelims_java = 1

-- 添加自定義的註解格式或覆蓋默認格式
--vim.g.NERDCustomDelimiters = {['c'] = {['left'] = '/**', ['right'] = '*/'}}

-- 允許對空行進行註解或反註解（在註解區域時很有用）
vim.g.NERDCommentEmptyLines = 1

-- 反註解時刪除尾部空白字符
vim.g.NERDTrimTrailingWhitespace = 1

-- 啟用 NERDCommenterToggle 檢查所有選中的行是否已被註解
vim.g.NERDToggleCheckAllLines = 1

