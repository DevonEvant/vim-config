return {
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		requires = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local bufferline = require("bufferline")
			local bufferline_group = require("bufferline.groups")

			vim.diagnostic.config({ update_in_insert = true })
			vim.opt.termguicolors = true

			require("bufferline").setup({
				options = {
					mode = "buffers", -- set to "tabs" to only show tabpages instead
					numbers = function(opts)
						return string.format("%s.", opts.ordinal)
					end,
					max_name_length = 15,
					tab_size = 10,
					style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,

					close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
					separator_style = "slant",
					indicator = {
						icon = "▎", -- this should be omitted if indicator style is not 'icon'
						style = "icon",
					},
					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					show_buffer_icons = true, -- disable filetype icons for buffers
					show_buffer_close_icons = false,
					show_close_icon = false,
					show_tab_indicators = true,
					show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
					duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
					persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
					move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
					enforce_regular_tabs = false,
					always_show_bufferline = true,
					auto_toggle_bufferline = true,
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},

					diagnostics = "nvim_lsp",
					-- diagnostics_update_in_insert = true,
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local tab_str = ""

						-- for _level, _count in pairs(diagnostics_dict) do
						-- 	local symbol = (_level == "error" and " " or (_level == "warning" and " " or ""))
						-- 	tab_str = tab_str .. _count .. symbol
						-- end

						tab_str = ""
							.. (
								level == "error" and " "
								or (level == "warning" and " ")
								or (level == "info" and "")
								or "" -- or ""
							) --.. count

						return tab_str
					end,

					groups = {
						options = {
							toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
						},
						items = {
							bufferline_group.builtin.pinned:with({ icon = "" }),

							{
								name = "tests", -- Mandatory
								highlight = { underline = true, sp = "blue" }, -- Optional
								priority = 2, -- determines where it will appear relative to other groups (Optional)
								icon = "", -- Optional
								matcher = function(buf) -- Mandatory
									-- return buf.filename:match("%_test") or buf.filename:match("%_spec")
								end,
							},
							{
								name = "docs",
								highlight = { undercurl = true, sp = "green" },
								auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
								matcher = function(buf)
									-- local matched = group.matcher(with_deprecation({
									-- 	id = buffer.id,
									-- 	name = buffer.name,
									-- 	path = buffer.path,
									-- 	modified = buffer.modified,
									-- 	buftype = buffer.buftype,
									-- }))
									return buf.name:match("%.md") or buf.name:match("%.txt")
								end,
								separator = { -- Optional
									style = require("bufferline.groups").separator.tab,
								},
							},
						},
					},

					custom_areas = {
						right = function()
							local result = {}
							local severity = vim.diagnostic.severity
							local error = #vim.diagnostic.get(0, { severity = severity.ERROR })
							local warning = #vim.diagnostic.get(0, { severity = severity.WARN })
							local info = #vim.diagnostic.get(0, { severity = severity.INFO })
							local hint = #vim.diagnostic.get(0, { severity = severity.HINT })

							if error ~= 0 then
								table.insert(result, { text = "  " .. error, fg = "#EC5241" })
							end
							if warning ~= 0 then
								table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
							end
							if hint ~= 0 then
								table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
							end
							if info ~= 0 then
								table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
							end

							return result
						end,
					},

					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
						},
						{
							filetype = "coc-explorer",
							text = function()
								return vim.fn.getcwd()
							end,
							highlight = "Directory",
							text_align = "left",
						},
						{
							filetype = "vista",
							text = function()
								return vim.fn.getcwd()
							end,
							highlight = "Tags",
							text_align = "right",
						},
					},
				},
				--
				-- name_formatter = function(buf)  -- buf contains:
				-- name                | str        | the basename of the active file
				-- path                | str        | the full path of the active file
				-- bufnr (buffer only) | int        | the number of the active buffer
				-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
				-- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
				-- return buf.path
				-- end,
			})
		end,
	},
}
