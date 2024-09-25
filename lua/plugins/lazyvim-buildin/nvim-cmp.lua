if true then
  return {}
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- preselect = cmp.PreselectMode.None,
      -- table.insert(opts.mapping, {

      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "nvim_lsp" })
      table.insert(opts.sources, { name = "luasnip" })
      table.insert(opts.sources, { name = "buffer" })
      table.insert(opts.sources, { name = "path" })

      local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end

      opts.mapping = vim.tbl_extend("force", opts.mapping, {

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- if cmp.get_active_entry() == 1 then
            --     cmp.select_next_item()
            --     cmp.select_prev_item()
            -- end
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      })

      table.insert(opts.sources, {
        { name = "nvim_lsp" },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = "buffer" },
        { name = "path" },
      })

      opts.confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      }

      table.insert(opts.experimental, {
        ghost_text = false,
        native_menu = false,
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
