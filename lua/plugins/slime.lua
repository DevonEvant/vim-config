
-- -----------------------------------------------------------------------------
-- slime 配置
-- -----------------------------------------------------------------------------
-- require('slime').setup {}
-- require('slime').setup {}


-- 總是使用 tmux
vim.g.slime_target = 'tmux'

-- 修復 ipython 中的粘貼問題
vim.g.slime_python_ipython = 1

-- 總是將文本發送到當前 tmux 選項卡的右上角窗格，無需詢問
vim.g.slime_default_config = {
  socket_name = vim.fn.split(vim.env.TMUX, ',')[1],
  target_pane = '{top-right}'
}

vim.g.slime_dont_ask_default = 1

