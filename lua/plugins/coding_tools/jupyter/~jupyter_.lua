return {
	{
		"GCBallesteros/jupytext.nvim",
		dependencies = {
			"GCBallesteros/vim-textobj-hydrogen",
			"kana/vim-textobj-user",
			"kana/vim-textobj-line",
		},

		configs = function()
			local jupytext = require("jupytext")

			jupytext.setup({
				style = "hydrogen",
				output_extension = "auto", -- Default extension. Don't change unless you know what you are doing
				force_ft = nil, -- Default filetype. Don't change unless you know what you are doing
				custom_language_formatting = {},
			})

			local iron = require("iron.core")
			iron.setup({
				config = {
					should_map_plug = false,
					scratch_repl = true,
					repl_definition = {
						python = {
							command = { "ipython" },
							format = require("iron.fts.common").bracketed_paste,
						},
					},
				},
				keymaps = {
					send_motion = "ctr",
					visual_send = "ctr",
				},
			})
		end,
	},
}
