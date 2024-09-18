local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- import/override with your plugins
		-- { import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version   defaults = {
		-- autocmds = true, -- lazyvim.config.autocmds
		keymaps = false, -- lazyvim.config.keymaps= "*", -- try installing the latest stable version for plugins that support semver
	},

	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"flash.nvim",
			},
		},
	},
})

-- local LazyVim = require("lazy")
-- LazyVim.setup({
-- 	-- {
-- 	--     "nvim-tree/nvim-tree.lua",
-- 	--     version = "*",
-- 	--     lazy = false,
-- 	--     dependencies = {
-- 	--         "nvim-tree/nvim-web-devicons",
-- 	--     },
-- 	--     config = function()
-- 	--         require("nvim-tree").setup {}
-- 	--     end,
-- 	-- },
--
-- 	{
-- 		"MunifTanjim/nui.nvim",
-- 		lazy = true,
-- 	},
--
-- 	{
-- 		"akinsho/bufferline.nvim",
-- 		requires = "nvim-tree/nvim-web-devicons",
-- 		-- config = function()
-- 		-- require('plugins/bufferline_')
-- 		-- end,
-- 	},
--
-- 	-- {
-- 	--     'preservim/nerdcommenter',
-- 	--     lazy = false,
-- 	-- },
--
--
-- 	{ "morhetz/gruvbox" },
--
-- 	{ "godlygeek/tabular" },
--
-- 	{ "Chiel92/vim-autoformat" },
--
-- 	{ "HerringtonDarkholme/yats.vim" },
--
--
-- 	{ "christoomey/vim-tmux-navigator" },
--
-- 	{ "ctrlpvim/ctrlp.vim" },
--
-- 	{ "dense-analysis/ale" },
--
-- 	{ "easymotion/vim-easymotion" },
--
-- 	{ "honza/vim-snippets" },
--
-- 	{ "tpope/vim-surround" },
--
-- 	{
-- 		"iamcco/markdown-preview.nvim",
-- 		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
-- 		ft = { "markdown" },
-- 		build = function()
-- 			vim.fn["mkdp#util#install"]()
-- 		end,
-- 	},
--
-- 	{ "mhinz/neovim-remote" },
--
--
-- 	{
-- 		"junegunn/fzf",
-- 		dir = "~/.fzf",
-- 		run = "./install --all",
-- 	},
--
-- 	{ "junegunn/vim-easy-align" },
--
-- 	{ "luochen1990/rainbow" },
--
-- 	{ "mattn/emmet-vim" },
--
-- 	{ "puremourning/vimspector" },
--
-- 	{ "rafi/awesome-vim-colorschemes" },
--
-- 	{ "ryanoasis/vim-devicons" },
--
-- 	--[[
-- 	{ "sheerun/vim-polyglot" },
--     --]]
--
-- 	{ "tomasiser/vim-code-dark" },
--
-- 	{ "vhda/verilog_systemverilog.vim" },
--
--
-- 	{ "simrat39/symbols-outline.nvim" },
--
-- 	{ "nvim-lua/plenary.nvim" },
--
--
--
--
--
--
-- 	{ "rafamadriz/friendly-snippets" },
--
--
--
--
--
--
--
--
--
--
--
--
-- 	{ "hkupty/iron.nvim" },
-- 	-- {
-- 	-- 	"kana/vim-textobj-user",
-- 	-- 	dependencies = { "Julian/vim-textobj-variable-segment" },
-- 	-- 	lazy = false,
-- 	-- },
-- 	-- {
-- 	-- 	"kana/vim-textobj-line",
-- 	-- 	dependencies = { "Julian/vim-textobj-variable-segment" },
-- 	-- 	lazy = false,
-- 	-- },
-- 	-- {
-- 	-- 	"GCBallesteros/vim-textobj-hydrogen",
-- 	-- 	dependencies = {
-- 	-- 		"kana/vim-textobj-user",
-- 	-- 		"kana/vim-textobj-line",
-- 	-- 	},
-- 	-- },
--
--
--
--
-- 	{ "HonkW93/automatic-verilog" },
--
--
-- 	-- {
-- 	--     "vhyrro/luarocks.nvim",
-- 	--     priority = 1001, -- this plugin needs to run before anything else
-- 	--     opts = {
-- 	--         rocks = { "magick" },
-- 	--     },
-- 	-- },
-- 	-- {
-- 	--     "3rd/image.nvim",
-- 	--     dependencies = { "luarocks.nvim" },
-- 	--     config = function()
-- 	--         -- ...
-- 	--     end
-- 	-- },
--
--
-- 	{
-- 		"Pocco81/DAPInstall.nvim",
-- 	},
--
--
--
-- 	{
-- 		"theHamsta/nvim-dap-virtual-text",
-- 		dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
-- 	},
-- 	{
-- 		"folke/neodev.nvim",
-- 		dependencies = { "nvim-dap-ui", "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
-- 	},
-- 	{
-- 		"mfussenegger/nvim-dap-python",
-- 		dependencies = { "mfussenegger/nvim-dap" },
-- 	},
--
-- 	{ "vim-scripts/taglist.vim" },
--
-- 	{
-- 		"camspiers/luarocks",
-- 		opts = { rocks = { "fzy" } },
-- 	},
--
--
-- })
--
-- -- require('plugins/init')
