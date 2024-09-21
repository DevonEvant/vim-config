return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		opt = true,
		ft = "tex",
		config = function()
			vim.g.vimtex_view_general_viewer = "okular"
			-- vim.g.tex_flavor = 'latex'
			-- vim.g.vimtex_view_general_viewer = 'zathura'
			-- vim.g.vimtex_view_method = 'zathura'

			-- # 这一项目默认即为 nvr，但是如果由于种种原因无法实现 SyncTeX 同步位置，可以考虑手动指定这一项目
			-- let g:vimtex_compiler_progname = 'nvr'

			-- use {
			-- 'lervag/vimtex',
			-- opt = true,
			-- config = function ()
			-- vim.g.vimtex_view_general_viewer = 'okular'
			-- vim.g.vimtex_compiler_latexmk_engines = {
			-- _ = '-xelatex'
			-- }
			-- vim.g.tex_comment_nospell = 1
			-- vim.g.vimtex_compiler_progname = 'nvr'
			-- vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
			-- vim.g.vimtex_view_general_options_latexmk = '--unique'
			-- end,
			-- ft = 'tex'
			-- }
		end,
	},
}
