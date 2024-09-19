return { -- {
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

	{ "morhetz/gruvbox" },

	{ "godlygeek/tabular" },

	{ "Chiel92/vim-autoformat" },

	{ "HerringtonDarkholme/yats.vim" },

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
		"junegunn/fzf",
		dir = "~/.fzf",
		run = "./install --all",
	},

	{ "junegunn/vim-easy-align" },

	{ "luochen1990/rainbow" },

	{ "mattn/emmet-vim" },

	{ "puremourning/vimspector" },

	{ "rafi/awesome-vim-colorschemes" },

	{ "ryanoasis/vim-devicons" },

	--[[
	{ "sheerun/vim-polyglot" },
    --]]

	{ "tomasiser/vim-code-dark" },

	{ "vhda/verilog_systemverilog.vim" },

	{ "simrat39/symbols-outline.nvim" },

	{ "nvim-lua/plenary.nvim" },

	{ "rafamadriz/friendly-snippets" },

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

	{ "HonkW93/automatic-verilog" },

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
		"Pocco81/DAPInstall.nvim",
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
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	{ "vim-scripts/taglist.vim" },

	{
		"camspiers/luarocks",
		opts = { rocks = { "fzy" } },
	},
}
