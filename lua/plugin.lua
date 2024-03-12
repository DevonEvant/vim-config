-- 初始化 Packer.nvim

-- Packer.nvim installation path (choose any directory you prefer)
local packer_install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Check if Packer is already installed
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_install_path)
end

-- Load Packer
vim.cmd [[packadd packer.nvim]]

vim.o.termguicolors = true

require('packer').startup(function()
  -- Packer本身
  -- use {'wbthomason/packer.nvim'}

  --use { 'preservim/nerdtree' }
  --use { 'scrooloose/nerdtree' }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- using packer.nvim
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- use { 'PhilRunninger/nerdtree-visual-selection' }
  use { 'preservim/nerdcommenter' }
  -- use { 'tiagofumo/vim-nerdtree-syntax-highlight' }
  -- use { 'Xuyuanp/nerdtree-git-plugin' }
  -- use { 'tsony-tsonev/nerdtree-git-plugin' }

  use { 'morhetz/gruvbox' }
  -- use { 'ellisonleao/gruvbox.nvim' }

  --use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile' }

  use { 'godlygeek/tabular' }

  -- use { 'SirVer/ultisnips' }
  -- use { 'prettier/vim-prettier', run = 'yarn install' }
  use { 'Chiel92/vim-autoformat' }
  use { 'HerringtonDarkholme/yats.vim' } -- TS Syntax
  use { 'Yggdroot/indentLine' }
  -- use { 'airblade/vim-gitgutter' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'ctrlpvim/ctrlp.vim' }
  use { 'dense-analysis/ale' }
  use { 'easymotion/vim-easymotion' }
  use { 'honza/vim-snippets' }
  use { 'https://github.com/tpope/vim-surround.git' }
  use {
    'instant-markdown/vim-instant-markdown',
    run = 'npm -g install instant-markdown-d',
    ft = 'markdown'
  }
  -- use({
  -- "iamcco/markdown-preview.nvim",
  -- run = "cd app && npm install",
  -- setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
  -- ft = { "markdown" },
  -- })
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
  use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  use 'mfussenegger/nvim-dap'
  use ({
      'nvimdev/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require('lspsaga').setup({})
      end,
    })
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'


  use {"akinsho/toggleterm.nvim", tag = '*'}


  use {"mbledkowski/neuleetcode.vim"}
  use {"LunarVim/bigfile.nvim"}
  use {"norcalli/nvim-colorizer.lua"}
  use {'rcarriga/nvim-notify'}
  use {
    'abecodes/tabout.nvim',
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'}
  }

  use { 'jpalardy/vim-slime', ft = 'python' }
  use { 'hanschen/vim-ipython-cell', ft = 'python' }

  use {
    "ahmedkhalf/jupyter-nvim",
    run = ":UpdateRemotePlugins",
  }

  use 'simrat39/rust-tools.nvim'
  use 'sbdchd/neoformat'
  use 'voldikss/vim-floaterm'
end)



 require('plugins/init')


