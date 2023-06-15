-- 初始化 Packer.nvim

require('packer').startup(function()
  use { 'preservim/nerdtree' }
  --use { 'scrooloose/nerdtree' }
  -- use { 'PhilRunninger/nerdtree-visual-selection' }
  use { 'preservim/nerdcommenter' }
  -- use { 'tiagofumo/vim-nerdtree-syntax-highlight' }
  -- use { 'Xuyuanp/nerdtree-git-plugin' }
  -- use { 'tsony-tsonev/nerdtree-git-plugin' }

  use { 'morhetz/gruvbox' }
  -- use { 'ellisonleao/gruvbox.nvim' }

  use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile' }

  use { 'godlygeek/tabular' }

  -- use { 'SirVer/ultisnips' }
  -- use { 'prettier/vim-prettier', run = 'yarn install' }
  use { 'Chiel92/vim-autoformat' }
  use { 'HerringtonDarkholme/yats.vim' } -- TS Syntax
  use { 'Yggdroot/indentLine' }
  use { 'airblade/vim-gitgutter' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'ctrlpvim/ctrlp.vim' }
  use { 'dense-analysis/ale' }
  use { 'easymotion/vim-easymotion' }
  use { 'honza/vim-snippets' }
  use { 'https://github.com/tpope/vim-surround.git' }
  use { 'instant-markdown/vim-instant-markdown', ft = 'markdown' }
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use { 'junegunn/fzf.vim' }
  use { 'junegunn/vim-easy-align' }
  use { 'luochen1990/rainbow' }
  use { 'mattn/emmet-vim' }
  use { 'puremourning/vimspector' }
  use { 'rafi/awesome-vim-colorschemes' }
  use { 'ryanoasis/vim-devicons' }
  use { 'sheerun/vim-polyglot' }
  use { 'tomasiser/vim-code-dark' }
  use { 'vhda/verilog_systemverilog.vim' }
  use { 'vim-airline/vim-airline' }
  use { 'vim-airline/vim-airline-themes' }
  -- use { 'vim-scripts/automatic-for-Verilog' }

  use { 'simrat39/symbols-outline.nvim' }
end)


