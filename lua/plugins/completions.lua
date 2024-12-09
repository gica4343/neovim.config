return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*",   -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",

      dependencies = { "rafamadriz/friendly-snippets" },

      config = function()
        local ls = require("luasnip")
        ls.filetype_extend("javascript", { "jsdoc" })

        --- TODO: What is expand?
        vim.keymap.set({ "i" }, "<C-s>e", function() ls.expand() end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end, { silent = true })
      end,
    }
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          --completion = cmp.config.window.bordered(),
          --documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })
    end,
  }
}
