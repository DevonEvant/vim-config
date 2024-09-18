return {
	{
		"Yggdroot/indentLine",
		configs = function()
			vim.g["indentLine_setColors"] = 0
			vim.g["indentLine_defaultGroup"] = "SpecialKey"
			vim.g["indentLine_color_term"] = 239
			vim.g["indentLine_showTrailingWhitespace"] = 1
			-- vim.g["indentLine_showFirstIndentLevel"] = 1
			vim.g["indentLine_colorEOL"] = 1
			vim.g["indentLine_showCursorLine"] = 1
		end,
	},
}
