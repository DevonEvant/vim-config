vim.opt.termguicolors = true
require("bufferline").setup({
    options = {
      numbers = "ordinal",
      max_name_length = 15,
      tab_size = 14,
      -- indicator = {
      -- icon = '.', -- this should be omitted if indicator style is not 'icon'
      -- style = 'icon',
      -- },
      diagnostics =  "nvim_lsp" ,
    },

    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    -- return "("..count..")"
    -- end,
    --
    -- offsets = {
    -- {
    -- filetype = "NvimTree",
    -- text = "File Explorer" | function ,
    -- text_align = "left" | "center" | "right"
    -- separator = true
    -- }
    -- },
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
