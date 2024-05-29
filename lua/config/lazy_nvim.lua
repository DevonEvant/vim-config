local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

local LazyVim = require("lazy")

LazyVim.setup({
	-- {
	--     "nvim-tree/nvim-tree.lua",
	--     version = "*",
	--     lazy = false,
	--     dependencies = {
	--         "nvim-tree/nvim-web-devicons",
	--     },
	--     config = function()
	--         require("nvim-tree").setup {}
	--     end,
	-- },

	{
		"MunifTanjim/nui.nvim",
		lazy = true,
	},

	{
		"akinsho/bufferline.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		-- config = function()
		-- require('plugins/bufferline_')
		-- end,
	},

	-- {
	--     'preservim/nerdcommenter',
	--     lazy = false,
	-- },
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		-- config = function()
		--     require("your.null-ls.config") -- require your null-ls config here (example below)
		-- end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		-- opts = function(_, opts)
		--     local null_ls = require('null-ls').builtins
		--     opts.sources = {
		--     }
		--     return opts
		-- end
	},

	{ "morhetz/gruvbox" },

	{ "godlygeek/tabular" },

	{ "Chiel92/vim-autoformat" },

	{ "HerringtonDarkholme/yats.vim" },

	{ "Yggdroot/indentLine" },

	{ "christoomey/vim-tmux-navigator" },

	{ "ctrlpvim/ctrlp.vim" },

	{ "dense-analysis/ale" },

	{ "easymotion/vim-easymotion" },

	{ "honza/vim-snippets" },

	{ "tpope/vim-surround" },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{ "mhinz/neovim-remote" },

	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		opt = true,
		init = function()
			vim.g.vimtex_view_general_viewer = "okular"
		end,
		ft = "tex",
	},

	{
		"junegunn/fzf",
		dir = "~/.fzf",
		run = "./install --all",
	},
	-- {
	-- 'junegunn/fzf',
	-- run = function() vim.fn['fzf#install']() end
	-- },

	{ "junegunn/vim-easy-align" },

	{ "luochen1990/rainbow" },

	{ "mattn/emmet-vim" },

	{ "puremourning/vimspector" },

	{ "rafi/awesome-vim-colorschemes" },

	{ "ryanoasis/vim-devicons" },

	{ "sheerun/vim-polyglot" },

	{ "tomasiser/vim-code-dark" },

	{ "vhda/verilog_systemverilog.vim" },

	{ "vim-airline/vim-airline" },

	{ "vim-airline/vim-airline-themes" },

	{ "simrat39/symbols-outline.nvim" },

	{ "nvim-lua/plenary.nvim" },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"hrsh7th/nvim-cmp",
		-- config = function()
		--     require('plugins/nvim-cmp')
		-- end
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },

	{ "mfussenegger/nvim-dap" },

	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	{ "rafamadriz/friendly-snippets" },

	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	{ "onsails/lspkind-nvim" },

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},

	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- configuration goes here
		},
	},

	{ "LunarVim/bigfile.nvim" },

	{ "norcalli/nvim-colorizer.lua" },

	{ "rcarriga/nvim-notify" },

	{
		"abecodes/tabout.nvim",
		lazy = false,
		dependencies = { -- These are optional
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
			"hrsh7th/nvim-cmp",
		},
		opt = true, -- Set this to true if the plugin is optional
		event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
		priority = 1000,
	},

	-- { 'jpalardy/vim-slime',        ft = 'python' },

	-- { 'hanschen/vim-ipython-cell', ft = 'python' },

	-- {
	-- 'ahmedkhalf/jupyter-nvim',
	-- run = ':UpdateRemotePlugins',
	-- },

	{ "hkupty/iron.nvim" },
	-- {
	-- 	"kana/vim-textobj-user",
	-- 	dependencies = { "Julian/vim-textobj-variable-segment" },
	-- 	lazy = false,
	-- },
	-- {
	-- 	"kana/vim-textobj-line",
	-- 	dependencies = { "Julian/vim-textobj-variable-segment" },
	-- 	lazy = false,
	-- },
	-- {
	-- 	"GCBallesteros/vim-textobj-hydrogen",
	-- 	dependencies = {
	-- 		"kana/vim-textobj-user",
	-- 		"kana/vim-textobj-line",
	-- 	},
	-- },
	-- {
	-- 	"GCBallesteros/jupytext.nvim",
	-- 	dependencies = {
	-- 		"GCBallesteros/vim-textobj-hydrogen",
	-- 		"kana/vim-textobj-user",
	-- 		"kana/vim-textobj-line",
	-- 	},
	-- },

	{ "simrat39/rust-tools.nvim" },

	{ "sbdchd/neoformat" },

	{ "voldikss/vim-floaterm" },

	{ "HonkW93/automatic-verilog" },

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer) end,
		},
	},

	-- {
	--     "vhyrro/luarocks.nvim",
	--     priority = 1001, -- this plugin needs to run before anything else
	--     opts = {
	--         rocks = { "magick" },
	--     },
	-- },
	-- {
	--     "3rd/image.nvim",
	--     dependencies = { "luarocks.nvim" },
	--     config = function()
	--         -- ...
	--     end
	-- },
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},

	{
		"rebelot/heirline.nvim",
		-- You can optionally lazy-load heirline on UiEnter
		-- to make sure all required plugins and colorschemes are loaded before setup
		event = "UiEnter",
		config = function()
			require("heirline").setup({})
		end,
	},

	{
		"Pocco81/DAPInstall.nvim",
		config = function()
			-- local dap_install = require("dap-install")
			-- dap_install.setup({
			--     installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
			-- })
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	},

	{
		"echasnovski/mini.nvim",
		version = "false",
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
	},
	{
		"folke/neodev.nvim",
		dependencies = { "nvim-dap-ui", "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	},
	{ "mfussenegger/nvim-dap" },
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	{ "vim-scripts/taglist.vim" },
})

-- require('plugins/init')
