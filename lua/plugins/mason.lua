return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "pylsp" },
        automatic_installation = true
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      
      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      })

      -- LSP servers setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities
      })

      -- Keybindings
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true })
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { noremap = true })
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { noremap = true })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap = true })
      
      -- Diagnostic keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true })
      vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, { noremap = true })
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true })

      -- Optional: Add diagnostic signs
      local signs = {
        { name = "DiagnosticSignError", text = "✘" },
        { name = "DiagnosticSignWarn", text = "▲" },
        { name = "DiagnosticSignHint", text = "⚡" },
        { name = "DiagnosticSignInfo", text = "" }
      }
      
      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end
    end
  }
}
