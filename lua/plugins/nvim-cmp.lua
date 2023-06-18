local lspkind = require('lspkind')
local cmp = require('cmp')

-- nvim-cmp 自动补全
local map = {
  -- 出现补全
  ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
  -- 取消补全
  ["<A-,>"] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close()
  }),
  -- 上一个
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  -- 下一个
  ["<C-j>"] = cmp.mapping.select_next_item(),
  -- 确认
  ["<CR>"] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace
  }),
  -- 如果窗口内容太多，可以滚动
  ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
  ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
}


cmp.setup {
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
  },
  -- 来源
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- For vsnip users.
    { name = 'vsnip' },
    -- For luasnip users.
    -- { name = 'luasnip' },
    --For ultisnips users.
    -- { name = 'ultisnips' },
    -- -- For snippy users.
    -- { name = 'snippy' },
  }, { { name = 'buffer' },
      { name = 'path' }
    }),

  -- 快捷键
  mapping = map,
  -- 使用lspkind-nvim显示类型图标
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "["..string.upper(entry.source.name).."]"
        return vim_item
      end
    })
  },
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

